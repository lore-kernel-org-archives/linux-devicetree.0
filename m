From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Sat, 5 Sep 2015 11:17:59 +0200
Message-ID: <201509051117.59751.arnd@arndb.de>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <201509041504.38412.arnd@arndb.de> <20150904132617.GB4796@x1>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904132617.GB4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 04 September 2015, Lee Jones wrote:
> On Fri, 04 Sep 2015, Arnd Bergmann wrote:
>=20
> > On Friday 04 September 2015, Lee Jones wrote:
> > > > > If we flip it the other way round, some subsystems derive the=
 firmware
> > > > > name from the 'node name'.  For instance, our zeroth General =
Purpose
> > > > > Co-Processor RemoteProc driver has a corresponding node calle=
d
> > > > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and=
 a '-fw'
> > > > > suffix and et voil=C3=A0, we load file:
> > > > >=20
> > > > >   lib/firmware/rproc-st231-gp0-fw
> > > >=20
> > > > IMO deriving from the node name seems fragile. Also imposing a =
linux'ism
> > > > "rproc" prefix on the firmware name doesn't seem correct as the=
 firmwares
> > > > can be shared across OS's. Although this is how remoteproc subs=
ys core
> > > > is currently working. It seems a generic DT firmware binding wo=
uld actually
> > > > be most useful for the remoteproc subsystem.
> > >=20
> > > The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-ba=
ck.  The
> > > RProc driver is welcome to supply a different firmware name if it
> > > desires.  This is where I think a generic 'firmware' property wou=
ld be
> > > of use.
> >=20
> > The firmware file name is agreed on between the device driver and t=
he
> > file system, so encoding the linux driver name in it seems appropri=
ate.
> >=20
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
> It depends what you mean by "basing the firmware name on the
> \"compatible\" property" here.  If you mean actually renaming the
> firmware binary file to match a driver's compatible string, that's
> absolutely out of the question.  Firmwares are not only OS agnostic,
> but are also independent of any H/W description language a particular
> OS or platform might be using.  Using DT'isums to rename these
> binaries is not logical.
>=20

I was thinking of naming the firmware and the compatible string the
same, and often enough that makes sense when both names are picked
by the same person. However, you make a good point that there are cases
where the firmware file already has a name based on some other
decision process and there may be good reasons not to rename the
file. In that case a driver writer can do a lookup table from
one to the other.

The downside of a lookup table of course is that you have to modify
the driver for each new firmware, but then again a lot of drivers
already require that, and others can come up with a policy that lets
you do a programmatic mapping from one to the other by picking
clever compatible strings.

> However, if you mean simply match on compatible string and supply the
> name from within the driver, that's closer to the mark (as then we ca=
n
> at least keep it in-house [kernel]), but it's still not particularly
> practical for the aforementioned reasons mentioned by Peter earlier.
>=20
> Why not just create a new 'firmware' property?  Simples! [0]
>=20
> [0] http://www.oxforddictionaries.com/definition/english/simples

My main thought was that loading a different firmware practically
always means that the device behaves in a (sometimes more, sometimes
less) different way, and we want to reflect that with a different
compatible string. Having a 1:1 relation between the two strings
enforces this.

	Arnd
