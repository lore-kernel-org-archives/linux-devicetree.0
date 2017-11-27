From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 00/13] SolidRun Hummingboard DT updates
Date: Mon, 27 Nov 2017 18:18:40 -0200
Message-ID: <CAOMZO5DY+6BkaFSVHg-mbZ6_vcM_wcwin16WmPbp22p1AX4yzA@mail.gmail.com>
References: <20171127165134.GH31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171127165134.GH31757-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Nettleton <jon.nettleton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 27, 2017 at 2:51 PM, Russell King - ARM Linux
<linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> Hi Shawn,
>
> This series updates the SolidRun Hummingboard platforms to:
> (a) make the DT more reflective of the schematics
> (b) re-organise how we deal with the differences between various board
>     versions in preparation for the new 1.5 microsom.
>
> The idea with (b) is that we add the support for the board + usom
> combination by including the appropriate dtsi files.
>
> For example, in mainline at the moment, we support two variants of the
> Hummingboards - both with Broadcom Wi-Fi and without eMMC.  Going
> forward, when a 1.5 usom is fitted (which modern Hummingboards will all
> have) the boards will have TI Wi-Fi and potentially eMMC on the usom.
>
> So, this prepares the ground to support these combinations, and maybe
> if I can get agreement from Jon, move forward with Hummingboard2
> support.

Looks good. Only a few minor nits that I found and replied in the
respective patches.

For the whole series:

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
