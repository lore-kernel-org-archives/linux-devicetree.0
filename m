From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 4/5] ARM: DTS: da850: Add cfgchip syscon node
Date: Thu, 14 Apr 2016 14:44:17 -0500
Message-ID: <1460663058-9462-5-git-send-email-david@lechnology.com>
References: <1460663058-9462-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460663058-9462-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nsekhar@ti.com
Cc: petr@barix.com, sergei.shtylyov@cogentembedded.com, khilman@kernel.org, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, Bin Liu <b-liu@ti.com>, Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a syscon node for the SoC CFGCHIPn registers. This is needed for
the new usb phy driver.

Signed-off-by: David Lechner <david@lechnology.com>
---

v4 changes: none

 arch/arm/boot/dts/da850.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
index b254ba6..e56c554 100644
--- a/arch/arm/boot/dts/da850.dtsi
+++ b/arch/arm/boot/dts/da850.dtsi
@@ -156,6 +156,10 @@
 			};
 
 		};
+		cfgchip: cfgchip@1417c {
+			compatible = "ti,da830-cfgchip", "syscon";
+			reg = <0x1417c 0x14>;
+		};
 		edma0: edma@0 {
 			compatible = "ti,edma3-tpcc";
 			/* eDMA3 CC0: 0x01c0 0000 - 0x01c0 7fff */
-- 
1.9.1
