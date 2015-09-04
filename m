From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 14:54:08 +0100
Message-ID: <20150904135407.GC4796@x1>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904102130.GA4796@x1>
 <201509041504.38412.arnd@arndb.de>
 <20150904132617.GB4796@x1>
 <CAL_Jsq+XpBV+BMMq1gYnvKtv6O5mjqVw6zsP4G-4Za3cQm9PzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+XpBV+BMMq1gYnvKtv6O5mjqVw6zsP4G-4Za3cQm9PzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 04 Sep 2015, Rob Herring wrote:

> On Fri, Sep 4, 2015 at 8:26 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrot=
e:
> > On Fri, 04 Sep 2015, Arnd Bergmann wrote:
> >
> >> On Friday 04 September 2015, Lee Jones wrote:
> >> > > > If we flip it the other way round, some subsystems derive th=
e firmware
> >> > > > name from the 'node name'.  For instance, our zeroth General=
 Purpose
> >> > > > Co-Processor RemoteProc driver has a corresponding node call=
ed
> >> > > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix an=
d a '-fw'
> >> > > > suffix and et voil=C3=A0, we load file:
> >> > > >
> >> > > >   lib/firmware/rproc-st231-gp0-fw
> >> > >
> >> > > IMO deriving from the node name seems fragile. Also imposing a=
 linux'ism
> >> > > "rproc" prefix on the firmware name doesn't seem correct as th=
e firmwares
> >> > > can be shared across OS's. Although this is how remoteproc sub=
sys core
> >> > > is currently working. It seems a generic DT firmware binding w=
ould actually
> >> > > be most useful for the remoteproc subsystem.
> >> >
> >> > The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-b=
ack.  The
> >> > RProc driver is welcome to supply a different firmware name if i=
t
> >> > desires.  This is where I think a generic 'firmware' property wo=
uld be
> >> > of use.
> >>
> >> The firmware file name is agreed on between the device driver and =
the
> >> file system, so encoding the linux driver name in it seems appropr=
iate.
> >>
> >> Generally speaking, I'd say a good policy would be to try basing
> >> the firmware name on the "compatible" property strings. That prope=
rty
> >> already contains a hierarchical list of models, which makes it par=
ticularly
> >> easy to have firmware files for specific models or those that are =
shared
> >> across multiple variations if necessary. Just ask for the most spe=
cific
> >> compatible string first and try the more specific compatible strin=
gs
> >> (with an appropriate prefix and/or postfix added by the driver) un=
til
> >> a file is found.
> >
> > It depends what you mean by "basing the firmware name on the
> > \"compatible\" property" here.  If you mean actually renaming the
> > firmware binary file to match a driver's compatible string, that's
> > absolutely out of the question.  Firmwares are not only OS agnostic=
,
> > but are also independent of any H/W description language a particul=
ar
> > OS or platform might be using.  Using DT'isums to rename these
> > binaries is not logical.
> >
> > However, if you mean simply match on compatible string and supply t=
he
> > name from within the driver, that's closer to the mark (as then we =
can
> > at least keep it in-house [kernel]), but it's still not particularl=
y
> > practical for the aforementioned reasons mentioned by Peter earlier=
=2E
> >
> > Why not just create a new 'firmware' property?  Simples! [0]
>=20
> Someone give me some evidence that other OS's use or will use the sam=
e
> names. Does *BSD use linux-firmware would be enough. With the
> complaints I get that bindings are just Linux driver properties, I'm
> not inclined to take this. Having a filename does imply the OS has a
> filesystem and drivers can access the filesystem which may not always
> be true.

Peter already provided a real-world example of multiple OSes using the
same Firmware based on his experience at ST.  Any vendor using this API
who doesn't _soley_ use Linux is likely to use the same firmware files
across all platforms.  The co-processor's jobs don't often change just
because the platform is running a different OS.

I don't know enough about the inner workings of other Operating
Systems to comment on your final statement, but if they can get
access to the filesystem them they'll need the name too.  If they
don't have access to the firmware file, then they don't require the
property and it becomes unused by them.  That's not an issue is it?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
