# Multi Translate

A ibrary which allows to translate a text between two languages and using multiple translation engines

## Installation
    gem install multi_translate

## Examples

```ruby
MultiTranslate.translate(MultiTranslate::Engines::GOOGLE, 'en', 'es', 'hello')
MultiTranslate.translate(MultiTranslate::Engines::APERTIUM, 'eu', 'es', 'kaixo')
```
