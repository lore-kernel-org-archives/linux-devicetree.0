From: Stuart Yoder <stuart.yoder@nxp.com>
Subject: [PATCH 0/2 v3] fsl-mc binding and device tree updates
Date: Tue, 19 Apr 2016 16:43:27 -0500
Message-ID: <1461102207-13263-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: leoyang.li@nxp.com, robh+dt@kernel.org, german.rivera@freescale.com, linux-kernel@vger.kernel.org, shawnguo@kernel.org, Stuart Yoder <stuart.yoder@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch series adds a few missing things from the binding
for the fsl-mc node on the ls2080a Soc-- msi-parent, ranges,
dpmac definition.  The ls2080a device tree is updated to
reflect the binding updates.

-v3
   -updated dpmac unit addresses to be in hex, to match the
    reg property
-v2
   -added ack to binding patch
   -updated whitespace and comment in dts patch

Stuart Yoder (2):
  Documentation: fsl-mc: binding updates for MSIs, ranges, PHYs
  arm64: dts: ls2080a: fsl-mc dt node updates

 .../devicetree/bindings/misc/fsl,qoriq-mc.txt      | 81 +++++++++++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     | 98 ++++++++++++++++++++++
 2 files changed, 178 insertions(+), 1 deletion(-)

-- 
1.9.0
