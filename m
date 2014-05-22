From: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
Subject: [Patch v5 3/7] mfd: ti-keystone-devctrl: add bindings for device
 state control
Date: Thu, 22 May 2014 16:48:32 +0300
Message-ID: <1400766516-14537-4-git-send-email-ivan.khoronzhuk@ti.com>
References: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400766516-14537-1-git-send-email-ivan.khoronzhuk@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: dbaryshkov@gmail.com, dwmw2@infradead.org, santosh.shilimkar@ti.com, arnd@arndb.de, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, grant.likely@linaro.org
Cc: devicetree@vger.kernel.org, grygorii.strashko@ti.com, linux@arm.linux.org.uk, sergei.shtylyov@cogentembedded.com, linux-doc@vger.kernel.org, w-kwok2@ti.com, rdunlap@infradead.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, m-karicheri2@ti.com, olof@lixom.net, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Keystone II devices have a set of registers that are used to control
the status of its peripherals. This node is intended to allow access to
this functionality.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>
---
 .../devicetree/bindings/mfd/ti-keystone-devctrl.txt   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt

diff --git a/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
new file mode 100644
index 0000000..35f7a66
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ti-keystone-devctrl.txt
@@ -0,0 +1,19 @@
+* Device tree bindings for Texas Instruments keystone device state control
+
+The Keystone II devices have a set of registers that are used to control
+the status of its peripherals. This node is intended to allow access to
+this functionality.
+
+Required properties:
+
+- compatible:		"ti,keystone-devctrl", "syscon"
+
+- reg:			contains offset/length value for pll controller
+			registers space.
+
+Example:
+
+devctrl: device-state-control {
+	compatible = "ti,keystone-devctrl", "syscon";
+	reg = <0x02620000 0x1000>;
+};
-- 
1.8.3.2
