From: Jiancheng Xue <xuejiancheng@huawei.com>
Subject: [PATCH v3 2/7] clk: hisilicon: add dt-binding document for Hi3519 CRG
Date: Fri, 11 Dec 2015 15:45:16 +0800
Message-ID: <1449819921-18464-3-git-send-email-xuejiancheng@huawei.com>
References: <1449819921-18464-1-git-send-email-xuejiancheng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1449819921-18464-1-git-send-email-xuejiancheng@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, khilman@linaro.org, arnd@arndb.de, olof@lixom.net, xuwei5@hisilicon.com, haojian.zhuang@linaro.org, zhangfei.gao@linaro.org, bintian.wang@huawei.com
Cc: suwenping@hisilicon.com, devicetree@vger.kernel.org, yanhaifeng@hisilicon.com, linux-kernel@vger.kernel.org, xuejiancheng@hisilicon.com, gaofei@hisilicon.com, Jiancheng Xue <xuejiancheng@huawei.com>, ml.yang@hisilicon.com, yanghongwei@hisilicon.com, zhangzhenxing@hisilicon.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

add dt-binding document for Hi3519 CRG block

Signed-off-by: Jiancheng Xue <xuejiancheng@huawei.com>
---
 .../devicetree/bindings/clock/hi3519-crg.txt       | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt

diff --git a/Documentation/devicetree/bindings/clock/hi3519-crg.txt b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
new file mode 100644
index 0000000..e0d30a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/hi3519-crg.txt
@@ -0,0 +1,46 @@
+* Hisilicon Hi3519 Clock and Reset Generator(CRG)
+
+The Hi3519 CRG module provides clock and reset signals to various
+controllers within the SoC.
+
+This binding uses the following bindings:
+    Documentation/devicetree/bindings/clock/clock-bindings.txt
+    Documentation/devicetree/bindings/reset/reset.txt
+
+Required Properties:
+
+- compatible: should be one of the following.
+  - "hisilicon,hi3519-crg" - controller compatible with Hi3519 SoC.
+
+- reg: physical base address of the controller and length of memory mapped
+  region.
+
+- #clock-cells: should be 1.
+
+Each clock is assigned an identifier and client nodes use this identifier
+to specify the clock which they consume.
+
+All these identifier could be found in <dt-bindings/clock/hi3519-clock.h>.
+
+- #reset-cells: should be 2.
+
+A reset signal can be controlled by writing a bit register in the CRG module.
+The reset specifier consists of two cells. The first cell represents the
+register offset relative to the base address. The second cell represents the
+bit index in the register.
+
+Example: CRG nodes
+CRG: clock-reset-controller {
+	compatible = "hisilicon,hi3519-crg";
+        reg = <0x12010000 0x10000>;
+        #clock-cells = <1>;
+        #reset-cells = <2>;
+};
+
+Example: consumer nodes
+i2c0: i2c@0x12110000 {
+	compatible = "hisilicon,hi3519-i2c";
+        reg = <0x12110000 0x1000>;
+        clocks = <&CRG HI3519_I2C0_RST>;*/
+        resets = <&CRG 0xE4 0>;
+};
-- 
1.9.1
