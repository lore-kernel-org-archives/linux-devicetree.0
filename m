From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv2 1/8] dt-bindings: use isil prefix for Intersil in vendor-prefixes.txt
Date: Tue, 13 Jan 2015 14:02:35 -0600
Message-ID: <CAL_JsqLt7BuG9eccqR4CELPsOO+o3NGP6c4aqKDXbJfT0O0=5w@mail.gmail.com>
References: <cover.1418763328.git.arno@natisbad.org> <e32fe98a511e3ab8aeed9849bcac33ba14fd8986.1418763328.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e32fe98a511e3ab8aeed9849bcac33ba14fd8986.1418763328.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Vaussard <florian.vaussard-p8DiymsW2f8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Hayato Suzuki <hytszk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 16, 2014 at 3:18 PM, Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org> wrote:
>
> This patch fixes DT vendor-prefixes.txt documentation to reference
> isil (NASDAQ symbol and the most used prefix inside the kernel) for
> Intersil.
>
> It reverts 7c75c1d5e72b ("dt-bindings: Document deprecated device
> vendor name to fix related warning").
>
> Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>

Applied for 3.20. Thanks.

While there are not interdepencies here, it probably would have been
better to keep this series all together. Other patches have already
been picked up, so I'm just taking this one.

Rob


> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index 423d47418e72..585e5b5dca27 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -81,8 +81,7 @@ innolux       Innolux Corporation
>  intel  Intel Corporation
>  intercontrol   Inter Control Group
>  isee   ISEE 2007 S.L.
> -isil    Intersil (deprecated, use isl)
> -isl    Intersil
> +isil   Intersil
>  karo   Ka-Ro electronics GmbH
>  keymile        Keymile GmbH
>  lacie  LaCie
> --
> 2.1.1
>
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
