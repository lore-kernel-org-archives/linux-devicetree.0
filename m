From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: [PATCH 0/3] Add dis_rxdet_inp3_quirk property to USB3 node
Date: Fri, 10 Jun 2016 11:53:43 +0530
Message-ID: <1465539826-5519-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sriram.dash@nxp.com, Rajesh Bhagat <rajesh.bhagat@nxp.com>
List-Id: devicetree@vger.kernel.org

Adds dis_rxdet_inp3_quirk property to USB3 nodes of ls1021a, ls2080a
and ls1043a platform.

Rajesh Bhagat (3):
  arm: dts: ls1021a: Add dis_rxdet_inp3_quirk property to USB3 node
  arm: dts: ls2080a: Add dis_rxdet_inp3_quirk property to USB3 node
  arm: dts: ls1043a: Add dis_rxdet_inp3_quirk property to USB3 node

 arch/arm/boot/dts/ls1021a.dtsi                 | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 3 +++
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 2 ++
 3 files changed, 6 insertions(+)

-- 
2.6.2.198.g614a2ac
