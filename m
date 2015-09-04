From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 15:04:38 +0200
Message-ID: <201509041504.38412.arnd@arndb.de>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd> <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd> <20150904102130.GA4796@x1>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904102130.GA4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Friday 04 September 2015, Lee Jones wrote:
> > > If we flip it the other way round, some subsystems derive the fir=
mware
> > > name from the 'node name'.  For instance, our zeroth General Purp=
ose
> > > Co-Processor RemoteProc driver has a corresponding node called
> > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a '=
-fw'
> > > suffix and et voil=C3=A0, we load file:
> > >=20
> > >   lib/firmware/rproc-st231-gp0-fw
> >=20
> > IMO deriving from the node name seems fragile. Also imposing a linu=
x'ism
> > "rproc" prefix on the firmware name doesn't seem correct as the fir=
mwares
> > can be shared across OS's. Although this is how remoteproc subsys c=
ore
> > is currently working. It seems a generic DT firmware binding would =
actually
> > be most useful for the remoteproc subsystem.
>=20
> The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back. =
 The
> RProc driver is welcome to supply a different firmware name if it
> desires.  This is where I think a generic 'firmware' property would b=
e
> of use.

The firmware file name is agreed on between the device driver and the
file system, so encoding the linux driver name in it seems appropriate.

Generally speaking, I'd say a good policy would be to try basing
the firmware name on the "compatible" property strings. That property
already contains a hierarchical list of models, which makes it particul=
arly
easy to have firmware files for specific models or those that are share=
d
across multiple variations if necessary. Just ask for the most specific
compatible string first and try the more specific compatible strings
(with an appropriate prefix and/or postfix added by the driver) until
a file is found.

	Arnd
