Return-Path: <SRS0=NUTy=SS=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <907f2e87-1cb4-fa37-5406-82bf2bf71188@cogentembedded.com>
References: <1555313834-15107-1-git-send-email-masonccyang@mxic.com.tw> <1555313834-15107-4-git-send-email-masonccyang@mxic.com.tw> <907f2e87-1cb4-fa37-5406-82bf2bf71188@cogentembedded.com>
Subject: Re: [PATCH v10 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF
 controller bindings
MIME-Version: 1.0
Message-ID: <OF2F61A6E6.AA7717A3-ON482583DE.0005C1EE-482583DE.00061474@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 16 Apr 2019 09:06:24 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00061474482583DE_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00061474482583DE_=
Content-Type: text/plain; charset="US-ASCII"


Hello,

> 
> Re: [PATCH v10 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 
> RPC-IF controller bindings
> 
> On 04/15/2019 10:37 AM, Mason Yang wrote:
> 
> > Document the bindings used by the Renesas R-Car Gen3 RPC-IF MFD 
controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > ---
> >  .../devicetree/bindings/mfd/mfd-renesas-rpc.txt    | 37 +++++++++
> +++++++++++++
> >  1 file changed, 37 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mfd-
> renesas-rpc.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mfd-renesas-
> rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> > new file mode 100644
> > index 0000000..bfb3d29
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> > @@ -0,0 +1,37 @@
> > +Renesas R-Car Gen3 RPC-IF MFD controller Device Tree Bindings
> > +-------------------------------------------------------------
> > +
> > +Required properties:
> > +- compatible: should be an SoC-specific compatible value, followed by
> > +      "renesas,rcar-gen3-rpc" as a fallback.
> > +      supported SoC-specific values are:
> > +      "renesas,r8a77995-rpc"   (R-Car D3)
> > +- reg: should contain 2 entries, one for the base address of rpc-
> if registers,
> > +   and one for the direct mapping area
> > +- reg-names: should contain "regs", and "dirmap"
> 
>    The device tree describes the hardware, not the driver. Why did you 
remove
> the "wbuf" area?

I don't think we should describe the hardware that driver did not 
implement it
because there are still many RPC registers we don't use them.

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

--=_alternative 00061474482583DE_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v10 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3
<br>
&gt; RPC-IF controller bindings</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On 04/15/2019 10:37 AM, Mason Yang wrote:<br>
&gt; <br>
&gt; &gt; Document the bindings used by the Renesas R-Car Gen3 RPC-IF MFD
controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; &nbsp;.../devicetree/bindings/mfd/mfd-renesas-rpc.txt &nbsp;
&nbsp;| 37 +++++++++<br>
&gt; +++++++++++++<br>
&gt; &gt; &nbsp;1 file changed, 37 insertions(+)<br>
&gt; &gt; &nbsp;create mode 100644 Documentation/devicetree/bindings/mfd/mfd-<br>
&gt; renesas-rpc.txt<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/Documentation/devicetree/bindings/mfd/mfd-renesas-<br>
&gt; rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..bfb3d29<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt<br>
&gt; &gt; @@ -0,0 +1,37 @@<br>
&gt; &gt; +Renesas R-Car Gen3 RPC-IF MFD controller Device Tree Bindings<br>
&gt; &gt; +-------------------------------------------------------------<br>
&gt; &gt; +<br>
&gt; &gt; +Required properties:<br>
&gt; &gt; +- compatible: should be an SoC-specific compatible value, followed
by<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;&quot;renesas,rcar-gen3-rpc&quot; as a
fallback.<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;supported SoC-specific values are:<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;&quot;renesas,r8a77995-rpc&quot; &nbsp;
(R-Car D3)<br>
&gt; &gt; +- reg: should contain 2 entries, one for the base address of
rpc-<br>
&gt; if registers,<br>
&gt; &gt; + &nbsp; and one for the direct mapping area<br>
&gt; &gt; +- reg-names: should contain &quot;regs&quot;, and &quot;dirmap&quot;<br>
&gt; <br>
&gt; &nbsp; &nbsp;The device tree describes the hardware, not the driver.
Why did you remove<br>
&gt; the &quot;wbuf&quot; area?<br>
</font></tt>
<br><tt><font size=2>I don't think we should describe the hardware that
driver did not implement it</font></tt>
<br><tt><font size=2>because there are still many RPC registers we don't
use them.<br>
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

--=_alternative 00061474482583DE_=--
