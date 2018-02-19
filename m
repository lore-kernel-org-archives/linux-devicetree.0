Return-Path: <SRS0=WWNl=FN=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:49680 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932116AbeBSWUu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Feb 2018 17:20:50 -0500
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 0/2] Update 64-bit DT with new NAND controller bindings
Date: Mon, 19 Feb 2018 23:20:43 +0100
Message-Id: <20180219222045.1927-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Gregory Clement <gregory.clement@bootlin.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Hello,

These two patches have already been submitted and accepted by Gregory
and were stacked for 4.17. But since then a small modification happened
due to a request from Rob Herring. Also, armada-cp110-[master/slave].dtsi
files became armada-cp110.dtsi due to the DT de-duplication work from
Thomas Petazzoni. This small series should replace the two patches
laying in the mvebu tree and should apply cleanly.

Thank you,
Miquèl

Changes since v1:
  - Renamed a NAND property: s/marvell,rb/nand-rb/ which is already
    documented.
  - Rebased on v4.16-rc1.

Miquel Raynal (2):
  arm64: dts: marvell: use reworked NAND controller driver on Armada 7K
  arm64: dts: marvell: use reworked NAND controller driver on Armada 8K

 arch/arm64/boot/dts/marvell/armada-7040-db.dts | 50 ++++++++++++++++----------
 arch/arm64/boot/dts/marvell/armada-8040-db.dts | 44 +++++++++++++----------
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi  |  8 ++---
 3 files changed, 61 insertions(+), 41 deletions(-)

-- 
2.14.1

