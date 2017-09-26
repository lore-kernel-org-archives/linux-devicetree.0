From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 02/10] dt-bindings: Add documentation for Broadcom Hurricane 2
 SoCs
Date: Mon, 25 Sep 2017 17:09:23 -0700
Message-ID: <20170926000931.670-3-f.fainelli@gmail.com>
References: <20170926000931.670-1-f.fainelli@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170926000931.670-1-f.fainelli@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Russell King <linux@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "maintainer:BROADCOM IPROC ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, Olof Johansson <olof@lixom.net>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add binding documentation for the Broadcom Hurricane 2 SoCs used in switching
control planes.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt
new file mode 100644
index 000000000000..a124c7fc4dcd
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,hr2.txt
@@ -0,0 +1,14 @@
+Broadcom Hurricane 2 device tree bindings
+---------------------------------------
+
+Broadcom Hurricane 2 family of SoCs are used for switching control. These SoCs
+are based on Broadcom's iProc SoC architecture and feature a single core Cortex
+A9 ARM CPUs, DDR2/DDR3 memory, PCIe GEN-2, USB 2.0 and USB 3.0, serial and NAND
+flash and a PCIe attached integrated switching engine.
+
+Boards with Hurricane SoCs shall have the following properties:
+
+Required root node property:
+
+BCM53342
+compatible = "brcm,bcm53342", "brcm,hr2";
-- 
2.14.1
