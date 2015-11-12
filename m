From: Vincent ABRIOU <vincent.abriou-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH] MAINTAINERS: update DT binding doc locations
Date: Thu, 12 Nov 2015 17:05:58 +0100
Message-ID: <5644B8E6.5010507@st.com>
References: <1446752475-2708-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1446752475-2708-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 11/05/2015 08:41 PM, Rob Herring wrote:
> After the recent moving of DT binding documents, some maintainers entries
> are stale. Update them to the new locations.
>
> In bindings/fb/, there were only 2 files and I'm assuming the FB
> maintainers don't want to be copied on all of bindings/display/. So I've
> dropped them.
>
> Reported-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alison Wang <alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Cc: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
> Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Vineet Gupta <vgupta-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> ---
>   MAINTAINERS | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
>

>   DRM DRIVERS FOR STI
>   M:	Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> @@ -3656,7 +3656,7 @@ L:	dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>   T:	git http://git.linaro.org/people/benjamin.gaignard/kernel.git
>   S:	Maintained
>   F:	drivers/gpu/drm/sti
> -F:	Documentation/devicetree/bindings/gpu/st,stih4xx.txt
> +F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
>

Acked-by: Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
