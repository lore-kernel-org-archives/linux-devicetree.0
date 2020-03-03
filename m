Return-Path: <SRS0=BDx3=4U=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AA5C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:47:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F319F214DB
	for <linux-devicetree@archiver.kernel.org>; Tue,  3 Mar 2020 09:47:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgCCJru (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 3 Mar 2020 04:47:50 -0500
Received: from lucky1.263xmail.com ([211.157.147.132]:51558 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727585AbgCCJru (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 3 Mar 2020 04:47:50 -0500
Received: from localhost (unknown [192.168.167.13])
        by lucky1.263xmail.com (Postfix) with ESMTP id 2B861A5F1B;
        Tue,  3 Mar 2020 17:47:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P3521T140169581676288S1583228860405504_;
        Tue, 03 Mar 2020 17:47:45 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7a8659cb98305b599d87f49f5915a23d>
X-RL-SENDER: yifeng.zhao@rock-chips.com
X-SENDER: zyf@rock-chips.com
X-LOGIN-NAME: yifeng.zhao@rock-chips.com
X-FST-TO: miquel.raynal@bootlin.com
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
From:   Yifeng Zhao <yifeng.zhao@rock-chips.com>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        heiko@sntech.de, linux-rockchip@lists.infradead.org,
        Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: [PATCH v3 0/3] Add Rockchip NFC drivers for RK3308 and others
Date:   Tue,  3 Mar 2020 17:47:33 +0800
Message-Id: <20200303094736.7490-1-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Rockchp's NFC(Nand Flash Controller) has three versions: V6, V8 and V9.
This series patch can support all  three versions.


Changes in v3:
-change the title for the dt-bindings

Changes in v2:
- Fix compile error.
- Include header files sorted by file name

Yifeng Zhao (3):
  mtd: rawnand: rockchip: NFC drivers for RK3308, RK3188 and others
  dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller
  MAINTAINERS: add maintainers to rockchip nfc

 .../bindings/mtd/rockchip,nand.yaml           |   95 ++
 MAINTAINERS                                   |    2 +
 drivers/mtd/nand/raw/Kconfig                  |    7 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/rockchip_nand.c          | 1229 +++++++++++++++++
 5 files changed, 1334 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand.yaml
 create mode 100644 drivers/mtd/nand/raw/rockchip_nand.c

-- 
2.17.1



