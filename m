Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3617C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87ECE2075E
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 12:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726093AbgEGMLI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 08:11:08 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37722 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgEGMLH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 08:11:07 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EA2C82A29CE;
        Thu,  7 May 2020 13:11:05 +0100 (BST)
Date:   Thu, 7 May 2020 14:11:03 +0200
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>
Subject: Re: [PATCH v3 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200507141103.0c241877@collabora.com>
In-Reply-To: <20200507110034.14736-8-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  7 May 2020 13:00:33 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:


> +
> +static void anfc_chips_cleanup(struct arasan_nfc *nfc)
> +{
> +	struct anand *anand, *tmp;
> +
> +	list_for_each_entry_safe(anand, tmp, &nfc->chips, node) {
> +		nand_release(&anand->chip);

		ret = mtd_device_unregister(nand_to_mtd(&anand->chip));
		WARN_ON(ret);
		nand_cleanup(&anand->chip);

Or maybe add this WARN_ON() to nand_release() so we don't have to ask
people to use mtd_device_unregister() + nand_cleanup(). We really
should fix that at some point (allocate nand_chip and mtd_info
separately and leave a dummy mtd_info object with all hooks returning
ENODEV when the unregister fails).

> +		list_del(&anand->node);
> +	}
> +}
