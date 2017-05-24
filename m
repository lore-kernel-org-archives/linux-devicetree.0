From: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 8/8] ARM: ux500: Add vendor prefix to tps61052 node
Date: Wed, 24 May 2017 09:45:04 +0200
Message-ID: <CABxcv=keYQwOGoxdATnFU0-iP_t6N4pR1FnQj62DL08s8TvfHQ@mail.gmail.com>
References: <20170504052107.18995-1-javier@dowhile0.org> <20170504052107.18995-9-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170504052107.18995-9-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[Adding Linus Walleij to cc list]

On Thu, May 4, 2017 at 7:21 AM, Javier Martinez Canillas
<javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:
> The tps61052 device node doesn't have a vendor prefix
> in its compatible string, fix it by adding one.
>
> Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
>
> ---
>
> Changes in v6: None
> Changes in v5:
> - Add Rob Herring's Acked-by tag.
> - Add Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>'s Acked-by tag.
>
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None
>
>  arch/arm/boot/dts/ste-hrefprev60.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ste-hrefprev60.dtsi b/arch/arm/boot/dts/ste-hrefprev60.dtsi
> index 5882a2606ac3..3f14b4df69b4 100644
> --- a/arch/arm/boot/dts/ste-hrefprev60.dtsi
> +++ b/arch/arm/boot/dts/ste-hrefprev60.dtsi
> @@ -30,7 +30,7 @@
>
>                 i2c@80004000 {
>                         tps61052@33 {
> -                               compatible = "tps61052";
> +                               compatible = "ti,tps61052";
>                                 reg = <0x33>;
>                         };
>
> --
> 2.9.3
>

Hello Linus,

I missed copying you this patch when posting the series (sorry about
that). Could you please give your Ack if you agree with the change in
this patch so Lee can pick the series?

Alternatively, you can pick $SUBJECT since the change is independently
of the driver changes. The complete series for your information is:
http://www.spinics.net/lists/devicetree/msg175446.html

Best regards,
Javier
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
