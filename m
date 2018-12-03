From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH v1 03/12] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date: Mon, 3 Dec 2018 11:45:06 +0800
Message-ID: <20181203034515.91412-4-chenyu56@huawei.com>
References: <20181203034515.91412-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203034515.91412-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey&HiKey960 Board.

Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
--
v1:
1) Fix some format errors as suggested by Sergei.
2) Modify gpio description to use gpiod API.
--
---
 .../bindings/misc/hisilicon-hikey-usb.txt          | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
new file mode 100644
index 000000000000..f3413d851e18
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
@@ -0,0 +1,36 @@
+Support usb hub and usb data role switch of Hisilicon HiKey&HiKey960 Board.
+
+-----------------------------
+
+Required properties:
+- compatible: "hisilicon,gpio-hubv1","hisilicon,hikey960-usb"
+- typc-vbus-int-gpio: gpio to control the vbus of typeC port
+- typc-vbus-enable-val: gpio value that enable the vbus of typeC port
+- otg-gpio: gpio to switch DP&DM between the hub and typeC port
+- hub-vdd33-en-gpio: gpio to enable the power of hub
+- pinctrl-0: pinctrl config
+
+Example
+-----
+
+	hisi_hikey_usb: hisi_hikey_usb {
+		compatible = "hisilicon,hikey960-usb";
+		typec-vbus-gpios = <&gpio25 2 0>;
+		typc-vbus-enable-val = <1>;
+		otg-switch-gpios = <&gpio25 6 0>;
+		hub-vdd33-en-gpios = <&gpio5 6 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbhub5734_pmx_func>;
+
+		port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hikey_usb_ep: endpoint@0 {
+				reg = <0>;
+				device_type = "usb-role-switch";
+				remote-endpoint = <&dwc3_role_switch_notify>;
+			};
+		};
+
+	};
-- 
2.15.0-rc2
