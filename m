From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] drm/exynos: Get HDMI version from device tree
Date: Thu, 31 Jan 2013 10:36:20 -0700
Message-ID: <510AAB94.6030406@wwwdotorg.org>
References: <50EC5EDE.3030208@firmworks.com>
 <1357676181-16728-1-git-send-email-seanpaul@chromium.org>
 <50ECA400.50007@wwwdotorg.org> <51082B6A.1010406@gmail.com>
 <CAAQKjZNR8EJ+UFRO3vgYLH9So_gHn0a8gAf1JKu250shGiJ4qQ@mail.gmail.com>
 <5109DF18.6010202@wwwdotorg.org>
 <CAOw6vbJtUQdDLNkhg3ZL10KaPK=wQRDxkVUUUqO_=W84sYHgzg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAOw6vbJtUQdDLNkhg3ZL10KaPK=wQRDxkVUUUqO_=W84sYHgzg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Tomasz Stanislawski <t.stanislaws-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olofj-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rahul Sharma <rahul.sharma-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/31/2013 08:04 AM, Sean Paul wrote:
...
> I think if we take a step back, we're really not discussing HDMI
> version 1.3 vs. 1.4, we're really talking about the HDMI IP block
> version.

Absolutely.

> The blocks just happen to implement different versions of the
> HDMI spec.

Yes.

> The initial naming in the driver is unfortunate.
> 
> That said, I think the above solution is fine, but it's a little
> misleading.  I'd much rather encode the version of the IP block
> instead of the SoC that contains it. Something like:
> 
> compatible = "samsung,exynos-hdmiXXX"
> 
> In this case, XXX is just some integer in the bindings that maps to an
> SoC. For example,
> 
> +----------------------+-------------+
> | HDMI IP version      | Exynos SoC  |
> +----------------------+-------------+
> | samsung,exynos-hdmi1 | 4210        |
> | samsung,exynos-hdmi2 | 4212, 5250  |
> +----------------------+-------------+

That seems reasonable to me. (But, does the documentation for these IP
blocks specify the version in the format "1" and "2"? It'd be best if
the compatible value encoded the same version scheme as the IP block
documentation).

>From all the bindings I've seen though, the style in the table above
would be unusual though; most compatible values simply specify the first
(or first SW-supported) SoC version that incorporated that IP version.
Still, I imagine that's simply historical precedent rather than some
hard-and-fast rule. So, I'd say go ahead with the table above, but you
may want to ping some DT maintainers or old-hands to make sure there
isn't something I forgot about.

> The reason I like this better is that it's clear which value to use
> when gating features in the driver. Using the scheme above, it might
> be tempting to gate a feature/fix on exynos5xxx-hdmi when it really
> works with both 4212 && 5xxx.
