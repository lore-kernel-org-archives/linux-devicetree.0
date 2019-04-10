Return-Path: <SRS0=FaJ7=SM=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <a2dc294f-f2a1-2469-1f44-db67f9b8cc10@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <a2dc294f-f2a1-2469-1f44-db67f9b8cc10@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OFC7F0028A.CFF6BD04-ON482583D8.00084FA1-482583D8.0008985F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 10 Apr 2019 09:33:52 +0800
Content-Type: multipart/alternative; boundary="=_alternative 0008985E482583D8_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 0008985E482583D8_=
Content-Type: text/plain; charset="US-ASCII"


Hi Sergei, 

> > +static ssize_t rpc_spi_mem_dirmap_write(struct spi_mem_dirmap_desc 
*desc,
> > +               u64 offs, size_t len, const void *buf)
> > +{
> > +   struct rpc_spi *rpc =
> > +         spi_controller_get_devdata(desc->mem->spi->controller);
> > +   int ret;
> > +
> > +   if (offs + desc->info.offset + len > U32_MAX)
> > +      return -EINVAL;
> > +
> > +   if (len > RPC_WBUF_SIZE)
> > +      len = RPC_WBUF_SIZE;
> > +
> > +   ret = rpc_spi_set_freq(rpc, desc->mem->spi->max_speed_hz);
> > +   if (ret)
> > +      return ret;
> > +
> > +   rpc_spi_mem_set_prep_op_cfg(desc->mem->spi,
> > +                &desc->info.op_tmpl, &offs, &len);
> > +
> > +   regmap_update_bits(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD, 
RPC_CMNCR_MD);
> > +
> > +   regmap_write(rpc->regmap, RPC_SMDRENR, 0);
> > +
> > +   regmap_update_bits(rpc->regmap, RPC_PHYCNT, RPC_PHYCNT_STRTIM(7) |
> > +            RPC_PHYCNT_WBUF2 | RPC_PHYCNT_WBUF,
> > +            RPC_PHYCNT_WBUF2 | RPC_PHYCNT_WBUF);
> > +
> > +   memcpy_toio(rpc->wbuf, buf, len);
> 
>    Wait, doesn't the manual say that the whole 256-byte buffer should be
> filled?  I think that short chunks have to be written w/o WBUF (done, in 
fact,
> by the HF driver).
> 

>From spi-nor.c layer always transfer 256 bytes data with page program 
command.

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

--=_alternative 0008985E482583D8_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Sergei, </font></tt>
<br>
<br><tt><font size=2>&gt; &gt; +static ssize_t rpc_spi_mem_dirmap_write(struct
spi_mem_dirmap_desc *desc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u64 offs,
size_t len, const void *buf)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct rpc_spi *rpc =<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi_controller_get_devdata(desc-&gt;mem-&gt;spi-&gt;controller);<br>
&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (offs + desc-&gt;info.offset + len &gt; U32_MAX)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (len &gt; RPC_WBUF_SIZE)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;len = RPC_WBUF_SIZE;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; ret = rpc_spi_set_freq(rpc, desc-&gt;mem-&gt;spi-&gt;max_speed_hz);<br>
&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; rpc_spi_mem_set_prep_op_cfg(desc-&gt;mem-&gt;spi,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;desc-&gt;info.op_tmpl,
&amp;offs, &amp;len);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; regmap_update_bits(rpc-&gt;regmap, RPC_CMNCR, RPC_CMNCR_MD,
RPC_CMNCR_MD);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_SMDRENR, 0);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; regmap_update_bits(rpc-&gt;regmap, RPC_PHYCNT, RPC_PHYCNT_STRTIM(7)
|<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_PHYCNT_WBUF2 |
RPC_PHYCNT_WBUF,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;RPC_PHYCNT_WBUF2 |
RPC_PHYCNT_WBUF);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; memcpy_toio(rpc-&gt;wbuf, buf, len);<br>
&gt; <br>
&gt; &nbsp; &nbsp;Wait, doesn't the manual say that the whole 256-byte
buffer should be<br>
&gt; filled? &nbsp;I think that short chunks have to be written w/o WBUF
(done, in fact,<br>
&gt; by the HF driver).<br>
&gt; <br>
</font></tt>
<br><tt><font size=2>From spi-nor.c layer always transfer 256 bytes data
with page program command.</font></tt>
<br>
<br><tt><font size=2>best regards,</font></tt>
<br><tt><font size=2>Mason</font></tt>
<br><tt><font size=2><br>
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

--=_alternative 0008985E482583D8_=--
