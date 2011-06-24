From: Manjunatha GK <manjugk-l0cyMroinI0@public.gmane.org>
Subject: Re: Converting i2c-omap driver to use device tree
Date: Fri, 24 Jun 2011 19:08:34 +0530
Message-ID: <BANLkTi==YKS854=YDGG44BRy_km31LqifQ@mail.gmail.com>
References: <BANLkTin0zaE6M=0+9bq6sCvCVO_PJqYseA@mail.gmail.com>
	<BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0708256244574866621=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <BANLkTi=DmNC6BbwDU+4smFvbc+LzFLiiOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org\"" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============0708256244574866621==
Content-Type: multipart/alternative; boundary=0016e6dab3496b83f104a675519b

--0016e6dab3496b83f104a675519b
Content-Type: text/plain; charset=ISO-8859-1

Hi Thomas,

On 24 June 2011 18:13, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> Hi Manjunath,
>
> I will try to give some comments based on whatever little I know about
> DT. My comments maybe wrong too, I am still learning DT.
>
> On 23 June 2011 19:45, Manjunatha GK <manjugk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> > Hi Grant,
> > I am trying to convert i2c-omap driver to use device tree. Since omap i2c
> > driver uses it's own mechanism to register as platform device, I have
> > commented out i2c device registration part from board file and trying to
> use
> > DT data in probe function of i2c driver.
> >
> > I have i2c node declared under omap4-panda.dts as:
> >
> > +       i2c@48072000 {
> > +               compatible = "ti,omap_i2c";
> > +               reg = <0x48072000 0x80>;
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
>
> Shouldn't size-cells = 1 ?
>
> > +
> > +               twl@48 {
> > +                       compatible = "twl6030,4030-6030";
> > +                       reg = < 0x48 >;
> > +               };
> > +       };
> >
> > and board file is changed as:
> >
> > @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
> >  {
> >         int package = OMAP_PACKAGE_CBS;
> >
> > +#ifdef CONFIG_OF
> > +       of_platform_prepare(NULL, NULL);
> > +#endif /* CONFIG_OF */
>
> Is of_platform_prepare still required?
>

not required. removed now.


> > +
> >         if (omap_rev() == OMAP4430_REV_ES1_0)
> >                 package = OMAP_PACKAGE_CBL;
> >         omap4_mux_init(board_mux, NULL, package);
> > @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
> >         omap4_ehci_init();
> >         usb_musb_init(&musb_board_data);
> >         omap4_panda_display_init();
> > +       of_platform_populate(NULL, NULL, NULL, NULL);
>
> Is it not required to provide the second parameter (matches) atleast?
> It depends on your dts file I guess. Maybe a proper matching is not
> happening.
>
yes. updated with second parameter as per entry in dts file.

>
> >  }
> >
> > I have commented out device registration for I2C1 in board file:
> >
> > diff --git a/arch/arm/mach-omap2/board-omap4panda.c
> > b/arch/arm/mach-omap2/board-omap4panda.c
> > index c9d1e13..0c31f35 100644
> > --- a/arch/arm/mach-omap2/board-omap4panda.c
> > +++ b/arch/arm/mach-omap2/board-omap4panda.c
> > @@ -409,7 +410,7 @@ static struct i2c_board_info __initdata
> > panda_i2c_eeprom[] = {
> >
> >  static int __init omap4_panda_i2c_init(void)
> >  {
> > -       omap4_pmic_init("twl6030", &omap4_panda_twldata);
> > +       //omap4_pmic_init("twl6030", &omap4_panda_twldata);
> > @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)
> >  {
> >         int package = OMAP_PACKAGE_CBS;
> >
> > +#ifdef CONFIG_OF
> > +       of_platform_prepare(NULL, NULL);
> > +#endif /* CONFIG_OF */
> > +
> >         if (omap_rev() == OMAP4430_REV_ES1_0)
> >                 package = OMAP_PACKAGE_CBL;
> >         omap4_mux_init(board_mux, NULL, package);
> > @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)
> >         omap4_ehci_init();
> >         usb_musb_init(&musb_board_data);
> >         omap4_panda_display_init();
> > +       of_platform_populate(NULL, NULL, NULL, NULL);
> >  }
> >
> > and i2c-omap is modified as:
> >
> > +static const struct of_device_id omap_i2c_of_match[];
> >  static int __devinit
> >  omap_i2c_probe(struct platform_device *pdev)
> >  {
> > @@ -1162,6 +1169,12 @@ static int omap_i2c_resume(struct device *dev)
> >         return 0;
> >  }
> >
> > +static const struct of_device_id omap_i2c_of_match[] = {
> > +       {.compatible = "omap_i2c", },
> > +       {},
> > +}
> > +MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
> >
> > With the above changes, i was expecting probe function to be called since
> > device gets binded to driver. But probe will never get called.
> >
> > Did I miss anything with above procedure?
>
> What about platform_driver->driver.of_match_table? Is it populated
> (set to omap_i2c_of_match)?
>

Yes. This entry was missing with my changes. With of_match_table, probe is
getting called.
Thanks for the pointer.

-Manjunath

--0016e6dab3496b83f104a675519b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Thomas,<br><br><div class=3D"gmail_quote">On 24 June 2011 18:13, Thomas =
Abraham <span dir=3D"ltr">&lt;<a href=3D"mailto:thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org">=
thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex;">
Hi Manjunath,<br>
<br>
I will try to give some comments based on whatever little I know about<br>
DT. My comments maybe wrong too, I am still learning DT.<br>
<div class=3D"im"><br>
On 23 June 2011 19:45, Manjunatha GK &lt;<a href=3D"mailto:manjugk@linaro.o=
rg">manjugk-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org</a>&gt; wrote:<br>
</div><div class=3D"im">&gt; Hi Grant,<br>
&gt; I am trying to convert i2c-omap driver to use device tree. Since omap =
i2c<br>
&gt; driver uses it&#39;s own mechanism to register as platform device, I h=
ave<br>
&gt; commented out i2c device registration part from board file and trying =
to use<br>
&gt; DT data in probe function of i2c driver.<br>
&gt;<br>
&gt; I have i2c node declared under omap4-panda.dts as:<br>
&gt;<br>
&gt; +=A0=A0=A0=A0=A0=A0 i2c@48072000 {<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D &quot;ti,om=
ap_i2c&quot;;<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D &lt;0x48072000 0x8=
0&gt;;<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D &lt;1&g=
t;;<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D &lt;0&gt;;=
<br>
<br>
</div>Shouldn&#39;t size-cells =3D 1 ?<br>
<div class=3D"im"><br>
&gt; +<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 twl@48 {<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 co=
mpatible =3D &quot;twl6030,4030-6030&quot;;<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 re=
g =3D &lt; 0x48 &gt;;<br>
&gt; +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 };<br>
&gt; +=A0=A0=A0=A0=A0=A0 };<br>
&gt;<br>
&gt; and board file is changed as:<br>
&gt;<br>
&gt; @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)<br>
&gt; =A0{<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 int package =3D OMAP_PACKAGE_CBS;<br>
&gt;<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +=A0=A0=A0=A0=A0=A0 of_platform_prepare(NULL, NULL);<br>
&gt; +#endif /* CONFIG_OF */<br>
<br>
</div>Is of_platform_prepare still required?<br></blockquote><div>=A0</div>=
<div>not required. removed now. <br><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 20=
4, 204); padding-left: 1ex;">

<div class=3D"im"><br>
&gt; +<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 if (omap_rev() =3D=3D OMAP4430_REV_ES1_0)<br>
&gt; =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 package =3D OMAP_PACKAGE=
_CBL;<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_mux_init(board_mux, NULL, package);<br>
&gt; @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_ehci_init();<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 usb_musb_init(&amp;musb_board_data);<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_panda_display_init();<br>
&gt; +=A0=A0=A0=A0=A0=A0 of_platform_populate(NULL, NULL, NULL, NULL);<br>
<br>
</div>Is it not required to provide the second parameter (matches) atleast?=
<br>
It depends on your dts file I guess. Maybe a proper matching is not<br>
happening.<br></blockquote><div>yes. updated with second parameter as per e=
ntry in dts file. <br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-l=
eft: 1ex;">

<div><div></div><div class=3D"h5"><br>
&gt; =A0}<br>
&gt;<br>
&gt; I have commented out device registration for I2C1 in board file:<br>
&gt;<br>
&gt; diff --git a/arch/arm/mach-omap2/board-omap4panda.c<br>
&gt; b/arch/arm/mach-omap2/board-omap4panda.c<br>
&gt; index c9d1e13..0c31f35 100644<br>
&gt; --- a/arch/arm/mach-omap2/board-omap4panda.c<br>
&gt; +++ b/arch/arm/mach-omap2/board-omap4panda.c<br>
&gt; @@ -409,7 +410,7 @@ static struct i2c_board_info __initdata<br>
&gt; panda_i2c_eeprom[] =3D {<br>
&gt;<br>
&gt; =A0static int __init omap4_panda_i2c_init(void)<br>
&gt; =A0{<br>
&gt; -=A0=A0=A0=A0=A0=A0 omap4_pmic_init(&quot;twl6030&quot;, &amp;omap4_pa=
nda_twldata);<br>
&gt; +=A0=A0=A0=A0=A0=A0 //omap4_pmic_init(&quot;twl6030&quot;, &amp;omap4_=
panda_twldata);<br>
&gt; @@ -685,6 +686,10 @@ static void __init omap4_panda_init(void)<br>
&gt; =A0{<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 int package =3D OMAP_PACKAGE_CBS;<br>
&gt;<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +=A0=A0=A0=A0=A0=A0 of_platform_prepare(NULL, NULL);<br>
&gt; +#endif /* CONFIG_OF */<br>
&gt; +<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 if (omap_rev() =3D=3D OMAP4430_REV_ES1_0)<br>
&gt; =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 package =3D OMAP_PACKAGE=
_CBL;<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_mux_init(board_mux, NULL, package);<br>
&gt; @@ -700,6 +705,7 @@ static void __init omap4_panda_init(void)<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_ehci_init();<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 usb_musb_init(&amp;musb_board_data);<br>
&gt; =A0=A0=A0=A0=A0=A0=A0 omap4_panda_display_init();<br>
&gt; +=A0=A0=A0=A0=A0=A0 of_platform_populate(NULL, NULL, NULL, NULL);<br>
&gt; =A0}<br>
&gt;<br>
&gt; and i2c-omap is modified as:<br>
&gt;<br>
&gt; +static const struct of_device_id omap_i2c_of_match[];<br>
&gt; =A0static int __devinit<br>
&gt; =A0omap_i2c_probe(struct platform_device *pdev)<br>
&gt; =A0{<br>
&gt; @@ -1162,6 +1169,12 @@ static int omap_i2c_resume(struct device *dev)<=
br>
&gt; =A0=A0=A0=A0=A0=A0=A0 return 0;<br>
&gt; =A0}<br>
&gt;<br>
&gt; +static const struct of_device_id omap_i2c_of_match[] =3D {<br>
&gt; +=A0=A0=A0=A0=A0=A0 {.compatible =3D &quot;omap_i2c&quot;, },<br>
&gt; +=A0=A0=A0=A0=A0=A0 {},<br>
&gt; +}<br>
&gt; +MODULE_DEVICE_TABLE(of, omap_i2c_of_match);<br>
&gt;<br>
&gt; With the above changes, i was expecting probe function to be called si=
nce<br>
&gt; device gets binded to driver. But probe will never get called.<br>
&gt;<br>
&gt; Did I miss anything with above procedure?<br>
<br>
</div></div>What about platform_driver-&gt;driver.of_match_table? Is it pop=
ulated<br>
(set to omap_i2c_of_match)?<br></blockquote><div>=A0</div><div>Yes. This en=
try was missing with my changes. With of_match_table, probe is getting call=
ed.<br>Thanks for the pointer. <br>
</div></div><br>-Manjunath<br>

--0016e6dab3496b83f104a675519b--

--===============0708256244574866621==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0708256244574866621==--
