From: Holger Schurig <holgerschurig-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx6q: add support for the Utilite Pro
Date: Mon, 30 May 2016 11:36:36 +0200
Message-ID: <87h9df99az.fsf@gmail.com>
References: <1463957258-4893-1-git-send-email-christopher.spinrath@rwth-aachen.de> <c4ab0387041f42ada68296141befe332@rwthex-s1-b.rwth-ad.de> <20abc2f6769b4369ba87ec27274a090e@rwthex-s2-a.rwth-ad.de> <644530ff6bb04b5898dc33604dc7a93a@rwthex-s1-b.rwth-ad.de> <9b905766c6cc4680be4b33f79a179d5a@rwthex-w1-b.rwth-ad.de> <0cf90ebe86e0461f82cb22b2a6b6ea83@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <0cf90ebe86e0461f82cb22b2a6b6ea83-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree@vger.kernel.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "robh+dt@kernel.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> OK, done. Can I always use the default value in this case? If yes, can
> you point me to a proper documentation of these?

Just google for "i.MX6Q Reference Manual", it's chapter 36 ("IOMUXC"),
or to be more specific, it at 36.4.316.



It's nice that Freescale/NXP is way better here than Marvell. You can
download this stuff without any problem.

When Marvell bought the PXA stuff from Intel and put everything under
NDA / download after approvement, I was hugely p.... off. I never
touched any Marvell chip after it :-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
