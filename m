From: Bintian Wang <bintian.wang@huawei.com>
Subject: [PATCH v2 3/6] clk: hi6220: Document devicetree bindings for hi6220 clock
Date: Mon, 13 Apr 2015 17:17:37 +0800
Message-ID: <1428916660-25910-4-git-send-email-bintian.wang@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org
Cc: xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, bintian.wang@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawei.com, kong.kongxinwei@hisilicon.com, btw@mail.itp.ac.cn, w.f@huawei.com, liguozhu@hisilicon.com
List-Id: devicetree@vger.kernel.org

Document DT files bindings for Hisilicon hi6220 clock.

Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>
---
 .../devicetree/bindings/clock/hi6220-clock.txt     | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi6220-clock.txt

diff --git a/Documentation/devicetree/bindings/clock/hi6220-clock.txt b/Documentation/devicetree/bindings/clock/hi6220-clock.txt
new file mode 100644
index 0000000..83cc7c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hi6220-clock.txt
@@ -0,0 +1,34 @@
+* Hisilicon Hi6220 Clock Controller
+
+Clock control registers reside in different Hi6220 system controllers,
+please refer the following document to know more about the binding rules
+for these system controllers:
+
+Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+
+Required Properties:
+
+- compatible: the compatible should be one of the following strings to
+	indicate the clock controller functionality.
+
+	- "hisilicon,aoctrl"
+	- "hisilicon,sysctrl"
+	- "hisilicon,mediactrl"
+	- "hisilicon,pmctrl"
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+For example:
+	sys_ctrl: sys_ctrl {
+		compatible = "hisilicon,sysctrl", "syscon";
+		reg = <0x0 0xf7030000 0x0 0x2000>;
+		#clock-cells = <1>;
+	};
+
+Each clock is assigned an identifier and client nodes use this identifier
+to specify the clock which they consume.
+
+All these identifier could be found in <dt-bindings/clock/hi6220-clock.h>.
-- 
1.9.1
