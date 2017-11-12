From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Remove unneeded address-cells/size-cells
Date: Sun, 12 Nov 2017 10:14:23 -0200
Message-ID: <CAOMZO5CEVdWgKRQT8-42GOEyFgB8cvCtJZK780BK1t3zHkX62w@mail.gmail.com>
References: <1510348378-18150-1-git-send-email-festevam@gmail.com> <62f3cb01-ff85-0fe0-2afa-0fe4732a7421@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <62f3cb01-ff85-0fe0-2afa-0fe4732a7421-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Christopher,

On Sat, Nov 11, 2017 at 12:24 PM, Christopher Spinrath
<christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org> wrote:

> This results in a regression for those devices where U-Boot is supposed
> to inject the partition sub-nodes. For example, this is the case for
> cm-fx6 module based devices like the Utilite Pro.
>
> Linux fails to parse the partitions and reports:
> [    9.330881] spi0.0: error parsing ofpart partition
> /soc/aips-bus@2000000/spba-bus@2000000/ecspi@2008000/m25p80@0/partition@0
> (/soc/aips-bus@2000000/spba-bus@2000000/ecspi@2008000/m25p80@0)
> [    9.330887] mtd: failed to find partitions; one or more parsers
> reports errors (-22)
>
> Also, the documentation does not forbid the #address-cells/size-cells if
> no partitions are present.
>
> So, please, drop this patch (or exclude at least the cm-fx6 related change).

Good point! I will resend the patch and will only change the NXP boards.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
