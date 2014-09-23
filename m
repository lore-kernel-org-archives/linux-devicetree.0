From: Boris BREZILLON <boris.brezillon@free-electrons.com>
Subject: [PATCH v9 10/10] mfd: syscon: add Atmel GPBR DT bindings documention
Date: Tue, 23 Sep 2014 16:48:45 +0200
Message-ID: <1411483725-31532-11-git-send-email-boris.brezillon@free-electrons.com>
References: <1411483725-31532-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1411483725-31532-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Johan Hovold <jhovold@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "Acked-by: Arnd Bergmann" <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The GPBR block provides a set of battery-backed registers that can be used
to save data which need to be kept when the system is powered down and
VDD-core is maintained by an external battery.

A typical usage is the RTT block (when used as an RTC) which needs one of
those registers to save the current time.

Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Acked-by: Johan Hovold <johan@kernel.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/devicetree/bindings/mfd/atmel,gpbr.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/atmel,gpbr.txt

diff --git a/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt b/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt
new file mode 100644
index 0000000..a285695
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/atmel,gpbr.txt
@@ -0,0 +1,15 @@
+* Device tree bindings for Atmel GPBR (General Purpose Backup Registers)
+
+The GPBR are a set of battery-backed registers.
+
+Required properties:
+- compatible:		"atmel,at91sam9260-gpbr", "syscon"
+- reg:			contains offset/length value of the GPBR memory
+			region.
+
+Example:
+
+gpbr: gpbr@fffffd50 {
+	compatible = "atmel,at91sam9260-gpbr", "syscon";
+	reg = <0xfffffd50 0x10>;
+};
-- 
1.9.1
