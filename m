From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 10:20:05 +0100
Message-ID: <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <CAL_JsqKQqbAQCPR6xuR2Ke5gEdX4kQYb29-W3qNaZqjM_JBoYg@mail.gmail.com>
 <20150904065916.GZ4796@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150904065916.GZ4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Lee,

On Fri, 04 Sep 2015, Lee Jones wrote:

> [...]
>=20
> > > If yes, is it worth having a generic binding?
> >=20
> > If we decide it is a good idea, then yes. It doesn't look that hard=
 to
> > arrive at something common.
> >=20
> > Strictly speaking, the firmware name is just an agreed upon name
> > between the kernel and userspace. So why tie that into DT? Would ot=
her
> > OS's use it or want something different? What if we started includi=
ng
> > paths in the names like <soc>/<firmware file>? Now we are imposing =
a
> > directory structure on the OS filesystem.
>=20
> In Linux we have a standard place for firmwares, so the path should
> not be required.  I certainly agree that DT is no place for absolute
> paths or OS'isums.
>=20
> [...]
>=20
> > > Presumably the alternative would be to add a whole bunch of compa=
tibles
> > > in the driver for each SoC, where the only difference from a
> > > functional point of view would be to help build the correct strin=
g for
> > > the firmware filename. However I'm also then wondering what the b=
est way
> > > would be to find out the instance name of the IP.
> >=20
> > If the name/path is Linux specific, then that is probably what we s=
hould do.
> >=20
> > You could perhaps make a policy that firmware files be named by
> > compatible string. So rather than translating from matching compati=
ble
> > to an arbitrary file name, you enforce file name is "<vendor>,<ip
> > block>.fw" or something. I know we don't have policy in the kernel,
> > but we already have it with hardcoded file names and search paths.
>=20
> Absolutely not.  Firmwares have no direct link to DT or platforms tha=
t
> run DT specifically.  They are carried by most platforms these days.
> Insisting on firmwares using a DT compatible string format is way off=
=2E
>=20
> If we flip it the other way round, some subsystems derive the firmwar=
e
> name from the 'node name'.  For instance, our zeroth General Purpose
> Co-Processor RemoteProc driver has a corresponding node called
> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a '-fw'
> suffix and et voil=E0, we load file:
>=20
>   lib/firmware/rproc-st231-gp0-fw

IMO deriving from the node name seems fragile. Also imposing a linux'is=
m
"rproc" prefix on the firmware name doesn't seem correct as the firmwar=
es
can be shared across OS's. Although this is how remoteproc subsys core
is currently working. It seems a generic DT firmware binding would actu=
ally
be most useful for the remoteproc subsystem.

I guess I should also comment about this on the ST remoteproc thread.

I'm curious though as to how the ST remoteproc driver then loads the fi=
rmware,
as that name doesn't look like a video or audio firmware filename that =
I've
seen shipped from ST. IIRC Usually it is named something like

vid_firmware-stih407.elf or audio_firmware-bd-stih407.elf

IMO we should be treating the firmware as a blackbox, and for me that a=
lso
includes the filename it is shipped with. Linux drivers making up their=
 own
firmware names based on the name of their subsystem doesn't seem like a
good way forward to me. Presumably to test this driver you have to rena=
me the
firmwares locally on your machine?

>=20
> > > We could do it by parsing the node name e.g. fdma0-audio, or by a=
dding
> > > a "instance" DT property to the node?
> >=20
> > Generally we try to avoid caring about node names. Having some inde=
x
> > or numbering also comes up which we also try to avoid. Generally, i=
f
> > you care about which instance you use for something, then there is
> > some property you care about and should add.
>=20
> Right, the alternative is a property like the ones already used.
> However, as these are becoming more prevalent I suggested
> standardising the property to avoid all these vendor specific firmwar=
e
> properties cluttering up the place.

I agree a proliferation of vendor specific firmware properties isn't
s good way forward.

>=20
>   firmware =3D "firmwarename.fw";
> OR
>   firmware-name =3D "firmwarename.fw";
>=20
> ... seems appropriate.

Either of those is fine with me.

regards,

Peter.
