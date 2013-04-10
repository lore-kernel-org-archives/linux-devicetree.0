From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7] clk: add si5351 i2c common clock driver
Date: Wed, 10 Apr 2013 18:34:01 +0200
Message-ID: <CABJ1b_TsrV_R4zdik_8wpfLkCVDLrY9eP1LTJcBfYmunw_5MFQ@mail.gmail.com>
References: <1365439617-18816-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <1365586810-6752-1-git-send-email-sebastian.hesselbarth@gmail.com>
 <51653C3E.2020702@gmail.com> <14854575.YAd2OMKOy9@ganymedes>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7982864754365401494=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <14854575.YAd2OMKOy9@ganymedes>
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
To: Michal Bachraty <michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rabeeh Khoury <rabeeh-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Dom Cobley <popcornmix-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============7982864754365401494==
Content-Type: multipart/alternative; boundary=e89a8f646a07cb263004da043cd1

--e89a8f646a07cb263004da043cd1
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 4:48 PM, Michal Bachraty <
michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org> wrote:

> Hi Sebastian,
> This driver doesn't work for me. In my case, u-boot initializes si-5351 and
> power down unused clocks while booting kernel.  there is need for power up
> clocks as was in previous versions of your driver.
> See patch, whre the problem is fixed:
>
> @@ -992,6 +992,10 @@ static long si5351_clkout_round_rate(struct clk_hw
> *hw,
> unsigned long rate,
>                 } while (1);
>         }
>         rate = *parent_rate >> rdiv;
> +
> +       /* powerup clkout */
> +       si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
> +                       SI5351_CLK_POWERDOWN, 0);
>
>         dev_dbg(&hwdata->drvdata->client->dev,
>                 "%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
>
> With this lines, driver works well.
>

Hmm, is there any driver using the clock output? Does it
clk_prepare_enable() the clock?
I tend not to mess with anything the bootloader or eeprom config left
disabled. It works
for me, but here the driver will prepare/enable the clock prior use.


> Also,
>
> > > +==Example==
> > > +
> > > +/* 25MHz reference crystal */
> > > +ref25: ref25M {
> > > +   compatible = "fixed-clock";
> > > +   #clock-cells = <0>;
> > > +   clock-frequency = <25000000>;
> > > +};
> > > +
> > > +i2c-master-node {
> > > +
> > > +   /* Si5351a msop10 i2c clock generator */
> > > +   si5351a: clock-generator@60 {
> > > +           compatible = "silabs,si5351a-msop";
> > > +           reg = <0x60>;
> > > +           #address-cells = <1>;
> > > +           #size-cells = <0>;
> > > +           #clock-cells = <1>;
> > > +
> > > +           /* connect xtal input to 25MHz reference */
> > > +           clocks = <&ref25>;
> > > +
> > > +           /* connect xtal input as source of pll0 and pll1 */
> > > +           silabs,pll-source = <0 0>, <1 0>;
> > > +
> > > +           /*
> > > +            * overwrite clkout0 configuration with:
> > > +            * - 8mA output drive strength
> > > +            * - pll0 as clock source of multisynth0
> > > +            * - multisynth0 as clock source of output divider
> > > +            * - multisynth0 can change pll0
> > > +            * - set initial clock frequency of 74.25MHz
> > > +            */
> > > +           clkout0 {
> > > +                   reg = <0>;
> > > +                   silabs,drive-strength = <8>;
> > > +                   silabs,multisynth-source = <0>;
> > > +                   silabs,clock-source = <0>;
> > > +                   silabs,pll-master;
> > > +                   clock-frequency = <74250000>;
> > > +           };
> > > +
> > > +           /*
> > > +            * overwrite clkout1 configuration with:
> > > +            * - 4mA output drive strength
> > > +            * - pll1 as clock source of multisynth1
> > > +            * - multisynth1 as clock source of output divider
> > > +            * - multisynth1 can change pll1
> > > +            */
> > > +           clkout1 {
> > > +                   reg = <1>;
> > > +                   silabs,drive-strength = <4>;
> > > +                   silabs,multisynth-source = <1>;
> > > +                   silabs,clock-source = <0>;
> > > +                   pll-master;
> > > +           };
> > > +
>  Is definition of pll-master in clkout1 correct? should not be silabs,pll-
> master ?
>

Good catch.

Sebastian

--e89a8f646a07cb263004da043cd1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Apr 10, 2013 at 4:48 PM, Michal Bachraty <span dir=3D"ltr">&lt;<a href=
=3D"mailto:michal.bachraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org" target=3D"_blank">michal.ba=
chraty-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Sebastian,<br>
This driver doesn&#39;t work for me. In my case, u-boot initializes si-5351=
 and<br>
power down unused clocks while booting kernel. =A0there is need for power u=
p<br>
clocks as was in previous versions of your driver.<br>
See patch, whre the problem is fixed:<br>
<br>
@@ -992,6 +992,10 @@ static long si5351_clkout_round_rate(struct clk_hw *hw=
,<br>
unsigned long rate,<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (1);<br>
<div class=3D"im">=A0 =A0 =A0 =A0 }<br>
=A0 =A0 =A0 =A0 rate =3D *parent_rate &gt;&gt; rdiv;<br>
+<br>
</div>+ =A0 =A0 =A0 /* powerup clkout */<br>
<div class=3D"im">+ =A0 =A0 =A0 si5351_set_bits(hwdata-&gt;drvdata, SI5351_=
CLK0_CTRL + hwdata-&gt;num,<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SI5351_CLK_POWERDOWN, 0);<br>
<br>
</div>=A0 =A0 =A0 =A0 dev_dbg(&amp;hwdata-&gt;drvdata-&gt;client-&gt;dev,<b=
r>
<div class=3D"im">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;%s - %s: rdiv =3D %=
u, parent_rate =3D %lu, rate =3D %lu\n&quot;,<br>
<br>
</div>With this lines, driver works well.<br></blockquote><div><br></div><d=
iv>Hmm, is there any driver using the clock output? Does it clk_prepare_ena=
ble() the clock?<br></div><div>I tend not to mess with anything the bootloa=
der or eeprom config left disabled. It works<br>
for me, but here the driver will prepare/enable the clock prior use.<br></d=
iv><div>=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Also,<br>
<div><div class=3D"h5"><br>
&gt; &gt; +=3D=3DExample=3D=3D<br>
&gt; &gt; +<br>
&gt; &gt; +/* 25MHz reference crystal */<br>
&gt; &gt; +ref25: ref25M {<br>
&gt; &gt; + =A0 compatible =3D &quot;fixed-clock&quot;;<br>
&gt; &gt; + =A0 #clock-cells =3D &lt;0&gt;;<br>
&gt; &gt; + =A0 clock-frequency =3D &lt;25000000&gt;;<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +i2c-master-node {<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 /* Si5351a msop10 i2c clock generator */<br>
&gt; &gt; + =A0 si5351a: clock-generator@60 {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 compatible =3D &quot;silabs,si5351a-msop&qu=
ot;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0x60&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 #address-cells =3D &lt;1&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 #size-cells =3D &lt;0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 #clock-cells =3D &lt;1&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 /* connect xtal input to 25MHz reference */=
<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 clocks =3D &lt;&amp;ref25&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 /* connect xtal input as source of pll0 and=
 pll1 */<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 silabs,pll-source =3D &lt;0 0&gt;, &lt;1 0&=
gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 /*<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* overwrite clkout0 configuration with:<=
br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - 8mA output drive strength<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - pll0 as clock source of multisynth0<=
br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - multisynth0 as clock source of outpu=
t divider<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - multisynth0 can change pll0<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - set initial clock frequency of 74.25=
MHz<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0*/<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 clkout0 {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,drive-strength =3D &=
lt;8&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,multisynth-source =
=3D &lt;0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,clock-source =3D &lt=
;0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,pll-master;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 clock-frequency =3D &lt;742=
50000&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt; +<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 /*<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* overwrite clkout1 configuration with:<=
br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - 4mA output drive strength<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - pll1 as clock source of multisynth1<=
br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - multisynth1 as clock source of outpu=
t divider<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0* - multisynth1 can change pll1<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0*/<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 clkout1 {<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D &lt;1&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,drive-strength =3D &=
lt;4&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,multisynth-source =
=3D &lt;1&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 silabs,clock-source =3D &lt=
;0&gt;;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pll-master;<br>
&gt; &gt; + =A0 =A0 =A0 =A0 =A0 };<br>
&gt; &gt; +<br>
</div></div>=A0Is definition of pll-master in clkout1 correct? should not b=
e silabs,pll-<br>
master ?<br></blockquote></div><br></div><div class=3D"gmail_extra">Good ca=
tch.<br><br>Sebastian<br></div></div>

--e89a8f646a07cb263004da043cd1--

--===============7982864754365401494==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7982864754365401494==--
