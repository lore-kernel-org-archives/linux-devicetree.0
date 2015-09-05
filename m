From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Sat, 5 Sep 2015 10:58:54 +0200
Message-ID: <201509051058.54229.arnd@arndb.de>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <201509041504.38412.arnd@arndb.de> <C93CEE95-AF30-4B2D-BD96-66733B282414@bsdimp.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <C93CEE95-AF30-4B2D-BD96-66733B282414-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 04 September 2015, Warner Losh wrote:
> > On Sep 4, 2015, at 7:04 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> > On Friday 04 September 2015, Lee Jones wrote:
> >>>> If we flip it the other way round, some subsystems derive the fi=
rmware
> >>>> name from the 'node name'.  For instance, our zeroth General Pur=
pose
> >>>> Co-Processor RemoteProc driver has a corresponding node called
> >>>> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a =
'-fw'
> >>>> suffix and et voil=C3=A0, we load file:
> >>>>=20
> >>>>  lib/firmware/rproc-st231-gp0-fw
> >>>=20
> >>> IMO deriving from the node name seems fragile. Also imposing a li=
nux'ism
> >>> "rproc" prefix on the firmware name doesn't seem correct as the f=
irmwares
> >>> can be shared across OS's. Although this is how remoteproc subsys=
 core
> >>> is currently working. It seems a generic DT firmware binding woul=
d actually
> >>> be most useful for the remoteproc subsystem.
> >>=20
> >> The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-bac=
k.  The
> >> RProc driver is welcome to supply a different firmware name if it
> >> desires.  This is where I think a generic 'firmware' property woul=
d be>=20
> Warner
>=20
>=20

> >> of use.
> >=20
> > The firmware file name is agreed on between the device driver and t=
he
> > file system, so encoding the linux driver name in it seems appropri=
ate.
>=20
> Encoding the driver name is not OS independent. It fosters the
> impression that DT isn=E2=80=99t OS independent, but rather some sill=
y
> Linux toy and hurts wider adaptation.

I meant encoding the driver name in the path for the firmware file,
e.g.

	 $DRIVER/$COMPATIBLE.bin

where $DRIVER is the name of the driver, and $COMPATIBLE is the name
from the compatible string.

> > Generally speaking, I'd say a good policy would be to try basing
> > the firmware name on the "compatible" property strings. That proper=
ty
> > already contains a hierarchical list of models, which makes it part=
icularly
> > easy to have firmware files for specific models or those that are s=
hared
> > across multiple variations if necessary. Just ask for the most spec=
ific
> > compatible string first and try the more specific compatible string=
s
> > (with an appropriate prefix and/or postfix added by the driver) unt=
il
> > a file is found.
>=20
> I think this is a horrible policy. It is an ugly kludge that is fragi=
le to change.
> While it sounds cool, I don=E2=80=99t think it is really a viable one=
=2E It requires
> different compatibility names for different bits of hardware that mig=
ht otherwise
> be the same just to get different firmware. Sometimes this may be OK,
> but it does seem needlessly limiting for systems that may have firmwa=
re
> =E2=80=9Cimages=E2=80=9D that are loaded into one hardware block, but=
 actually control
> other blocks indirectly (where the different compat strings would be)=
=2E

The idea is that the compatible string here not only encodes the hardwa=
re
but also how it is getting used. This is the same as what we do with ot=
her
programmable hardware, such as PHY controllers that can be either PCIe
or USB3 depending on some setting. The driver would match on the more g=
eneric
property that identifies the hardware, while the firmware can match on =
the
more specific one, if any, or be provided by the user. As an example,
you can have

	compatible =3D "fwmaker,firmwaretype", "hardwaremaker,thisdevice-insta=
nce2",
		"hardwaremaker,thisdevice-version-3.1", "hardwaremaker,thisdevice";

So the driver matches on the one of the last two strings (as any other =
driver),
and the firmware can match on the same string, or the user can provide =
an image
in the file system based on the instance (if there are multiple ones), =
or the
boot loader can predefine which function should get loaded into this on=
e, based
on how the hardware is physically wired up.

The file name for loading the firmware can still get constructed from a=
dditional
properties, e.g. the instance can be appended by the driver instead of =
coming
from compatible if that makes more sense.

	Arnd
