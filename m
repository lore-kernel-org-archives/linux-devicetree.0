From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 3/3] ARM: dts: imx6qp: Specify imx6qp version of PCIe core
Date: Sun, 17 Apr 2016 22:51:17 -0700
Message-ID: <1460958677-10604-3-git-send-email-andrew.smirnov@gmail.com>
References: <1460958677-10604-1-git-send-email-andrew.smirnov@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460958677-10604-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>, Richard Zhu <Richard.Zhu@freescale.com>, gary.bisson@boundarydevices.com
List-Id: devicetree@vger.kernel.org

I.MX6Quad Plus has a slightly different version of PCIe core than
reqular i.MX6Quad.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Changes since v1:

	- Patchset is rebased against
          https://git.kernel.org/cgit/linux/kernel/git/helgaas/pci.git/log/?h=pci/host-imx6

	- DTS files changes moved into a separate patch

 arch/arm/boot/dts/imx6qp.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qp.dtsi b/arch/arm/boot/dts/imx6qp.dtsi
index 1ada714..886dbf2 100644
--- a/arch/arm/boot/dts/imx6qp.dtsi
+++ b/arch/arm/boot/dts/imx6qp.dtsi
@@ -82,5 +82,8 @@
 				      "ldb_di0", "ldb_di1", "prg";
 		};
 
+		pcie: pcie@0x01000000 {
+			compatible = "fsl,imx6qp-pcie", "snps,dw-pcie";
+		};
 	};
 };
-- 
2.5.5
