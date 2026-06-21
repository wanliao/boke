import { defineConfig } from 'vitepress'

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "婳-",
  description: "网站",
  head:[['link',{rel: 'icon',href: '/wz.png'}],],
  locales: {
    root: {
      label: '简体中文',
      lang: 'zh-CN',
    },
  },
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: '首页', link: '/' },
      { text: '全部内容', link: '/markdown-examples' }
    ],

    sidebar: [
      {
        text: '目录',
        items: [
          { text: 'Markdown Examples', link: '/markdown-examples' },
          { text: 'C++笔记', link: '/C++笔记/常用函数' },
          { text: 'Runtime API Examples', link: '/api-examples' }
        ]
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/wanliao/' }
    ],

    siteTitle: false,
    sidebarMenuLabel: '菜单',
    lightModeSwitchTitle: '切换到浅色模式',
    darkModeSwitchLabel: '外观',
    darkModeSwitchTitle: '切换到深色模式',
    returnToTopLabel: '返回顶部',
    outline: {
      label: '页面导航',
      level: 'deep',
    },
    lastUpdated: {
      text: '最后更新于',
    },
    docFooter: {
      prev: '上一篇',
      next: '下一篇',
    },
    editLink: {
      pattern: 'https://github.com/wanliao/boke/edit/main/docs/:path',
      text: '在 GitHub 上编辑此页面',
    },
    },
    srcDir: './docs'
})
