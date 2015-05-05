From: Bintian Wang <bintian.wang@huawei.com>
Subject: [PATCH v4 2/5] arm64: hi6220: Document devicetree bindings for Hisilicon hi6220 SoC
Date: Tue, 5 May 2015 20:06:36 +0800
Message-ID: <1430827599-11560-3-git-send-email-bintian.wang@huawei.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org, khilman@kernel.org, pebolle@tiscali.nl, arnd@arndb.de, marc.zyngier@arm.com
Cc: xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, bintian.wang@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawei.com, kong.kongxinwei@hisilicon.com, btw@mail.itp.ac.cn, w.f@huawei.com, liguozhu@hisilicon.com
List-Id: devicetree@vger.kernel.org

This patch adds documentation for the devicetree bindings used by the
DT files of Hisilicon hi6220 SoC mobile platform.

Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
---
 .../bindings/arm/hisilicon/hisilicon.txt           | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index 35b1bd4..f67d0f3 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -1,5 +1,8 @@
 Hisilicon Platforms Device Tree Bindings
 ----------------------------------------------------
+Hi6220 SoC
+Required root node properties:
+	- compatible = "hisilicon,hi6220";
 
 Hi4511 Board
 Required root node properties:
@@ -13,6 +16,9 @@ HiP01 ca9x2 Board
 Required root node properties:
 	- compatible = "hisilicon,hip01-ca9x2";
 
+HiKey Board
+Required root node properties:
+	- compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
 
 Hisilicon system controller
 
@@ -41,6 +47,87 @@ Example:
 	};
 
 -----------------------------------------------------------------------
+Hisilicon Hi6220 system controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-sysctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this controller as one of the system controllers,
+its main functions are the same as Hisilicon system controller, but
+the register offset of some core modules are different.
+
+Example:
+	/*for Hi6220*/
+	sys_ctrl: sys_ctrl {
+		compatible = "hisilicon,hi6220-sysctrl", "syscon";
+		reg = <0x0 0xf7030000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Power Always ON domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-aoctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the power always
+on domain for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	ao_ctrl: ao_ctrl {
+		compatible = "hisilicon,hi6220-aoctrl", "syscon";
+		reg = <0x0 0xf7800000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Media domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-mediactrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, many clock registers are defined
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the multimedia
+domain(e.g. codec, G3D ...) for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	media_ctrl: media_ctrl {
+		compatible = "hisilicon,hi6220-mediactrl", "syscon";
+		reg = <0x0 0xf4410000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+
+Hisilicon Hi6220 Power Management domain controller
+
+Required properties:
+- compatible : "hisilicon,hi6220-pmctrl"
+- reg : Register address and size
+- #clock-cells: should be set to 1, some clock registers are define
+  under this controller and this property must be present.
+
+Hisilicon designs this system controller to control the power management
+domain for mobile platform.
+
+Example:
+	/*for Hi6220*/
+	pm_ctrl: pm_ctrl {
+		compatible = "hisilicon,hi6220-pmctrl", "syscon";
+		reg = <0x0 0xf7032000 0x0 0x1000>;
+		#clock-cells = <1>;
+	};
+
+-----------------------------------------------------------------------
 Hisilicon HiP01 system controller
 
 Required properties:
-- 
1.9.1
