Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83613C47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:32:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69C5720675
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgEKPcp (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 11:32:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52676 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbgEKPcp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 11 May 2020 11:32:45 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B76402A0945;
        Mon, 11 May 2020 16:32:42 +0100 (BST)
Date:   Mon, 11 May 2020 17:32:35 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200511173235.2e2fe467@collabora.com>
In-Reply-To: <20200511170729.4766eeaa@xps13>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
        <20200508171339.8052-8-miquel.raynal@bootlin.com>
        <20200510090314.10426b6e@collabora.com>
        <20200511170729.4766eeaa@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon, 11 May 2020 17:07:29 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
> 2020 09:03:14 +0200:
> 
> > On Fri,  8 May 2020 19:13:38 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >   
> > > +static int anfc_exec_op(struct nand_chip *chip,
> > > +			const struct nand_operation *op,
> > > +			bool check_only)
> > > +{
> > > +	int ret;
> > > +
> > > +	if (check_only)
> > > +		return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
> > > +					      check_only);    
> > 
> > You should also check the DATA_IN/OUT size here ^.  
> 
> Here is my proposal:
> 
> ---8<---
> 
> +static int anfc_check_op(struct nand_chip *chip,
> +                        const struct nand_operation *op)
> +{
> +       int op_id;
> +
> +       /*
> +        * The controller abstracts all the NAND operations and do not support
> +        * data only operations.

	* FIXME: The nand_op_parser framework should be extended to
	* support custom checks on DATA instructions.

> +        */

You also didn't mention the fact that the number of data cycles should
be aligned on 4 bytes, and that the controller might read/write more
than requested when that's not the case. But maybe you have that
comment elsewhere in the code (where you do the round_up(4)?).

	/*
	 * Number of DATA cycles must be aligned on 4, that means the
	 * controller might read/write more than requested This is
	 * harmless most of the time as extra DATA are discarded in
	 * the write path and read pointer adjusted in the read path.
	 * FIXME: The core should mark operations where reading/writing
	 * more is allowed so the exec_op() implementation can take
	 * the right decision when the alignment constraint is not met:
	 * adjust the number of DATA cycles when it's allowed, and
	 * reject the operation otherwise.
	 */

> +       for (op_id = 0; op_id < op->ninstrs; op_id++) {
> +               instr = &op->instrs[op_id];
> +
> +               switch (instr->type) {
> +               case NAND_OP_ADDR_INSTR:
> +                       if (instr->ctx.addr.naddrs > ANFC_MAX_ADDR_CYC)
> +                               return -ENOTSUPP;
> +                       break;
> +               case NAND_OP_DATA_IN_INSTR:
> +               case NAND_OP_DATA_OUT_INSTR:
> +                       if (instr->ctx.data.len > ANFC_MAX_CHUNK_SIZE)
> +                               return -ENOTSUPP;
> +                       break;
> +               default:
> +               }
> +       }
> +
> +       /*
> +        * The controller does not allow to proceed with a CMD+DATA_IN cycle
> +        * manually on the bus by reading data from the data register. Instead,
> +        * the controller abstract a status read operation with its own status
> +        * register after ordering a read status operation. Hence, we cannot
> +        * support any CMD+DATA_IN operation other than a READ STATUS.

	* FIXME: The nand_op_parser() framework should be extended to
	* describe fixed patterns instead of open-coding this check
	* here.

> +        */
> +       if (op->ninstrs == 2 &&
> +           op->instrs[0].type == NAND_OP_CMD_INSTR &&
> +           op->instrs[0].ctx.cmd.opcode != NAND_CMD_STATUS &&
> +           op->instrs[1].type == NAND_OP_DATA_IN_INSTR)
> +               return -ENOTSUPP;
> +
> +       return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
> +                                     check_only);
> +}
> +
>  static int anfc_exec_op(struct nand_chip *chip,
>                         const struct nand_operation *op,
>                         bool check_only)
> @@ -774,8 +813,7 @@ static int anfc_exec_op(struct nand_chip *chip,
>         int ret;
>  
>         if (check_only)
> -               return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
> -                                             check_only);
> +               return anfc_check_op(chip, op);
>  
>         ret = anfc_select_target(chip, op->cs);
>         if (ret)
> 
> --->8---  
> 
> What do you think?

