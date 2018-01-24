From: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v2 2/4] drivers: firmware: xilinx: Add ZynqMP firmware
 driver
Date: Wed, 24 Jan 2018 23:28:12 +0000
Message-ID: <DM2PR0201MB076771C6652E5D19A803D66DB8E20@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516220434-22204-1-git-send-email-jollys@xilinx.com>
 <1516220434-22204-3-git-send-email-jollys@xilinx.com>
 <20180123083823.GB21463@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180123083823.GB21463-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org" <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, "sudeep.holla-5wv7dgnIgG8@public.gmane.org" <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks for review Greg,

> -----Original Message-----
> From: Greg KH [mailto:gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org]
> Sent: Tuesday, January 23, 2018 12:38 AM
> To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org=
;
> sudeep.holla-5wv7dgnIgG8@public.gmane.org; hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org;
> dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Rajan Vaja
> <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v2 2/4] drivers: firmware: xilinx: Add ZynqMP firmwar=
e
> driver
>=20
> On Wed, Jan 17, 2018 at 12:20:32PM -0800, Jolly Shah wrote:
> > This patch is adding communication layer with firmware.
> > Firmware driver provides an interface to firmware APIs.
> > Interface APIs can be used by any driver to communicate to
> > PMUFW(Platform Management Unit). All requests go through ATF.
> >
> > Signed-off-by: Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > Signed-off-by: Rajan Vaja <rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm64/Kconfig.platforms                    |   1 +
> >  drivers/firmware/Kconfig                        |   1 +
> >  drivers/firmware/Makefile                       |   1 +
> >  drivers/firmware/xilinx/Kconfig                 |   4 +
> >  drivers/firmware/xilinx/Makefile                |   4 +
> >  drivers/firmware/xilinx/zynqmp/Kconfig          |  16 +
> >  drivers/firmware/xilinx/zynqmp/Makefile         |   4 +
> >  drivers/firmware/xilinx/zynqmp/firmware.c       | 987
> ++++++++++++++++++++++++
> >  include/linux/firmware/xilinx/zynqmp/firmware.h | 570 ++++++++++++++
>=20
> Why does this file need to be in include/linux/ at all?  Shouldn't it jus=
t live in the
> driver-specific subdir?
>=20
> thanks,
>=20
> greg k-h

It is used by multiple drivers so can not live in driver specific subdir.

Thanks,
Jolly Shah

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
