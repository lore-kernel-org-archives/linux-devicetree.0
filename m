From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx6: Add dts for Embest MarS Board
Date: Tue, 19 Apr 2016 08:22:42 -0300
Message-ID: <CAOMZO5DwOa8s_tBJWpOjcxt0hj6befxjPFwVH57SOO5J5Hm5fw@mail.gmail.com>
References: <1460420743-30883-1-git-send-email-sergio.prado@e-labworks.com>
	<CAOMZO5D80VWGad7Lz+Crp8on5xLJzHDXL88FBh7x8d4Mc2XKww@mail.gmail.com>
	<570EB2DB.20707@e-labworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <570EB2DB.20707-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergio Prado <sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sergio,

On Wed, Apr 13, 2016 at 5:58 PM, Sergio Prado
<sergio.prado-1e4yhPs3/ABSwrhanM7KvQ@public.gmane.org> wrote:

> Although the boards are similar, there are a lot of differences:
>
> Marsboard -> imx6dual, no sound, sst25vf016b spi flash, 1 external sd/mmc
> interface (sdhc2) and one eMMC (sdhc3), different PMUX config for no sdhc3,
> no pmic, i2c1, i2c2 and i2c3 externally available, no ssi interface.
>
> Riotboard -> imx6solo, sound (sgtl5000), no spi flash, 2 external sd/mmc
> interface (sdhc2 and sdhc3) and one eMMC (sdhc4), pmic (pfuze100), i2c1,
> i2c2 and i2c4 externally available, ssi interface.
>
> We could certainly create a dtsi file to be shared between them, but I do
> not know if it is worth the effort.
>
> What do you think?

Ok, it seems it is not worth to share a device tree between them.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
