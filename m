From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6: Remove unneeded address-cells/size-cells
Date: Mon, 13 Nov 2017 08:55:53 +0100
Message-ID: <20171113075553.vseyq3swmzwja3ld@pengutronix.de>
References: <1510348378-18150-1-git-send-email-festevam@gmail.com>
 <62f3cb01-ff85-0fe0-2afa-0fe4732a7421@rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <62f3cb01-ff85-0fe0-2afa-0fe4732a7421-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello,

On Sat, Nov 11, 2017 at 03:24:47PM +0100, Christopher Spinrath wrote:
> (I'm sorry if I've missed some recipients or broke the email thread but
> I got Fabio's email from the infradead archive.)
> 
> On 11/10/2017 10:12 PM, festevam at gmail.com (Fabio Estevam) wrote:
> > From: Fabio Estevam <fabio.estevam at nxp.com>
> > 
> > According to Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt:
> > 
> > "- #address-cells, #size-cells : Must be present if the device has
> > sub-nodes representing partitions."
> > 
> > Remove the occurrences of #address-cells/size-cells where no sub-nodes
> > representing partitions are present.
> 
> This results in a regression for those devices where U-Boot is supposed
> to inject the partition sub-nodes. For example, this is the case for
> cm-fx6 module based devices like the Utilite Pro.

sounds like an U-Boot bug that it inserts partition nodes, but doesn't
ensure matching #address-cells/size-cells are specified.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
