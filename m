Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6826CC433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:56:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 164032072D
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 16:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729223AbgHTQ4v (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 12:56:51 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33596 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727972AbgHTQ4u (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 12:56:50 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 16D1B298C52;
        Thu, 20 Aug 2020 17:56:47 +0100 (BST)
Date:   Thu, 20 Aug 2020 18:56:42 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Nicolas Pitre <nico@fluxnic.net>,
        Matthew Schnoor <matthew.schnoor@intel.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
        Laura Nixon <laura.nixon@team.mipi.org>,
        Robert Gough <robert.gough@intel.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] i3c/master: add the mipi-i3c-hci driver
Message-ID: <20200820185642.04f184e9@collabora.com>
In-Reply-To: <nycvar.YSQ.7.78.906.2008201102500.1479@knanqh.ubzr>
References: <20200814034854.460830-1-nico@fluxnic.net>
        <20200814034854.460830-3-nico@fluxnic.net>
        <20200820100829.0e44200a@xps13>
        <nycvar.YSQ.7.78.906.2008201102500.1479@knanqh.ubzr>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 20 Aug 2020 12:34:13 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Thu, 20 Aug 2020, Miquel Raynal wrote:

> > > +
> > > +#ccflags-y := -DDEBUG  
> > 
> > Probably a leftover?  
> 
> Well, I left it there intentionally as the code is still actively being 
> developed, so full debugging can quickly be reactivated by anyone.
> I can remove it if deemed too distracting.

How about using dynamic printk instead? I'm pretty sure you don't need
to debug I3C stuff early enough to warrant usage of DDEBUG.

> 
> > [...]
> >   
> > > +#define CMD_C1_DATA_LENGTH(v)		FIELD_PREP(W1_MASK(63, 48), v)
> > > +#define CMD_C1_OFFSET(v)		FIELD_PREP(W1_MASK(47, 32), v)
> > > +#define CMD_C0_TOC			           W0_BIT_(31)
> > > +#define CMD_C0_ROC			           W0_BIT_(30)
> > > +#define CMD_C0_RNW			           W0_BIT_(29)
> > > +#define CMD_C0_MODE(v)			FIELD_PREP(W0_MASK(28, 26), v)
> > > +#define CMD_C0_16_BIT_SUBOFFSET		W0_bit(25)
> > > +#define CMD_C0_FIRST_PHASE_MODE		           W0_BIT_(24)
> > > +#define CMD_C0_DATA_LENGTH_POSITION(v)	FIELD_PREP(W0_MASK(23, 22), v)
> > > +#define CMD_C0_DEV_INDEX(v)		FIELD_PREP(W0_MASK(20, 16), v)
> > > +#define CMD_C0_CP			           W0_BIT_(15)
> > > +#define CMD_C0_CMD(v)			FIELD_PREP(W0_MASK(14, 7), v)
> > > +#define CMD_C0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> > > +
> > > +/*
> > > + * Internal Control Command
> > > + */
> > > +
> > > +#define CMD_0_ATTR_M			FIELD_PREP(CMD_0_ATTR, 0x7)
> > > +
> > > +#define CMD_M1_VENDOR_SPECIFIC		           W1_MASK(63, 32)
> > > +#define CMD_M0_MIPI_RESERVED		           W0_MASK(31, 12)
> > > +#define CMD_M0_MIPI_CMD			           W0_MASK(11, 8)
> > > +#define CMD_M0_VENDOR_INFO_PRESENT	           W0_BIT_(7)
> > > +#define CMD_M0_TID(v)			FIELD_PREP(W0_MASK(6, 3), v)
> > > +
> > > +
> > > +static int hci_cmd_v1_prep_ccc(struct i3c_hci *hci,
> > > +			       struct hci_xfer *xfer,
> > > +			       u8 ccc_addr, u8 ccc_cmd, bool raw)
> > > +{
> > > +	u_int dat_idx = 0;  
> > 
> > I guess u_int her and below is not the preferred way to declare an unsigned int?  
> 
> Why not?
> 
> > > +	int mode = hci_get_i3c_mode(hci);
> > > +	u8 *data = xfer->data;
> > > +	u_int data_len = xfer->data_len;
> > > +	bool rnw = xfer->rnw;
> > > +	int ret;
> > > +
> > > +	BUG_ON(raw);  
> > 
> > It looks like 'raw' cannot be used with v1 (at least you seem to take
> > care of it in v2), so maybe BUG_ON is a bit radical here and you can
> > simply return an error? I think the use of BUG() is not appreciated in
> > general.  
> 
> That depends. Judgement is needed for BUG() usage.
> 
> Here raw is absolutely impossible with v1 hardware and if ever this 
> happens this is definitely a software bug that needs fixing right away. 
> There is no point returning a runtime error code in that case as the 
> upper layer won't know what to do about it.
> 
> On the other hand, you absolutely don't want to BUG() on a condition 
> that could _eventually_ happen at run time during normal usage. But 
> that's not the case here.

Well, people have tried to eradicate BUG() occurrences, so let's not add
new ones if we can avoid it. How about a WARN_ON()+error:

	if (WARN_ON(raw))
		return -EINVAL;

> 
> > > +const struct hci_cmd_ops i3c_hci_cmd_v1 = {
> > > +	.prep_ccc		= hci_cmd_v1_prep_ccc,
> > > +	.prep_i3c_xfer		= hci_cmd_v1_prep_i3c_xfer,
> > > +	.prep_i2c_xfer		= hci_cmd_v1_prep_i2c_xfer,
> > > +	.perform_daa		= hci_cmd_v1_daa,  
> > 
> > I know Boris does not like such space alignment :)  
> 
> Well... unfortunately for Boris, this is overwhelmingly prevalent in the 
> kernel code:
> 
> $ git grep "^"$'\t'"\.[^ ]*"$'\t'"*= "
> 
> And I do like it.  ;-P

The rational being this preference is that sooner or later someone will
add a field to hci_cmd_ops that messes up your nice formatting :P.
Anyway, that's definitely not a blocker.

> 
> > > +void i3c_hci_pio_reset(struct i3c_hci *hci)
> > > +{
> > > +	reg_write(RESET_CONTROL, RX_FIFO_RST|TX_FIFO_RST|RESP_QUEUE_RST);  
> > 
> > Style with missing spaces                  ^ ^  
> 
> True. Will fix.
> 
> > > +static int i3c_hci_send_ccc_cmd(struct i3c_master_controller *m,
> > > +				struct i3c_ccc_cmd *ccc)
> > > +{
> > > +	struct i3c_hci *hci = to_i3c_hci(m);
> > > +	struct hci_xfer *xfer;
> > > +	bool raw = !!(hci->quirks & HCI_QUIRK_RAW_CCC);
> > > +	bool prefixed = raw && !!(ccc->id & I3C_CCC_DIRECT);
> > > +	u_int nxfers = ccc->ndests + prefixed;
> > > +	DECLARE_COMPLETION_ONSTACK(done);
> > > +	int i, last, ret = 0;
> > > +
> > > +	DBG("cmd=%#x rnw=%d ndests=%d data[0].len=%d",
> > > +	    ccc->id, ccc->rnw, ccc->ndests, ccc->dests[0].payload.len);
> > > +
> > > +	xfer = hci_alloc_xfer(nxfers);
> > > +	if (!xfer)
> > > +		return -ENOMEM;
> > > +
> > > +	if (prefixed) {
> > > +		xfer->data = NULL;
> > > +		xfer->data_len = 0;
> > > +		xfer->rnw = false;
> > > +		hci->cmd->prep_ccc(hci, xfer, I3C_BROADCAST_ADDR,
> > > +				   ccc->id, true);
> > > +		xfer++;
> > > +	}
> > > +
> > > +	for (i = 0; i < nxfers - prefixed; i++) {
> > > +		xfer[i].data = ccc->dests[i].payload.data;
> > > +		xfer[i].data_len = ccc->dests[i].payload.len;
> > > +		xfer[i].rnw = ccc->rnw;
> > > +		ret = hci->cmd->prep_ccc(hci, &xfer[i], ccc->dests[i].addr,
> > > +					 ccc->id, raw);
> > > +		if (ret)
> > > +			goto out;
> > > +		xfer[i].cmd_desc[0] |= CMD_0_ROC;
> > > +	}
> > > +	last = i - 1;
> > > +	xfer[last].cmd_desc[0] |= CMD_0_TOC;
> > > +	xfer[last].completion = &done;
> > > +
> > > +	if (prefixed)
> > > +		xfer--;
> > > +
> > > +	ret = hci->io->queue_xfer(hci, xfer, nxfers);
> > > +	if (ret)
> > > +		goto out;
> > > +	if (!wait_for_completion_timeout(&done, HZ) &&
> > > +	    hci->io->dequeue_xfer(hci, xfer, nxfers)) {
> > > +		ret = -ETIME;
> > > +		goto out;
> > > +	}
> > > +	for (i = prefixed; i < nxfers; i++) {
> > > +		if (ccc->rnw)
> > > +			ccc->dests[i - prefixed].payload.len =
> > > +				RESP_DATA_LENGTH(xfer[i].response);
> > > +		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
> > > +			ret = -EIO;
> > > +			goto out;
> > > +		}
> > > +	}
> > > +
> > > +#if 0
> > > +	if (ccc->rnw) {
> > > +		HEXDUMP("got: ", ccc->dests[0].payload.data,
> > > +				 ccc->dests[0].payload.len);
> > > +	}
> > > +#endif  
> > 
> > I guess this debug block can be dropped too (there are many debug
> > information the should probably be dropped or turned into dev_info()
> > or similar).  
> 
> Again, hardware bringup from different vendors and other developments 
> are still ongoing. I'd wish for those to stay for the time being unless 
> people feel strongly enough about these to become a merge show stopper.

Can't we replace that by a dev_dbg() using the %*pE formater?

> 
> > > +/*
> > > + * Paul Kimelman's debug trace log facility.
> > > + * This is completely vendor and hardware specific.
> > > + */
> > > +void __PK_debug_trace(struct i3c_hci *hci, const char *func)
> > > +{
> > > +	void __iomem *trcp = (void __iomem *)hci->vendor_data + 7*4;  
> > 
> > Maybe you need to define what is 7*4 , 0*4 below, v >> 27, etc
> > 
> > Also there are many missing spaces between operators (7 * 4,w & (1 <<9).  
> 
> I think in this case this is really crossing the distraction threshold. 
> This is used to extract debugging traces out of a specific FPGA 
> implementation and is of no use to anyone else. I'll just rip that out 
> from the next submission.
> 
> > > +		if (rh->ibi_data_phys)  
> > 
> > I was told that _phys was a very bad suffix for something which is a
> > DMA address an not focibly a physical address.  
> 
> Fair enough. The HCI spec refers to these as "physical memory" hence the 
> suffix. What were you told to use instead?

Maybe _dma instead of _phys?

> 
> > > +static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
> > > +				 struct hci_xfer *xfer_list, int n)
> > > +{
> > > +	struct hci_rings_data *rings = hci->io_data;
> > > +	struct hci_rh_data *rh = &rings->headers[xfer_list[0].ring];
> > > +	u_int i;
> > > +	bool did_unqueue = false;
> > > +
> > > +	/* stop the ring */
> > > +	rh_reg_write(RING_CONTROL, RING_CTRL_ABORT);
> > > +	if (wait_for_completion_timeout(&rh->op_done, HZ) == 0) {
> > > +		/*
> > > +		 * We're deep in it if ever this condition is ever met.
> > > +		 * Hardware might still be writing to memory, etc.
> > > +		 */
> > > +		ERR("unable to abort the ring");
> > > +		BUG();  
> > 
> > Why not just treating the error as always?  
> 
> Again, if this ever happens, you're screwed. That means potential DMA 
> engines could still be alive and about to scribble over memory that is 
> about to be freed which may cause all sorts of impossible-to-find bugs 
> in unrelated parts of the kernel. There is no point going on reporting 
> such error condition to upper layers until the software, or possibly the 
> hardware, is fixed

Again, I think adding a WARN_ON() and letting hci_dma_dequeue_xfer()
return an error code is a good compromise. 

> 
> > > +struct hci_xfer {
> > > +	u32 cmd_desc[4];
> > > +	u32 response;
> > > +	bool rnw;
> > > +	void *data;
> > > +	u_int data_len;
> > > +	u_int cmd_tid;
> > > +	struct completion *completion;
> > > +	union {
> > > +		struct {
> > > +			/* PIO specific */
> > > +			struct hci_xfer *next_xfer;
> > > +			struct hci_xfer *next_data;
> > > +			struct hci_xfer *next_resp;
> > > +			u_int data_left;
> > > +			u32 data_word_before_partial;
> > > +		};  
> > 
> > I think anonymous unions are prohibited because the kernel is supposed
> > to be built with old gcc versions which do not support it.  
> 
> Hmmm... let's see:
> 
> According to Documentation/process/changes.rst the current minimal 
> required gcc version is 4.9.
> 
> The oldest gcc I have lying around is 4.5.1 and it supports anonymous 
> unions just fine.
> 
> So I think we're clear.

We had problems with a buggy version of gcc 4.<something> at some
point, and that was only when initializing anonymous unions, but I
think it's all behind us now.
