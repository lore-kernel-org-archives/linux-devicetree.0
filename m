Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A461DC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:34:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 793112054F
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pobox.com header.i=@pobox.com header.b="lb43PE57";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=fluxnic.net header.i=@fluxnic.net header.b="wtUQOsQJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729847AbgHTQeb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 12:34:31 -0400
Received: from pb-smtp20.pobox.com ([173.228.157.52]:54318 "EHLO
        pb-smtp20.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728439AbgHTQe0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 12:34:26 -0400
Received: from pb-smtp20.pobox.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id CF99FD866B;
        Thu, 20 Aug 2020 12:34:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=us97tkQ6PLUX0XkrL5tU1rmprkA=; b=lb43PE
        57IY30v/Blr1K0M3Vy34sVar9RA/Q96N41QICIi8cduo6pNgtnuyaZRB3klWrJV8
        GSi5Vojm238/u2eVk0U8U4/ACOadYgEIhrQlKZ8nuEddNUF/WDyiaDqHRBaJ0mGV
        fx6Hp/eZiOHOHGNzUTu75t+9BffFNsLWNzQ8M=
Received: from pb-smtp20.sea.icgroup.com (unknown [127.0.0.1])
        by pb-smtp20.pobox.com (Postfix) with ESMTP id C74C7D866A;
        Thu, 20 Aug 2020 12:34:18 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=BBldfq5HtCQVSDxqkIF7Q7liFlyCRCk9GmylPj0R7Po=; b=wtUQOsQJcfyrQhL6K9DS3nwbXZlB/pR2bcFj6uRdahmr14lkvh+7U5qWgVm8pIq9oQtKK3nBn2aQlhZVhG42a1lZ8U2mVGGSoIdczV80t7Yfef+od38i3SY1l9HFT4zGAe85u24/Ufn/Ggrc3gyXTBZtexnYr0UJRJDdzvLrjQU=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp20.pobox.com (Postfix) with ESMTPSA id A6C7AD8668;
        Thu, 20 Aug 2020 12:34:15 -0400 (EDT)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id A13F62DA01C4;
        Thu, 20 Aug 2020 12:34:13 -0400 (EDT)
Date:   Thu, 20 Aug 2020 12:34:13 -0400 (EDT)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
cc:     Boris Brezillon <boris.brezillon@collabora.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
In-Reply-To: <20200820100829.0e44200a@xps13>
Message-ID: <nycvar.YSQ.7.78.906.2008201102500.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net> <20200814034854.460830-3-nico@fluxnic.net> <20200820100829.0e44200a@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: FCAECF80-E302-11EA-95A9-F0EA2EB3C613-78420484!pb-smtp20.pobox.com
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Aug 2020, Miquel Raynal wrote:

> Hi Nicolas,
> 
> Nicolas Pitre <nico@fluxnic.net> wrote on Thu, 13 Aug 2020 23:48:54 -0400:
> 
> > From: Nicolas Pitre <npitre@baylibre.com>
> > 
> > This adds basic support for hardware implementing the MIPI I3C HCI
> > specification. This driver is currently limited by the capabilities
> > of the I3C subsystem, meaning things like scheduled commands,
> > auto-commands and NCM are not yet supported.
> > 
> > This supports version 1.0 of the MIPI I3C HCI spec, as well as the
> > imminent release of version 1.1. Support for draft version 2.0 of the
> > spec is also partially included but is guaranteed to change as the spec
> > is still a work in progress.
> > 
> > This is also lightly tested as actual hardware is still very scarse,
> > even for HCI v1.0. Further contributions to this driver are expected
> > once vendor implementations and new I3C devices become available.
> 
> Nice work! I honnestly do not know a lot about HCIs and I basically
> had only minor nits to point out, see below.

Thanks for your comments.
Please find my replies inline.

> > diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
> > new file mode 100644
> > index 0000000000..8349960c5b
> > --- /dev/null
> > +++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
> > @@ -0,0 +1,9 @@
> > +# SPDX-License-Identifier: BSD-3-Clause
> 
> Just out of curiosity, why this license?

MIPI is sponsoring this work and they own the copyright. It is their 
policy to license all their Open Source code as BSD.

> > +
> > +#ccflags-y := -DDEBUG
> 
> Probably a leftover?

Well, I left it there intentionally as the code is still actively being 
developed, so full debugging can quickly be reactivated by anyone.
I can remove it if deemed too distracting.

> [...]
> 
> > +#define CMD_C1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
> > +#define CMD_C1_OFFSET(v)		FIELD_PREP(W1_MASK(47, 32), v)
> > +#define CMD_C0_TOC			           W0_BIT_(31)
> > +#define CMD_C0_ROC			           W0_BIT_(30)
> > +#define CMD_C0_RNW			           W0_BIT_(29)
> > +#define CMD_C0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
> > +#define CMD_C0_16_BIT_SUBOFFSET		W0_bit(25)
> > +#define CMD_C0_FIRST_PHASE_MODE		           W0_BIT_(24)
> > +#define CMD_C0_DATA_LENGTH_POSITION(v)	FIELD_PREP(W0_MASK(23, 22), v)
> > +#define CMD_C0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
> > +#define CMD_C0_CP			           W0_BIT_(15)
> > +#define CMD_C0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
> > +#define CMD_C0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> > +
> > +/*
> > + * Internal Control Command
> > + */
> > +
> > +#define CMD_0_ATTR_M			FIELD_PREP(CMD_0_ATTR, 0x7)
> > +
> > +#define CMD_M1_VENDOR_SPECIFIC		           W1_MASK(63, 32)
> > +#define CMD_M0_MIPI_RESERVED		           W0_MASK(31, 12)
> > +#define CMD_M0_MIPI_CMD			           W0_MASK(11, 8)
> > +#define CMD_M0_VENDOR_INFO_PRESENT	           W0_BIT_(7)
> > +#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> > +
> > +
> > +static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
> > +			       struct hci_xfer *xfer,
> > +			       u8 ccc_addr, u8 ccc_cmd, bool raw)
> > +{
> > +	u_int dat_idx = 0;
> 
> I guess u_int her and below is not the preferred way to declare an unsigned int?

Why not?

> > +	int mode = hci_get_i3c_mode(hci);
> > +	u8 *data = xfer->data;
> > +	u_int data_len = xfer->data_len;
> > +	bool rnw = xfer->rnw;
> > +	int ret;
> > +
> > +	BUG_ON(raw);
> 
> It looks like 'raw' cannot be used with v1 (at least you seem to take
> care of it in v2), so maybe BUG_ON is a bit radical here and you can
> simply return an error? I think the use of BUG() is not appreciated in
> general.

That depends. Judgement is needed for BUG() usage.

Here raw is absolutely impossible with v1 hardware and if ever this 
happens this is definitely a software bug that needs fixing right away. 
There is no point returning a runtime error code in that case as the 
upper layer won't know what to do about it.

On the other hand, you absolutely don't want to BUG() on a condition 
that could _eventually_ happen at run time during normal usage. But 
that's not the case here.

> > +const struct hci_cmd_ops i3c_hci_cmd_v1 = {
> > +	.prep_ccc		= hci_cmd_v1_prep_ccc,
> > +	.prep_i3c_xfer		= hci_cmd_v1_prep_i3c_xfer,
> > +	.prep_i2c_xfer		= hci_cmd_v1_prep_i2c_xfer,
> > +	.perform_daa		= hci_cmd_v1_daa,
> 
> I know Boris does not like such space alignment :)

Well... unfortunately for Boris, this is overwhelmingly prevalent in the 
kernel code:

$ git grep "^"$'\t'"\.[^ ]*"$'\t'"*= "

And I do like it.  ;-P

> > +void i3c_hci_pio_reset(struct i3c_hci *hci)
> > +{
> > +	reg_write(RESET_CONTROL, RX_FIFO_RST|TX_FIFO_RST|RESP_QUEUE_RST);
> 
> Style with missing spaces                  ^ ^

True. Will fix.

> > +static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
> > +				struct i3c_ccc_cmd *ccc)
> > +{
> > +	struct i3c_hci *hci = to_i3c_hci(m);
> > +	struct hci_xfer *xfer;
> > +	bool raw = !!(hci->quirks & HCI_QUIRK_RAW_CCC);
> > +	bool prefixed = raw && !!(ccc->id & I3C_CCC_DIRECT);
> > +	u_int nxfers = ccc->ndests + prefixed;
> > +	DECLARE_COMPLETION_ONSTACK(done);
> > +	int i, last, ret = 0;
> > +
> > +	DBG("cmd=%#x rnw=%d ndests=%d data[0].len=%d",
> > +	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
> > +
> > +	xfer = hci_alloc_xfer(nxfers);
> > +	if (!xfer)
> > +		return -ENOMEM;
> > +
> > +	if (prefixed) {
> > +		xfer->data = NULL;
> > +		xfer->data_len = 0;
> > +		xfer->rnw = false;
> > +		hci->cmd->prep_ccc(hci, xfer, I3C_BROADCAST_ADDR,
> > +				   ccc->id, true);
> > +		xfer++;
> > +	}
> > +
> > +	for (i = 0; i < nxfers - prefixed; i++) {
> > +		xfer[i].data = ccc->dests[i].payload.data;
> > +		xfer[i].data_len = ccc->dests[i].payload.len;
> > +		xfer[i].rnw = ccc->rnw;
> > +		ret = hci->cmd->prep_ccc(hci, &xfer[i], ccc->dests[i].addr,
> > +					 ccc->id, raw);
> > +		if (ret)
> > +			goto out;
> > +		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> > +	}
> > +	last = i - 1;
> > +	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> > +	xfer[last].completion = &done;
> > +
> > +	if (prefixed)
> > +		xfer--;
> > +
> > +	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> > +	if (ret)
> > +		goto out;
> > +	if (!wait_for_completion_timeout(&done, HZ) &&
> > +	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> > +		ret = -ETIME;
> > +		goto out;
> > +	}
> > +	for (i = prefixed; i < nxfers; i++) {
> > +		if (ccc->rnw)
> > +			ccc->dests[i - prefixed].payload.len =
> > +				RESP_DATA_LENGTH(xfer[i].response);
> > +		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
> > +			ret = -EIO;
> > +			goto out;
> > +		}
> > +	}
> > +
> > +#if 0
> > +	if (ccc->rnw) {
> > +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> > +				 ccc->dests[0].payload.len);
> > +	}
> > +#endif
> 
> I guess this debug block can be dropped too (there are many debug
> information the should probably be dropped or turned into dev_info()
> or similar).

Again, hardware bringup from different vendors and other developments 
are still ongoing. I'd wish for those to stay for the time being unless 
people feel strongly enough about these to become a merge show stopper.

> > +/*
> > + * Paul Kimelman's debug trace log facility.
> > + * This is completely vendor and hardware specific.
> > + */
> > +void __PK_debug_trace(struct i3c_hci *hci, const char *func)
> > +{
> > +	void __iomem *trcp = (void __iomem *)hci->vendor_data + 7*4;
> 
> Maybe you need to define what is 7*4 , 0*4 below, v >> 27, etc
> 
> Also there are many missing spaces between operators (7 * 4,w & (1 <<9).

I think in this case this is really crossing the distraction threshold. 
This is used to extract debugging traces out of a specific FPGA 
implementation and is of no use to anyone else. I'll just rip that out 
from the next submission.

> > +		if (rh->ibi_data_phys)
> 
> I was told that _phys was a very bad suffix for something which is a
> DMA address an not focibly a physical address.

Fair enough. The HCI spec refers to these as "physical memory" hence the 
suffix. What were you told to use instead?

> > +static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> > +				 struct hci_xfer *xfer_list, int n)
> > +{
> > +	struct hci_rings_data *rings = hci->io_data;
> > +	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring];
> > +	u_int i;
> > +	bool did_unqueue = false;
> > +
> > +	/* stop the ring */
> > +	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> > +	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> > +		/*
> > +		 * We're deep in it if ever this condition is ever met.
> > +		 * Hardware might still be writing to memory, etc.
> > +		 */
> > +		ERR("unable to abort the ring");
> > +		BUG();
> 
> Why not just treating the error as always?

Again, if this ever happens, you're screwed. That means potential DMA 
engines could still be alive and about to scribble over memory that is 
about to be freed which may cause all sorts of impossible-to-find bugs 
in unrelated parts of the kernel. There is no point going on reporting 
such error condition to upper layers until the software, or possibly the 
hardware, is fixed

> > +struct hci_xfer {
> > +	u32 cmd_desc[4];
> > +	u32 response;
> > +	bool rnw;
> > +	void *data;
> > +	u_int data_len;
> > +	u_int cmd_tid;
> > +	struct completion *completion;
> > +	union {
> > +		struct {
> > +			/* PIO specific */
> > +			struct hci_xfer *next_xfer;
> > +			struct hci_xfer *next_data;
> > +			struct hci_xfer *next_resp;
> > +			u_int data_left;
> > +			u32 data_word_before_partial;
> > +		};
> 
> I think anonymous unions are prohibited because the kernel is supposed
> to be built with old gcc versions which do not support it.

Hmmm... let's see:

According to Documentation/process/changes.rst the current minimal 
required gcc version is 4.9.

The oldest gcc I have lying around is 4.5.1 and it supports anonymous 
unions just fine.

So I think we're clear.


Nicolas
