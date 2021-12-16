set shiftwidth=2

augroup typescript
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
  "autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html silent call <SID>document_diagnostics()
augroup END

function s:document_diagnostics()
  LspDocumentDiagnostics
endfunction

"let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
"let g:lsp_settings_filetype_typescriptreact = ['typescript-language-server', 'eslint-language-server']
