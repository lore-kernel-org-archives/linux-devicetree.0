From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: Re: Converting i2c-omap driver to use device tree
Date: Mon, 27 Jun 2011 00:21:27 +0530
Message-ID: <BANLkTimJU1ecxAroZMdWDdcAg6icH1mXyA@mail.gmail.com>
References: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
	<BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA@mail.gmail.com>
	<BANLkTi==YKS854=YDGG44BRy_km31LqifQ@mail.gmail.com>
	<20110626081202.GB24241@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0082352406499356842=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20110626081202.GB24241-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
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

--===============0082352406499356842==
Content-Type: multipart/alternative; boundary=000e0cd215780e5e8a04a6a1ec68

--000e0cd215780e5e8a04a6a1ec68
Content-Type: text/plain; charset=ISO-8859-1

Hi Grant,

On 26 June 2011 13:42, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:

> On Fri, Jun 24, 2011 at 07:08:34PM +0530, Manjunatha GK wrote:
> > Hi Thomas,
> >
> > On 24 June 2011 18:13, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> >
> > > Hi Manjunath,
> > >
>

[...]

> > >
> > > > With the above changes, i was expecting probe function to be called
> since
> > > > device gets binded to driver. But probe will never get called.
> > > >
> > > > Did I miss anything with above procedure?
> > >
> > > What about platform_driver->driver.of_match_table? Is it populated
> > > (set to omap_i2c_of_match)?
> > >
> >
> > Yes. This entry was missing with my changes. With of_match_table, probe
> is
> > getting called.
> > Thanks for the pointer.
>
> Glad to hear you got it sorted out.
>

Yes. Now I am able to get i2c base address from DT through device node
structure but not able to get irq number from DT. The .dts entries are:

+       gic: intc@48241000 {
+               compatible = "arm,omap-gic", "arm,gic";
+               interrupt-controller;
+               #interrupt-cells = <1>;
+               reg = <0x48241000 0x1000>;
+       };
+
+       i2c@48072000 {
+               interrupts = <88>;
+               interrupt-parent = <&gic>;
+               compatible = "ti,omap_i2c";
+               #address-cells = <1>;
+               #size-cells = <0>;
+               reg = <0x48072000 0x80>;
+
+               twl@0x48 {
+                       compatible = "ti,twl6030";
+                       reg = < 0x48 >;
+               };
+
+       };

>From the debug log, it is observed that, the interrupts field will not
exists in device_node data structure. It captures all the fields from the
about i2c DT entries except interrupts field.

[    0.293182] of_irq_map_one: dev=/i2c@48072000, index=0
[    0.293212] of_find_property; pp->name: compatible    name: interrupts
[    0.293212] of_find_property; pp->name: reg   name: interrupts
[    0.293243] of_find_property; pp->name: #address-cells        name:
interrupts
[    0.293243] of_find_property; pp->name: #size-cells   name: interrupts
[    0.293273] of_find_property; pp->name: name  name: interrupts
[    0.293304] omap_i2c_probe: i2c: dev->base: fa072000
[    0.293304] omap_i2c_probe: i2c: dev->irq: ffffffff

Any specific reason for missing entries in device node structures?

Since you explored other ARM boards, is this interrupts field used and
tested?

-Manjunath

--000e0cd215780e5e8a04a6a1ec68
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Grant,<br><br><div class=3D"gmail_quote">On 26 June 2011 13:42, Grant Li=
kely <span dir=3D"ltr">&lt;<a href=3D"mailto:grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org">gra=
nt.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex;">
<div><div></div><div class=3D"h5">On Fri, Jun 24, 2011 at 07:08:34PM +0530,=
 Manjunatha GK wrote:<br>
&gt; Hi Thomas,<br>
&gt;<br>
&gt; On 24 June 2011 18:13, Thomas Abraham &lt;<a href=3D"mailto:thomas.abr=
aham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi Manjunath,<br>
&gt; &gt;<br></div></div></blockquote><div><br>[...]<br><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1=
px solid rgb(204, 204, 204); padding-left: 1ex;"><div><div class=3D"h5">
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
</div></div>Glad to hear you got it sorted out.<br></blockquote><div>=A0</d=
iv><div>Yes. Now I am able to get i2c base address from DT through device n=
ode structure but not able to get irq number from DT. The .dts entries are:=
<br>
<br>+=A0=A0=A0=A0=A0=A0 gic: intc@48241000 {<br>+=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 compatible =3D &quot;arm,omap-gic&quot;, &quot;arm,gic&q=
uot;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-controller;<=
br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #interrupt-cells =3D &lt;1&g=
t;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D &lt;0x48241000 0=
x1000&gt;;<br>
+=A0=A0=A0=A0=A0=A0 };<br>+<br>+=A0=A0=A0=A0=A0=A0 i2c@48072000 {<br>+=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D &lt;88&gt;;<br>+=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-parent =3D &lt;&amp;gic&g=
t;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D &quot;ti,=
omap_i2c&quot;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #address-cel=
ls =3D &lt;1&gt;;<br>
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D &lt;0&gt;;<br>+=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D &lt;0x48072000 0x80&gt;;=
<br>+<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 twl@0x48 {<br>+=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D=
 &quot;ti,twl6030&quot;;<br>+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 reg =3D &lt; 0x48 &gt;;<br>
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };<br>+<br>+=A0=A0=A0=A0=A0=A0 =
};<br><br>From the debug log, it is observed that, the interrupts field wil=
l not exists in device_node data structure. It captures all the fields from=
 the about i2c DT entries except interrupts field. <br>
<br>[=A0=A0=A0 0.293182] of_irq_map_one: dev=3D/i2c@48072000, index=3D0<br>=
[=A0=A0=A0 0.293212] of_find_property; pp-&gt;name: compatible=A0=A0=A0 nam=
e: interrupts<br>[=A0=A0=A0 0.293212] of_find_property; pp-&gt;name: reg=A0=
=A0 name: interrupts<br>[=A0=A0=A0 0.293243] of_find_property; pp-&gt;name:=
 #address-cells=A0=A0=A0=A0=A0=A0=A0 name: interrupts<br>
[=A0=A0=A0 0.293243] of_find_property; pp-&gt;name: #size-cells=A0=A0 name:=
 interrupts<br>[=A0=A0=A0 0.293273] of_find_property; pp-&gt;name: name=A0 =
name: interrupts<br>[=A0=A0=A0 0.293304] omap_i2c_probe: i2c: dev-&gt;base:=
 fa072000<br>[=A0=A0=A0 0.293304] omap_i2c_probe: i2c: dev-&gt;irq: fffffff=
f<br>
<br>Any specific reason for missing entries in device node structures? <br>=
<br>Since you explored other ARM boards, is this interrupts field used and =
tested?<br><br>-Manjunath<br>
</div></div><br>

--000e0cd215780e5e8a04a6a1ec68--

--===============0082352406499356842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0082352406499356842==--
