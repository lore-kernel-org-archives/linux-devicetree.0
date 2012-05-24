From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v2 00/12] add imx usb driver for mx28/6x
Date: Thu, 24 May 2012 11:38:15 +0800
Message-ID: <20120524033815.GB19682@b20223-02.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <CAOMZO5AcP2cAAkuFPJn3Xp5NuR+JG4hDO7Ehq5H-V6PCy4DwNA@mail.gmail.com>
 <20120522050831.GQ6206@b20223-02.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522050831.GQ6206-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, May 22, 2012 at 01:08:31PM +0800, Richard Zhao wrote:
> On Mon, May 21, 2012 at 04:34:15PM -0300, Fabio Estevam wrote:
> > Hi Richard,
> >=20
> > On Mon, May 21, 2012 at 6:23 AM, Richard Zhao
> > <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > The work is based on =A0ci13xxx rework done by Alexander Shishkin=
=2E
> > >
> > > Status:
> > > =A0- this version only support host
> > > =A0- usbotg controler works at host role
> > >
> > > Changes since V1:
> > > =A0- Merge the work of Marek
> > > =A0- re-implement connect change notify
> > > =A0- imx6q: move part of code to clk
> > > =A0- imx6q: add config-on-boot gpios
> >=20
> > Can you please also add the driver into the defconfig files?
> Thanks for you reminder.
I'll not put it in defconfig until we can get ride of mxc usb driver.
It cannot be in one image.

Thanks
Richard
> >=20
> > What about the existing USB host drivers for mx27/mx31/mx35/mx25/mx=
35?
> >=20
> > Is the idea to switch to drivers/usb/chipidea/host.c too?
> Yes. but I'm now just focusing on imx6q and imx28.
>=20
> Thanks
> Richard
> >=20
> > Regards,
> >=20
> > Fabio Estevam
> >=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
