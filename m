From: Yu Chen <chenyu56@huawei.com>
Subject: [PATCH 03/10] dt-bindings: misc: Add bindings for HiSilicon usb hub and data role switch functionality on HiKey960
Date: Sat, 27 Oct 2018 17:58:13 +0800
Message-ID: <20181027095820.40056-4-chenyu56@huawei.com>
References: <20181027095820.40056-1-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181027095820.40056-1-chenyu56@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: suzhuangluan@hisilicon.com, kongfei@hisilicon.com, Yu Chen <chenyu56@huawei.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, John Stultz <john.stultz@linaro.org>, Binghui Wang <wangbinghui@hisilicon.com>
List-Id: devicetree@vger.kernel.org

This patch adds binding documentation to support usb hub and usb
data role switch of Hisilicon HiKey&HiKey960 Board.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Signed-off-by: Yu Chen <chenyu56@huawei.com>
---
 .../bindings/misc/hisilicon-hikey-usb.txt          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt

diff --git a/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
new file mode 100644
index 000000000000..f94e990362c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.txt
@@ -0,0 +1,24 @@
+Support usb hub and usb data role switch of Hisilicon HiKey&HiKey960 Board.
+
+-----------------------------
+
+Required properties:
+- compatible: "hisilicon,gpio_hubv1","hisilicon,hikey960_usb"
+- typc_vbus_int_gpio,typec-gpios: gpio to control the vbus of typeC port
+- typc_vbus_enable_val: gpio value that enable the vbus of typeC port
+- otg_gpio: gpio to switch DP&DM between the hub and typeC port
+- hub_vdd33_en_gpio: gpio to enable the power of hub
+- pinctrl-0: pinctrl config
+
+Example
+-----
+
+	hisi_hikey_usb: hisi_hikey_usb {
+		compatible = "hisilicon,hikey960_usb";
+		typc_vbus_int_gpio,typec-gpios = <&gpio25 2 0>;
+		typc_vbus_enable_val = <1>;
+		otg_gpio = <&gpio25 6 0>;
+		hub_vdd33_en_gpio = <&gpio5 6 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usbhub5734_pmx_func>;
+	};
-- 
2.15.0-rc2
