From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Date: Wed, 27 May 2015 09:37:53 +0200
Message-ID: <5386954.hrl5VLbdYc@wuerfel>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432492349-18517-1-git-send-email-hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 24 May 2015 20:32:29 Hauke Mehrtens wrote:
> @@ -124,17 +124,7 @@
>                         <0x00026000 0 &gic GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>,
>  
>                         /* Ethernet Controller 3 */
> -                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
> -
> -                       /* NAND Controller */
> -                       <0x00028000 0 &gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 1 &gic GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 2 &gic GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 3 &gic GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 4 &gic GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 5 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 6 &gic GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
> -                       <0x00028000 7 &gic GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +                       <0x00027000 0 &gic GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>;
>  
>                 chipcommon: chipcommon@0 {
>                         reg = <0x00000000 0x1000>;
> @@ -143,4 +133,30 @@
>                         #gpio-cells = <2>;
>                 };
>         };
> +
> +       nand: nand@18028000 {
> +               compatible = "brcm,nand-iproc", "brcm,brcmnand-v6.1", "brcm,brcmnand";
> +               reg = <0x18028000 0x600>, <0x1811a408 0x600>, <0x18028f00 0x20>;
> +               reg-names = "nand", "iproc-idm", "iproc-ext";
> +               interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;

I think I'd rather leave the interrupt-map in the brcm node, and use

	interrupts = <0>;

here.

> +               status = "disabled";
> +
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               brcm,nand-has-wp;
> +
> +               nandcs@0 {
> +                       compatible = "brcm,nandcs";
> +                       reg = <0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       nand-ecc-strength = <8>;
> +                       nand-ecc-step-size = <512>;
> +
> +                       linux,part-probe = "ofpart", "bcm47xxpart";
> +               };
> +       };

This seems fine in principle, once the exact binding has been nailed down.

"bcm47xxpart" does not seem like an appropriate string here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
