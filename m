Return-Path: <SRS0=ovSU=SK=mxic.com.tw=masonccyang@kernel.org>
In-Reply-To: <7467d695-8922-16b2-03d4-fb4bbdda125a@cogentembedded.com>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw> <1553847606-18122-3-git-send-email-masonccyang@mxic.com.tw> <231f7423-bf13-99f8-427b-530f5446348b@cogentembedded.com> <OF7F1B534F.B934A9FE-ON482583D0.001DC618-482583D0.001FE84B@mxic.com.tw> <6d60bbef-a8ef-849e-33f3-3db35cefc09f@cogentembedded.com> <OFAEA16021.C7F7B095-ON482583D1.0031A13D-482583D1.00335085@mxic.com.tw> <7467d695-8922-16b2-03d4-fb4bbdda125a@cogentembedded.com>
Subject: Re: [PATCH v9 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller driver
MIME-Version: 1.0
Message-ID: <OF2404F267.07FEB6C8-ON482583D6.000A8180-482583D6.000CC92F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Mon, 8 Apr 2019 10:19:39 +0800
Content-Type: multipart/alternative; boundary="=_alternative 000CC92F482583D6_="
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: bbrezillon@kernel.org, broonie@kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw, lee.jones@linaro.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org, zhengxunli@mxic.com.tw
List-ID: <devicetree@vger.kernel.org>

This is a multipart message in MIME format.
--=_alternative 000CC92F482583D6_=
Content-Type: text/plain; charset="US-ASCII"


Hi Sergei,


> >> >> > +static void rpc_spi_mem_set_prep_op_cfg(struct spi_device *spi,
> >> >> > +               const struct spi_mem_op *op,
> >> >> > +               u64 *offs, size_t *len)
> >> >> > +{
> >> >> > +   struct rpc_spi *rpc = 
spi_controller_get_devdata(spi->controller);
> >> >> > +
> >> >> > +   rpc->cmd = RPC_SMCMR_CMD(op->cmd.opcode);
> >> >> > +   rpc->smenr = RPC_SMENR_CDE |
> >> >> > +           RPC_SMENR_CDB(ilog2(op->cmd.buswidth));
> >> >> > +   rpc->totalxferlen = 1;
> >> >> > +   rpc->xfer_dir = SPI_MEM_NO_DATA;
> >> >> > +   rpc->xferlen = 0;
> >> >> > +   rpc->addr = 0;
> >> >> > +
> >> >> > +   if (op->addr.nbytes) {
> >> >> > +      rpc->smenr |= RPC_SMENR_ADB(ilog2(op->addr.buswidth));
> >> >> > +      if (op->addr.nbytes == 4)
> >> >> > +         rpc->smenr |= RPC_SMENR_ADE(0xf);
> >> >> > +      else
> >> >> > +         rpc->smenr |= RPC_SMENR_ADE(0x7);
> >> >> > +
> >> >> > +      if (offs && len)
> >> >> > +         rpc->addr = *offs;
> >> >> > +      else
> >> >> > +         rpc->addr = op->addr.val;
> >> >> > +      rpc->totalxferlen += op->addr.nbytes;
> >> >> > +   }
> >> >> > +
> >> >> > +   if (op->dummy.nbytes) {
> >> >> > +      rpc->smenr |= RPC_SMENR_DME;
> >> >> > +      rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes);
> >> >>
> >> >>    So you haven't fixed this bug? I repeat, the driver doesn'twork 
right
> >> >> w/o this fixed!
> >> >
> >> > Do you mean
> >> >
> >> > rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes) * 8;   ?
> >>
> >>    Yes. Or some other code that amounts to it.
> 
>    Oops, I wasn't attentive enough, I was proposing:
> 
>    rpc->dummy = RPC_SMDMCR_DMCYC(op->dummy.nbytes * 8);

If so, RPC make 9 dummy cycles not 8 dummy cycle due to setting 0 is 1 
dummy cycle,
1 is 2 dummy cycles and 0x13 is 20 dummy cycles(max value).

I think it should set a correct dummy cycle/dummy bytes from 
spi-nor/spi-mem layer,
not in spi host driver.

Maybe Boris could comment on this !


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

--=_alternative 000CC92F482583D6_=
Content-Type: text/html; charset="US-ASCII"


<tt><font size=2>Hi Sergei,</font></tt>
<br><tt><font size=2><br>
<br>
&gt; &gt;&gt; &gt;&gt; &gt; +static void rpc_spi_mem_set_prep_op_cfg(struct
spi_device *spi,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; const struct spi_mem_op *op,<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; u64 *offs, size_t *len)<br>
&gt; &gt;&gt; &gt;&gt; &gt; +{<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; struct rpc_spi *rpc = spi_controller_get_devdata(spi-&gt;controller);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;cmd = RPC_SMCMR_CMD(op-&gt;cmd.opcode);<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;smenr = RPC_SMENR_CDE |<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RPC_SMENR_CDB(ilog2(op-&gt;cmd.buswidth));<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;totalxferlen = 1;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;xfer_dir = SPI_MEM_NO_DATA;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;xferlen = 0;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; rpc-&gt;addr = 0;<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; if (op-&gt;addr.nbytes) {<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_ADB(ilog2(op-&gt;addr.buswidth));<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (op-&gt;addr.nbytes
== 4)<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr
|= RPC_SMENR_ADE(0xf);<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;smenr
|= RPC_SMENR_ADE(0x7);<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;if (offs &amp;&amp; len)<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr
= *offs;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;else<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; rpc-&gt;addr
= op-&gt;addr.val;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;totalxferlen
+= op-&gt;addr.nbytes;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; }<br>
&gt; &gt;&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; if (op-&gt;dummy.nbytes) {<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;smenr |= RPC_SMENR_DME;<br>
&gt; &gt;&gt; &gt;&gt; &gt; + &nbsp; &nbsp; &nbsp;rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes);<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &nbsp; &nbsp;So you haven't fixed this bug? I repeat,
the driver doesn'twork right<br>
&gt; &gt;&gt; &gt;&gt; w/o this fixed!<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Do you mean<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes)
* 8; &nbsp; ?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &nbsp; &nbsp;Yes. Or some other code that amounts to it.<br>
&gt; <br>
&gt; &nbsp; &nbsp;Oops, I wasn't attentive enough, I was proposing:<br>
&gt; <br>
&gt; &nbsp; &nbsp;rpc-&gt;dummy = RPC_SMDMCR_DMCYC(op-&gt;dummy.nbytes
* 8);</font></tt>
<br>
<br><tt><font size=2>If so, RPC make 9 dummy cycles not 8 dummy cycle due
to setting 0 is 1 dummy cycle,</font></tt>
<br><tt><font size=2>1 is 2 dummy cycles and 0x13 is 20 dummy cycles(max
value).</font></tt>
<br>
<br><tt><font size=2>I think it should set a correct dummy cycle/dummy
bytes from spi-nor/spi-mem layer,</font></tt>
<br><tt><font size=2>not in spi host driver.</font></tt>
<br>
<br><tt><font size=2>Maybe Boris could comment on this !</font></tt>
<br>
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

--=_alternative 000CC92F482583D6_=--
