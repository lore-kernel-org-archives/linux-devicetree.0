From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Subject: Re: [PATCH 07/10] usb: chipidea: usbmisc_imx: add unburst setting
 for imx6
Date: Wed, 29 Jul 2015 12:19:46 +0200
Message-ID: <20150729121946.009e7f03@ipc1.ka-ro>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
	<1438137734-27311-8-git-send-email-peter.chen@freescale.com>
	<20150729103022.7cfe0466@ipc1.ka-ro>
	<20150729075728.GC27605@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150729075728.GC27605@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

> On Wed, Jul 29, 2015 at 10:30:22AM +0200, Lothar Wa=C3=9Fmann wrote:
> > Hi,
> >=20
> > > With this setting and AHBBRST at SBUSCFG as "Incremental burst of
> > > unspecified length", each unburst size can be taken as one single=
 transfer.
> > > It is benefit for unburst size transfer.
> > >=20
> > What is an 'unburst'?
> >=20
>=20
> Assume burst size is 8 dword, unburst size 't' < 8.
>=20
> With this feature, 't' length payload can be taken
> as one burst transfer, otherwise, the single transfer
> (1 dword) will be used.
>=20
IMO non-burst would be a better word.


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
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
