Return-Path: <SRS0=FHWM=SE=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <231f7423-bf13-99f8-427b-530f5446348b@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <231f7423-bf13-99f8-427b-530f5446348b@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF7F1B534F.B934A9FE-ON482583D0.001DC618-482583D0.001FE84B@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Tue, 2 Apr 2019 13:48:29 +0800
Content-Type: multipart/alternative; boundary="=_alternative 001FE849482583D0_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 001FE849482583D0_=
Content-Type: text/plain; charset="US-ASCII"


Hi Sergei,


> > +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device *spi,
> > +               const struct spi_mem_op *op,
> > +               u64 *offs, size_t *len)
> > +{
> > +   struct rpc_spi *rpc = spi_controller_get_devdata(spi->controller);
> > +
> > +   rpc->cmd = RPC_SMCMR_CMD(op->cmd.opcode);
> > +   rpc->smenr = RPC_SMENR_CDE |
> > +           RPC_SMENR_CDB(ilog2(op->cmd.buswidth));
> > +   rpc->totalxferlen = 1;
> > +   rpc->xfer_dir = SPI_MEM_NO_DATA;
> > +   rpc->xferlen = 0;
> > +   rpc->addr = 0;
> > +
> > +   if (op->addr.nbytes) {
> > +      rpc->smenr |= RPC_SMENR_ADB(ilog2(op->addr.buswidth));
> > +      if (op->addr.nbytes == 4)
> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> > +      else
> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> > +
> > +      if (offs && len)
> > +         rpc->addr = *offs;
> > +      else
> > +         rpc->addr = op->addr.val;
> > +      rpc->totalxferlen += op->addr.nbytes;
> > +   }
> > +
> > +   if (op->dummy.nbytes) {
> > +      rpc->smenr |= RPC_SMENR_DME;
> > +      rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes);
> 
>    So you haven't fixed this bug? I repeat, the driver doesn't work 
right
> w/o this fixed!

Do you mean

rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes) * 8;   ?

What is your flash part number?

The problem you found is in 1 bit or 4 bits width ?

> 
> [...]
> > +static ssize_t rpc_spi_mem_dirmap_read(struct spi_mem_dirmap_desc 
*desc,
> > +                   u64 offs, size_t len, void *buf)
> > +{
> > +   struct rpc_spi *rpc =
> > +         spi_controller_get_devdata(desc->mem->spi->controller);
> > +   int ret;
> > +
> > +   if (offs + desc->info.offset + len > U32_MAX)
> > +      return -EINVAL;
> > +
> > +   if (len > 0x4000000)
> > +      len = 0x4000000;
> 
>    Ugh...

by mtd->size ?

> 
> > +
> > +   ret = rpc_spi_set_freq(rpc, desc->mem->spi->max_speed_hz);
> > +   if (ret)
> > +      return ret;
> > +
> > +   rpc_spi_mem_set_prep_op_cfg(desc->mem->spi,
> > +                &desc->info.op_tmpl, &offs, &len);
> > +
> > +   regmap_update_bits(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD, 0);
> > +   regmap_write(rpc->regmap, RPC_DRCR, RPC_DRCR_RBURST(32) |
> > +           RPC_DRCR_RBE);
> > +
> > +   regmap_write(rpc->regmap, RPC_DRCMR, rpc->cmd);
> > +   regmap_write(rpc->regmap, RPC_DREAR, RPC_DREAR_EAC(1));
> 
>    So you're not even trying to support flashes larger than the read 
dirmap?
> Now I don't think it's acceptable (and I have rewritten this code 
internally).

what about the size comes form mtd->size ?

> 
> [...]
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
> 
>    Ugh! Again, I no longer think this is acceptable... Maybe we just 
need
> to drop the support of the write buffer...
> 

why ?
Using write buffer got the much better write performance.

> [...]
> > +static void rpc_spi_transfer_setup(struct rpc_spi *rpc,
> > +               struct spi_message *msg)
> > +{
> [...]
> > +   if (xfercnt > 2 && xfer[1].len && xfer[1].tx_buf) {
> > +      rpc->smenr |=
> > +         RPC_SMENR_ADB(ilog2((unsigned int)xfer[1].tx_nbits));
> > +
> > +      for (i = 0; i < xfer[1].len; i++)
> > +         rpc->addr |= ((u8 *)xfer[1].tx_buf)[i] <<
> > +                 (8 * (xfer[1].len - i - 1));
> > +
> > +      if (xfer[1].len == 4)
> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> > +      else
> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> > +   }
> > +
> > +   if (xfercnt > 3 && xfer[2].len && xfer[2].tx_buf) {
> > +      rpc->smenr |= RPC_SMENR_DME;
> > +      rpc->dummy = RPC_SMDMCR_DMCYC(xfer[2].len);
> 
>    Needs to be multiplied by 8 (or other value) as well...

Same above you mentioned:

rpc->dummy = RPC_SMDMCR_DMCYC(xfer[2].len) * 8; 


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

--=_alternative 001FE849482583D0_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Sergei,<br>
<br>
<br>
&gt; &gt; +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device *spi,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const struct
spi_mem_op *op,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u64 *offs,
size_t *len)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_controller_get_devdata(spi-&gt;controller);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; rpc-&gt;cmd = RPC_SMCMR_CMD(op-&gt;cmd.opcode);<br>
&gt; &gt; + &nbsp; rpc-&gt;smenr = RPC_SMENR_CDE |<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RPC_SMENR_CDB(ilog2(op-&gt;cmd.buswidth));<br>
&gt; &gt; + &nbsp; rpc-&gt;totalxferlen = 1;<br>
&gt; &gt; + &nbsp; rpc-&gt;xfer_dir = SPI_MEM_NO_DATA;<br>
&gt; &gt; + &nbsp; rpc-&gt;xferlen = 0;<br>
&gt; &gt; + &nbsp; rpc-&gt;addr = 0;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (op-&gt;addr.nbytes) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_ADB(ilog2(op-&gt;addr.buswidth));<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (op-&gt;addr.nbytes == 4)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0xf);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0x7);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (offs &amp;&amp; len)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr = *offs;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr = op-&gt;addr.val;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;totalxferlen += op-&gt;addr.nbytes;<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_DME;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes);<br>
&gt; <br>
&gt; &nbsp; &nbsp;So you haven't fixed this bug? I repeat, the driver doesn't
work right<br>
&gt; w/o this fixed!</font></tt>
<br>
<br><tt><font size=2>Do you mean</font></tt>
<br>
<br><tt><font size=2>rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes)
* 8; &nbsp; ?</font></tt>
<br>
<br><tt><font size=2>What is your flash part number?</font></tt>
<br>
<br><tt><font size=2>The problem you found is in 1 bit or 4 bits width
?</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; [...]<br>
&gt; &gt; +static ssize_t rpc_spi_mem_dirmap_read(struct spi_mem_dirmap_desc
*desc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
u64 offs, size_t len, void *buf)<br>
&gt; &gt; +{<br>
&gt; &gt; + &nbsp; struct rpc_spi *rpc =<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi_controller_get_devdata(desc-&gt;mem-&gt;spi-&gt;controller);<br>
&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (offs + desc-&gt;info.offset + len &gt; U32_MAX)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (len &gt; 0x4000000)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;len = 0x4000000;<br>
&gt; <br>
&gt; &nbsp; &nbsp;Ugh...</font></tt>
<br>
<br><tt><font size=2>by mtd-&gt;size ?</font></tt>
<br><tt><font size=2><br>
&gt; <br>
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
0);<br>
&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DRCR, RPC_DRCR_RBURST(32)
|<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RPC_DRCR_RBE);<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DRCMR, rpc-&gt;cmd);<br>
&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DREAR, RPC_DREAR_EAC(1));<br>
&gt; <br>
&gt; &nbsp; &nbsp;So you're not even trying to support flashes larger than
the read dirmap?<br>
&gt; Now I don't think it's acceptable (and I have rewritten this code
internally).</font></tt>
<br>
<br><tt><font size=2>what about the size comes form mtd-&gt;size ?</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; [...]<br>
&gt; &gt; +static ssize_t rpc_spi_mem_dirmap_write(struct spi_mem_dirmap_desc
*desc,<br>
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
&gt; <br>
&gt; &nbsp; &nbsp;Ugh! Again, I no longer think this is acceptable... Maybe
we just need<br>
&gt; to drop the support of the write buffer...<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>why ?</font></tt>
<br><tt><font size=2>Using write buffer got the much better write performance.</font></tt>
<br><tt><font size=2><br>
&gt; [...]<br>
&gt; &gt; +static void rpc_spi_transfer_setup(struct rpc_spi *rpc,<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct spi_message
*msg)<br>
&gt; &gt; +{<br>
&gt; [...]<br>
&gt; &gt; + &nbsp; if (xfercnt &gt; 2 &amp;&amp; xfer[1].len &amp;&amp;
xfer[1].tx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |=<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; RPC_SMENR_ADB(ilog2((unsigned int)xfer[1].tx_nbits));<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;for (i = 0; i &lt; xfer[1].len; i++)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr |= ((u8 *)xfer[1].tx_buf)[i]
&lt;&lt;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (8
* (xfer[1].len - i - 1));<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;if (xfer[1].len == 4)<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0xf);<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0x7);<br>
&gt; &gt; + &nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; + &nbsp; if (xfercnt &gt; 3 &amp;&amp; xfer[2].len &amp;&amp;
xfer[2].tx_buf) {<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_DME;<br>
&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;dummy = RPC_SMDMCR_DMCYC(xfer[2].len);<br>
&gt; <br>
&gt; &nbsp; &nbsp;Needs to be multiplied by 8 (or other value) as well...</font></tt>
<br>
<br><tt><font size=2>Same above you mentioned:</font></tt>
<br>
<br><tt><font size=2>rpc-&gt;dummy = RPC_SMDMCR_DMCYC(xfer[2].len) * 8;
&nbsp; &nbsp; </font></tt>
<br><tt><font size=2><br>
<br>
best regards,</font></tt>
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

--=_alternative 001FE849482583D0_=--
