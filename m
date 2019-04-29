Return-Path: <SRS0=qeJe=S7=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <20190426224136.GA636@bogus>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw> <1555320234-15802-5-git-send-email-masonccyang@mxic.com.tw> <20190426224136.GA636@bogus>
Subject: Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A controller
 bindings
MIME-Version: 1.0
Message-ID: <OF5968AFD8.ED24A14B-ON482583EB.002AC97F-482583EB.002C06FD@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 29 Apr 2019 16:00:53 +0800
Content-Type: multipart/alternative; boundary="=_alternative 002C06FB482583EB_="
To: Rob Herring <robh@kernel.org>
Cc: bbrezillon@kernel.org, broonie@kernel.org, christophe.kerello@st.com, computersforpeace@gmal.com, devicetree@vger.kernel.org, dwmw2@infradead.org, geert@linux-m68k.org, juliensu@mxic.com.tw, lee.jones@linaro.org, liang.yang@amlogic.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, marek.vasut@gmail.com, mark.rutland@arm.com, miquel.raynal@bootlin.com, paul.burton@mips.com, richard@nod.at, stefan@agner.ch, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 002C06FB482583EB_=
Content-Type: text/plain; charset="US-ASCII"


Hi Rob,

> 
> Subject
> 
> Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A 
> controller bindings
> 
> On Mon, Apr 15, 2019 at 05:23:54PM +0800, Mason Yang wrote:
> > Document the bindings used by the Macronix MX25F0A MFD controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  .../devicetree/bindings/mfd/mxic-mx25f0a.txt       | 51 +++++++++
> +++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 
Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mxic-
> mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > new file mode 100644
> > index 0000000..7f3e0f8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt
> > @@ -0,0 +1,51 @@
> > +Macronix MX25F0A MultiFunction Device Tree Bindings
> > +----------------------------------------------------
> > +
> > +MX25F0A is a MultiFunction Device with SPI and raw NAND, which
> > +supports either spi host controller or raw nand controller.
> > +
> > +Required properties:
> > +- compatible: should be "mxic,mx25f0a"
> > +- #address-cells: should be 1
> > +- #size-cells: should be 0
> > +- reg: should contain 2 entries, one for the registers and one 
> for the direct
> > +       mapping area in SPI mode.
> > +- reg-names: should contain "regs" and "dirmap"
> > +- interrupts: interrupt line connected to this MFD controller
> > +- SPI controller driver:
> > +      - clock-names: should contain "ps_clk", "send_clk" and
> > +                "send_dly_clk"
> > +      - clocks: should contain 3 entries for the "ps_clk", "send_clk"
> > +           and "send_dly_clk" clocks
> > +
> > +- Raw nand controller driver.
> > +      - nand-ecc-mode = "soft";
> > +      - nand-ecc-algo = "bch";
> > +
> > +Example:
> > +
> > +   mxic: mx25f0a@43c30000 {
> > +      compatible = "mxic,mx25f0a";
> > +      reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
> > +      reg-names = "regs", "dirmap";
> > +
> > +      /* spi */
> > +      clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
> > +      clock-names = "send_clk", "send_dly_clk", "ps_clk";
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      flash@0 {
> > +         compatible = "jedec,spi-nor";
> > +         reg = <0>;
> > +         spi-max-frequency = <25000000>;
> > +         spi-tx-bus-width = <4>;
> > +         spi-rx-bus-width = <4>;
> > +      };
> > +
> > +      /* nand */
> 
> Don't you need a nand child node? I'm not sure how that's going to work 
> as you are already using the number space (i.e. reg) for SPI CS number 
> and you can't really mix number spaces within a node level.
> 

Oops, I forgot to describe enabling either spi or nand,
that is only one node is enable at a time.
Will patch it in next version.
thanks for your review.

> > +      nand-ecc-mode = "soft";
> > +      nand-ecc-algo = "bch";
> > +      nand-ecc-step-size = <512>;
> > +      nand-ecc-strength = <8>;
> > +   };
> > -- 
> > 1.9.1
> > 

best regards,
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

--=_alternative 002C06FB482583EB_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Rob,</font></tt>
<br>
<br><tt><font size=2>&gt; <br>
&gt; Subject</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v3 4/4] dt-bindings: mfd: Document Macronix MX25F0A <br>
&gt; controller bindings</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On Mon, Apr 15, 2019 at 05:23:54PM +0800, Mason Yang wrote:<br>
&gt; &gt; Document the bindings used by the Macronix MX25F0A MFD controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;.../devicetree/bindings/mfd/mxic-mx25f0a.txt &nbsp; &nbsp;
&nbsp; | 51 +++++++++<br>
&gt; +++++++++++++<br>
&gt; &gt; &nbsp;1 file changed, 51 insertions(+)<br>
&gt; &gt; &nbsp;create mode 100644 Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/mfd/mxic-<br>
&gt; mx25f0a.txt b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..7f3e0f8<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/Documentation/devicetree/bindings/mfd/mxic-mx25f0a.txt<br>
&gt; &gt; @@ -0,0 +1,51 @@<br>
&gt; &gt; +Macronix MX25F0A MultiFunction Device Tree Bindings<br>
&gt; &gt; +----------------------------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +MX25F0A is a MultiFunction Device with SPI and raw NAND, which<br>
&gt; &gt; +supports either spi host controller or raw nand controller.<br>
&gt; &gt; +<br>
&gt; &gt; +Required properties:<br>
&gt; &gt; +- compatible: should be &quot;mxic,mx25f0a&quot;<br>
&gt; &gt; +- #address-cells: should be 1<br>
&gt; &gt; +- #size-cells: should be 0<br>
&gt; &gt; +- reg: should contain 2 entries, one for the registers and one
<br>
&gt; for the direct<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; mapping area in SPI mode.<br>
&gt; &gt; +- reg-names: should contain &quot;regs&quot; and &quot;dirmap&quot;<br>
&gt; &gt; +- interrupts: interrupt line connected to this MFD controller<br>
&gt; &gt; +- SPI controller driver:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- clock-names: should contain &quot;ps_clk&quot;,
&quot;send_clk&quot; and<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;send_dly_clk&quot;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- clocks: should contain 3 entries for
the &quot;ps_clk&quot;, &quot;send_clk&quot;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; and &quot;send_dly_clk&quot;
clocks<br>
&gt; &gt; +<br>
&gt; &gt; +- Raw nand controller driver.<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- nand-ecc-mode = &quot;soft&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;- nand-ecc-algo = &quot;bch&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; +Example:<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; mxic: mx25f0a@43c30000 {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;compatible = &quot;mxic,mx25f0a&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg = &lt;0x43c30000 0x10000&gt;, &lt;0xa0000000
0x4000000&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg-names = &quot;regs&quot;, &quot;dirmap&quot;;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;/* spi */<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;clocks = &lt;&amp;clkwizard 0&gt;, &lt;&amp;clkwizard
1&gt;, &lt;&amp;clkc 15&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;clock-names = &quot;send_clk&quot;, &quot;send_dly_clk&quot;,
&quot;ps_clk&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#address-cells = &lt;1&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#size-cells = &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;flash@0 {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; compatible = &quot;jedec,spi-nor&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; reg = &lt;0&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi-max-frequency = &lt;25000000&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi-tx-bus-width = &lt;4&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi-rx-bus-width = &lt;4&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;};<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;/* nand */<br>
&gt; <br>
&gt; Don't you need a nand child node? I'm not sure how that's going to
work <br>
&gt; as you are already using the number space (i.e. reg) for SPI CS number
<br>
&gt; and you can't really mix number spaces within a node level.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>Oops, I forgot to describe enabling either spi or
nand,</font></tt>
<br><tt><font size=2>that is only one node is enable at a time.</font></tt>
<br><tt><font size=2>Will patch it in next version.</font></tt>
<br><tt><font size=2>thanks for your review.</font></tt>
<br><tt><font size=2><br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;nand-ecc-mode = &quot;soft&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;nand-ecc-algo = &quot;bch&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;nand-ecc-step-size = &lt;512&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;nand-ecc-strength = &lt;8&gt;;<br>
&gt; &gt; + &nbsp; };<br>
&gt; &gt; -- <br>
&gt; &gt; 1.9.1<br>
&gt; &gt; <br>
</font></tt>
<br><tt><font size=2>best regards,</font></tt>
<br><tt><font size=2>Mason<br>
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

--=_alternative 002C06FB482583EB_=--
