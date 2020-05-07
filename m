Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA8CC38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFB3A2083B
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbgEGLAt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:00:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37417 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgEGLAt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 7 May 2020 07:00:49 -0400
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 935CF20004;
        Thu,  7 May 2020 11:00:35 +0000 (UTC)
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
Subject: [PATCH v3 0/8] New Arasan NAND controller driver
Date:   Thu,  7 May 2020 13:00:26 +0200
Message-Id: <20200507110034.14736-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

New Arasan NAND controller driver

Hello,

This is a deep rework of Naga's Arasan NAND controller driver. This
version is the final version and works with software ECC. It relies on
a previous series called "Supporting restricted NAND controllers" that
brings more flexibility to the NAND with the goal to support
restricted controllers like this one.

Cheers,
Miquèl

Changes in v3:
* Prefix specific clock definitions with XLNX as they do not apply for
  any other SoC and are attached to a single compatible.
* Used field getters/setters as defined in bitfield.h.
* Force casting to u32 before shifting u8 values by 8 16 or 24 bits.
* Comply with the recent core changes and select manually
  nand_monolithic_read/write_page_raw() helpers.
* Add MAINTAINER patch.
* Add a bit extraction helper in the core.
* Rename BCH functions.
* Add a swapping bit mechanism to BCH.
* Support the hardware ECC engine.

Changes in v2:
* Working ->exec_op() implementation relying on core changes.
* Dropped the ECC support for now, will be part of another series if
  this patch is accepted.

Boris Brezillon (1):
  lib/bch: Allow easy bit swapping

Miquel Raynal (7):
  lib/bch: Rework a little bit the exported function names
  mtd: rawnand: Ensure the number of bitflips is consistent
  mtd: rawnand: Add nand_extract_bits()
  MAINTAINERS: Add Arasan NAND controller and bindings
  dt-bindings: mtd: Document ARASAN NAND bindings
  mtd: rawnand: arasan: Add new Arasan NAND controller
  mtd: rawnand: arasan: Support the hardware BCH ECC engine

 .../bindings/mtd/arasan,nand-controller.yaml  |   63 +
 MAINTAINERS                                   |    7 +
 drivers/mtd/devices/docg3.c                   |   10 +-
 drivers/mtd/nand/raw/Kconfig                  |    7 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/arasan-nand-controller.c | 1207 +++++++++++++++++
 drivers/mtd/nand/raw/nand_base.c              |   41 +-
 drivers/mtd/nand/raw/nand_bch.c               |   10 +-
 include/linux/bch.h                           |    9 +-
 include/linux/mtd/rawnand.h                   |    4 +
 lib/bch.c                                     |  148 +-
 11 files changed, 1443 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/arasan-nand-controller.c

-- 
2.20.1

