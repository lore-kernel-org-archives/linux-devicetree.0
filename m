Return-Path: <SRS0=FHWM=SE=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190401193431.3e8788a0@xps13>
References: <1553768318-23149-1-git-send-email-masonccyang@mxic.com.tw>	<1553768318-23149-5-git-send-email-masonccyang@mxic.com.tw> <20190401193431.3e8788a0@xps13>
Subject: Re: [PATCH 4/7] dt-bindings: mfd: Document Macronix MX25F0A controller
 bindings
MIME-Version: 1.0
Message-ID: <OF9E5442F6.B542597C-ON482583D0.0020591E-482583D0.00216580@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 2 Apr 2019 14:04:45 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00216580482583D0_="
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, christophe.kerello@st.com, computersforpeace@gmail.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, paul.burton@mips.com, richard@nod.at, robh+dt@kernel.org, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00216580482583D0_=
Content-Type: text/plain; charset="US-ASCII"


Hi Miquel,


> > Document the bindings used by the Macronix MX25F0A MFD controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  .../devicetree/bindings/mfd/mxic-mx25f0a.txt       | 66 +++++++++
> +++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mxic-
> mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > new file mode 100644
> > index 0000000..53b4839
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > @@ -0,0 +1,66 @@
> > +Macronix MX25F0A Multi-Function Device Tree Bindings
> > +----------------------------------------------------
> > +
> > +MX25F0A is a MultiFunction Device with SPI and raw NAND, which
> > +supports either spi host controller or raw nand controller.
> > +
> > +Required properties:
> > +- compatible: should be "mxic,mx25f0a-mfd"
> 
> Should probably be "mxic,mx25f0a"

okay,

> 
> > +- #address-cells: should be 1
> > +- #size-cells: should be 0
> > +- reg: should contain 2 entries, one for the registers and one 
> for the direct
> > +       mapping area in SPI mode.
> > +- reg-names: should contain "regs" and "dirmap"
> > +- interrupts: interrupt line connected to this MFD controller
> > +
> > +Required nodes:
> > + - spi :
> > +   Node for configuring the SPI controller driver.
> > +   Required properties:
> > +      - compatible = "mxicy,mx25f0a-spi";
> > +      - clock-names: should contain "ps_clk", "send_clk" and
> > +                "send_dly_clk"
> > +      - clocks: should contain 3 entries for the "ps_clk", "send_clk"
> > +           and "send_dly_clk" clocks
> > +
> > +- nand :
> > +   Node for configuring the raw nand controller driver.
> > +   Required properties:
> > +      - compatible = "mxicy,mx25f0a-nand-ctlr";
> > +      - nand-ecc-mode = "soft";
> > +      - nand-ecc-algo = "bch";
> 
> You can have only one node at a time. You can add a mxic,mode property
> being either "spi-controller" or "nand-controller".
> 

okay, to add mode property or just "jedec,spi-nor" for spi-controller
and the other is for nand-controller.

> > +
> > +Example:
> > +
> > +   mxic: mx25f0a-mfd@43c30000 {
> > +      compatible = "mxic,mx25f0a-mfd";
> > +      reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
> > +      reg-names = "regs", "dirmap";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      /* either spi or nand */
> > +      spi {
> > +         compatible = "mxicy,mx25f0a-spi";
> > +         clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +         clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +         #address-cells = <1>;
> > +         #size-cells = <0>;
> > +
> > +         flash@0 {
> > +            compatible = "jedec,spi-nor";
> > +            reg = <0>;
> > +            spi-max-frequency = <25000000>;
> > +            spi-tx-bus-width = <4>;
> > +            spi-rx-bus-width = <4>;
> > +         };
> > +      };
> > +
> > +      nand {
> > +         compatible = "mxicy,mx25f0a-nand-ctlr";
> > +         nand-ecc-mode = "soft";
> > +         nand-ecc-algo = "bch";
> > +         nand-ecc-step-size = <512>;
> > +         nand-ecc-strength = <8>;
> 
> Are you sure you want soft correction? (I have not checked the driver
> yet). 

yes, currently.

For hw correction, I prefer to drop the two step-size/strength
> properties. These values will be derived depending on the chip's
> requirements.
> 
yes, step-size/strength are just for soft bch and they will be removed
for hw correction.

BTW, I will separate these patchset and resubmit it later by Mark's 
comments.

thanks & best regards,
Mason


CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information 
and/or personal data, which is protected by applicable laws. Please be 
reminded that duplication, disclosure, distribution, or use of this e-mail 
(and/or its attachments) or any part thereof is prohibited. If you receive 
this e-mail in error, please notify us immediately and delete this mail as 
well as its attachment(s) from your system. In addition, please be 
informed that collection, processing, and/or use of personal data is 
prohibited unless expressly permitted by personal data protection laws. 
Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================



============================================================================

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or personal data, which is protected by applicable laws. Please be reminded that duplication, disclosure, distribution, or use of this e-mail (and/or its attachments) or any part thereof is prohibited. If you receive this e-mail in error, please notify us immediately and delete this mail as well as its attachment(s) from your system. In addition, please be informed that collection, processing, and/or use of personal data is prohibited unless expressly permitted by personal data protection laws. Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=====================================================================

--=_alternative 00216580482583D0_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Miquel,<br>
</font></tt>
<br><tt><font size=2><br>
&gt; &gt; Document the bindings used by the Macronix MX25F0A MFD controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;.../devicetree/bindings/mfd/mxic-mx25f0a.txt &nbsp; &nbsp;
&nbsp; | 66 +++++++++<br>
&gt; +++++++++++++<br>
&gt; &gt; &nbsp;1 file changed, 66 insertions(+)<br>
&gt; &gt; &nbsp;create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/mfd/mxic-<br>
&gt; mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..53b4839<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; @@ -0,0 +1,66 @@<br>
&gt; &gt; +Macronix MX25F0A Multi-Function Device Tree Bindings<br>
&gt; &gt; +----------------------------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +MX25F0A is a MultiFunction Device with SPI and raw NAND, which<br>
&gt; &gt; +supports either spi host controller or raw nand controller.<br>
&gt; &gt; +<br>
&gt; &gt; +Required properties:<br>
&gt; &gt; +- compatible: should be &quot;mxic,mx25f0a-mfd&quot;<br>
&gt; <br>
&gt; Should probably be &quot;mxic,mx25f0a&quot;</font></tt>
<br>
<br><tt><font size=2>okay,</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; +- #address-cells: should be 1<br>
&gt; &gt; +- #size-cells: should be 0<br>
&gt; &gt; +- reg: should contain 2 entries, one for the registers and one
<br>
&gt; for the direct<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; mapping area in SPI mode.<br>
&gt; &gt; +- reg-names: should contain &quot;regs&quot; and &quot;dirmap&quot;<br>
&gt; &gt; +- interrupts: interrupt line connected to this MFD controller<br>
&gt; &gt; +<br>
&gt; &gt; +Required nodes:<br>
&gt; &gt; + - spi :<br>
&gt; &gt; + &nbsp; Node for configuring the SPI controller driver.<br>
&gt; &gt; + &nbsp; Required properties:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- compatible = &quot;mxicy,mx25f0a-spi&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- clock-names: should contain &quot;ps_clk&quot;,
&quot;send_clk&quot; and<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;send_dly_clk&quot;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- clocks: should contain 3 entries for
the &quot;ps_clk&quot;, &quot;send_clk&quot;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; and &quot;send_dly_clk&quot;
clocks<br>
&gt; &gt; +<br>
&gt; &gt; +- nand :<br>
&gt; &gt; + &nbsp; Node for configuring the raw nand controller driver.<br>
&gt; &gt; + &nbsp; Required properties:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- compatible = &quot;mxicy,mx25f0a-nand-ctlr&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- nand-ecc-mode = &quot;soft&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- nand-ecc-algo = &quot;bch&quot;;<br>
&gt; <br>
&gt; You can have only one node at a time. You can add a mxic,mode property<br>
&gt; being either &quot;spi-controller&quot; or &quot;nand-controller&quot;.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>okay, to add mode property or just &quot;jedec,spi-nor&quot;
for spi-controller</font></tt>
<br><tt><font size=2>and the other is for nand-controller.</font></tt>
<br><tt><font size=2><br>
&gt; &gt; +<br>
&gt; &gt; +Example:<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; mxic: mx25f0a-mfd@43c30000 {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;compatible = &quot;mxic,mx25f0a-mfd&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg = &lt;0x43c30000 0x10000&gt;, &lt;0xa0000000
0x4000000&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg-names = &quot;regs&quot;, &quot;dirmap&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#address-cells = &lt;1&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#size-cells = &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;/* either spi or nand */<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;spi {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; compatible = &quot;mxicy,mx25f0a-spi&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; clocks = &lt;&amp;clkwizard 0&gt;,
&lt;&amp;clkwizard 1&gt;, &lt;&amp;clkc 15&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; clock-names = &quot;send_clk&quot;,
&quot;send_dly_clk&quot;, &quot;ps_clk&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; #address-cells = &lt;1&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; #size-cells = &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; flash@0 {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;compatible = &quot;jedec,spi-nor&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reg = &lt;0&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spi-max-frequency
= &lt;25000000&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spi-tx-bus-width =
&lt;4&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;spi-rx-bus-width =
&lt;4&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; };<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;};<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;nand {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; compatible = &quot;mxicy,mx25f0a-nand-ctlr&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; nand-ecc-mode = &quot;soft&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; nand-ecc-algo = &quot;bch&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; nand-ecc-step-size = &lt;512&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; nand-ecc-strength = &lt;8&gt;;<br>
&gt; <br>
&gt; Are you sure you want soft correction? (I have not checked the driver<br>
&gt; yet). </font></tt>
<br>
<br><tt><font size=2>yes, currently.</font></tt>
<br>
<br><tt><font size=2>For hw correction, I prefer to drop the two step-size/strength<br>
&gt; properties. These values will be derived depending on the chip's<br>
&gt; requirements.<br>
&gt; <br>
yes, step-size/strength are just for soft bch and they will be removed</font></tt>
<br><tt><font size=2>for hw correction.<br>
<br>
BTW, I will separate these patchset and resubmit it later by Mark's comments.</font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason</font></tt>
<br><tt><font size=2><br>
<br>
CONFIDENTIALITY NOTE:<br>
<br>
This e-mail and any attachments may contain confidential information and/or
personal data, which is protected by applicable laws. Please be reminded
that duplication, disclosure, distribution, or use of this e-mail (and/or
its attachments) or any part thereof is prohibited. If you receive this
e-mail in error, please notify us immediately and delete this mail as well
as its attachment(s) from your system. In addition, please be informed
that collection, processing, and/or use of personal data is prohibited
unless expressly permitted by personal data protection laws. Thank you
for your attention and cooperation.<br>
<br>
Macronix International Co., Ltd.<br>
<br>
=====================================================================<br>
</font></tt>

--=_alternative 00216580482583D0_=--
