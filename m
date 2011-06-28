From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: Re: Converting i2c-omap driver to use device tree
Date: Tue, 28 Jun 2011 19:48:29 +0530
Message-ID: <BANLkTinNVzgGhEXSfQf+WpSMtoUDN-5Jag@mail.gmail.com>
References: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
	<BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA@mail.gmail.com>
	<BANLkTi==YKS854=YDGG44BRy_km31LqifQ@mail.gmail.com>
	<20110626081202.GB24241@ponder.secretlab.ca>
	<BANLkTimJU1ecxAroZMdWDdcAg6icH1mXyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6883785311835242074=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTimJU1ecxAroZMdWDdcAg6icH1mXyA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============6883785311835242074==
Content-Type: multipart/alternative; boundary=20cf30266eda8c6b4004a6c657c7

--20cf30266eda8c6b4004a6c657c7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Grant,
I am able to sort out this issue and i can see irq numbers getting populate=
d
in i2c driver.

I have some other queries related to handling SoC specific data. I will pos=
t
the query with separate thread.

-Manjunath

On 27 June 2011 00:21, Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org> wrote:

> Hi Grant,
>
> On 26 June 2011 13:42, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>
>> On Fri, Jun 24, 2011 at 07:08:34PM +0530, Manjunatha GK wrote:
>> > Hi Thomas,
>> >
>> > On 24 June 2011 18:13, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> wrote:
>> >
>> > > Hi Manjunath,
>> > >
>>
>
> [...]
>
> > > >
>> > > > With the above changes, i was expecting probe function to be calle=
d
>> since
>> > > > device gets binded to driver. But probe will never get called.
>> > > >
>> > > > Did I miss anything with above procedure?
>> > >
>> > > What about platform_driver->driver.of_match_table? Is it populated
>> > > (set to omap_i2c_of_match)?
>> > >
>> >
>> > Yes. This entry was missing with my changes. With of_match_table, prob=
e
>> is
>> > getting called.
>> > Thanks for the pointer.
>>
>> Glad to hear you got it sorted out.
>>
>
> Yes. Now I am able to get i2c base address from DT through device node
> structure but not able to get irq number from DT. The .dts entries are:
>
> +       gic: intc@48241000 {
> +               compatible =3D "arm,omap-gic", "arm,gic";
> +               interrupt-controller;
> +               #interrupt-cells =3D <1>;
> +               reg =3D <0x48241000 0x1000>;
> +       };
> +
> +       i2c@48072000 {
> +               interrupts =3D <88>;
> +               interrupt-parent =3D <&gic>;
> +               compatible =3D "ti,omap_i2c";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               reg =3D <0x48072000 0x80>;
> +
> +               twl@0x48 {
> +                       compatible =3D "ti,twl6030";
> +                       reg =3D < 0x48 >;
> +               };
> +
> +       };
>
> From the debug log, it is observed that, the interrupts field will not
> exists in device_node data structure. It captures all the fields from the
> about i2c DT entries except interrupts field.
>
> [    0.293182] of_irq_map_one: dev=3D/i2c@48072000, index=3D0
> [    0.293212] of_find_property; pp->name: compatible    name: interrupts
> [    0.293212] of_find_property; pp->name: reg   name: interrupts
> [    0.293243] of_find_property; pp->name: #address-cells        name:
> interrupts
> [    0.293243] of_find_property; pp->name: #size-cells   name: interrupts
> [    0.293273] of_find_property; pp->name: name  name: interrupts
> [    0.293304] omap_i2c_probe: i2c: dev->base: fa072000
> [    0.293304] omap_i2c_probe: i2c: dev->irq: ffffffff
>
> Any specific reason for missing entries in device node structures?
>
> Since you explored other ARM boards, is this interrupts field used and
> tested?
>
> -Manjunath
>
>


--=20
Manjunatha GK

Linaro.org <http://www.linaro.org/>* **=E2=94=82 *Open source software for =
ARM SoCs

Follow *Linaro: *Facebook <http://www.facebook.com/pages/Linaro> |
Twitter<http://twitter.com/#%21/linaroorg>|
Blog <http://www.linaro.org/linaro-blog/>

--20cf30266eda8c6b4004a6c657c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Grant,<br>I am able to sort out this issue and i can see irq numbers gettin=
g populated in i2c driver.<br><br>I have some other queries related to hand=
ling SoC specific data. I will post the query with separate thread.<br><br>
-Manjunath<br><br><div class=3D"gmail_quote">On 27 June 2011 00:21, Manjuna=
tha GK <span dir=3D"ltr">&lt;<a href=3D"mailto:manjugk-l0cyMroinI0@public.gmane.org">manjugk@ti.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
Hi Grant,<br><br><div class=3D"gmail_quote"><div class=3D"im">On 26 June 20=
11 13:42, Grant Likely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely=
@secretlab.ca" target=3D"_blank">grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<div><div></div><div>On Fri, Jun 24, 2011 at 07:08:34PM +0530, Manjunatha G=
K wrote:<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; On 24 June 2011 18:13, Thomas Abraham &lt;<a href=3D"mailto:thomas.abr=
aham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" target=3D"_blank">thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:=
<br>
&gt;<br>
&gt; &gt; Hi Manjunath,<br>
&gt; &gt;<br></div></div></blockquote></div><div><br>[...]<br><br></div><di=
v class=3D"im"><blockquote class=3D"gmail_quote" style=3D"margin:0pt 0pt 0p=
t 0.8ex;border-left:1px solid rgb(204, 204, 204);padding-left:1ex"><div><di=
v>

&gt; &gt; &gt;<br>
&gt; &gt; &gt; With the above changes, i was expecting probe function to be=
 called since<br>
&gt; &gt; &gt; device gets binded to driver. But probe will never get calle=
d.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Did I miss anything with above procedure?<br>
&gt; &gt;<br>
&gt; &gt; What about platform_driver-&gt;driver.of_match_table? Is it popul=
ated<br>
&gt; &gt; (set to omap_i2c_of_match)?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Yes. This entry was missing with my changes. With of_match_table, prob=
e is<br>
&gt; getting called.<br>
&gt; Thanks for the pointer.<br>
<br>
</div></div>Glad to hear you got it sorted out.<br></blockquote><div>=C2=A0=
</div></div><div>Yes. Now I am able to get i2c base address from DT through=
 device node structure but not able to get irq number from DT. The .dts ent=
ries are:<br>

<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic: intc@48241000 {<br>+=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 compatible =3D &quot;arm,omap-gic&quot;, &quot;arm,gic&quot;;<br>+=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 interrupt-controller;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #interrupt-cells =3D &lt;1&gt;;<=
br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 reg =3D &lt;0x48241000 0x1000&gt;;<br>

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br>+<br>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 i2c@48072000 {<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 interrupts =3D &lt;88&gt;;<br>+=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 interrupt-parent =3D &lt;&amp;gic&gt;;<br>+=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =
=3D &quot;ti,omap_i2c&quot;;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D &lt;1&gt;;<br=
>

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 #size-cells =3D &lt;0&gt;;<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt;0x480720=
00 0x80&gt;;<br>+<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 twl@0x48 {<br>+=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =3D &quot;ti,twl6030&quot;;<br=
>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D &lt; 0=
x48 &gt;;<br>

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 };<br>+<br>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };<br><br>Fro=
m the debug log, it is observed that, the interrupts field will not exists =
in device_node data structure. It captures all the fields from the about i2=
c DT entries except interrupts field. <br>

<br>[=C2=A0=C2=A0=C2=A0 0.293182] of_irq_map_one: dev=3D/i2c@48072000, inde=
x=3D0<br>[=C2=A0=C2=A0=C2=A0 0.293212] of_find_property; pp-&gt;name: compa=
tible=C2=A0=C2=A0=C2=A0 name: interrupts<br>[=C2=A0=C2=A0=C2=A0 0.293212] o=
f_find_property; pp-&gt;name: reg=C2=A0=C2=A0 name: interrupts<br>[=C2=A0=
=C2=A0=C2=A0 0.293243] of_find_property; pp-&gt;name: #address-cells=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 name: interrupts<br>

[=C2=A0=C2=A0=C2=A0 0.293243] of_find_property; pp-&gt;name: #size-cells=C2=
=A0=C2=A0 name: interrupts<br>[=C2=A0=C2=A0=C2=A0 0.293273] of_find_propert=
y; pp-&gt;name: name=C2=A0 name: interrupts<br>[=C2=A0=C2=A0=C2=A0 0.293304=
] omap_i2c_probe: i2c: dev-&gt;base: fa072000<br>[=C2=A0=C2=A0=C2=A0 0.2933=
04] omap_i2c_probe: i2c: dev-&gt;irq: ffffffff<br>

<br>Any specific reason for missing entries in device node structures? <br>=
<br>Since you explored other ARM boards, is this interrupts field used and =
tested?<br><br>-Manjunath<br>
</div></div><br>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Manjunatha GK<br><p><sp=
an style=3D"font-size:10.0pt;color:#00B050" lang=3D"EN-US"><a href=3D"http:=
//www.linaro.org/" target=3D"_blank"><span style=3D"color:#0044FC">Linaro.o=
rg</span></a><b>=C2=A0</b></span><b><span style=3D"font-size:10.0pt" lang=
=3D"EN-US">=E2=94=82=C2=A0</span></b><span style=3D"font-size:10.0pt" lang=
=3D"EN-US">Open source software for ARM SoCs</span><span style=3D"font-size=
:10pt" lang=3D"EN-US"><br>
</span></p><p><span style=3D"font-size:10.0pt" lang=3D"EN-US">Follow=C2=A0<=
b>Linaro:=C2=A0</b></span><span style=3D"font-size:10.0pt;color:#0044FC"><a=
 href=3D"http://www.facebook.com/pages/Linaro" target=3D"_blank"><span styl=
e=3D"color:blue">Facebook</span></a></span><span style=3D"font-size:10.0pt"=
> | <span style=3D"color:#0044FC"><a href=3D"http://twitter.com/#%21/linaro=
org" target=3D"_blank"><span style=3D"color:blue">Twitter</span></a></span>=
 | <span style=3D"color:#0044FC"><a href=3D"http://www.linaro.org/linaro-bl=
og/" target=3D"_blank"><span style=3D"color:blue">Blog</span></a></span></s=
pan></p>
<br><br>

--20cf30266eda8c6b4004a6c657c7--

--===============6883785311835242074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============6883785311835242074==--
