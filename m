Return-Path: <SRS0=WtQU=TN=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <CAMuHMdUP8KU3Dbv6cwOvrY0hWOcm1xqVcsi20+GvazYMDLGGZg@mail.gmail.com>
References: <1556092536-17095-1-git-send-email-masonccyang@mxic.com.tw> <1556092536-17095-4-git-send-email-masonccyang@mxic.com.tw> <20190424212356.GA27103@bogus> <65853dc2-6f3c-1494-7e72-54877797cdd2@gmail.com> <20190507125730.GD29524@dell> <OF08A5650B.8AE8977C-ON482583F4.000E5B1E-482583F4.000F7215@mxic.com.tw> <d229b19e-351c-c576-b5c4-716d10dad1a0@gmail.com> <20190508061119.GB7627@dell> <OFE86674B9.06D723A0-ON482583F5.000AD50C-482583F5.000BA075@mxic.com.tw> <a05cff8f-7df2-1938-c0e7-f9366bece607@cogentembedded.com> <OFB19BCE91.6EBBAA77-ON482583F6.000234E2-482583F6.00061290@mxic.com.tw> <CAMuHMdUP8KU3Dbv6cwOvrY0hWOcm1xqVcsi20+GvazYMDLGGZg@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF
 MFD bindings
MIME-Version: 1.0
Message-ID: <OFD932ABFC.E3FFCEB8-ON482583F9.003412B1-482583F9.0034D5CA@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 13 May 2019 17:37:11 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0034D5CA482583F9_="
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>, Mark Brown <broonie@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, Lee Jones <lee.jones@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0034D5CA482583F9_=
Content-Type: text/plain; charset="US-ASCII"


Hi Geert,


> > > [...]
> > > >> > >> > On 4/24/19 11:23 PM, Rob Herring wrote:
> > > >> > >> > > On Wed, Apr 24, 2019 at 03:55:36PM +0800, Mason Yang 
wrote:
> > > >> > >> > >> Document the bindings used by the Renesas R-Car 
> Gen3 RPC-IF MFD.
> > > >> > >> > >>
> > > >> > >> > >> Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > > >> > >> > >> ---
> > > >> > >> > >>  .../devicetree/bindings/mfd/mfd-renesas-rpc.txt 
> | 40 ++++++
> > > >> > >> ++++++++++++++++
> > > >> > >> > >>  1 file changed, 40 insertions(+)
> > > >> > >> > >>  create mode 100644 Documentation/devicetree/
> bindings/mfd/mfd-
> > > >> > >> renesas-rpc.txt
> > > >> > >> > >>
> > > >> > >> > >> diff --git a/Documentation/devicetree/bindings/mfd/
> mfd-renesas-
> > > >> > >> rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-
> renesas-rpc.txt
> > > >> > >> > >> new file mode 100644
> > > >> > >> > >> index 0000000..668b822
> > > >> > >> > >> --- /dev/null
> > > >> > >> > >> +++ b/Documentation/devicetree/bindings/mfd/mfd-
> renesas-rpc.txt
> > > >> > >> > >> @@ -0,0 +1,40 @@
> > > >> > >> > >> +Renesas R-Car Gen3 RPC-IF MFD Device Tree Bindings
> > > >> > >> > >> +--------------------------------------------------
> > > >> > >> > >
> > > >> > >> > > Looks like a SPI flash controller from the example. What
> > > makes it an
> > > >> > >> > > MFD?
> > > >> > >> >
> > > >> > >> > It supports both SPI NOR and HyperFlash 
(CFI-compliantflash with
> > > >> > >> > different bus interface).
> > > >> > >>
> > > >> > >> Looks like you're registering one OR the other.
> > > >> > >>
> > > >> > >> Why don't you just do this from DT?
> > > >> > >>
> > > >> > >> No reason for this to be an MFD IMHO.
> > > >> > >
> > > >> > >
> > > >> > > okay, I will patch it back to SPI mode only.
> > > >> >
> > > >> > I don't think that's what Lee meant . The controller supports 
_both_
> > > >> > modes , hence it would have the same compatible string. You
> just need to
> > > >> > extract the mode of operation from the DT.
> > > >>
> > > >> HiSilicon attempted to upstream something similar, only their
> > > >> controller provided NAND and NOR functionality.  They used 
different
> > > >> compatible strings to differentiate between the varying
> > > >> technologies.
> > > >>
> > > >> They too tried to use MFD as a means to select between them 
(which was
> > > >> also NACKed).  Not sure what they ended up doing, but the 
original
> > > >> submission and (half of) the conversation can be found at [0]. 
Some
> > > >> more of the thread continues at [1].
> > > >>
> > > >> Hope that helps.
> > > >>
> > > >> [0] 
https://groups.google.com/forum/#!topic/fa.linux.kernel/F6i9o8sfOIw
> > > >> [1] https://marc.info/?l=devicetree&m=147669165104431&w=2
> > > >
> > > >
> > > > Hi Marek,
> > > >
> > > > By Jones's comments:
> > > > 
> 
--------------------------------------------------------------------------
> > > >> From: Shunquan Lin <linshunquan1@hisilicon.com>
> > > >>
> > > >> This patch adds driver support for HiSilicon Flash Memory
> > > >> Controller(FMC). HiSilicon FMC is a multi-functions device which
> > > >> supports SPI Nor flash controller, SPI nand Flash controller and
> > > >> parallel nand flash controller.
> > > >
> > > > MFDs are for devices which span multiple subsystems.
> > >
> > >    And we do! One of the subdrivers will live under drivers/
> spi/, the other
> > > under drivers/mtd/...
> > >
> >
> > From my point of view, I think Jones mean to MFD's subsystems are 
> working simultaneously
> > at the run-time, one period of time is working for sub-device-1 
> and later period of time
> > is working for sub-device-2 and so on.
> >
> > But for RPC-IF, SPI or HF mode is decided at boot time by pins 
> configure and later in kernel
> > by dtb, RPC-IF can't switch SPI and HF mode at the run time.
> 
> > So far, Jones seems don't agree RPC-IF to MFD and then RPC MFD 
> will not applied
> > to mfd tree by him !
> 
> There's precedence for such constructs being an MFD: please see
> drivers/mfd/at91-usart.c, which registers a single MFD cell for either
> serial or SPI.

okay, many thanks for your information.

How about to patch RPF-IF dts to:
-------------------------------------------------------------->

Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings
---------------------------------------------------------
 
  RPC-IF supports both SPI NOR and HyperFlash (CFI-compliant flash)
 
  Required properties:
  - compatible: should be an SoC-specific compatible value, followed by
                  "renesas,rcar-gen3-rpc" as a fallback.
                  supported SoC-specific values are:
                  "renesas,r8a77995-rpc"  (R-Car D3)
  - reg: should contain three register areas:
          first for the base address of RPC-IF registers,
          second for the direct mapping read mode and
          third for the write buffer area.
  - reg-names: should contain "regs", "dirmap" and "wbuf"
  - clocks: should contain 1 entries for the module's clock
  - clock-names: should contain "rpc"
 
  Example:
  - SPI mode:
 
          rpc: rpc-if@ee200000 {
                  compatible = "renesas,r8a77995-rpc", 
"renesas,rcar-gen3-rpc";
                  reg = <0 0xee200000 0 0x200>, <0 0x08000000 0 
0x4000000>,
                        <0 0xee208000 0 0x100>;
                  reg-names = "regs", "dirmap", "wbuf";
                  clocks = <&cpg CPG_MOD 917>;
                  clock-names = "rpc";
                  power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
                  resets = <&cpg 917>;
                  #address-cells = <1>;
                  #size-cells = <0>;
 
                  flash@0 {
                          compatible = "jedec,spi-nor";
                          reg = <0>;
                          spi-max-frequency = <40000000>;
                          spi-tx-bus-width = <1>;
                          spi-rx-bus-width = <1>;
                  };
          };
 
  - HF mode:
          rpc: rpc-if@ee200000 {
                  compatible = "renesas,r8a77995-rpc", 
"renesas,rcar-gen3-rpc";
                  reg = <0 0xee200000 0 0x200>, <0 0x08000000 0 
0x4000000>,
                        <0 0xee208000 0 0x100>;
                  reg-names = "regs", "dirmap", "wbuf";
                  clocks = <&cpg CPG_MOD 917>;
                  clock-names = "rpc";
                  power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
                  resets = <&cpg 917>;
                  #address-cells = <1>;
                  #size-cells = <1>;
 
                  flash@0 {
                          compatible = "cfi-flash";
                          reg = <0 0x4000000>;
                  };
          };

--------------------------------------------------------------<

Is it OK ?

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- 
> geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. 
But
> when I'm talking to journalists I just say "programmer" or somethinglike 
that.
>                                 -- Linus Torvalds

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

--=_alternative 0034D5CA482583F9_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Geert,<br>
<br>
<br>
&gt; &gt; &gt; [...]<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; On 4/24/19 11:23 PM, Rob Herring
wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; On Wed, Apr 24, 2019 at
03:55:36PM +0800, Mason Yang wrote:<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; Document the bindings
used by the Renesas R-Car <br>
&gt; Gen3 RPC-IF MFD.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; Signed-off-by: Mason
Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; &nbsp;.../devicetree/bindings/mfd/mfd-renesas-rpc.txt
&nbsp; <br>
&gt; | 40 ++++++<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; ++++++++++++++++<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; &nbsp;1 file changed,
40 insertions(+)<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; &nbsp;create mode 100644
Documentation/devicetree/<br>
&gt; bindings/mfd/mfd-<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; renesas-rpc.txt<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; diff --git a/Documentation/devicetree/bindings/mfd/<br>
&gt; mfd-renesas-<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-<br>
&gt; renesas-rpc.txt<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; new file mode 100644<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; index 0000000..668b822<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; --- /dev/null<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; +++ b/Documentation/devicetree/bindings/mfd/mfd-<br>
&gt; renesas-rpc.txt<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; @@ -0,0 +1,40 @@<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; +Renesas R-Car Gen3
RPC-IF MFD Device Tree Bindings<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;&gt; +--------------------------------------------------<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; Looks like a SPI flash
controller from the example. What<br>
&gt; &gt; &gt; makes it an<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; &gt; MFD?<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; It supports both SPI NOR and
HyperFlash (CFI-compliantflash with<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; &gt; different bus interface).<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; Looks like you're registering one
OR the other.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; Why don't you just do this from DT?<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;&gt; No reason for this to be an MFD IMHO.<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; &gt; okay, I will patch it back to SPI mode
only.<br>
&gt; &gt; &gt; &gt;&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; &gt; I don't think that's what Lee meant . The
controller supports _both_<br>
&gt; &gt; &gt; &gt;&gt; &gt; modes , hence it would have the same compatible
string. You<br>
&gt; just need to<br>
&gt; &gt; &gt; &gt;&gt; &gt; extract the mode of operation from the DT.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; HiSilicon attempted to upstream something similar,
only their<br>
&gt; &gt; &gt; &gt;&gt; controller provided NAND and NOR functionality.
&nbsp;They used different<br>
&gt; &gt; &gt; &gt;&gt; compatible strings to differentiate between the
varying<br>
&gt; &gt; &gt; &gt;&gt; technologies.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; They too tried to use MFD as a means to select
between them (which was<br>
&gt; &gt; &gt; &gt;&gt; also NACKed). &nbsp;Not sure what they ended up
doing, but the original<br>
&gt; &gt; &gt; &gt;&gt; submission and (half of) the conversation can be
found at [0]. &nbsp;Some<br>
&gt; &gt; &gt; &gt;&gt; more of the thread continues at [1].<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; Hope that helps.<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; [0] </font></tt><a href=https://groups.google.com/forum/#!topic/fa.linux.kernel/F6i9o8sfOIw><tt><font size=2>https://groups.google.com/forum/#!topic/fa.linux.kernel/F6i9o8sfOIw</font></tt></a><tt><font size=2><br>
&gt; &gt; &gt; &gt;&gt; [1] </font></tt><a href="https://marc.info/?l=devicetree&amp;m=147669165104431&amp;w=2"><tt><font size=2>https://marc.info/?l=devicetree&amp;m=147669165104431&amp;w=2</font></tt></a><tt><font size=2><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Hi Marek,<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; By Jones's comments:<br>
&gt; &gt; &gt; &gt; <br>
&gt; --------------------------------------------------------------------------<br>
&gt; &gt; &gt; &gt;&gt; From: Shunquan Lin &lt;linshunquan1@hisilicon.com&gt;<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; This patch adds driver support for HiSilicon Flash
Memory<br>
&gt; &gt; &gt; &gt;&gt; Controller(FMC). HiSilicon FMC is a multi-functions
device which<br>
&gt; &gt; &gt; &gt;&gt; supports SPI Nor flash controller, SPI nand Flash
controller and<br>
&gt; &gt; &gt; &gt;&gt; parallel nand flash controller.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; MFDs are for devices which span multiple subsystems.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &nbsp; &nbsp;And we do! One of the subdrivers will live
under drivers/<br>
&gt; spi/, the other<br>
&gt; &gt; &gt; under drivers/mtd/...<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; From my point of view, I think Jones mean to MFD's subsystems
are <br>
&gt; working simultaneously<br>
&gt; &gt; at the run-time, one period of time is working for sub-device-1
<br>
&gt; and later period of time<br>
&gt; &gt; is working for sub-device-2 and so on.<br>
&gt; &gt;<br>
&gt; &gt; But for RPC-IF, SPI or HF mode is decided at boot time by pins
<br>
&gt; configure and later in kernel<br>
&gt; &gt; by dtb, RPC-IF can't switch SPI and HF mode at the run time.<br>
&gt; <br>
&gt; &gt; So far, Jones seems don't agree RPC-IF to MFD and then RPC MFD
<br>
&gt; will not applied<br>
&gt; &gt; to mfd tree by him !<br>
&gt; <br>
&gt; There's precedence for such constructs being an MFD: please see<br>
&gt; drivers/mfd/at91-usart.c, which registers a single MFD cell for either<br>
&gt; serial or SPI.</font></tt>
<br>
<br><tt><font size=2>okay, many thanks for your information.</font></tt>
<br>
<br><tt><font size=2>How about to patch RPF-IF dts to:</font></tt>
<br><tt><font size=2>--------------------------------------------------------------&gt;</font></tt>
<br>
<br><tt><font size=2>Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings</font></tt>
<br><tt><font size=2>---------------------------------------------------------</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; RPC-IF supports both SPI NOR and HyperFlash
(CFI-compliant flash)</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; Required properties:</font></tt>
<br><tt><font size=2>&nbsp; - compatible: should be an SoC-specific compatible
value, followed by</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &quot;renesas,rcar-gen3-rpc&quot; as a fallback.</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; supported SoC-specific values are:</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &quot;renesas,r8a77995-rpc&quot; &nbsp;(R-Car D3)</font></tt>
<br><tt><font size=2>&nbsp; - reg: should contain three register areas:</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; first for the base
address of RPC-IF registers,</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; second for the
direct mapping read mode and</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; third for the write
buffer area.</font></tt>
<br><tt><font size=2>&nbsp; - reg-names: should contain &quot;regs&quot;,
&quot;dirmap&quot; and &quot;wbuf&quot;</font></tt>
<br><tt><font size=2>&nbsp; - clocks: should contain 1 entries for the
module's clock</font></tt>
<br><tt><font size=2>&nbsp; - clock-names: should contain &quot;rpc&quot;</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; Example:</font></tt>
<br><tt><font size=2>&nbsp; - SPI mode:</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc: rpc-if@ee200000
{</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; compatible = &quot;renesas,r8a77995-rpc&quot;, &quot;renesas,rcar-gen3-rpc&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; reg = &lt;0 0xee200000 0 0x200&gt;, &lt;0 0x08000000 0 0x4000000&gt;,</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;0 0xee208000 0 0x100&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; reg-names = &quot;regs&quot;, &quot;dirmap&quot;, &quot;wbuf&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; clocks = &lt;&amp;cpg CPG_MOD 917&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; clock-names = &quot;rpc&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; power-domains = &lt;&amp;sysc R8A77995_PD_ALWAYS_ON&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; resets = &lt;&amp;cpg 917&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; #address-cells = &lt;1&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; #size-cells = &lt;0&gt;;</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; flash@0 {</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible = &quot;jedec,spi-nor&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg = &lt;0&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spi-max-frequency = &lt;40000000&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spi-tx-bus-width = &lt;1&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; spi-rx-bus-width = &lt;1&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; };</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; - HF mode:</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rpc: rpc-if@ee200000
{</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; compatible = &quot;renesas,r8a77995-rpc&quot;, &quot;renesas,rcar-gen3-rpc&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; reg = &lt;0 0xee200000 0 0x200&gt;, &lt;0 0x08000000 0 0x4000000&gt;,</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &lt;0 0xee208000 0 0x100&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; reg-names = &quot;regs&quot;, &quot;dirmap&quot;, &quot;wbuf&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; clocks = &lt;&amp;cpg CPG_MOD 917&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; clock-names = &quot;rpc&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; power-domains = &lt;&amp;sysc R8A77995_PD_ALWAYS_ON&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; resets = &lt;&amp;cpg 917&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; #address-cells = &lt;1&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; #size-cells = &lt;1&gt;;</font></tt>
<br><tt><font size=2>&nbsp;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; flash@0 {</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compatible = &quot;cfi-flash&quot;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg = &lt;0 0x4000000&gt;;</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; };</font></tt>
<br><tt><font size=2>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };</font></tt>
<br>
<br><tt><font size=2>--------------------------------------------------------------&lt;</font></tt>
<br>
<br><tt><font size=2>Is it OK ?</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; Gr{oetje,eeting}s,<br>
&gt; <br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; Geert<br>
&gt; <br>
&gt; -- <br>
&gt; Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- <br>
&gt; geert@linux-m68k.org<br>
&gt; <br>
&gt; In personal conversations with technical people, I call myself a hacker.
But<br>
&gt; when I'm talking to journalists I just say &quot;programmer&quot;
or somethinglike that.<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -- Linus Torvalds<br>
</font></tt>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
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

--=_alternative 0034D5CA482583F9_=--
