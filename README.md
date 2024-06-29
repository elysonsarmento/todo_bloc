## Metas

- Mantenha o código limpo
- Mantenha o código testável
- Mantenha a base de código facilmente extensível e adaptável
- Garanta a transparência do gerenciamento de estado

## Características adicionais

- Suporte ao tema Material 3 (Escuro e Claro)
- Widget e testes unitários
- Chamada remota de API e cache
- Autentificação

## Dica

No final das contas, esta arquitetura é apenas uma coleção de boas ideias baseadas em princípios bem fundamentados (como Separação de interesses).

**PENSE** primeiro, depois **AJA**.

## Uma breve descrição sobre "Arquitetura Limpa"

Há dois pontos principais a serem entendidos sobre a arquitetura: ela divide o projeto em diferentes camadas e está em conformidade com a regra de Dependência.

O número de camadas utilizadas pode variar ligeiramente de um projeto para outro, mas ao utilizá-las, promovemos o princípio da 'separação de interesses'. Se você é um novo desenvolvedor e nunca ouviu falar disso antes, é simplesmente uma maneira elegante de dizer: 'Ei! Sou uma camada e estou preocupado apenas com um único aspecto do sistema”. Se uma camada for responsável por exibir a UI, ela não tratará das operações do banco de dados. Por outro lado, se uma camada for responsável pela persistência dos dados, ela não terá nenhum conhecimento dos componentes da UI

E a regra da Dependência? Vamos colocar isso em termos simples. Primeiro, você precisa entender que as camadas discutidas acima não estão empilhadas umas sobre as outras; em vez disso, eles se assemelham às camadas de uma 'cebola'. Existe uma camada central cercada por camadas externas. A regra de Dependência afirma que as classes dentro de uma camada só podem acessar classes de sua própria camada ou das camadas externas, mas nunca das camadas internas.

Normalmente, ao trabalhar com esta arquitetura, você encontrará alguma terminologia adicional, como Entidades, Adaptadores de Interface, Casos de Uso, Modelos e outros termos. Estes termos são simplesmente nomes dados a componentes que também cumprem “responsabilidades únicas” dentro do projeto:

- Entidades: Representam os principais objetos de negócios, muitas vezes refletindo entidades do mundo real.

- Adaptadores de Interface: Também conhecidos como Adaptadores, são responsáveis ​​por preencher a lacuna entre as camadas do sistema, **_facilitando a conversão e mapeamento de dados entre camadas_**. Existem várias abordagens disponíveis, como classes mapeadoras especializadas ou herança. A questão é que, ao usar esses adaptadores, cada camada pode trabalhar com dados em um formato que melhor atenda às suas necessidades. À medida que os dados se movem entre as camadas, eles são mapeados para um formato adequado para a próxima camada. Assim, quaisquer alterações futuras podem ser resolvidas modificando esses adaptadores para acomodar o formato atualizado sem impactar o interior da camada.

- Casos de uso: também conhecidos como Interatores, **_eles contêm a lógica de negócios principal e coordenam o fluxo de dados_**. Por exemplo, eles lidam com login/logout de usuário, salvamento ou recuperação de dados e outras funcionalidades. As classes de caso de uso normalmente são importadas e usadas por classes na camada de apresentação (UI). Eles também utilizam uma técnica chamada 'inversão de controle' para serem independentes do mecanismo de recuperação ou envio de dados, enquanto coordenam o fluxo de dados

- Modelos: São objetos utilizados para transferência de dados entre diferentes camadas do sistema.

Recomendo conferir [este link](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), fornecido por Robert C. Martin ('Uncle Bob') , que oferece o que hoje pode ser considerado a explicação “oficial”

### Benefícios conhecidos

- O teste A/B pode ser facilmente aplicado
- Todas as camadas podem ser testadas individualmente
- O fluxo de dados unidirecional facilita a compreensão do código

# Referências

- [Joe Birch - Google GDE: Clean Architecture Course](https://caster.io/courses/android-clean-architecture)
- [Reso Coder - Flutter TDD Clean Architecture](https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech)
- [Majid Hajian | Flutter Europe - Strategic Domain Driven Design to Flutter](https://youtu.be/lGv6KV5u75k)
- [Guide to app architecture - Jetpack Guides](https://developer.android.com/jetpack/docs/guide#common-principles)
- [ABHISHEK TYAGI - TopTal Developer: Better Android Apps Using MVVM with Clean Architecture](https://www.toptal.com/android/android-apps-mvvm-with-clean-architecture)
- [Jason Taylor (+20 years of experience) - Clean Architecture ](https://youtu.be/Zygw4UAxCdg)
- [Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
