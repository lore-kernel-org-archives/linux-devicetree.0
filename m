From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/16] SolidRun Hummingboard DT updates
Date: Tue, 28 Nov 2017 14:31:03 -0200
Message-ID: <CAOMZO5B6KEbmrgm3An=NXidD8Lfu35dMebWPPbLzjFL8Bmuupw@mail.gmail.com>
References: <20171128150045.GV31757@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171128150045.GV31757-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 28, 2017 at 1:00 PM, Russell King - ARM Linux
<linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> Hi Shawn,
>
> This series updates the SolidRun Hummingboard platforms to:
> (a) make the DT more reflective of the schematics
> (b) re-organise how we deal with the differences between various board
>     versions in preparation for the new 1.5 SOM.
>
> The idea with (b) is that we add the support for the board + usom
> combination by including the appropriate dtsi files.
>
> For example, in mainline at the moment, we support two variants of the
> Hummingboards - both with Broadcom Wi-Fi and without eMMC.  Going
> forward, when a 1.5 SOM is fitted (which modern Hummingboards will all
> have) the boards will have TI Wi-Fi and potentially eMMC on the usom.
>
> This series adds the dtsi files for the new SOM and dts files for the
> platform variants (v1.5 SOM without eMMC, v1.5 SOM with eMMC.)  It's
> unfortunate that the w/o eMMC variant can't detect the lack of eMMC,
> running the eMMC version without eMMC on the boards results in an
> almost constant stream of kernel messages.
>
> Feedback from the previous posting has been addressed, and additional
> changes adding the v1.5 SOM board level files added through discussion
> with Jon.

Looks good, thanks.

For the whole series:

Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
