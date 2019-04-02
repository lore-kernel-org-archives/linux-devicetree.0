Return-Path: <SRS0=FHWM=SE=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <7a2d3d45-76ec-611d-08cf-f63da17d12f0@gmail.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-4-git-send-email-masonccyang@mxic.com.tw> <7a2d3d45-76ec-611d-08cf-f63da17d12f0@gmail.com>
Subject: Re: [PATCH v9 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF
 controller bindings
MIME-Version: 1.0
Message-ID: <OF30B0B31C.83718533-ON482583D0.001CF6D4-482583D0.001D9551@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 2 Apr 2019 13:23:06 +0800
Content-Type: multipart/alternative; boundary="=_alternative 001D9550482583D0_="
To: Marek Vasut <marek.vasut@gmail.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, sergei.shtylyov@cogentembedded.com, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 001D9550482583D0_=
Content-Type: text/plain; charset="US-ASCII"


Hi Marek,

> > +
> > +Example:
> > +
> > +   rpc_mfd: rpc-mfd@ee200000 {
> > +      compatible = "renesas,r8a77995-rpc", "renesas,rcar-gen3-rpc";
> > +      reg = <0 0xee200000 0 0x200>, <0 0x08000000 0 0x4000000>,
> > +            <0 0xee208000 0 0x100>;
> > +      reg-names = "regs", "dirmap", "wbuf";
> > +      clocks = <&cpg CPG_MOD 917>;
> > +      clock-names = "rpc";
> > +      power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
> > +      resets = <&cpg 917>;
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      spi {
> 
> Why is this subnode needed ?
> The MFD driver core can just check whether the flash@0 is jedec,spi-nor
> or cfi-flash and select mode of operation based on that.
> 

okay, I will remove this virtual node and patch code based on your 
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

--=_alternative 001D9550482583D0_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Marek,</font></tt>
<br>
<br><tt><font size=2>&gt; &gt; +<br>
&gt; &gt; +Example:<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; rpc_mfd: rpc-mfd@ee200000 {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;compatible = &quot;renesas,r8a77995-rpc&quot;,
&quot;renesas,rcar-gen3-rpc&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg = &lt;0 0xee200000 0 0x200&gt;, &lt;0
0x08000000 0 0x4000000&gt;,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&lt;0 0xee208000 0
0x100&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;reg-names = &quot;regs&quot;, &quot;dirmap&quot;,
&quot;wbuf&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;clocks = &lt;&amp;cpg CPG_MOD 917&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;clock-names = &quot;rpc&quot;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;power-domains = &lt;&amp;sysc R8A77995_PD_ALWAYS_ON&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;resets = &lt;&amp;cpg 917&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#address-cells = &lt;1&gt;;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;#size-cells = &lt;0&gt;;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;spi {<br>
&gt; <br>
&gt; Why is this subnode needed ?<br>
&gt; The MFD driver core can just check whether the flash@0 is jedec,spi-nor<br>
&gt; or cfi-flash and select mode of operation based on that.<br>
&gt; <br>
<br>
okay, I will remove this virtual node and patch code based on your comments.</font></tt>
<br>
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

--=_alternative 001D9550482583D0_=--
