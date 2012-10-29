From: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Representation of external memory-mapped devices in DT (gpmc)
Date: Mon, 29 Oct 2012 23:37:08 +0100
Message-ID: <CACTFLAPk3sH1kKuSbjsRFBfYg_CjRG_jTxHVv6GREro3HA-=uA@mail.gmail.com>
References: <508E9513.7050106@gmail.com> <508E9C42.10907@gmail.com>
 <508EBB47.8070405@gmail.com> <508EF9E3.5090507@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8798951381505091678=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <508EF9E3.5090507-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Afzal Mohammed <afzal-l0cyMroinI0@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "Nori,
 Sekhar" <nsekhar-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============8798951381505091678==
Content-Type: multipart/alternative; boundary=047d7bb045d444246404cd3a4f38

--047d7bb045d444246404cd3a4f38
Content-Type: text/plain; charset=ISO-8859-1

Hi Rob,

On Oct 29, 2012 10:49 PM, "Rob Herring" <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On 10/29/2012 12:22 PM, Daniel Mack wrote:
> > On 29.10.2012 16:09, Rob Herring wrote:
> >> On 10/29/2012 09:39 AM, Daniel Mack wrote:
> >>> Hi,
> >>>
> >>> we're currently working on a DT binding for the GPMC bus that is found
> >>> on SoCs by TI. The implementation is based on CS lines and an 8, 16 or
> >>> 32 bit parallel interface. That IP is quite flexible, and it can for
> >>> example be used for physmap flash, external peripherals or even NAND.
> >>>
> >>> Depending on which CS is used to control the device, different memory
> >>> regions are reserved, and there's code to calculate the location and
> >>> size of them, given a CS number (see arch/arm/mach-omap2/gpmc.c).
> >>
> >> I don't know the details of the h/w, but I would think the DT core code
> >> should be able work out the addresses. This can be done using ranges
> >> property which defines the mapping of a child bus into the parent bus
> >> addresses.
> >
> > In this case, the controller is @0x50000000 while the external device is
> > mapped to address 0x0.
>
> Okay, so it's not fixed or some sub-range of the memory map.

It still haz a fixed position i  the memory map (0 - 0x1fffffff), but how
that space is divided for peripherals depends on the configuration.

>
> >>> The binding will use one top-level node to describe the GPMC
controller
> >>> itself and register the actual devices as sub-nodes to it. The NAND
type
> >>> is the only one that is currently supported. This is how it currently
looks:
> >>>
> >>>     gpmc: gpmc@50000000 {
> >>>             compatible = "ti,gpmc";
> >>>             ti,hwmods = "gpmc";
> >>>             reg = <0x50000000 0x2000>;
> >>>             interrupt-parent = <&intc>;
> >>>             interrupts = <100>;
> >>>             #address-cells = <1>;
> >>>             #size-cells = <0>;
> >>>
> >>>             nand@0 {
> >>
> >> You may want a CS0 node with nand as a child node of that.
> >
> > Hmm, I don't see what that would buy us. The question is which way is
> > feasible for storing both the memory region and the cs number in the
> > device tree. The CS number should certainly go to the child node, no?
>
> I was thinking of if you had per CS properties you needed to setup each
> CS. So something like this (using non-zero address to show the
> translation better):
>
> gpmc {
>         compatible = "ti,gpmc", "simple-bus";
>         ti,hwmods = "gpmc";
>         reg = <0x50000000 0x2000>;
>
>         CS0 {
>                 // map 1MB @ gpmc offset 0 to host address 0x10000000
>                 ranges = <0x10000000 0x0 <0x100000>;

The most important bit has a syntax error ;-) Was that property meant to
carry 3 values?

>                 // other gpmc specific per CS properties.
>                 nand {
>                         reg = <0x0 0x100000>;
>                 }
>         };
>

so that way, the child has the awareness about the gpmc controller config
(the offset in the memory map), and is agnostic to the cs number in use,
right? I think this is not really the most convenient approach from a
user's perspective.

> The core code will look at parents' ranges properties to translate the
> local offset of 0 into host address of 0x10000000 Then the nand node's
> reg address will get translated to 0x10000000.

That part is understood, I'm just not sure whether this is the most useful
way of describing the h/w capabilities.

Thanks,
Daniel

>
> The gpmc code can then use the ranges properties to setup the mapping of
> each chip select to the host address. You don't need a new property to
> describe the cs mapping.
>
> Rob
>
> >
> > IOW, would it be a good idea to have something like the following
layout?
> >
> >       gpmc: gpmc@50000000 {
> >               compatible = "ti,gpmc";
> >               ti,hwmods = "gpmc";
> >               reg = <0x50000000 0x2000>;
> >
> >               /* cs-reg stores the setup of the controller's
> >                  memory map */
> >
> >                       /* offset       size */
> >               cs-reg = <0x0           0x1000000
> >                         ....          .....
> >                         ....          .....>;
> >
> >               nand: child@0 {
> >                       /* timings */
> >                       /* peripheral specifics */
> >               };
> >       };
> >
> > I would actually much prefer that approach.
> >
> > Afzal, because because that way, we can leave the code as-is for now and
> > add the "cs-reg" property once the code is switched to dynamic handling.
> > What do you think?
> >
> >
> > Thanks,
> > Daniel
> >
>

--047d7bb045d444246404cd3a4f38
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Rob,</p>
<p dir=3D"ltr">On Oct 29, 2012 10:49 PM, &quot;Rob Herring&quot; &lt;<a hre=
f=3D"mailto:robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On 10/29/2012 12:22 PM, Daniel Mack wrote:<br>
&gt; &gt; On 29.10.2012 16:09, Rob Herring wrote:<br>
&gt; &gt;&gt; On 10/29/2012 09:39 AM, Daniel Mack wrote:<br>
&gt; &gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; we&#39;re currently working on a DT binding for the GPMC =
bus that is found<br>
&gt; &gt;&gt;&gt; on SoCs by TI. The implementation is based on CS lines an=
d an 8, 16 or<br>
&gt; &gt;&gt;&gt; 32 bit parallel interface. That IP is quite flexible, and=
 it can for<br>
&gt; &gt;&gt;&gt; example be used for physmap flash, external peripherals o=
r even NAND.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Depending on which CS is used to control the device, diff=
erent memory<br>
&gt; &gt;&gt;&gt; regions are reserved, and there&#39;s code to calculate t=
he location and<br>
&gt; &gt;&gt;&gt; size of them, given a CS number (see arch/arm/mach-omap2/=
gpmc.c).<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I don&#39;t know the details of the h/w, but I would think th=
e DT core code<br>
&gt; &gt;&gt; should be able work out the addresses. This can be done using=
 ranges<br>
&gt; &gt;&gt; property which defines the mapping of a child bus into the pa=
rent bus<br>
&gt; &gt;&gt; addresses.<br>
&gt; &gt;<br>
&gt; &gt; In this case, the controller is @0x50000000 while the external de=
vice is<br>
&gt; &gt; mapped to address 0x0.<br>
&gt;<br>
&gt; Okay, so it&#39;s not fixed or some sub-range of the memory map.</p>
<p dir=3D"ltr">It still haz a fixed position i=A0 the memory map (0 - 0x1ff=
fffff), but how that space is divided for peripherals depends on the config=
uration.</p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt;&gt;&gt; The binding will use one top-level node to describe the G=
PMC controller<br>
&gt; &gt;&gt;&gt; itself and register the actual devices as sub-nodes to it=
. The NAND type<br>
&gt; &gt;&gt;&gt; is the only one that is currently supported. This is how =
it currently looks:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 gpmc: gpmc@50000000 {<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;ti,gpmc&quot=
;;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 ti,hwmods =3D &quot;gpmc&quot;;<b=
r>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x50000000 0x2000&gt;=
;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D &lt;&amp;int=
c&gt;;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D &lt;100&gt;;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 nand@0 {<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; You may want a CS0 node with nand as a child node of that.<br=
>
&gt; &gt;<br>
&gt; &gt; Hmm, I don&#39;t see what that would buy us. The question is whic=
h way is<br>
&gt; &gt; feasible for storing both the memory region and the cs number in =
the<br>
&gt; &gt; device tree. The CS number should certainly go to the child node,=
 no?<br>
&gt;<br>
&gt; I was thinking of if you had per CS properties you needed to setup eac=
h<br>
&gt; CS. So something like this (using non-zero address to show the<br>
&gt; translation better):<br>
&gt;<br>
&gt; gpmc {<br>
&gt; =A0 =A0 =A0 =A0 compatible =3D &quot;ti,gpmc&quot;, &quot;simple-bus&q=
uot;;<br>
&gt; =A0 =A0 =A0 =A0 ti,hwmods =3D &quot;gpmc&quot;;<br>
&gt; =A0 =A0 =A0 =A0 reg =3D &lt;0x50000000 0x2000&gt;;<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0 CS0 {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 // map 1MB @ gpmc offset 0 to host add=
ress 0x10000000<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ranges =3D &lt;0x10000000 0x0 &lt;0x10=
0000&gt;;</p>
<p dir=3D"ltr">The most important bit has a syntax error ;-) Was that prope=
rty meant to carry 3 values?</p>
<p dir=3D"ltr">&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 // other gpmc specific =
per CS properties.<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand {<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x0 0x1000=
00&gt;;<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }<br>
&gt; =A0 =A0 =A0 =A0 };<br>
&gt;</p>
<p dir=3D"ltr">so that way, the child has the awareness about the gpmc cont=
roller config (the offset in the memory map), and is agnostic to the cs num=
ber in use, right? I think this is not really the most convenient approach =
from a user&#39;s perspective.</p>

<p dir=3D"ltr">&gt; The core code will look at parents&#39; ranges properti=
es to translate the<br>
&gt; local offset of 0 into host address of 0x10000000 Then the nand node&#=
39;s<br>
&gt; reg address will get translated to 0x10000000.</p>
<p dir=3D"ltr">That part is understood, I&#39;m just not sure whether this =
is the most useful way of describing the h/w capabilities.<br></p>
<p dir=3D"ltr">Thanks,<br>
Daniel</p>
<p dir=3D"ltr">&gt;<br>
&gt; The gpmc code can then use the ranges properties to setup the mapping =
of<br>
&gt; each chip select to the host address. You don&#39;t need a new propert=
y to<br>
&gt; describe the cs mapping.<br>
&gt;<br>
&gt; Rob<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; IOW, would it be a good idea to have something like the following=
 layout?<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 gpmc: gpmc@50000000 {<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;ti,gpmc&quot;;<b=
r>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 ti,hwmods =3D &quot;gpmc&quot;;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x50000000 0x2000&gt;;<br=
>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* cs-reg stores the setup of the con=
troller&#39;s<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memory map */<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* offset =A0 =A0 =A0=
 size */<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 cs-reg =3D &lt;0x0 =A0 =A0 =A0 =A0 =
=A0 0x1000000<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .... =A0 =A0 =A0 =
=A0 =A0.....<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .... =A0 =A0 =A0 =
=A0 =A0.....&gt;;<br>
&gt; &gt;<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 nand: child@0 {<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* timings */<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* peripheral specifi=
cs */<br>
&gt; &gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt; =A0 =A0 =A0 };<br>
&gt; &gt;<br>
&gt; &gt; I would actually much prefer that approach.<br>
&gt; &gt;<br>
&gt; &gt; Afzal, because because that way, we can leave the code as-is for =
now and<br>
&gt; &gt; add the &quot;cs-reg&quot; property once the code is switched to =
dynamic handling.<br>
&gt; &gt; What do you think?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Daniel<br>
&gt; &gt;<br>
&gt;<br>
</p>

--047d7bb045d444246404cd3a4f38--

--===============8798951381505091678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8798951381505091678==--
