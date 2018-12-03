From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v1 02/12] dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
Date: Mon, 3 Dec 2018 11:45:05 +0800
Message-ID: <20181203034515.91412-3-chenyu56@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding documentation for supporting the hi3660 usb
phy on boards like the HiKey960.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
--
v1: Fix some format error as suggested by Rob.
--
---
 .../devicetree/bindings/phy/phy-hi3660-usb3.txt     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
new file mode 100644
index 000000000000..8ea52d51aa13
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
@@ -0,0 +1,21 @@
+Hisilicon hi3660 usb PHY
+-----------------------
+
+Required properties:
+- compatible: should be "hisilicon,hi3660-usb-phy"
+- #phy-cells: must be 0
+- hisilicon,pericrg-syscon: phandle of syscon used to control phy.
+- hisilicon,pctrl-syscon: phandle of syscon used to control phy.
+- hisilicon,usb3-otg-bc-syscon: phandle of syscon used to control phy.
+- hisilicon,eye-diagram-param: parameter set for phy
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+Example:
+	usb-phy {
+		compatible = "hisilicon,hi3660-usb-phy";
+		#phy-cells = <0>;
+		hisilicon,pericrg-syscon = <&crg_ctrl>;
+		hisilicon,pctrl-syscon = <&pctrl>;
+		hisilicon,usb3-otg-bc-syscon = <&usb3_otg_bc>;
+		hisilicon,eye-diagram-param = <0x22466e4>;
+	};
-- 
2.15.0-rc2
