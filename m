From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCHv9][ 4/6] pinctrl: pinctrl-imx: add imx25 pinctrl driver
Date: Mon, 4 Nov 2013 15:47:08 +0100
Message-ID: <20131104154708.6f288c39@ipc1.ka-ro>
References: <1383210928-18906-1-git-send-email-denis@eukrea.com>
	<1383210928-18906-4-git-send-email-denis@eukrea.com>
	<20131104143140.GD15098@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131104143140.GD15098-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Markus Pargmann wrote:
> On Thu, Oct 31, 2013 at 10:15:26AM +0100, Denis Carikli wrote:
[...]
> > +#define MX25_PAD_CTL_GRP_DVS_SDHC1		0x000 0x458 0x000 0x00 0x000
> > +#define MX25_PAD_CTL_GRP_DVS_LCD		0x000 0x45c 0x000 0x00 0x000
>=20
> These pinfunctions do not define a pinmux function for a pin. Instead
> they are used to configure the pin characteristics for a whole group =
of
> pins. I am not sure if they should be defined as "pin functions" for =
the
> iomux driver.
>=20
Please trim the quoted text appropriately when answering.
It will take you less than 10 seconds to do so, but it will save
hundreds of readers of your mails those seconds when trying to find
your answer in the mail.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org
___________________________________________________________
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
