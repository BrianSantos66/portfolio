from matplotlib.pyplot import title
import streamlit as st
import pandas as pd
import plotly.express as px
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS, ImageColorGenerator
import nltk
from nltk.tokenize import word_tokenize

#Texto para análise
texto = '''
Com 205 mortes em um dia, Brasil chega a 660.586 óbitos por Covid

ão também 30.002.348 casos registrados do novo coronavírus desde o início da pandemia, segundo dados reunidos pelo consórcio de veículos de imprensa.

O Brasil registrou nesta terça-feira (5) 205 mortes pela Covid-19 nas últimas 24 horas, totalizando 660.586 desde o início da pandemia. Com isso, a média móvel de mortes nos últimos 7 dias é de 185, abaixo da marca de 200 pelo quarto dia. Em comparação à média de 14 dias atrás, a variação foi de -37%, tendência de queda nos óbitos decorrentes da doença.

Acre, Mato Grosso e Roraima não registraram mortes por Covid em 24 horas.

Assim, o país registrou 35.465 novos diagnósticos de Covid-19 em 24 horas, completando 30.037.813 casos conhecidos desde o início da pandemia. Com isso, a média móvel de casos nos últimos 7 dias foi de 22.262, variação de -38% em relação a duas semanas atrás.

Em seu pior momento, a média móvel superou a marca de 188 mil casos conhecidos diários, no dia 31 de janeiro deste ano.

Os números estão no novo levantamento do consórcio de veículos de imprensa sobre a situação da pandemia de coronavírus no Brasil, consolidados às 20h. O balanço é feito a partir de dados das secretarias estaduais de Saúde.

Essa comparação leva em conta a média de mortes nos últimos 7 dias até a publicação deste balanço em relação à média registrada duas semanas atrás (entenda os critérios usados pelo g1 para analisar as tendências da pandemia).

Vale ressaltar que há estados em que o baixo número médio de óbitos pode levar a grandes variações percentuais. Os números de médias móveis são, em geral, em números decimais e arredondados para facilitar a apresentação dos dados. Já a variação percentual para calcular a tendência (alta, estabilidade ou queda) leva em conta os números não arredondados.
'''

nltk.download('punkt')
nltk.download('stopwords')

stopwords = nltk.corpus.stopwords.words('portuguese')

stopwords.remove('não')

acentos = [',', '.', "'", '"', '!', '%', '(', ')']
for acento in acentos:
    stopwords.append(acento)

palavras = word_tokenize(texto.lower())

wordcloud = WordCloud(stopwords = stopwords, 
                      background_color="white",
                      width=1600, height=800).generate(' '.join(palavras))

fig2, ax = plt.subplots(figsize=(10,6))
ax.imshow(wordcloud)
ax.set_axis_off()
 
#plt.show(wordcloud)
fig2.savefig('Nuvem.png')

#Importação da base e tratamento dos dados
df = pd.read_csv('glp-2021-02.csv',delimiter=';', decimal=',')
df['Estado'] = df['Estado - Sigla']
df.drop('Estado - Sigla', axis = 1, inplace = True)

st.set_page_config(
    page_title='Análise Gás',
    page_icon=':bar_chart:',
    layout='centered'
    )

st.title(':page_with_curl: Dashboard Gás')

st.sidebar.subheader('FILTROS')

filtro_bandeira = st.sidebar.multiselect(
    label='Selecione a Bandeira:',
    options=df['Bandeira'].sort_values().unique(),
    default=df['Bandeira'].sort_values().unique()
)

filtro_estado = st.sidebar.multiselect(
    label='Selecione o Estado:',
    options=df['Estado'].sort_values().unique(),
    default=df['Estado'].sort_values().unique()
)

df_f = df.query('Bandeira == @filtro_bandeira and Estado == @filtro_estado')

media = round(df_f['Valor de Venda'].mean(),2)

desvio = round(df_f['Valor de Venda'].std(),2)

coef = round(desvio / media * 100, 1)

esquerda, direita = st.columns(2)

with esquerda:
    st.subheader('Média do Valor de Venda')
    st.subheader(media)

with direita:
    st.subheader('Desvio do Valor de Venda')
    st.subheader(f'{coef}%')


bandeira = df.groupby('Bandeira').mean()['Valor de Venda'].sort_values()
val = st.slider('Selecione o top:', min_value=1 ,max_value=int(bandeira.count()))

bandeira = bandeira[:val]
fig, ax = plt.subplots()
ax.barh(y = bandeira.index, width = bandeira)
ax.set_title(f'Top {val} Bandeiras')

st.pyplot(fig)

st.image('Nuvem.png')