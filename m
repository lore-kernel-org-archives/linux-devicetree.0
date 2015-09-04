From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 11:21:30 +0100
Message-ID: <20150904102130.GA4796@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
 <20150904065916.GZ4796@x1>
 <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 04 Sep 2015, Peter Griffin wrote:
> On Fri, 04 Sep 2015, Lee Jones wrote:
> > [...]
> >=20
> > > > If yes, is it worth having a generic binding?
> > >=20
> > > If we decide it is a good idea, then yes. It doesn't look that ha=
rd to
> > > arrive at something common.
> > >=20
> > > Strictly speaking, the firmware name is just an agreed upon name
> > > between the kernel and userspace. So why tie that into DT? Would =
other
> > > OS's use it or want something different? What if we started inclu=
ding
> > > paths in the names like <soc>/<firmware file>? Now we are imposin=
g a
> > > directory structure on the OS filesystem.
> >=20
> > In Linux we have a standard place for firmwares, so the path should
> > not be required.  I certainly agree that DT is no place for absolut=
e
> > paths or OS'isums.
> >=20
> > [...]
> >=20
> > > > Presumably the alternative would be to add a whole bunch of com=
patibles
> > > > in the driver for each SoC, where the only difference from a
> > > > functional point of view would be to help build the correct str=
ing for
> > > > the firmware filename. However I'm also then wondering what the=
 best way
> > > > would be to find out the instance name of the IP.
> > >=20
> > > If the name/path is Linux specific, then that is probably what we=
 should do.
> > >=20
> > > You could perhaps make a policy that firmware files be named by
> > > compatible string. So rather than translating from matching compa=
tible
> > > to an arbitrary file name, you enforce file name is "<vendor>,<ip
> > > block>.fw" or something. I know we don't have policy in the kerne=
l,
> > > but we already have it with hardcoded file names and search paths=
=2E
> >=20
> > Absolutely not.  Firmwares have no direct link to DT or platforms t=
hat
> > run DT specifically.  They are carried by most platforms these days=
=2E
> > Insisting on firmwares using a DT compatible string format is way o=
ff.
> >=20
> > If we flip it the other way round, some subsystems derive the firmw=
are
> > name from the 'node name'.  For instance, our zeroth General Purpos=
e
> > Co-Processor RemoteProc driver has a corresponding node called
> > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a '-f=
w'
> > suffix and et voil=C3=A0, we load file:
> >=20
> >   lib/firmware/rproc-st231-gp0-fw
>=20
> IMO deriving from the node name seems fragile. Also imposing a linux'=
ism
> "rproc" prefix on the firmware name doesn't seem correct as the firmw=
ares
> can be shared across OS's. Although this is how remoteproc subsys cor=
e
> is currently working. It seems a generic DT firmware binding would ac=
tually
> be most useful for the remoteproc subsystem.

The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back.  T=
he
RProc driver is welcome to supply a different firmware name if it
desires.  This is where I think a generic 'firmware' property would be
of use.

> I guess I should also comment about this on the ST remoteproc thread.
>=20
> I'm curious though as to how the ST remoteproc driver then loads the =
firmware,
> as that name doesn't look like a video or audio firmware filename tha=
t I've
> seen shipped from ST. IIRC Usually it is named something like
>=20
> vid_firmware-stih407.elf or audio_firmware-bd-stih407.elf

This driver came direct from ST.  I'm using their conventions as a
default, although I would be happy to conduct some investigation into
how this works for releases and suggest a better interface.  The only
reason I mentioned it here was because this is how others are using
other SS which are similar in some way.  Same for the Firmware SS I
guess.

In my unbiased PoV, I'd much prefer the name was derived from a
predefined properly.

> IMO we should be treating the firmware as a blackbox, and for me that=
 also
> includes the filename it is shipped with. Linux drivers making up the=
ir own
> firmware names based on the name of their subsystem doesn't seem like=
 a
> good way forward to me.

I guess the driver author was just using the fall-back convention for
testing.  I'm pretty sure RemoteProc isn't being shipped in products
yet.

> Presumably to test this driver you have to rename the firmwares
> locally on your machine?

The firmware that was provided to conduct testing was already named as
expected by the driver, but yes, if we were to test the firmwares you
mentioned they would either have to be renamed, or those names would
have to be provided to the RemoteProc SS in a different way.

> > > > We could do it by parsing the node name e.g. fdma0-audio, or by=
 adding
> > > > a "instance" DT property to the node?
> > >=20
> > > Generally we try to avoid caring about node names. Having some in=
dex
> > > or numbering also comes up which we also try to avoid. Generally,=
 if
> > > you care about which instance you use for something, then there i=
s
> > > some property you care about and should add.
> >=20
> > Right, the alternative is a property like the ones already used.
> > However, as these are becoming more prevalent I suggested
> > standardising the property to avoid all these vendor specific firmw=
are
> > properties cluttering up the place.
>=20
> I agree a proliferation of vendor specific firmware properties isn't
> s good way forward.
>=20
> >   firmware =3D "firmwarename.fw";
> > OR
> >   firmware-name =3D "firmwarename.fw";
> >=20
> > ... seems appropriate.
>=20
> Either of those is fine with me.

Just need a DT nod and I'll happily code it up.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
