From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: Add IT6151 bridge chip
 driver bindings.
Date: Thu, 12 Mar 2015 11:35:55 +0100
Message-ID: <CABuKBe+nfY5Gt==GHPW+dQT_uTsEAY5BfwUD0x2SHNkxwNf=JQ@mail.gmail.com>
References: <1426054733-54378-1-git-send-email-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426054733-54378-1-git-send-email-ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-03-11 7:18 GMT+01:00 CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>:
> Add devicetree bindings for IT6151 MIPI to eDP bridge chip driver.
>
> Signed-off-by: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Please use scripts/get_maintainer.pl for all people to which send the
next version of the patch set.

Thanks,
Matthias

> ---
>  Documentation/devicetree/bindings/drm/bridge/it6151.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/it6151.txt
>
> diff --git a/Documentation/devicetree/bindings/drm/bridge/it6151.txt b/Documentation/devicetree/bindings/drm/bridge/it6151.txt
> new file mode 100644
> index 0000000..ad0ad60
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/bridge/it6151.txt
> @@ -0,0 +1,15 @@
> +it6151 bridge bindings
> +
> +Required properties:
> +       - compatible: "ite,it6151"
> +       - reg: i2c address of the bridge's dp tx.
> +       - rxreg: i2c address of the bridge's mipi rx.
> +       - reset-gpio: OF device-tree gpio specification
> +
> +Example:
> +       ite6151: edp-bridge@5c {
> +               compatible = "ite,it6151";
> +               reg = <0x5c>;
> +               rxreg = <0x6c>;
> +               reset-gpio = <&pio 94 GPIO_ACTIVE_HIGH>;
> +       };
> --
> 1.8.1.1.dirty
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek



-- 
motzblog.wordpress.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
