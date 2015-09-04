From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 14:26:17 +0100
Message-ID: <20150904132617.GB4796@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904102130.GA4796@x1>
 <201509041504.38412.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201509041504.38412.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 04 Sep 2015, Arnd Bergmann wrote:

> On Friday 04 September 2015, Lee Jones wrote:
> > > > If we flip it the other way round, some subsystems derive the f=
irmware
> > > > name from the 'node name'.  For instance, our zeroth General Pu=
rpose
> > > > Co-Processor RemoteProc driver has a corresponding node called
> > > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a=
 '-fw'
> > > > suffix and et voil=C3=A0, we load file:
> > > >=20
> > > >   lib/firmware/rproc-st231-gp0-fw
> > >=20
> > > IMO deriving from the node name seems fragile. Also imposing a li=
nux'ism
> > > "rproc" prefix on the firmware name doesn't seem correct as the f=
irmwares
> > > can be shared across OS's. Although this is how remoteproc subsys=
 core
> > > is currently working. It seems a generic DT firmware binding woul=
d actually
> > > be most useful for the remoteproc subsystem.
> >=20
> > The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back=
=2E  The
> > RProc driver is welcome to supply a different firmware name if it
> > desires.  This is where I think a generic 'firmware' property would=
 be
> > of use.
>=20
> The firmware file name is agreed on between the device driver and the
> file system, so encoding the linux driver name in it seems appropriat=
e.
>=20
> Generally speaking, I'd say a good policy would be to try basing
> the firmware name on the "compatible" property strings. That property
> already contains a hierarchical list of models, which makes it partic=
ularly
> easy to have firmware files for specific models or those that are sha=
red
> across multiple variations if necessary. Just ask for the most specif=
ic
> compatible string first and try the more specific compatible strings
> (with an appropriate prefix and/or postfix added by the driver) until
> a file is found.

It depends what you mean by "basing the firmware name on the
\"compatible\" property" here.  If you mean actually renaming the
firmware binary file to match a driver's compatible string, that's
absolutely out of the question.  Firmwares are not only OS agnostic,
but are also independent of any H/W description language a particular
OS or platform might be using.  Using DT'isums to rename these
binaries is not logical.

However, if you mean simply match on compatible string and supply the
name from within the driver, that's closer to the mark (as then we can
at least keep it in-house [kernel]), but it's still not particularly
practical for the aforementioned reasons mentioned by Peter earlier.

Why not just create a new 'firmware' property?  Simples! [0]

[0] http://www.oxforddictionaries.com/definition/english/simples

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
