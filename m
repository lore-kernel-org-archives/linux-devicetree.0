From: John Garry <john.garry@huawei.com>
Subject: [PATCH 3/3] arm64: dts: hisi: Enable Hisi LPC node for hip07
Date: Mon, 30 Apr 2018 23:15:42 +0800
Message-ID: <1525101342-27120-4-git-send-email-john.garry@huawei.com>
References: <1525101342-27120-1-git-send-email-john.garry@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525101342-27120-1-git-send-email-john.garry@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com
Cc: linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, John Garry <john.garry@huawei.com>
List-Id: devicetree@vger.kernel.org

The patch enables the HiSi LPC node for hip07, with
the IPMI child device.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 arch/arm64/boot/dts/hisilicon/hip07-d05.dts |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi    | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
index fe7c16c..21147e8 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip07-d05.dts
@@ -57,6 +57,10 @@
 	status = "ok";
 };
 
+&ipmi0 {
+	status = "ok";
+};
+
 &usb_ohci {
 	status = "ok";
 };
diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index 0600a6a..9c10030a 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1114,6 +1114,20 @@
 		#size-cells = <2>;
 		ranges;
 
+		isa@a01b0000 {
+			compatible = "hisilicon,hip07-lpc";
+			#size-cells = <1>;
+			#address-cells = <2>;
+			reg = <0x0 0xa01b0000 0x0 0x1000>;
+
+			ipmi0: bt@e4 {
+				compatible = "ipmi-bt";
+				device_type = "ipmi";
+				reg = <0x01 0xe4 0x04>;
+				status = "disabled";
+			};
+		};
+
 		uart0: uart@602b0000 {
 			compatible = "arm,sbsa-uart";
 			reg = <0x0 0x602b0000 0x0 0x1000>;
-- 
1.9.1
