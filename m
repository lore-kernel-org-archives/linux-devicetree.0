From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v4 01/12] dt-bindings: phy: Add support for HiSilicon's hi3660 USB PHY
Date: Sat, 16 Mar 2019 11:53:31 +0800
Message-ID: <20190316035342.77998-2-chenyu56@huawei.com>
References: <20190316035342.77998-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190316035342.77998-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: john.stultz@linaro.org, suzhuangluan@hisilicon.com, kongfei@hisilicon.com, liuyu712@hisilicon.com, wanghu17@hisilicon.com, butao@hisilicon.com, chenyao11@huawei.com, fangshengzhou@hisilicon.com, lipengcheng8@huawei.com, songxiaowei@hisilicon.com, xuyiping@hisilicon.com, xuyoujun4@huawei.com, yudongbin@hisilicon.com, zangleigang@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding documentation for supporting the hi3660 usb
phy on boards like the HiKey960.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
v1:
* Fix some format error as suggested by Rob.
v2:
* Change hi3660 usb PHY to hi3660 USB PHY
v3:
* Make device node a subnode of usb3_otg_bc register.
v4:
* Remove "hisilicon,usb3-otg-bc-syscon" property
---
---
 .../devicetree/bindings/phy/phy-hi3660-usb3.txt    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
new file mode 100644
index 000000000000..e88ba7d92dcb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-hi3660-usb3.txt
@@ -0,0 +1,26 @@
+Hisilicon hi3660 USB PHY
+-----------------------
+
+Required properties:
+- compatible: should be "hisilicon,hi3660-usb-phy"
+- #phy-cells: must be 0
+- hisilicon,pericrg-syscon: phandle of syscon used to control phy.
+- hisilicon,pctrl-syscon: phandle of syscon used to control phy.
+- hisilicon,eye-diagram-param: parameter set for phy
+Refer to phy/phy-bindings.txt for the generic PHY binding properties
+
+This is a subnode of usb3_otg_bc register node.
+
+Example:
+	usb3_otg_bc: usb3_otg_bc@ff200000 {
+		compatible = "syscon", "simple-mfd";
+		reg = <0x0 0xff200000 0x0 0x1000>;
+
+		usb-phy {
+			compatible = "hisilicon,hi3660-usb-phy";
+			#phy-cells = <0>;
+			hisilicon,pericrg-syscon = <&crg_ctrl>;
+			hisilicon,pctrl-syscon = <&pctrl>;
+			hisilicon,eye-diagram-param = <0x22466e4>;
+		};
+	};
-- 
2.15.0-rc2
