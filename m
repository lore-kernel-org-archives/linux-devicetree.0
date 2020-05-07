Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B4FC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F19D2083B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 16:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgEGQLp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 12:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEGQLo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 12:11:44 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A3BC05BD43
        for <devicetree@vger.kernel.org>; Thu,  7 May 2020 09:11:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1B8322A2C7E;
        Thu,  7 May 2020 17:11:42 +0100 (BST)
Date:   Thu, 7 May 2020 18:11:39 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v3 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200507181139.0fc36c39@collabora.com>
In-Reply-To: <20200507174559.58b57452@xps13>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-8-miquel.raynal@bootlin.com>
        <20200507145127.71615ed8@collabora.com>
        <20200507174559.58b57452@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 7 May 2020 17:45:59 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > > +	}
> > > +
> > > +	return steps;    
> > 
> > I guess you have a limit on steps. It's probably worth checking
> > that steps is in bounds.  
> 
> The upper limit is 2048, I'm not sure it is relevant to add a check
> here?

Well, it wouldn't hurt to add it, just for correctness.

> >   
> > > +}
> > > +
> > > +/* NAND framework ->exec_op() hooks and related helpers */
> > > +static void anfc_parse_instructions(struct nand_chip *chip,
> > > +				    const struct nand_subop *subop,
> > > +				    struct anfc_op *nfc_op)
> > > +{
> > > +	struct anand *anand = to_anand(chip);
> > > +	const struct nand_op_instr *instr = NULL;
> > > +	bool first_cmd = true;
> > > +	unsigned int op_id;
> > > +	int i;
> > > +
> > > +	memset(nfc_op, 0, sizeof(*nfc_op));
> > > +	nfc_op->addr2_reg = ADDR2_CS(anand->cs);
> > > +	nfc_op->cmd_reg = CMD_PAGE_SIZE(anand->page_sz);
> > > +
> > > +	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
> > > +		unsigned int offset, naddrs, pktsize;
> > > +		const u8 *addrs;
> > > +		u8 *buf;
> > > +
> > > +		instr = &subop->instrs[op_id];
> > > +
> > > +		switch (instr->type) {
> > > +		case NAND_OP_CMD_INSTR:
> > > +			if (first_cmd)
> > > +				nfc_op->cmd_reg |= CMD_1(instr->ctx.cmd.opcode);
> > > +			else
> > > +				nfc_op->cmd_reg |= CMD_2(instr->ctx.cmd.opcode);
> > > +
> > > +			first_cmd = false;
> > > +			break;
> > > +
> > > +		case NAND_OP_ADDR_INSTR:
> > > +			offset = nand_subop_get_addr_start_off(subop, op_id);
> > > +			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
> > > +			addrs = &instr->ctx.addr.addrs[offset];
> > > +			nfc_op->cmd_reg |= CMD_NADDRS(naddrs);
> > > +
> > > +			for (i = 0; i < min(ANFC_MAX_ADDR_CYC, naddrs); i++) {
> > > +				if (i < 4)
> > > +					nfc_op->addr1_reg |= (u32)addrs[i] << i * 8;
> > > +				else
> > > +					nfc_op->addr2_reg |= addrs[i];
> > > +			}
> > > +
> > > +			break;
> > > +		case NAND_OP_DATA_IN_INSTR:
> > > +			nfc_op->read = true;
> > > +			fallthrough;
> > > +		case NAND_OP_DATA_OUT_INSTR:
> > > +			offset = nand_subop_get_data_start_off(subop, op_id);
> > > +			buf = instr->ctx.data.buf.in;
> > > +			nfc_op->buf = &buf[offset];
> > > +			nfc_op->len = nand_subop_get_data_len(subop, op_id);
> > > +			nfc_op->steps = anfc_len_to_steps(chip, nfc_op->len);
> > > +			pktsize = DIV_ROUND_UP(nfc_op->len, nfc_op->steps);
> > > +			nfc_op->pkt_reg |= PKT_SIZE(round_up(pktsize, 4)) |    
> > 
> > Hm, pktsize has to be aligned on 4? Again, that's not great since you
> > adjust the size without letting the core know you did that.  
> 
> Mmmh probably not, I will test that.
> 
> But a FIFO read is 4 bytes long so anyway, it will probably read/write
> more no matter what I request (and move the SRAM pointer).

The FIFO/SRAM pointer and actual DATA len are most of the time not
correlated, meaning that you can write/read more to/from the FIFO/SRAM
without having extra DATA cycles issued on the bus.

> > > +static const struct nand_op_parser anfc_op_parser = NAND_OP_PARSER(
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_param_read_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> > > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> > > +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_param_write_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> > > +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, ANFC_MAX_PARAM_SIZE)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_data_read_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> > > +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_data_write_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> > > +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, ANFC_MAX_CHUNK_SIZE),
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_reset_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_erase_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_status_type_exec,
> > > +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > > +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> > > +	NAND_OP_PARSER_PATTERN(
> > > +		anfc_wait_type_exec,
> > > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > > +	);
> > > +    
> > 
> > Okay, no DATA-only patterns, so my suggestion to split non-aligned data
> > reads doesn't work. I'd suggest to describe data-lengths
> > constraints rather than automatically adjusting the data length to
> > something bigger when we can't do exactly the number of requested DATA
> > cycles.  
> 
> Well, we *must* adjust the data length automatically. But the below
> change is interesting and should be extended and then this controller
> updated (see the next sentence).

What's probably as important as allowing controllers to exceed the
amount of DATA cycles is flagging operations where that's allowed. I
can think of any READ/WRITE operations where you can issue a
RNDOUT/RNDIN to move the pointer after reading/writing data. READID
would also qualify here as data are just wrapping around, and I think
SET/GET_FEATURES allow that too, but I'm not sure.

Note that the mxc driver is probably even worse in that it only allows
512byte reads/writes, so we'll need the feature if we want to convert
that one.

> 
> > I started doing something similar here [1], except you'd need
> > much more fined-grained constraints, so maybe we should add an optional
> > check hook to data patterns.  
> 
> We could describe a "round_up" limitation too. That's definitely
> something that we can add in this driver on top of [1].
> 
> Would apply to Marvell NFC as well for instance.

Until we have that working, may I suggest to return ENOTSUPP when you
can't issue exactly the number of DATA cycles requested? That implies
doing an extra check to make sure any DATA instruction is either
smaller than MAX_PKT_SIZE or has a valid NUM_PKTS divisor.
