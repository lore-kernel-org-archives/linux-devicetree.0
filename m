Return-Path: <wlosh@bsdimp.com>
MIME-Version: 1.0
Sender: wlosh@bsdimp.com
In-Reply-To: <201509051058.54229.arnd@arndb.de>
References: <20150903144944.GC7093@griffinp-ThinkPad-X1-Carbon-2nd>
	<201509041504.38412.arnd@arndb.de>
	<C93CEE95-AF30-4B2D-BD96-66733B282414@bsdimp.com>
	<201509051058.54229.arnd@arndb.de>
Date: Sat, 5 Sep 2015 15:06:35 -0600
Message-ID: <CANCZdfrLbbN_nGJ8WLsBHHGuM3SxGgiLgjkZ+YG4zP4BBA68YQ@mail.gmail.com>
Subject: Re: st_fdma: Firmware filename in DT?
From: Warner Losh <imp@bsdimp.com>
Content-Type: multipart/alternative; boundary=001a11354d5c3aab81051f0664de
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robherring2@gmail.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Maxime Coquelin <maxime.coquelin@st.com>, Patrice Chotard <patrice.chotard@st.com>, Ludovic Barre <ludovic.barre@st.com>, "devicetree-spec@vger.kernel.org" <devicetree-spec@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a11354d5c3aab81051f0664de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2015 at 2:58 AM, Arnd Bergmann <arnd@arndb.de> wrote:

> On Friday 04 September 2015, Warner Losh wrote:
> > > On Sep 4, 2015, at 7:04 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Friday 04 September 2015, Lee Jones wrote:
> > >>>> If we flip it the other way round, some subsystems derive the
> firmware
> > >>>> name from the 'node name'.  For instance, our zeroth General Purpo=
se
> > >>>> Co-Processor RemoteProc driver has a corresponding node called
> > >>>> 'st231-gp0@40000000'.  RemoteProc adds an 'rproc-' prefix and a
> '-fw'
> > >>>> suffix and et voil=C3=A0, we load file:
> > >>>>
> > >>>>  lib/firmware/rproc-st231-gp0-fw
> > >>>
> > >>> IMO deriving from the node name seems fragile. Also imposing a
> linux'ism
> > >>> "rproc" prefix on the firmware name doesn't seem correct as the
> firmwares
> > >>> can be shared across OS's. Although this is how remoteproc subsys
> core
> > >>> is currently working. It seems a generic DT firmware binding would
> actually
> > >>> be most useful for the remoteproc subsystem.
> > >>
> > >> The "rproc-%s-fw", where %s =3D=3D driver name, is only a fall-back.=
  The
> > >> RProc driver is welcome to supply a different firmware name if it
> > >> desires.  This is where I think a generic 'firmware' property would
> be>
> > Warner
> >
> >
>
> > >> of use.
> > >
> > > The firmware file name is agreed on between the device driver and the
> > > file system, so encoding the linux driver name in it seems appropriat=
e.
> >
> > Encoding the driver name is not OS independent. It fosters the
> > impression that DT isn=E2=80=99t OS independent, but rather some silly
> > Linux toy and hurts wider adaptation.
>
> I meant encoding the driver name in the path for the firmware file,
> e.g.
>
>          $DRIVER/$COMPATIBLE.bin
>
> where $DRIVER is the name of the driver, and $COMPATIBLE is the name
> from the compatible string.
>
> > > Generally speaking, I'd say a good policy would be to try basing
> > > the firmware name on the "compatible" property strings. That property
> > > already contains a hierarchical list of models, which makes it
> particularly
> > > easy to have firmware files for specific models or those that are
> shared
> > > across multiple variations if necessary. Just ask for the most specif=
ic
> > > compatible string first and try the more specific compatible strings
> > > (with an appropriate prefix and/or postfix added by the driver) until
> > > a file is found.
> >
> > I think this is a horrible policy. It is an ugly kludge that is fragile
> to change.
> > While it sounds cool, I don=E2=80=99t think it is really a viable one. =
It
> requires
> > different compatibility names for different bits of hardware that might
> otherwise
> > be the same just to get different firmware. Sometimes this may be OK,
> > but it does seem needlessly limiting for systems that may have firmware
> > =E2=80=9Cimages=E2=80=9D that are loaded into one hardware block, but a=
ctually control
> > other blocks indirectly (where the different compat strings would be).
>
> The idea is that the compatible string here not only encodes the hardware
> but also how it is getting used. This is the same as what we do with othe=
r
> programmable hardware, such as PHY controllers that can be either PCIe
> or USB3 depending on some setting. The driver would match on the more
> generic
> property that identifies the hardware, while the firmware can match on th=
e
> more specific one, if any, or be provided by the user. As an example,
> you can have
>
>         compatible =3D "fwmaker,firmwaretype",
> "hardwaremaker,thisdevice-instance2",
>                 "hardwaremaker,thisdevice-version-3.1",
> "hardwaremaker,thisdevice";
>
> So the driver matches on the one of the last two strings (as any other
> driver),
> and the firmware can match on the same string, or the user can provide an
> image
> in the file system based on the instance (if there are multiple ones), or
> the
> boot loader can predefine which function should get loaded into this one,
> based
> on how the hardware is physically wired up.
>
> The file name for loading the firmware can still get constructed from
> additional
> properties, e.g. the instance can be appended by the driver instead of
> coming
> from compatible if that makes more sense
>

I understood what you were proposing. It wasn't a lack of understanding
that lead me to the opinion that it was a horrible policy. Despite your
lengthy explanation, you did nothing to address the very simple and common
use case of having identical hardware that none-the-less needs different
firmware which was my basis of the horrible brand I put on this policy.

Also, firmware comes from vendors generally named something other
than FDT compat strings. Renaming firmware generally is also a
horrible policy that most shops frown on. It hampers traceability from
a deployed system back to the sources, for one and introduces one
more place for an 'oops' rename to go undetected until the firmware
is deployed.

So there needs to be a standardized way to augment local policy
to say 'the firmware you need for this node so that the system behaves
as expect in the DT is Y.'

Warner

--001a11354d5c3aab81051f0664de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Sep 5, 2015 at 2:58 AM, Arnd Bergmann <span dir=3D"ltr">&lt;<a =
href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd@arndb.de</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Friday 04 Se=
ptember 2015, Warner Losh wrote:<br>
&gt; &gt; On Sep 4, 2015, at 7:04 AM, Arnd Bergmann &lt;<a href=3D"mailto:a=
rnd@arndb.de">arnd@arndb.de</a>&gt; wrote:<br>
&gt; &gt; On Friday 04 September 2015, Lee Jones wrote:<br>
&gt; &gt;&gt;&gt;&gt; If we flip it the other way round, some subsystems de=
rive the firmware<br>
&gt; &gt;&gt;&gt;&gt; name from the &#39;node name&#39;.=C2=A0 For instance=
, our zeroth General Purpose<br>
&gt; &gt;&gt;&gt;&gt; Co-Processor RemoteProc driver has a corresponding no=
de called<br>
&gt; &gt;&gt;&gt;&gt; &#39;st231-gp0@40000000&#39;.=C2=A0 RemoteProc adds a=
n &#39;rproc-&#39; prefix and a &#39;-fw&#39;<br>
&gt; &gt;&gt;&gt;&gt; suffix and et voil=C3=A0, we load file:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;=C2=A0 lib/firmware/rproc-st231-gp0-fw<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; IMO deriving from the node name seems fragile. Also impos=
ing a linux&#39;ism<br>
&gt; &gt;&gt;&gt; &quot;rproc&quot; prefix on the firmware name doesn&#39;t=
 seem correct as the firmwares<br>
&gt; &gt;&gt;&gt; can be shared across OS&#39;s. Although this is how remot=
eproc subsys core<br>
&gt; &gt;&gt;&gt; is currently working. It seems a generic DT firmware bind=
ing would actually<br>
&gt; &gt;&gt;&gt; be most useful for the remoteproc subsystem.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The &quot;rproc-%s-fw&quot;, where %s =3D=3D driver name, is =
only a fall-back.=C2=A0 The<br>
&gt; &gt;&gt; RProc driver is welcome to supply a different firmware name i=
f it<br>
&gt; &gt;&gt; desires.=C2=A0 This is where I think a generic &#39;firmware&=
#39; property would be&gt;<br>
</span>&gt; Warner<br>
<span class=3D"">&gt;<br>
&gt;<br>
<br>
&gt; &gt;&gt; of use.<br>
&gt; &gt;<br>
&gt; &gt; The firmware file name is agreed on between the device driver and=
 the<br>
&gt; &gt; file system, so encoding the linux driver name in it seems approp=
riate.<br>
&gt;<br>
&gt; Encoding the driver name is not OS independent. It fosters the<br>
&gt; impression that DT isn=E2=80=99t OS independent, but rather some silly=
<br>
&gt; Linux toy and hurts wider adaptation.<br>
<br>
</span>I meant encoding the driver name in the path for the firmware file,<=
br>
e.g.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$DRIVER/$COMPATIBLE.bin<br>
<br>
where $DRIVER is the name of the driver, and $COMPATIBLE is the name<br>
from the compatible string.<br>
<span class=3D""><br>
&gt; &gt; Generally speaking, I&#39;d say a good policy would be to try bas=
ing<br>
&gt; &gt; the firmware name on the &quot;compatible&quot; property strings.=
 That property<br>
&gt; &gt; already contains a hierarchical list of models, which makes it pa=
rticularly<br>
&gt; &gt; easy to have firmware files for specific models or those that are=
 shared<br>
&gt; &gt; across multiple variations if necessary. Just ask for the most sp=
ecific<br>
&gt; &gt; compatible string first and try the more specific compatible stri=
ngs<br>
&gt; &gt; (with an appropriate prefix and/or postfix added by the driver) u=
ntil<br>
&gt; &gt; a file is found.<br>
&gt;<br>
&gt; I think this is a horrible policy. It is an ugly kludge that is fragil=
e to change.<br>
&gt; While it sounds cool, I don=E2=80=99t think it is really a viable one.=
 It requires<br>
&gt; different compatibility names for different bits of hardware that migh=
t otherwise<br>
&gt; be the same just to get different firmware. Sometimes this may be OK,<=
br>
&gt; but it does seem needlessly limiting for systems that may have firmwar=
e<br>
&gt; =E2=80=9Cimages=E2=80=9D that are loaded into one hardware block, but =
actually control<br>
&gt; other blocks indirectly (where the different compat strings would be).=
<br>
<br>
</span>The idea is that the compatible string here not only encodes the har=
dware<br>
but also how it is getting used. This is the same as what we do with other<=
br>
programmable hardware, such as PHY controllers that can be either PCIe<br>
or USB3 depending on some setting. The driver would match on the more gener=
ic<br>
property that identifies the hardware, while the firmware can match on the<=
br>
more specific one, if any, or be provided by the user. As an example,<br>
you can have<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D &quot;fwmaker,firmwaretype&quot;=
, &quot;hardwaremaker,thisdevice-instance2&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;hardwaremaker=
,thisdevice-version-3.1&quot;, &quot;hardwaremaker,thisdevice&quot;;<br>
<br>
So the driver matches on the one of the last two strings (as any other driv=
er),<br>
and the firmware can match on the same string, or the user can provide an i=
mage<br>
in the file system based on the instance (if there are multiple ones), or t=
he<br>
boot loader can predefine which function should get loaded into this one, b=
ased<br>
on how the hardware is physically wired up.<br>
<br>
The file name for loading the firmware can still get constructed from addit=
ional<br>
properties, e.g. the instance can be appended by the driver instead of comi=
ng<br>
from compatible if that makes more sense<br></blockquote><div><br></div><di=
v>I understood what you were proposing. It wasn&#39;t a lack of understandi=
ng</div><div>that lead me to the opinion that it was a horrible policy. Des=
pite your</div><div>lengthy explanation, you did nothing to address the ver=
y simple and common</div><div>use case of having identical hardware that no=
ne-the-less needs different</div><div>firmware which was my basis of the ho=
rrible brand I put on this policy.</div><div><br></div><div>Also, firmware =
comes from vendors generally named something other</div><div>than FDT compa=
t strings. Renaming firmware generally is also a</div><div>horrible policy =
that most shops frown on. It hampers traceability from</div><div>a deployed=
 system back to the sources, for one and introduces one</div><div>more plac=
e for an &#39;oops&#39; rename to go undetected until the firmware</div><di=
v>is deployed.</div><div><br></div><div>So there needs to be a standardized=
 way to augment local policy</div><div>to say &#39;the firmware you need fo=
r this node so that the system behaves</div><div>as expect in the DT is Y.&=
#39;</div><div><br></div><div>Warner</div></div></div></div>

--001a11354d5c3aab81051f0664de--
