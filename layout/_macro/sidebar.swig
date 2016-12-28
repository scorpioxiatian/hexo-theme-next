{% macro render(is_post) %}
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    <div class="sidebar-inner">

      {% set display_toc = is_post and theme.toc.enable %}

      {% if display_toc and toc(page.content).length > 1 %}
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap" >
            {{ __('sidebar.toc') }}
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview">
            {{ __('sidebar.overview') }}
          </li>
        </ul>
      {% endif %}

      <section class="site-overview sidebar-panel{% if not display_toc or toc(page.content).length <= 1 %} sidebar-panel-active{% endif %}">
        <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
          <img class="site-author-image" itemprop="image"
               src="{{ url_for( theme.avatar | default(theme.images + '/avatar.gif') ) }}"
               alt="{{ theme.author }}" />
          <p class="site-author-name" itemprop="name">{{ theme.author }}</p>
          <p class="site-description motion-element" itemprop="description">{{ theme.description }}</p>
        </div>
        <nav class="site-state motion-element">
          <div class="site-state-item site-state-posts">
            <a href="{{ url_for(theme.menu.archives) }}">
              <span class="site-state-item-count">{{ site.posts.length }}</span>
              <span class="site-state-item-name">{{ __('state.posts') }}</span>
            </a>
          </div>

          {% if site.categories.length > 0 %}
            <div class="site-state-item site-state-categories">
              {% if theme.menu.categories %}<a href="{{ url_for(theme.menu.categories) }}">{% endif %}
                <span class="site-state-item-count">{{ site.categories.length }}</span>
                <span class="site-state-item-name">{{ __('state.categories') }}</span>
              {% if theme.menu.categories %}</a>{% endif %}
            </div>
          {% endif %}

          {% if site.tags.length > 0 %}
            <div class="site-state-item site-state-tags">
              {% if theme.menu.tags %}<a href="{{ url_for(theme.menu.tags) }}">{% endif %}
                <span class="site-state-item-count">{{ site.tags.length }}</span>
                <span class="site-state-item-name">{{ __('state.tags') }}</span>
              {% if theme.menu.tags %}</a>{% endif %}
            </div>
          {% endif %}

        </nav>

        {% if theme.rss %}
          <div class="feed-link motion-element">
            <a href="{{ url_for(theme.rss) }}" rel="alternate">
              <i class="fa fa-rss"></i>
              RSS
            </a>
            <a href='javascript:(function(){function h(){var e=document.createElement("link");e.setAttribute("type","text/css");e.setAttribute("rel","stylesheet");e.setAttribute("href",l);e.setAttribute("class",c);document.body.appendChild(e)}function p(){var e=document.getElementsByClassName(c);for(var t=0;t<e.length;t++){document.body.removeChild(e[t])}}function d(){var e=document.createElement("div");e.setAttribute("class",f);document.body.appendChild(e);setTimeout(function(){document.body.removeChild(e)},100)}function v(e){return{height:e.offsetHeight,width:e.offsetWidth}}function m(i){var s=v(i);return s.height>e&&s.height<n&&s.width>t&&s.width<r}function g(e){var t=e;var n=0;while(!!t){n+=t.offsetTop;t=t.offsetParent}return n}function y(){var e=document.documentElement;if(!!window.innerWidth){return window.innerHeight}else if(e&&!isNaN(e.clientHeight)){return e.clientHeight}return 0}function b(){if(window.pageYOffset){return window.pageYOffset}return Math.max(document.documentElement.scrollTop,document.body.scrollTop)}function S(e){var t=g(e);return t>=E&&t<=w+E}function x(){var e=document.createElement("audio");e.setAttribute("class",c);e.src=i;e.loop=false;var t=false,n=false,r=false;e.addEventListener("timeupdate",function(){var i=e.currentTime,s=D,o=s.length,u;if(i>=.5&&!t){t=true;T(_)}if(i>=15.5&&!n){n=true;k();d();for(u=0;u<o;u++){N(s[u])}}if(e.currentTime>=28.4&&!r){r=true;C()}},true);e.addEventListener("ended",function(){k();p()},true);e.innerHTML="<p>If you are reading this, it is because your browser does not support the audio element. We recommend that you get a new browser.</p>p>";document.body.appendChild(e);e.play()}function T(e){e.className+=" "+s+" "+u}function N(e){e.className+=" "+s+" "+a[Math.floor(Math.random()*a.length)]}function C(){var e=document.getElementsByClassName(s);for(var t=0;t<e.length;){e[t].className=e[t].className.replace(s,o)}s=o}function k(){var e=document.getElementsByClassName(s);var t=new RegExp("\\b"+s+"\\b");for(var n=0;n<e.length;){e[n].className=e[n].className.replace(t,"")}}var e=30;var t=30;var n=350;var r=350;var i="//s3.amazonaws.com/moovweb-marketing/playground/harlem-shake.ogg";var s="mw-harlem_shake_me";var o="mw-harlem_shake_slow";var u="im_first";var a=["im_drunk","im_baked","im_trippin","im_blown"];var f="mw-strobe_light";var l="//s3.amazonaws.com/moovweb-marketing/playground/harlem-shake-style.css";var c="mw_added_css";var w=y();var E=b();var L=document.getElementsByTagName("*"),A=L.length,O,M;var _=null;for(O=0;O<A;O++){M=L[O];if(m(M)){if(S(M)){_=M;break}}}if(M===null){console.warn("Could not find a node of the right size. Please try a different page.");return}h();x();var D=[];for(O=0;O<A;O++){M=L[O];if(m(M)){D.push(M)}}})()' rel="alternate">
              <i class="fa fa-music"></i>
              HOT_DANCE
            </a>
          </div>
        {% endif %}

        <div class="links-of-author motion-element">
          {% if theme.social %}
            {% for name, link in theme.social %}
              <span class="links-of-author-item">
                <a href="{{ link }}" target="_blank" title="{{ name }}">
                  {% if theme.social_icons.enable %}
                    <i class="fa fa-fw fa-{{ theme.social_icons[name] | default('globe') | lower }}"></i>
                  {% endif %}
                  {{ name }}
                </a>
              </span>
            {% endfor %}
          {% endif %}
        </div>

        {% set cc = {'by': 1, 'by-nc': 1, 'by-nc-nd': 1, 'by-nc-sa': 1, 'by-nd': 1, 'by-sa': 1, 'zero': 1} %}
        {% if theme.creative_commons in cc %}
          <div class="cc-license motion-element" itemprop="license">
            <a href="https://creativecommons.org/{% if theme.creative_commons === 'zero' %}publicdomain/zero/1.0{% else %}licenses/{{ theme.creative_commons }}/4.0{% endif %}/" class="cc-opacity" target="_blank">
              <img src="{{ url_for(theme.images) }}/cc-{{ theme.creative_commons }}.svg" alt="Creative Commons" />
            </a>
          </div>
        {% endif %}

        {# Blogroll #}
        {% if theme.links %}
          <div class="links-of-blogroll motion-element {{ "links-of-blogroll-" + theme.links_layout | default('inline') }}">
            <div class="links-of-blogroll-title">
              <i class="fa  fa-fw fa-{{ theme.links_icon | default('globe') | lower }}"></i>
              {{ theme.links_title }}
            </div>
            <ul class="links-of-blogroll-list">
              {% for name, link in theme.links %}
                <li class="links-of-blogroll-item">
                  <a href="{{ link }}" title="{{ name }}" target="_blank">{{ name }}</a>
                </li>
              {% endfor %}
            </ul>
          </div>
        {% endif %}

        {% include '../_custom/sidebar.swig' %}

      </section>

      {% if display_toc and toc(page.content).length > 1 %}
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            {% if page.toc_number === undefined %}
              {% set toc = toc(page.content, { "class": "nav", list_number: theme.toc.number }) %}
            {% else %}
              {% set toc = toc(page.content, { "class": "nav", list_number: page.toc_number }) %}
            {% endif %}

            {% if toc.length <= 1 %}
              <p class="post-toc-empty">{{ __('post.toc_empty') }}</p>
            {% else %}
              <div class="post-toc-content">{{ toc }}</div>
            {% endif %}

          </div>
        </section>
      <!--/noindex-->
      {% endif %}

    </div>
  </aside>
{% endmacro %}
