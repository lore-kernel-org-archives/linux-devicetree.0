From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/1] USB: Chipidea: Create a menu in Kconfig to choose
 driver bindings
Date: Tue, 22 May 2012 13:01:48 +0300
Message-ID: <20120522100146.GO30559@arwen.pp.htv.fi>
References: <1337675676-4913-1-git-send-email-richard.zhao@freescale.com>
 <20120522083742.GJ30559@arwen.pp.htv.fi>
 <20120522084727.GA32035@b20223-02.ap.freescale.net>
 <20120522085804.GM30559@arwen.pp.htv.fi>
 <20120522090854.GB32035@b20223-02.ap.freescale.net>
 <20120522092130.GN30559@arwen.pp.htv.fi>
 <20120522094033.GC32035@b20223-02.ap.freescale.net>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8N0TQpGUCeEQshoq"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120522094033.GC32035-iWYTGMXpHj9ITqJhDdzsOjpauB2SiJktrE5yTffgRl4@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--8N0TQpGUCeEQshoq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 22, 2012 at 05:40:34PM +0800, Richard Zhao wrote:
> On Tue, May 22, 2012 at 12:21:31PM +0300, Felipe Balbi wrote:
> > On Tue, May 22, 2012 at 05:08:55PM +0800, Richard Zhao wrote:
> > > On Tue, May 22, 2012 at 11:58:05AM +0300, Felipe Balbi wrote:
> > > > On Tue, May 22, 2012 at 04:47:27PM +0800, Richard Zhao wrote:
> > > > > On Tue, May 22, 2012 at 11:37:43AM +0300, Felipe Balbi wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > On Tue, May 22, 2012 at 04:34:36PM +0800, Richard Zhao wrote:
> > > > > > > It's more flexible to enable each driver binding, especially
> > > > > > > when one driver binding is used by more than one platforms.
> > > > > > >=20
> > > > > > > Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> > > > > > > ---
> > > > > > >  drivers/usb/chipidea/Kconfig  |   18 ++++++++++++++++++
> > > > > > >  drivers/usb/chipidea/Makefile |    9 ++-------
> > > > > > >  2 files changed, 20 insertions(+), 7 deletions(-)
> > > > > > >=20
> > > > > > > diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipi=
dea/Kconfig
> > > > > > > index fd36dc8..91cf82b 100644
> > > > > > > --- a/drivers/usb/chipidea/Kconfig
> > > > > > > +++ b/drivers/usb/chipidea/Kconfig
> > > > > > > @@ -29,4 +29,22 @@ config USB_CHIPIDEA_DEBUG
> > > > > > >  	help
> > > > > > >  	  Say Y here to enable debugging output of the ChipIdea dri=
ver.
> > > > > > > =20
> > > > > > > +menu "ChipIdea driver bindings"
> > > > > > > +
> > > > > > > +config USB_CHIPIDEA_PCI
> > > > > > > +	tristate "PCI ChipIdea USB controller"
> > > > > > > +	default y if PCI
> > > > > > > +	depends on PCI
> > > > > > > +	help
> > > > > > > +	  Say Y here to enable ChipIdea USB controller with PCI int=
erface.
> > > > > > > +
> > > > > > > +config USB_CHIPIDEA_MSM
> > > > > > > +	tristate "MSM ChipIdea USB controller"
> > > > > > > +	default y if ARCH_MSM
> > > > > > > +	depends on ARCH_MSM
> > > > > > > +	help
> > > > > > > +	  Say Y here to enable ChipIdea USB controller for Qualcomm=
 MSM SoCs.
> > > > > > > +
> > > > > > > +endmenu
> > > > > > > +
> > > > > > >  endif
> > > > > > > diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chip=
idea/Makefile
> > > > > > > index cc34937..74d8c60 100644
> > > > > > > --- a/drivers/usb/chipidea/Makefile
> > > > > > > +++ b/drivers/usb/chipidea/Makefile
> > > > > > > @@ -5,10 +5,5 @@ ci_hdrc-$(CONFIG_USB_CHIPIDEA_UDC)	+=3D udc.o
> > > > > > >  ci_hdrc-$(CONFIG_USB_CHIPIDEA_HOST)	+=3D host.o
> > > > > > >  ci_hdrc-$(CONFIG_USB_CHIPIDEA_DEBUG)	+=3D debug.o
> > > > > > > =20
> > > > > > > -ifneq ($(CONFIG_PCI),)
> > > > > > > -	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_pci.o
> > > > > > > -endif
> > > > > > > -
> > > > > > > -ifneq ($(CONFIG_ARCH_MSM),)
> > > > > > > -	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_msm.o
> > > > > > > -endif
> > > > > > > +obj-$(CONFIG_USB_CHIPIDEA_PCI)		+=3D ci13xxx_pci.o
> > > > > > > +obj-$(CONFIG_USB_CHIPIDEA_MSM)		+=3D ci13xxx_msm.o
> > > > > >=20
> > > > > > no, this is not what I wanted. I want this to be always buildab=
le, with
> > > > > > no need for an extra Kconfig option.
> > > > > ifneq ($(CONFIG_ARCH_MXC),)
> > > > >        obj-$(CONFIG_USB_CHIPIDEA)      +=3D ci13xxx_imx.o
> > > > > else
> > > > >   ifneq ($(CONFIG_ARCH_MXS),)
> > > > >          obj-$(CONFIG_USB_CHIPIDEA)    +=3D ci13xxx_imx.o
> > > > >   endif
> > > > > endif
> > > > >=20
> > > > > If you accept the above, that's ok.
> > > >=20
> > > > Just remove the ARCH tests.
> > > hmm.. I'm not sure it can pass build for x86 (probably PCI). Maybe
> > > we can at least check CONFIG_ARM ?
> >=20
> > PCI fails to compile unless CONFIG_PCI is enabled, as it doesn't provide
> > stubs. But that's the only thing that needs checking. I just tested this
> > myself:
> >=20
> > diff --git a/drivers/usb/chipidea/Makefile b/drivers/usb/chipidea/Makef=
ile
> > index cc34937..b69900a 100644
> > --- a/drivers/usb/chipidea/Makefile
> > +++ b/drivers/usb/chipidea/Makefile
> > @@ -5,10 +5,12 @@ ci_hdrc-$(CONFIG_USB_CHIPIDEA_UDC)	+=3D udc.o
> >  ci_hdrc-$(CONFIG_USB_CHIPIDEA_HOST)	+=3D host.o
> >  ci_hdrc-$(CONFIG_USB_CHIPIDEA_DEBUG)	+=3D debug.o
> > =20
> > +# Glue/Bridge layers go here
> > +
> > +obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_msm.o
> > +
> > +# PCI doesn't provide stubs, need to check
> >  ifneq ($(CONFIG_PCI),)
> >  	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_pci.o
> >  endif
> > =20
> > -ifneq ($(CONFIG_ARCH_MSM),)
> > -	obj-$(CONFIG_USB_CHIPIDEA)	+=3D ci13xxx_msm.o
> > -endif
> >=20
> > $ make -j8 drivers/usb/chipidea/
> > make[1]: Nothing to be done for `all'.
> >   CHK     include/linux/version.h
> >   CHK     include/generated/utsrelease.h
> >   CALL    scripts/checksyscalls.sh
> >   LD      drivers/usb/chipidea/built-in.o
> >   CC [M]  drivers/usb/chipidea/core.o
> >   CC [M]  drivers/usb/chipidea/udc.o
> >   CC [M]  drivers/usb/chipidea/host.o
> >   CC [M]  drivers/usb/chipidea/debug.o
> >   CC [M]  drivers/usb/chipidea/ci13xxx_msm.o
> >   CC [M]  drivers/usb/chipidea/ci13xxx_pci.o
> >   LD [M]  drivers/usb/chipidea/ci_hdrc.o
> But it don't work for all driver. On x86:
>=20
>   CC      drivers/usb/chipidea/ci13xxx_pci.o
>   CC      drivers/usb/chipidea/ci13xxx_imx.o
>   CC      drivers/tty/vt/vt_ioctl.o
> In file included from drivers/usb/chipidea/ci13xxx_imx.c:15:0:
> include/linux/of_platform.h:106:13: warning: =E2=80=98struct of_device_id=
=E2=80=99 declared inside parameter list [enabled by default]
> include/linux/of_platform.h:106:13: warning: its scope is only this defin=
ition or declaration, which is probably not what you want [enabled by defau=
lt]
> include/linux/of_platform.h:106:13: warning: =E2=80=98struct device_node=
=E2=80=99 declared inside parameter list [enabled by default]
> drivers/usb/chipidea/ci13xxx_imx.c: In function =E2=80=98ci13xxx_imx_prob=
e=E2=80=99:
> drivers/usb/chipidea/ci13xxx_imx.c:89:3: error: implicit declaration of f=
unction =E2=80=98of_find_device_by_node=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]
> drivers/usb/chipidea/ci13xxx_imx.c:89:12: warning: assignment makes point=
er from integer without a cast [enabled by default]
> cc1: some warnings being treated as errors

then, IMX depends on CONFIG_OF... so you check for CONFIG_OF, but don't
check for IMX. In fact, this is bigger bug on the whole OF
implementation because it defines a function outside of any ifdef
CONFIG_OF_DEVICE, but the prototype on the header is only available
ifdef CONFIG_OF_DEVICE.  Which is quite bogus... that needs to be fixed
ASAP.

--=20
balbi

--8N0TQpGUCeEQshoq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPu2QKAAoJEIaOsuA1yqRE18EQALUWchNfQmkhAnISPKO9XsfH
qDh5qYM/QmuX9BxgZcyVeyfaCHzsSsiX7IBQvJbTLBZu7epo2kRTPTk3jb2lA/WD
FobphtFuDdh7sB3N+FiE0SaB5smP9WnChAKKD2eJ0Gox6I4WDcVrMwvzPiR2+oKR
uVhE0l0qcpMqD4Cy8O8qD77eAHzbglTqqtExcIbDtN80K5Hg6YptEc4JZyPy2FQ6
R5Tc6S6BTIfil+G4bUJvqV0yLCuscuyUED9dEdGwa5O4eknqhNlQvE043uYElobB
soDwPphTzzfaOqEscEEZUkZviZY3Y9qyxUKRQ3i401OFMKC5M5Wo83mHrjiSyOR7
j/51aeKbQ/NpxnvJtKrDSYF9j00jpUrbVpsXy36XDR/Em8xtakO9dY2RbnPozbRm
Nzutq9mFKWMz8R1DsXtrrJU0kk+SS4iOF04cAaMrwBv/9fRM5F7fUQTbbpQaxucb
mvuLHNJuGAr73l8lig7DWlPf3REk2sfzRAH15+CRqqfU4z+h6+J3UL7MFIr1nNFc
rr3ZvxEf8EPKVcifb7iQ7s0otTLbvW1ea+3Bocd1bMw+vhKz7GOZlFQag4YQ+zSq
A9iCLHd8WT0UK72kJCWmUNGWMJfff2B4+bGqtUigkP+eapLwmLHlcwQQRUlFQv8D
HT7z5s0xK5jPMjLtc70P
=d4yC
-----END PGP SIGNATURE-----

--8N0TQpGUCeEQshoq--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
