Return-Path: <SRS0=dlvX=AH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B53C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:14:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0185F20768
	for <linux-devicetree@archiver.kernel.org>; Fri, 26 Jun 2020 07:14:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725801AbgFZHOI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 26 Jun 2020 03:14:08 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:50223 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgFZHOI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 26 Jun 2020 03:14:08 -0400
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 55195100006;
        Fri, 26 Jun 2020 07:13:59 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <devicetree@vger.kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        <linux-mtd@lists.infradead.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        masonccyang@mxic.com.tw, juliensu@mxic.com.tw,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v11 0/2] NAND ECC engine binding changes
Date:   Fri, 26 Jun 2020 09:13:55 +0200
Message-Id: <20200626071357.21421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

As part of a bigger series, I proposed these changes to facilitate the
insertion of a generic ECC engine abstraction, needed specifically for
new SPI-NAND devices not featuring any on-die engine.

The series is almost ready to be merged but the bindings did not pass
the checks. Now it is solved so I am just waiting for Rob's ack on
these two patches to apply the whole series.

Miquel Raynal (2):
  dt-bindings: mtd: Document nand-ecc-engine
  dt-bindings: mtd: Document boolean NAND ECC properties

 .../bindings/mtd/nand-controller.yaml          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.20.1

