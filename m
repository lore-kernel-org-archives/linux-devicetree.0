From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v7] pinctrl: imx27: imx27 pincontrol driver
Date: Thu, 07 Nov 2013 10:28:01 +0100
Message-ID: <1383816481.4115.2.camel@weser.hi.pengutronix.de>
References: <1382950843-26066-3-git-send-email-mpa@pengutronix.de>
	 <1383057139-25304-1-git-send-email-mpa@pengutronix.de>
	 <CACRpkdYKgA5E4-APSTHsM=zVbb3X2R4v+V4EeK3+W1tKPR1FeA@mail.gmail.com>
	 <CAHCPf3v3dsTyk9Cd93GBLBKQLSQ+Mb0mpq134X7Ko4U8m-b-qg@mail.gmail.com>
	 <20131107091212.GH15098@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131107091212.GH15098-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Donnerstag, den 07.11.2013, 10:12 +0100 schrieb Markus Pargmann:
> On Wed, Nov 06, 2013 at 10:54:02AM -0600, Matt Sealey wrote:
[...]
> > 
> > Would it be so bad to implement this as a regmap and have two drivers
> > access the same regmap on the Linux side? You don't need two nodes for
> > that, and the IOMUX definitions can live under the GPIO node. There is
> > NOTHING stopping two drivers on Linux matching the same compatible
> > property. Locking and coordination in software of a single IP block
> > used by two drivers shouldn't be arbitrated by the device tree.
> 
> I am not sure if it is practical to use the GPIO nodes for the IOMUX
> driver. There are actually 6 GPIO nodes. This would lead to 6
> iomux controllers? The different pin functions may be distributed over
> different controllers then.
> 
> The first version of this series [1] was designed to have a iomux node
> with 6 gpio subnodes.

Why was this changed? Having two different DT nodes requesting the same
IO region is certainly the wrong thing to do.

Regards,
Lucas

-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
