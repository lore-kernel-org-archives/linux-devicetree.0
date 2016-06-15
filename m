From: Jiancheng Xue <xuejiancheng@hisilicon.com>
Subject: [PATCH v11 2/3] ARM: dt-bindings: add device tree bindings for Hi3519 sysctrl
Date: Wed, 15 Jun 2016 10:19:06 +0800
Message-ID: <1465957147-32314-3-git-send-email-xuejiancheng@hisilicon.com>
References: <1465957147-32314-1-git-send-email-xuejiancheng@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465957147-32314-1-git-send-email-xuejiancheng@hisilicon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: xuwei5@hisilicon.com, arnd@arndb.de
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, yanhaifeng@hisilicon.com, yanghongwei@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Jiancheng Xue <xuejiancheng@huawei.com>

Add device tree bindings for Hi3519 system controller.

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
new file mode 100644
index 0000000..115c5be
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hi3519-sysctrl.txt
@@ -0,0 +1,14 @@
+* Hisilicon Hi3519 System Controller Block
+
+This bindings use the following binding:
+Documentation/devicetree/bindings/mfd/syscon.txt
+
+Required properties:
+- compatible: "hisilicon,hi3519-sysctrl".
+- reg: the register region of this block
+
+Examples:
+sysctrl: system-controller@12010000 {
+	compatible = "hisilicon,hi3519-sysctrl", "syscon";
+	reg = <0x12010000 0x1000>;
+};
-- 
1.9.1
