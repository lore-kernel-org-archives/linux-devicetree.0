Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC48BC38A24
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:13:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF74B2173E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 19:13:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgEGTNI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 15:13:08 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:43535 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgEGTNI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 15:13:08 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 12C4924000A;
        Thu,  7 May 2020 19:13:03 +0000 (UTC)
Date:   Thu, 7 May 2020 21:13:02 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
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
Message-ID: <20200507211302.59f7c2ba@xps13>
In-Reply-To: <20200507145127.71615ed8@collabora.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-8-miquel.raynal@bootlin.com>
        <20200507145127.71615ed8@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
2020 14:51:27 +0200:

> > +/* NAND framework ->exec_op() hooks and related helpers */
> > +static void anfc_parse_instructions(struct nand_chip *chip,
> > +				    const struct nand_subop *subop,
> > +				    struct anfc_op *nfc_op)
> > +{
> > +	struct anand *anand = to_anand(chip);
> > +	const struct nand_op_instr *instr = NULL;
> > +	bool first_cmd = true;
> > +	unsigned int op_id;
> > +	int i;
> > +
> > +	memset(nfc_op, 0, sizeof(*nfc_op));
> > +	nfc_op->addr2_reg = ADDR2_CS(anand->cs);
> > +	nfc_op->cmd_reg = CMD_PAGE_SIZE(anand->page_sz);
> > +
> > +	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
> > +		unsigned int offset, naddrs, pktsize;
> > +		const u8 *addrs;
> > +		u8 *buf;
> > +
> > +		instr = &subop->instrs[op_id];
> > +
> > +		switch (instr->type) {
> > +		case NAND_OP_CMD_INSTR:
> > +			if (first_cmd)
> > +				nfc_op->cmd_reg |= CMD_1(instr->ctx.cmd.opcode);
> > +			else
> > +				nfc_op->cmd_reg |= CMD_2(instr->ctx.cmd.opcode);
> > +
> > +			first_cmd = false;
> > +			break;
> > +
> > +		case NAND_OP_ADDR_INSTR:
> > +			offset = nand_subop_get_addr_start_off(subop, op_id);
> > +			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
> > +			addrs = &instr->ctx.addr.addrs[offset];
> > +			nfc_op->cmd_reg |= CMD_NADDRS(naddrs);
> > +
> > +			for (i = 0; i < min(ANFC_MAX_ADDR_CYC, naddrs); i++) {
> > +				if (i < 4)
> > +					nfc_op->addr1_reg |= (u32)addrs[i] << i * 8;
> > +				else
> > +					nfc_op->addr2_reg |= addrs[i];
> > +			}
> > +
> > +			break;
> > +		case NAND_OP_DATA_IN_INSTR:
> > +			nfc_op->read = true;
> > +			fallthrough;
> > +		case NAND_OP_DATA_OUT_INSTR:
> > +			offset = nand_subop_get_data_start_off(subop, op_id);
> > +			buf = instr->ctx.data.buf.in;
> > +			nfc_op->buf = &buf[offset];
> > +			nfc_op->len = nand_subop_get_data_len(subop, op_id);
> > +			nfc_op->steps = anfc_len_to_steps(chip, nfc_op->len);
> > +			pktsize = DIV_ROUND_UP(nfc_op->len, nfc_op->steps);
> > +			nfc_op->pkt_reg |= PKT_SIZE(round_up(pktsize, 4)) |  
> 
> Hm, pktsize has to be aligned on 4? Again, that's not great since you
> adjust the size without letting the core know you did that.

I confirm the round_up() is needed. It does not work without.

> 
> > +					   PKT_STEPS(nfc_op->steps);
> > +			break;
> > +		case NAND_OP_WAITRDY_INSTR:
> > +			nfc_op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
> > +			break;
> > +		}
> > +	}
> > +}

