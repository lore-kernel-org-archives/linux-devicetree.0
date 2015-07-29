From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 07/10] usb: chipidea: usbmisc_imx: add unburst setting
 for imx6
Date: Wed, 29 Jul 2015 15:57:29 +0800
Message-ID: <20150729075728.GC27605@shlinux2>
References: <1438137734-27311-1-git-send-email-peter.chen@freescale.com>
 <1438137734-27311-8-git-send-email-peter.chen@freescale.com>
 <20150729103022.7cfe0466@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150729103022.7cfe0466-VjFSrY7JcPWvSplVBqRQBQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 29, 2015 at 10:30:22AM +0200, Lothar Wa=DFmann wrote:
> Hi,
>=20
> > With this setting and AHBBRST at SBUSCFG as "Incremental burst of
> > unspecified length", each unburst size can be taken as one single t=
ransfer.
> > It is benefit for unburst size transfer.
> >=20
> What is an 'unburst'?
>=20

Assume burst size is 8 dword, unburst size 't' < 8.

With this feature, 't' length payload can be taken
as one burst transfer, otherwise, the single transfer
(1 dword) will be used.

--=20

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
