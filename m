Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 429EAC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C582208CA
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgEGLBZ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:01:25 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60937 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgEGLBZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:01:25 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 970A22000E;
        Thu,  7 May 2020 11:01:21 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Michal Simek <monstr@monstr.eu>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 5/8] MAINTAINERS: Add Arasan NAND controller and bindings
Date:   Thu,  7 May 2020 13:00:31 +0200
Message-Id: <20200507110034.14736-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507110034.14736-1-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b816a453b10e..1f2c83ead00b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1285,6 +1285,13 @@ S:	Supported
 W:	http://www.aquantia.com
 F:	drivers/net/ethernet/aquantia/atlantic/aq_ptp*
 
+ARASAN NAND CONTROLLER DRIVER
+M:	Naga Sureshkumar Relli <nagasure@xilinx.com>
+L:	linux-mtd@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
+F:	drivers/mtd/nand/raw/arasan-nand-controller.c
+
 ARC FRAMEBUFFER DRIVER
 M:	Jaya Kumar <jayalk@intworks.biz>
 S:	Maintained
-- 
2.20.1

