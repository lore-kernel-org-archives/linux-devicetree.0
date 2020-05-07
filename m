Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C59EC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A12F20CC7
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbgEGLut (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:50:49 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37504 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgEGLup (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:50:45 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id AABF42A29AB;
        Thu,  7 May 2020 12:50:43 +0100 (BST)
Date:   Thu, 7 May 2020 13:50:41 +0200
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
Subject: Re: [PATCH v3 5/8] MAINTAINERS: Add Arasan NAND controller and
 bindings
Message-ID: <20200507135041.7438ad63@collabora.com>
In-Reply-To: <20200507110034.14736-6-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
        <20200507110034.14736-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu,  7 May 2020 13:00:31 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

Missing commit message here.

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b816a453b10e..1f2c83ead00b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1285,6 +1285,13 @@ S:	Supported
>  W:	http://www.aquantia.com
>  F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
>  
> +ARASAN NAND CONTROLLER DRIVER
> +M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
> +L:	linux-mtd@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
> +F:	drivers/mtd/nand/raw/arasan-nand-controller.c
> +
>  ARC FRAMEBUFFER DRIVER
>  M:	Jaya Kumar <jayalk@intworks.biz>
>  S:	Maintained

