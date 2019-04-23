Return-Path: <SRS0=TBo3=SZ=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <d2a7a471-2847-b774-42b1-9feb8f4c69f3@cogentembedded.com>
References: <1555903925-15292-1-git-send-email-masonccyang@mxic.com.tw> <1555903925-15292-3-git-send-email-masonccyang@mxic.com.tw> <d2a7a471-2847-b774-42b1-9feb8f4c69f3@cogentembedded.com>
Subject: Re: [PATCH v11 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
MIME-Version: 1.0
Message-ID: <OFF96C004A.0EFDDD69-ON482583E5.0032EE18-482583E5.00337F42@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 23 Apr 2019 17:22:28 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00337F40482583E5_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00337F40482583E5_=
Content-Type: text/plain; charset="US-ASCII"


Hello,
 
> Subject
> 
> Re: [PATCH v11 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller 
driver
> 
> On 04/22/2019 06:32 AM, Mason Yang wrote:
> 
> > Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.
> > 
> > Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> [...]
> 
>   Do dote that I'm opposed to the driver separation as it's presented in
> this patches, and I have a large patch reworking both MFD and SPI 
drivers
> in the works.
> 

Do you mean add your name in both MFD & dt-binding ?

i.e., 
[PATCH v12 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF MFD 
bindings

Document the bindings used by the Renesas R-Car Gen3 RPC-IF MFD. 

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>



[PATCH v12 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF MFD driver

Add a driver for Renesas R-Car Gen3 RPC-IF MFD.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>


Is it ok ?

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

--=_alternative 00337F40482583E5_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hello,</font></tt>
<br><tt><font size=2>&nbsp;<br>
&gt; Subject</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; Re: [PATCH v11 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
driver</font></tt>
<br><tt><font size=2>&gt; <br>
&gt; On 04/22/2019 06:32 AM, Mason Yang wrote:<br>
&gt; <br>
&gt; &gt; Add a driver for Renesas R-Car Gen3 RPC-IF SPI controller.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;<br>
&gt; &gt; Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;<br>
&gt; [...]<br>
&gt; <br>
&gt; &nbsp; Do dote that I'm opposed to the driver separation as it's presented
in<br>
&gt; this patches, and I have a large patch reworking both MFD and SPI
drivers<br>
&gt; in the works.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>Do you mean add your name in both MFD &amp; dt-binding
?</font></tt>
<br>
<br><tt><font size=2>i.e., </font></tt>
<br><tt><font size=2>[PATCH v12 3/3] dt-bindings: mfd: Document Renesas
R-Car Gen3 RPC-IF MFD bindings</font></tt>
<br>
<br><tt><font size=2>Document the bindings used by the Renesas R-Car Gen3
RPC-IF MFD. </font></tt>
<br><tt><font size=2><br>
Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;</font></tt>
<br><tt><font size=2>Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;</font></tt>
<br>
<br>
<br>
<br><tt><font size=2>[PATCH v12 1/3] mfd: Add Renesas R-Car Gen3 RPC-IF
MFD driver</font></tt>
<br>
<br><tt><font size=2>Add a driver for Renesas R-Car Gen3 RPC-IF MFD.<br>
<br>
Signed-off-by: Mason Yang &lt;masonccyang@mxic.com.tw&gt;</font></tt>
<br><tt><font size=2>Signed-off-by: Sergei Shtylyov &lt;sergei.shtylyov@cogentembedded.com&gt;</font></tt>
<br>
<br>
<br><tt><font size=2>Is it ok ?</font></tt>
<br>
<br><tt><font size=2>best regards,</font></tt>
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

--=_alternative 00337F40482583E5_=--
