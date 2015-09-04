From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: st_fdma: Firmware filename in DT?
Date: Fri, 4 Sep 2015 08:44:31 -0500
Message-ID: <CAL_Jsq+XpBV+BMMq1gYnvKtv6O5mjqVw6zsP4G-4Za3cQm9PzQ@mail.gmail.com>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
 <20150904092005.GA2990@griffinp-ThinkPad-X1-Carbon-2nd> <20150904102130.GA4796@x1>
 <201509041504.38412.arnd@arndb.de> <20150904132617.GB4796@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150904132617.GB4796@x1>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 4, 2015 at 8:26 AM, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Fri, 04 Sep 2015, Arnd Bergmann wrote:
>
>> On Friday 04 September 2015, Lee Jones wrote:
>> > > > If we flip it the other way round, some subsystems derive the =
firmware
>> > > > name from the 'node name'.  For instance, our zeroth General P=
urpose
>> > > > Co-Processor RemoteProc driver has a corresponding node called
>> > > > 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and =
a '-fw'
>> > > > suffix and et voil=C3=A0, we load file:
>> > > >
>> > > >   lib/firmware/rproc-st231-gp0-fw
>> > >
>> > > IMO deriving from the node name seems fragile. Also imposing a l=
inux'ism
>> > > "rproc" prefix on the firmware name doesn't seem correct as the =
firmwares
>> > > can be shared across OS's. Although this is how remoteproc subsy=
s core
>> > > is currently working. It seems a generic DT firmware binding wou=
ld actually
>> > > be most useful for the remoteproc subsystem.
>> >
>> > The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-bac=
k.  The
>> > RProc driver is welcome to supply a different firmware name if it
>> > desires.  This is where I think a generic 'firmware' property woul=
d be
>> > of use.
>>
>> The firmware file name is agreed on between the device driver and th=
e
>> file system, so encoding the linux driver name in it seems appropria=
te.
>>
>> Generally speaking, I'd say a good policy would be to try basing
>> the firmware name on the "compatible" property strings. That propert=
y
>> already contains a hierarchical list of models, which makes it parti=
cularly
>> easy to have firmware files for specific models or those that are sh=
ared
>> across multiple variations if necessary. Just ask for the most speci=
fic
>> compatible string first and try the more specific compatible strings
>> (with an appropriate prefix and/or postfix added by the driver) unti=
l
>> a file is found.
>
> It depends what you mean by "basing the firmware name on the
> \"compatible\" property" here.  If you mean actually renaming the
> firmware binary file to match a driver's compatible string, that's
> absolutely out of the question.  Firmwares are not only OS agnostic,
> but are also independent of any H/W description language a particular
> OS or platform might be using.  Using DT'isums to rename these
> binaries is not logical.
>
> However, if you mean simply match on compatible string and supply the
> name from within the driver, that's closer to the mark (as then we ca=
n
> at least keep it in-house [kernel]), but it's still not particularly
> practical for the aforementioned reasons mentioned by Peter earlier.
>
> Why not just create a new 'firmware' property?  Simples! [0]

Someone give me some evidence that other OS's use or will use the same
names. Does *BSD use linux-firmware would be enough. With the
complaints I get that bindings are just Linux driver properties, I'm
not inclined to take this. Having a filename does imply the OS has a
filesystem and drivers can access the filesystem which may not always
be true.

Rob
