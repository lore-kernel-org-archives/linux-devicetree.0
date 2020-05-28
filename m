Return-Path: <SRS0=2ZKK=7K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC3BC433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 23:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56E47207F9
	for <linux-devicetree@archiver.kernel.org>; Thu, 28 May 2020 23:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437711AbgE1XqX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 28 May 2020 19:46:23 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:46399 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437697AbgE1XqV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 28 May 2020 19:46:21 -0400
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id F3722240004;
        Thu, 28 May 2020 23:46:14 +0000 (UTC)
Date:   Fri, 29 May 2020 01:46:13 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Julien Su <juliensu@mxic.com.tw>,
        Weijie Gao <weijie.gao@mediatek.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Mason Yang <masonccyang@mxic.com.tw>,
        Chuanhong Guo <gch981213@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 15/18] mtd: nand: Introduce the ECC engine
 abstraction
Message-ID: <20200529014613.6e64f95f@xps13>
In-Reply-To: <20200528205251.5e8abdd1@collabora.com>
References: <20200528113113.9166-1-miquel.raynal@bootlin.com>
        <20200528113113.9166-16-miquel.raynal@bootlin.com>
        <20200528205251.5e8abdd1@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 28 May
2020 20:52:51 +0200:

> On Thu, 28 May 2020 13:31:10 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Create a generic ECC engine object.
> > 
> > Later the ecc.c file will receive more generic code coming from
> > the raw NAND specific part. This is a base to instantiate ECC engine
> > objects.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/Kconfig  |   7 ++
> >  drivers/mtd/nand/Makefile |   2 +
> >  drivers/mtd/nand/ecc.c    | 138 ++++++++++++++++++++++++++++++++++++++
> >  include/linux/mtd/nand.h  |  67 ++++++++++++++++++
> >  4 files changed, 214 insertions(+)
> >  create mode 100644 drivers/mtd/nand/ecc.c
> > 
> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> > index c1a45b071165..a4478ffa279d 100644
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -9,4 +9,11 @@ source "drivers/mtd/nand/onenand/Kconfig"
> >  source "drivers/mtd/nand/raw/Kconfig"
> >  source "drivers/mtd/nand/spi/Kconfig"
> >  
> > +menu "ECC engine support"
> > +
> > +config MTD_NAND_ECC
> > +	bool
> > +
> > +endmenu
> > +
> >  endmenu
> > diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> > index 7ecd80c0a66e..981372953b56 100644
> > --- a/drivers/mtd/nand/Makefile
> > +++ b/drivers/mtd/nand/Makefile
> > @@ -6,3 +6,5 @@ obj-$(CONFIG_MTD_NAND_CORE) += nandcore.o
> >  obj-y	+= onenand/
> >  obj-y	+= raw/
> >  obj-y	+= spi/
> > +
> > +nandcore-$(CONFIG_MTD_NAND_ECC) += ecc.o
> > diff --git a/drivers/mtd/nand/ecc.c b/drivers/mtd/nand/ecc.c
> > new file mode 100644
> > index 000000000000..e4f2b6fcbb12
> > --- /dev/null
> > +++ b/drivers/mtd/nand/ecc.c
> > @@ -0,0 +1,138 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Generic Error-Correcting Code (ECC) engine
> > + *
> > + * Copyright (C) 2019 Macronix
> > + * Author:
> > + *     Miquèl RAYNAL <miquel.raynal@bootlin.com>
> > + *
> > + *
> > + * This file describes the abstraction of any NAND ECC engine. It has been
> > + * designed to fit most cases, including parallel NANDs and SPI-NANDs.
> > + *
> > + * There are three main situations where instantiating this ECC engine makes
> > + * sense:
> > + *   - "external": The ECC engine is outside the NAND pipeline, typically this  
> 
> I'm not sure why you put quotes around those names.
> 
> > + *                 is a software ECC engine. One can also imagine a generic  
> 
> 				  		^ or an hardware
> 	engine that's outside the NAND controller pipeline.
> 
> You can the drop the "One can also imagine ..." since it's more than a
> theoretical use case, we already have a few engines that fall in this
> category.
> 
> > + *                 hardware ECC engine which would be an IP itself. Interacting
> > + *                 with a SPI-NAND device without on-die ECC could be achieved  
> 
> 								 ^can
> 
> > + *                 thanks to the use of such external engine.  
> 
> But I think I would simply drop this last sentence.
> 
> > + *   - "pipelined": The ECC engine is inside the NAND pipeline, ie. on the
> > + *                  controller's side. This is the case of most of the raw NAND
> > + *                  controllers. These controllers usually embed an hardware ECC
> > + *                  engine which is managed thanks to the same register set as
> > + *                  the controller's.  
> 
> Again, I would drop the last sentence here. I think saying the ECC
> bytes are generated/data corrected on the fly when a page is
> written/read would be more useful.
> 
> > + *   - "ondie": The ECC engine is inside the NAND pipeline, on the chip's side.
> > + *              Some NAND chips can correct themselves the data. The on-die
> > + *              correction can be enabled, disabled and the status of the
> > + *              correction after a read may be retrieved with a NAND command
> > + *              (may be vendor specific).  
> 
> "The on-die correction can be enabled, disabled" -> this is true for
> any kind of ECC engine :P.
> 
> > + *
> > + * Besides the initial setup and final cleanups, the interfaces are rather
> > + * simple:
> > + *   - "prepare": Prepare an I/O request, check the ECC engine is enabled or  
> 
> 						   ^if/whether
> 
> > + *                disabled as requested before the I/O. In case of software  
> 
> How about "Enable/disable the ECC engine based on the I/O request type."
> 
> > + *                correction, this step may involve to derive the ECC bytes and
> > + *                place them in the OOB area before a write.  
> 
> This is also true for external hardware ECC engines.
> 
> > + *   - "finish": Finish an I/O request, check the status of the operation ie.
> > + *               the data validity in case of a read (report to the upper layer
> > + *               any bitflip/errors).  
> 
> It's all about correcting/reporting errors, right. Let's try to put
> that into simple words: "Correct the data in case of a read request and
> report the number of corrected bits/uncorrectable errors. Most likely
> empty for write operations, unless you have hardware specific stuff to
> do, like shutting down the engine to save some power"
> 
> > + *
> > + * Both prepare/finish callbacks are supposed to enclose I/O request and will  
> 
> "The I/O request should be enclosed in a prepare()/finish() pair of
> calls" or "The prepare/finish call should surround the I/O request".
> 
> > + * behave differently depending on the desired correction:  
> 
> 					   ^requested I/O type
> 
> > + *   - "raw": Correction disabled
> > + *   - "ecc": Correction enabled
> > + *
> > + * The request direction is impacting the logic as well:
> > + *   - "read": Load data from the NAND chip
> > + *   - "write": Store data in the NAND chip
> > + *
> > + * Mixing all this combinations together gives the following behavior.  
> 
> Mention that those are just examples, and drivers are free to add
> custom steps in their prepare/finish hooks.
> 
> > + *
> > + * ["external" ECC engine]
> > + *   - external + prepare + raw + read: do nothing
> > + *   - external + finish  + raw + read: do nothing
> > + *   - external + prepare + raw + write: do nothing
> > + *   - external + finish  + raw + write: do nothing
> > + *   - external + prepare + ecc + read: do nothing
> > + *   - external + finish  + ecc + read: calculate expected ECC bytes, extract
> > + *                                      ECC bytes from OOB buffer, correct
> > + *                                      and report any bitflip/error
> > + *   - external + prepare + ecc + write: calculate ECC bytes and store them at
> > + *                                       the right place in the OOB buffer based
> > + *                                       on the OOB layout
> > + *   - external + finish  + ecc + write: do nothing
> > + *
> > + * ["pipelined" ECC engine]
> > + *   - pipelined + prepare + raw + read: disable the controller's ECC engine if
> > + *                                       activated
> > + *   - pipelined + finish  + raw + read: do nothing
> > + *   - pipelined + prepare + raw + write: disable the controller's ECC engine if
> > + *                                        activated
> > + *   - pipelined + finish  + raw + write: do nothing
> > + *   - pipelined + prepare + ecc + read: enable the controller's ECC engine if
> > + *                                       deactivated
> > + *   - pipelined + finish  + ecc + read: check the status, report any
> > + *                                       error/bitflip
> > + *   - pipelined + prepare + ecc + write: enable the controller's ECC engine if
> > + *                                        deactivated
> > + *   - pipelined + finish  + ecc + write: do nothing
> > + *
> > + * ["ondie" ECC engine]
> > + *   - ondie + prepare + raw + read: send commands to disable the on-chip ECC
> > + *                                   engine if activated
> > + *   - ondie + finish  + raw + read: do nothing
> > + *   - ondie + prepare + raw + write: send commands to disable the on-chip ECC
> > + *                                    engine if activated
> > + *   - ondie + finish  + raw + write: do nothing
> > + *   - ondie + prepare + ecc + read: send commands to enable the on-chip ECC
> > + *                                   engine if deactivated
> > + *   - ondie + finish  + ecc + read: send commands to check the status, report
> > + *                                   any error/bitflip
> > + *   - ondie + prepare + ecc + write: send commands to enable the on-chip ECC
> > + *                                    engine if deactivated
> > + *   - ondie + finish  + ecc + write: do nothing
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/mtd/nand.h>
> > +  
> 
> Shouldn't we have kernel-docs for those functions?
> 
> > +int nand_ecc_init_ctx(struct nand_device *nand)
> > +{
> > +	if (!nand->ecc.engine->ops->init_ctx)
> > +		return 0;
> > +
> > +	return nand->ecc.engine->ops->init_ctx(nand);
> > +}
> > +EXPORT_SYMBOL(nand_ecc_init_ctx);
> > +
> > +void nand_ecc_cleanup_ctx(struct nand_device *nand)
> > +{
> > +	if (nand->ecc.engine->ops->cleanup_ctx)
> > +		nand->ecc.engine->ops->cleanup_ctx(nand);
> > +}
> > +EXPORT_SYMBOL(nand_ecc_cleanup_ctx);
> > +
> > +int nand_ecc_prepare_io_req(struct nand_device *nand,
> > +			    struct nand_page_io_req *req)
> > +{
> > +	if (!nand->ecc.engine->ops->prepare_io_req)
> > +		return 0;
> > +
> > +	return nand->ecc.engine->ops->prepare_io_req(nand, req);
> > +}
> > +EXPORT_SYMBOL(nand_ecc_prepare_io_req);
> > +
> > +int nand_ecc_finish_io_req(struct nand_device *nand,
> > +			   struct nand_page_io_req *req)
> > +{
> > +	if (!nand->ecc.engine->ops->finish_io_req)
> > +		return 0;
> > +
> > +	return nand->ecc.engine->ops->finish_io_req(nand, req);
> > +}
> > +EXPORT_SYMBOL(nand_ecc_finish_io_req);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
> > +MODULE_DESCRIPTION("Generic ECC engine");
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 2e9af24936cd..0be260fd2f86 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -221,6 +221,73 @@ struct nand_ops {
> >  	bool (*isbad)(struct nand_device *nand, const struct nand_pos *pos);
> >  };
> >  
> > +/**
> > + * struct nand_ecc_context - Context for the ECC engine
> > + * @conf: basic ECC engine parameters
> > + * @total: Total number of bytes used for storing ECC codes, this is used by  
> 
> Sometimes you start your description with an uppercase, sometimes not.
> 
> > + *         generic OOB layouts
> > + * @priv: ECC engine driver private data
> > + */
> > +struct nand_ecc_context {
> > +	struct nand_ecc_props conf;
> > +	unsigned int total;
> > +	void *priv;
> > +};
> > +
> > +/**
> > + * struct nand_ecc_engine_ops - Generic ECC engine operations  
> 
> 				    ^s/Generic//
> 
> > + * @init_ctx: given a desired user configuration for the pointed NAND device,
> > + *            requests the ECC engine driver to setup a configuration with
> > + *            values it supports.
> > + * @cleanup_ctx: clean the context initialized by @init_ctx.
> > + * @prepare_io_req: is called before reading/writing a page to prepare the I/O
> > + *                  request to be performed with ECC correction.
> > + * @finish_io_req: is called after reading/writing a page to terminate the I/O
> > + *                 request and ensure proper ECC correction.
> > + */
> > +struct nand_ecc_engine_ops {
> > +	int (*init_ctx)(struct nand_device *nand);
> > +	void (*cleanup_ctx)(struct nand_device *nand);
> > +	int (*prepare_io_req)(struct nand_device *nand,
> > +			      struct nand_page_io_req *req);
> > +	int (*finish_io_req)(struct nand_device *nand,
> > +			     struct nand_page_io_req *req);
> > +};
> > +
> > +/**
> > + * struct nand_ecc_engine - Generic ECC engine abstraction for NAND devices  
> 
> 				^s/Generic//
> 
> > + * @ops: ECC engine operations
> > + */
> > +struct nand_ecc_engine {
> > +	struct nand_ecc_engine_ops *ops;
> > +};
> > +
> > +int nand_ecc_init_ctx(struct nand_device *nand);
> > +void nand_ecc_cleanup_ctx(struct nand_device *nand);
> > +int nand_ecc_prepare_io_req(struct nand_device *nand,
> > +			    struct nand_page_io_req *req);
> > +int nand_ecc_finish_io_req(struct nand_device *nand,
> > +			   struct nand_page_io_req *req);
> > +
> > +/**
> > + * struct nand_ecc - High-level ECC object  
> 
> I think you can drop the "High-level" and just say "Information
> relative to the ECC"
> 
> > + * @defaults: Default values, depend on the underlying subsystem
> > + * @requirements: ECC requirements from the NAND chip perspective
> > + * @user_conf: User desires in terms of ECC parameters
> > + * @ctx: ECC context for the ECC engine, derived from the device @requirements
> > + *       the @user_conf and the @defaults
> > + * @ondie_engine: On-die ECC engine reference, if any
> > + * @engine: ECC engine actually bound
> > + */
> > +struct nand_ecc {
> > +	struct nand_ecc_props defaults;
> > +	struct nand_ecc_props requirements;
> > +	struct nand_ecc_props user_conf;
> > +	struct nand_ecc_context ctx;
> > +	struct nand_ecc_engine *ondie_engine;
> > +	struct nand_ecc_engine *engine;
> > +};
> > +
> >  /**
> >   * struct nand_device - NAND device
> >   * @mtd: MTD instance attached to the NAND device  
> 


All comments applied.

Thanks,
Miquèl
