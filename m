Return-Path: <SRS0=vHNE=6K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370CBC55199
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 10:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B1F12071C
	for <linux-devicetree@archiver.kernel.org>; Sun, 26 Apr 2020 10:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbgDZKDN (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 26 Apr 2020 06:03:13 -0400
Received: from lucky1.263xmail.com ([211.157.147.132]:38848 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgDZKDM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 26 Apr 2020 06:03:12 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id 49A11CA2A2;
        Sun, 26 Apr 2020 18:03:05 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from ubuntu18.lan (unknown [58.22.7.114])
        by smtp.263.net (postfix) whith ESMTP id P19267T139854424778496S1587895377527434_;
        Sun, 26 Apr 2020 18:03:06 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <76275af8ddd67ec61dabce6f96107900>
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
Subject: [PATCH v5 0/7] Add Rockchip NFC drivers for RK3308 and others
Date:   Sun, 26 Apr 2020 18:02:43 +0800
Message-Id: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Rockchp's NFC(Nand Flash Controller) has three versions: V6, V8 and V9.
This series patch can support all three versions.


Changes in v5:
- Fix some wrong define
- Add boot-medium define
- Remove some compatible define
- Add boot blocks support  with different ecc for bootrom
- Rename rockchip-nand.c to rockchip-nand-controller.c
- Unification of other variable names
- Remove some compatible define

Changes in v4:
- The compatible define with rkxx_nfc
- Add assigned-clocks
- Fix some wrong define
- Define platform data structure for the register offsets.
- The compatible define with rkxx_nfc.
- Use SET_SYSTEM_SLEEP_PM_OPS to define PM_OPS.
- Use exec_op instead of legacy hooks.

Changes in v3:
- Change the title for the dt-bindings

Changes in v2:
- Fix compile error.
- Include header files sorted by file name

Yifeng Zhao (7):
  dt-bindings: mtd: Describe Rockchip RK3xxx NAND flash controller
  mtd: rawnand: rockchip: NFC drivers for RK3308, RK3188 and others
  MAINTAINERS: add maintainers to rockchip nfc
  arm64: dts: rockchip: Add nfc dts for RK3308 SOC
  arm64: dts: rockchip: Add nfc dts for PX30 SOC
  xarm: dts: rockchip: Add nfc dts for RV1108 SOC
  arm: dts: rockchip: Add nfc dts for RK3066 and RK3188 SOC

 .../mtd/rockchip,nand-controller.yaml         |  124 ++
 MAINTAINERS                                   |    4 +-
 arch/arm/boot/dts/rk3xxx.dtsi                 |    9 +
 arch/arm/boot/dts/rv1108.dtsi                 |   11 +
 arch/arm64/boot/dts/rockchip/px30.dtsi        |   15 +
 arch/arm64/boot/dts/rockchip/rk3308.dtsi      |   14 +
 drivers/mtd/nand/raw/Kconfig                  |    7 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 .../mtd/nand/raw/rockchip-nand-controller.c   | 1344 +++++++++++++++++
 9 files changed, 1527 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
 create mode 100644 drivers/mtd/nand/raw/rockchip-nand-controller.c

-- 
2.17.1



