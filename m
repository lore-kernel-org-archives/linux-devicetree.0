Return-Path: <SRS0=3o4J=SV=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <9bc4847f-8e7e-3627-5394-6f2b5c5972bc@cogentembedded.com>
References: <1555313834-15107-1-git-send-email-masonccyang@mxic.com.tw> <1555313834-15107-4-git-send-email-masonccyang@mxic.com.tw> <907f2e87-1cb4-fa37-5406-82bf2bf71188@cogentembedded.com> <OF2F61A6E6.AA7717A3-ON482583DE.0005C1EE-482583DE.00061474@mxic.com.tw> <8720224d-76f4-c620-9e3f-91605d6fa1e3@cogentembedded.com> <OFCBCE0527.706EB4F2-ON482583E0.00200707-482583E0.00208EAD@mxic.com.tw> <9bc4847f-8e7e-3627-5394-6f2b5c5972bc@cogentembedded.com>
Subject: Re: [PATCH v10 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF
 controller bindings
MIME-Version: 1.0
Message-ID: <OFAA181887.D7D41B6C-ON482583E1.001F1BC6-482583E1.002010BE@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 19 Apr 2019 13:50:14 +0800
Content-Type: multipart/alternative; boundary="=_alternative 002010BC482583E1_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 002010BC482583E1_=
Content-Type: text/plain; charset="US-ASCII"


Hello,
 
> >> >  > > Document the bindings used by the Renesas R-Car Gen3 RPC-IF
> >> MFD controller.
> >> >  > >
> >> >  > > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> >> >  > > ---
> >> >  > >  .../devicetree/bindings/mfd/mfd-renesas-rpc.txt  | 37 
+++++++++
> >> >  > +++++++++++++
> >> >  > >  1 file changed, 37 insertions(+)
> >> >  > >  create mode 100644 Documentation/devicetree/bindings/mfd/mfd-
> >> >  > renesas-rpc.txt
> >> >  > >
> >> >  > > diff --git 
a/Documentation/devicetree/bindings/mfd/mfd-renesas-
> >> >  > rpc.txt 
b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> >> >  > > new file mode 100644
> >> >  > > index 0000000..bfb3d29
> >> >  > > --- /dev/null
> >> >  > > +++ 
b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
> >> >  > > @@ -0,0 +1,37 @@
> >> >  > > +Renesas R-Car Gen3 RPC-IF MFD controller Device Tree Bindings
> >> >  > > +-------------------------------------------------------------
> >> >  > > +
> >> >  > > +Required properties:
> >> >  > > +- compatible: should be an SoC-specific compatible value,
> followed by
> >> >  > > +      "renesas,rcar-gen3-rpc" as a fallback.
> >> >  > > +      supported SoC-specific values are:
> >> >  > > +      "renesas,r8a77995-rpc" (R-Car D3)
> >> >  > > +- reg: should contain 2 entries, one for the base address of 
rpc-
> >> >  > if registers,
> >> >  > > +   and one for the direct mapping area
> >> >  > > +- reg-names: should contain "regs", and "dirmap"
> >> >  >
> >> >  >    The device tree describes the hardware, not the driver. Why
> >> did you remove
> >> >  > the "wbuf" area?
> >> >
> >> > I don't think we should describe the hardware that driver did not
> >> implement it
> >> > because there are still many RPC registers we don't use them.
> >>
> >>     I have to repeat: we describe the hardware, not the driver 
> capabilities.
> > 
> > how about:
> > 
> > - reg: should contain three register areas:
> >           first for the base address of rpc-if registers,
> >           second for the direct mapping read mode and
> >           third for an optional write buffer area.
> >  - reg-names: should contain "regs", "dirmap" and "wbuf"(optional).
> > 
> > is it OK ?
> 
>    No, the write buffer area is always there, at least on the gen3 
chips.
> (I forgot which other Renesas SoC has RPC-IF as well).

please don't forget that WBUF is part of read cache area and WBUF must be
cleared by DRCR.RCF bit. I also have test writting some data into WBUF and
reading them back will get some problems. 
It means that WBUF is not good for a read-and-write application.

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

--=_alternative 002010BC482583E1_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2><br>
Hello,<br>
 <br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; Document the bindings used by the Renesas
R-Car Gen3 RPC-IF<br>
&gt; &gt;&gt; MFD controller.<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; &nbsp;.../devicetree/bindings/mfd/mfd-renesas-rpc.txt
&nbsp;| 37 +++++++++<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; +++++++++++++<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; &nbsp;1 file changed, 37 insertions(+)<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; &nbsp;create mode 100644 Documentation/devicetree/bindings/mfd/mfd-<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; renesas-rpc.txt<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt;<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; diff --git a/Documentation/devicetree/bindings/mfd/mfd-renesas-<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; index 0000000..bfb3d29<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +++ b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; @@ -0,0 +1,37 @@<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +Renesas R-Car Gen3 RPC-IF MFD controller
Device Tree Bindings<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +-------------------------------------------------------------<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +Required properties:<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +- compatible: should be an SoC-specific
compatible value,<br>
&gt; followed by<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; + &nbsp; &nbsp; &nbsp;&quot;renesas,rcar-gen3-rpc&quot;
as a fallback.<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; + &nbsp; &nbsp; &nbsp;supported SoC-specific
values are:<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; + &nbsp; &nbsp; &nbsp;&quot;renesas,r8a77995-rpc&quot;
(R-Car D3)<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +- reg: should contain 2 entries, one
for the base address of rpc-<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; if registers,<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; + &nbsp; and one for the direct mapping
area<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &gt; +- reg-names: should contain &quot;regs&quot;,
and &quot;dirmap&quot;<br>
&gt; &gt;&gt; &gt; &nbsp;&gt;<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; &nbsp; &nbsp;The device tree describes the
hardware, not the driver. Why<br>
&gt; &gt;&gt; did you remove<br>
&gt; &gt;&gt; &gt; &nbsp;&gt; the &quot;wbuf&quot; area?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I don't think we should describe the hardware that driver
did not<br>
&gt; &gt;&gt; implement it<br>
&gt; &gt;&gt; &gt; because there are still many RPC registers we don't
use them.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp; I have to repeat: we describe the hardware,
not the driver <br>
&gt; capabilities.<br>
&gt; &gt; <br>
&gt; &gt; how about:<br>
&gt; &gt; <br>
&gt; &gt; - reg: should contain three register areas:<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; first for the base address
of rpc-if registers,<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; second for the direct mapping
read mode and<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; third for an optional write
buffer area.<br>
&gt; &gt; &nbsp;- reg-names: should contain &quot;regs&quot;, &quot;dirmap&quot;
and &quot;wbuf&quot;(optional).<br>
&gt; &gt; <br>
&gt; &gt; is it OK ?<br>
&gt; <br>
&gt; &nbsp; &nbsp;No, the write buffer area is always there, at least on
the gen3 chips.<br>
&gt; (I forgot which other Renesas SoC has RPC-IF as well).<br>
</font></tt>
<br><tt><font size=2>please don't forget that WBUF is part of read cache
area and WBUF must be</font></tt>
<br><tt><font size=2>cleared by DRCR.RCF bit. I also have test writting
some data into WBUF and</font></tt>
<br><tt><font size=2>reading them back will get some problems. </font></tt>
<br><tt><font size=2>It means that WBUF is not good for a read-and-write
application.</font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
<br><tt><font size=2>Mason<br>
<br>
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

--=_alternative 002010BC482583E1_=--
