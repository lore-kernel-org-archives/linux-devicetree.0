From: Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH/RFC v2 0/2] arm64: dts: r8a7795: Add support for R-Car
 H3 ES2.0
Date: Thu, 30 Mar 2017 12:48:18 +0200
Message-ID: <1490870898.3471.3.camel@collabora.co.uk>
References: <1490362665-4422-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490362665-4422-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Wolfram Sang <wsa-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-03-24 at 14:37 +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series adds preliminary support for Renesas Salvator-X
> development boards equipped with revision ES2.0 of the R-Car H3 Soc.
> 
>   - Patch 1 adds support for the R-Car H3 ES2.0 Soc,
>     While this patch is safe as-is, as it doesn't affect any existing
>     setups, it's probably a bit premature to apply it.
>   - Patch 2 adds support for Salvator-X boards with R-Car H3 ES2.0.
>     This patch does affect existing development setups, as it changes
> the
>     name of the DTB for Salvator-X boards equipped with ES1.x SoCs.
>     Given most developers have access to ES1.x only, this patch must
> not be
>     applied yet.

Would it make more sense to add a new r8a7795-es2.dtsi and keep the
current dtsi for es1? Having to load different device-trees based on
which kernel is used would be rather nasty.

-- 
Sjoerd Simons
Collabora Ltd.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
