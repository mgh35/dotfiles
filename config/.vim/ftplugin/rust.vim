" Follow the Rust Style Guide
" https://github.com/rust-dev-tools/fmt-rfcs/blob/master/guide/guide.md

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

set colorcolumn=100

" vim-lsp takes some configuration
if executable('rust-analyzer')
  au User lsp_setup call lsp#register_server({
        \   'name': 'Rust Language Server',
        \   'cmd': {server_info->['rust-analyzer']},
        \   'whitelist': ['rust'],
        \ })
endif
