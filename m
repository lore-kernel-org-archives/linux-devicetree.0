Return-Path: <SRS0=CrBB=SO=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <3f4a77a9-0c2a-b3c3-c97e-a3c84df90ef0@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <a2dc294f-f2a1-2469-1f44-db67f9b8cc10@cogentembedded.com> <OFC7F0028A.CFF6BD04-ON482583D8.00084FA1-482583D8.0008985F@mxic.com.tw> <2095d059-8276-a01a-7c3a-da4647f7b7df@gmail.com> <OF75EDBF48.5C308F1B-ON482583D8.0027A537-482583D8.002C0A64@mxic.com.tw> <3f4a77a9-0c2a-b3c3-c97e-a3c84df90ef0@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF94E98142.FA44928E-ON482583DA.0022FCA1-482583DA.00241ECD@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 12 Apr 2019 14:34:31 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00241ECC482583DA_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00241ECC482583DA_=
Content-Type: text/plain; charset="US-ASCII"


 Hi Sergei,

> On 04/10/2019 11:01 AM, masonccyang@mxic.com.tw wrote:
> 
> >> >> > +static ssize_t rpc_spi_mem_dirmap_write(struct 
spi_mem_dirmap_desc
> >> > *desc,
> >> >> > +               u64 offs, size_t len, const void *buf)
> >> >> > +{
> >> >> > +   struct rpc_spi *rpc =
> >> >> > + spi_controller_get_devdata(desc->mem->spi->controller);
> >> >> > +   int ret;
> >> >> > +
> >> >> > +   if (offs + desc->info.offset + len > U32_MAX)
> >> >> > +      return -EINVAL;
> >> >> > +
> >> >> > +   if (len > RPC_WBUF_SIZE)
> >> >> > +      len = RPC_WBUF_SIZE;
> >> >> > +
> >> >> > +   ret = rpc_spi_set_freq(rpc, desc->mem->spi->max_speed_hz);
> >> >> > +   if (ret)
> >> >> > +      return ret;
> >> >> > +
> >> >> > +   rpc_spi_mem_set_prep_op_cfg(desc->mem->spi,
> >> >> > +                &desc->info.op_tmpl, &offs, &len);
> >> >> > +
> >> >> > +   regmap_update_bits(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD,
> >> > RPC_CMNCR_MD);
> >> >> > +
> >> >> > +   regmap_write(rpc->regmap, RPC_SMDRENR, 0);
> >> >> > +
> >> >> > +   regmap_update_bits(rpc->regmap, RPC_PHYCNT, 
RPC_PHYCNT_STRTIM(7) |
> >> >> > +            RPC_PHYCNT_WBUF2 | RPC_PHYCNT_WBUF,
> >> >> > +            RPC_PHYCNT_WBUF2 | RPC_PHYCNT_WBUF);
> >> >> > +
> >> >> > +   memcpy_toio(rpc->wbuf, buf, len);
> >> >>
> >> >>    Wait, doesn't the manual say that the whole 256-byte 
buffershould be
> >> >> filled?
> > 
> > it could be less than 256 bytes, i.e., 128 bytes to rpc->wbuf !
> 
>    The gen3 manual 1.50 contradicts:
> 
> Note: This area should be accessed sequentially from the start 
> address and transfer size
> to the device is 256-byte unit. All Write Buffer area should be 
> filled with transfer data
> in every transfer. When accessing non-sequentially or at random, the
> operation is not
> guaranteed. After Write Buffer Operation, this cache area must be 
> cleared by DRCR.RCF bit.

I have tried it ok but I am still waiting for a confirm answer 
from Renesas FAE.

I may drop rpc_spi_mem_dirmap_write() due to WBUF issue.

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

--=_alternative 00241ECC482583DA_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>&nbsp;<br>
Hi Sergei,<br>
<br>
&gt; On 04/10/2019 11:01 AM, masonccyang@mxic.com.tw wrote:<br>
&gt; <br>
&gt; &gt;&gt; &gt;&gt; &gt; +static ssize_t rpc_spi_mem_dirmap_write(struct
spi_mem_dirmap_desc<br>
&gt; &gt;&gt; &gt; *desc,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; u64 offs, size_t len, const void *buf)<br>
&gt; &gt;&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; struct rpc_spi *rpc =<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi_controller_get_devdata(desc-&gt;mem-&gt;spi-&gt;controller);<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; if (offs + desc-&gt;info.offset +
len &gt; U32_MAX)<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EINVAL;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; if (len &gt; RPC_WBUF_SIZE)<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;len = RPC_WBUF_SIZE;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; ret = rpc_spi_set_freq(rpc, desc-&gt;mem-&gt;spi-&gt;max_speed_hz);<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc_spi_mem_set_prep_op_cfg(desc-&gt;mem-&gt;spi,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;&amp;desc-&gt;info.op_tmpl, &amp;offs, &amp;len);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; regmap_update_bits(rpc-&gt;regmap,
RPC_CMNCR, RPC_CMNCR_MD,<br>
&gt; &gt;&gt; &gt; RPC_CMNCR_MD);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMDRENR,
0);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; regmap_update_bits(rpc-&gt;regmap,
RPC_PHYCNT, RPC_PHYCNT_STRTIM(7) |<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_PHYCNT_WBUF2
| RPC_PHYCNT_WBUF,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_PHYCNT_WBUF2
| RPC_PHYCNT_WBUF);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; memcpy_toio(rpc-&gt;wbuf, buf, len);<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &nbsp; &nbsp;Wait, doesn't the manual say that the
whole 256-byte buffershould be<br>
&gt; &gt;&gt; &gt;&gt; filled?<br>
&gt; &gt; <br>
&gt; &gt; it could be less than 256 bytes, i.e., 128 bytes to rpc-&gt;wbuf
!<br>
&gt; <br>
&gt; &nbsp; &nbsp;The gen3 manual 1.50 contradicts:<br>
&gt; <br>
&gt; Note: This area should be accessed sequentially from the start <br>
&gt; address and transfer size<br>
&gt; to the device is 256-byte unit. All Write Buffer area should be <br>
&gt; filled with transfer data<br>
&gt; in every transfer. When accessing non-sequentially or at random, the<br>
&gt; operation is not<br>
&gt; guaranteed. After Write Buffer Operation, this cache area must be
<br>
&gt; cleared by DRCR.RCF bit.</font></tt>
<br>
<br><tt><font size=2>I have tried it ok but I am still waiting for a confirm
answer </font></tt>
<br><tt><font size=2>from Renesas FAE.</font></tt>
<br>
<br><tt><font size=2>I may drop rpc_spi_mem_dirmap_write() due to WBUF
issue.</font></tt>
<br><tt><font size=2><br>
thanks &amp; best regards,<br>
Mason<br>
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

--=_alternative 00241ECC482583DA_=--
