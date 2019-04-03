Return-Path: <SRS0=FrmT=SF=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <6d60bbef-a8ef-849e-33f3-3db35cefc09f@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <231f7423-bf13-99f8-427b-530f5446348b@cogentembedded.com> <OF7F1B534F.B934A9FE-ON482583D0.001DC618-482583D0.001FE84B@mxic.com.tw> <6d60bbef-a8ef-849e-33f3-3db35cefc09f@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OFAEA16021.C7F7B095-ON482583D1.0031A13D-482583D1.00335085@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Wed, 3 Apr 2019 17:20:27 +0800
Content-Type: multipart/alternative; boundary="=_alternative 00335085482583D1_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 00335085482583D1_=
Content-Type: text/plain; charset="US-ASCII"


Hi Sergei,

> 
> >> > +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device *spi,
> >> > +               const struct spi_mem_op *op,
> >> > +               u64 *offs, size_t *len)
> >> > +{
> >> > +   struct rpc_spi *rpc = 
spi_controller_get_devdata(spi->controller);
> >> > +
> >> > +   rpc->cmd = RPC_SMCMR_CMD(op->cmd.opcode);
> >> > +   rpc->smenr = RPC_SMENR_CDE |
> >> > +           RPC_SMENR_CDB(ilog2(op->cmd.buswidth));
> >> > +   rpc->totalxferlen = 1;
> >> > +   rpc->xfer_dir = SPI_MEM_NO_DATA;
> >> > +   rpc->xferlen = 0;
> >> > +   rpc->addr = 0;
> >> > +
> >> > +   if (op->addr.nbytes) {
> >> > +      rpc->smenr |= RPC_SMENR_ADB(ilog2(op->addr.buswidth));
> >> > +      if (op->addr.nbytes == 4)
> >> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> >> > +      else
> >> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> >> > +
> >> > +      if (offs && len)
> >> > +         rpc->addr = *offs;
> >> > +      else
> >> > +         rpc->addr = op->addr.val;
> >> > +      rpc->totalxferlen += op->addr.nbytes;
> >> > +   }
> >> > +
> >> > +   if (op->dummy.nbytes) {
> >> > +      rpc->smenr |= RPC_SMENR_DME;
> >> > +      rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes);
> >>
> >>    So you haven't fixed this bug? I repeat, the driver doesn't work 
right
> >> w/o this fixed!
> > 
> > Do you mean
> > 
> > rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes) * 8;   ?
> 
>    Yes. Or some other code that amounts to it.

why not setting "op->dummy.nbytes = 7" from spi-nor.c protocol layer ?
driver may check device ID or something else to setup op->dummy.nbytes.

I think it is not a good idea to *8 in spi host driver.

> 
> > What is your flash part number?
> 
>    Spansion/Cypress S25FS512S. The datasheet says there must be 8 dummy 
cycles
> for the RSFDP command...
> 
> > The problem you found is in 1 bit or 4 bits width ?
> 
>    1-bit, I think.
> 
> >>
> >> [...]
> >> > +static ssize_t rpc_spi_mem_dirmap_read(struct spi_mem_dirmap_desc 
*desc,
> >> > +                   u64 offs, size_t len, void *buf)
> >> > +{
> >> > +   struct rpc_spi *rpc =
> >> > +         spi_controller_get_devdata(desc->mem->spi->controller);
> >> > +   int ret;
> >> > +
> >> > +   if (offs + desc->info.offset + len > U32_MAX)
> >> > +      return -EINVAL;
> >> > +
> >> > +   if (len > 0x4000000)
> >> > +      len = 0x4000000;
> >>
> >>    Ugh...
> > 
> > by mtd->size ?
> 
>   That'd be better, yes.
> 

Oops, it seems hard to get mtd->size info. from spi_mem_dirmap,
I would like to keep 0x4000000.

> >> > +
> >> > +   ret = rpc_spi_set_freq(rpc, desc->mem->spi->max_speed_hz);
> >> > +   if (ret)
> >> > +      return ret;
> >> > +
> >> > +   rpc_spi_mem_set_prep_op_cfg(desc->mem->spi,
> >> > +                &desc->info.op_tmpl, &offs, &len);
> >> > +
> >> > +   regmap_update_bits(rpc->regmap, RPC_CMNCR, RPC_CMNCR_MD, 0);
> >> > +   regmap_write(rpc->regmap, RPC_DRCR, RPC_DRCR_RBURST(32) |
> >> > +           RPC_DRCR_RBE);
> >> > +
> >> > +   regmap_write(rpc->regmap, RPC_DRCMR, rpc->cmd);
> >> > +   regmap_write(rpc->regmap, RPC_DREAR, RPC_DREAR_EAC(1));
> >>
> >>    So you're not even trying to support flashes larger than the 
> read dirmap?
> >> Now I don't think it's acceptable (and I have rewritten this code
> internally).
> > 
> > what about the size comes form mtd->size ?
> 
>    I'm not talking about size here; we should use the full address. 
> I'm attaching
> my patch...

okay,got it!
what about just 
-      regmap_write(rpc->mfd->regmap, RPC_DREAR, RPC_DREAR_EAC(1));
+      regmap_write(rpc->mfd->regmap, RPC_DREAR,
+                   RPC_DREAR_EAV(offs >> 25) | RPC_DREAR_EAC(1));

because only > 64MByte size make RPC_DREAR_EAV() work. 

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

--=_alternative 00335085482583D1_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Sergei,<br>
<br>
&gt; <br>
&gt; &gt;&gt; &gt; +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device
*spi,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; const
struct spi_mem_op *op,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; u64
*offs, size_t *len)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_controller_get_devdata(spi-&gt;controller);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;cmd = RPC_SMCMR_CMD(op-&gt;cmd.opcode);<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;smenr = RPC_SMENR_CDE |<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RPC_SMENR_CDB(ilog2(op-&gt;cmd.buswidth));<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;totalxferlen = 1;<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;xfer_dir = SPI_MEM_NO_DATA;<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;xferlen = 0;<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;addr = 0;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (op-&gt;addr.nbytes) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_ADB(ilog2(op-&gt;addr.buswidth));<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (op-&gt;addr.nbytes == 4)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0xf);<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr |= RPC_SMENR_ADE(0x7);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (offs &amp;&amp; len)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr = *offs;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr = op-&gt;addr.val;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;totalxferlen += op-&gt;addr.nbytes;<br>
&gt; &gt;&gt; &gt; + &nbsp; }<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_DME;<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes);<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;So you haven't fixed this bug? I repeat, the
driver doesn't work right<br>
&gt; &gt;&gt; w/o this fixed!<br>
&gt; &gt; <br>
&gt; &gt; Do you mean<br>
&gt; &gt; <br>
&gt; &gt; rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes) * 8; &nbsp;
?<br>
&gt; <br>
&gt; &nbsp; &nbsp;Yes. Or some other code that amounts to it.</font></tt>
<br>
<br><tt><font size=2>why not setting &quot;op-&gt;dummy.nbytes = 7&quot;
from spi-nor.c protocol layer ?</font></tt>
<br><tt><font size=2>driver may check device ID or something else to setup
op-&gt;dummy.nbytes.</font></tt>
<br>
<br><tt><font size=2>I think it is not a good idea to *8 in spi host driver.</font></tt>
<br><tt><font size=2><br>
&gt; <br>
&gt; &gt; What is your flash part number?<br>
&gt; <br>
&gt; &nbsp; &nbsp;Spansion/Cypress S25FS512S. The datasheet says there
must be 8 dummy cycles<br>
&gt; for the RSFDP command...<br>
&gt; <br>
&gt; &gt; The problem you found is in 1 bit or 4 bits width ?<br>
&gt; <br>
&gt; &nbsp; &nbsp;1-bit, I think.<br>
&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; [...]<br>
&gt; &gt;&gt; &gt; +static ssize_t rpc_spi_mem_dirmap_read(struct spi_mem_dirmap_desc
*desc,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; u64 offs, size_t len, void *buf)<br>
&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt; + &nbsp; struct rpc_spi *rpc =<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; spi_controller_get_devdata(desc-&gt;mem-&gt;spi-&gt;controller);<br>
&gt; &gt;&gt; &gt; + &nbsp; int ret;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (offs + desc-&gt;info.offset + len &gt;
U32_MAX)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;return -EINVAL;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; if (len &gt; 0x4000000)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;len = 0x4000000;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;Ugh...<br>
&gt; &gt; <br>
&gt; &gt; by mtd-&gt;size ?<br>
&gt; <br>
&gt; &nbsp; That'd be better, yes.<br>
&gt; </font></tt>
<br>
<br><tt><font size=2>Oops, it seems hard to get mtd-&gt;size info. from
spi_mem_dirmap,</font></tt>
<br><tt><font size=2>I would like to keep 0x4000000.</font></tt>
<br>
<br><tt><font size=2>&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; ret = rpc_spi_set_freq(rpc, desc-&gt;mem-&gt;spi-&gt;max_speed_hz);<br>
&gt; &gt;&gt; &gt; + &nbsp; if (ret)<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;return ret;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; rpc_spi_mem_set_prep_op_cfg(desc-&gt;mem-&gt;spi,<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;desc-&gt;info.op_tmpl,
&amp;offs, &amp;len);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_update_bits(rpc-&gt;regmap, RPC_CMNCR,
RPC_CMNCR_MD, 0);<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DRCR, RPC_DRCR_RBURST(32)
|<br>
&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RPC_DRCR_RBE);<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DRCMR, rpc-&gt;cmd);<br>
&gt; &gt;&gt; &gt; + &nbsp; regmap_write(rpc-&gt;regmap, RPC_DREAR, RPC_DREAR_EAC(1));<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;So you're not even trying to support flashes
larger than the <br>
&gt; read dirmap?<br>
&gt; &gt;&gt; Now I don't think it's acceptable (and I have rewritten this
code<br>
&gt; internally).<br>
&gt; &gt; <br>
&gt; &gt; what about the size comes form mtd-&gt;size ?<br>
&gt; <br>
&gt; &nbsp; &nbsp;I'm not talking about size here; we should use the full
address. <br>
&gt; I'm attaching<br>
&gt; my patch...<br>
</font></tt>
<br><tt><font size=2>okay,got it!</font></tt>
<br><tt><font size=2>what about just </font></tt>
<br><tt><font size=2>- &nbsp; &nbsp; &nbsp;regmap_write(rpc-&gt;mfd-&gt;regmap,
RPC_DREAR, RPC_DREAR_EAC(1));</font></tt>
<br><tt><font size=2>+ &nbsp; &nbsp; &nbsp;regmap_write(rpc-&gt;mfd-&gt;regmap,
RPC_DREAR,</font></tt>
<br><tt><font size=2>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; RPC_DREAR_EAV(offs &gt;&gt; 25) | RPC_DREAR_EAC(1));</font></tt>
<br>
<br><tt><font size=2>because only &gt; 64MByte size make RPC_DREAR_EAV()
work. </font></tt>
<br>
<br><tt><font size=2>thanks &amp; best regards,</font></tt>
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

--=_alternative 00335085482583D1_=--
