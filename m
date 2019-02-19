From: Vignesh R <vigneshr@ti.com>
Subject: [RFC PATCH 2/5] dt-bindings: mtd: Add binding documentation for
 Hyperbus memory devices
Date: Tue, 19 Feb 2019 12:06:04 +0530
Message-ID: <20190219063607.29949-3-vigneshr@ti.com>
References: <20190219063607.29949-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190219063607.29949-1-vigneshr@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vignesh R <vigneshr@ti.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, tudor.ambarus@microchip.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nsekhar@ti.com, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for Hyperbus memory devices. For now only
Hyperflash is supported.

Signed-off-by: Vignesh R <vigneshr@ti.com>
---
 Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt

diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
new file mode 100644
index 000000000000..cb408f80b868
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cypress,hyperbus.txt
@@ -0,0 +1,6 @@
+Bindings for Hyperflash NOR flash chips compliant with Cypress Hyperbus
+specification and supports Cypress CFI specification 1.5 command set.
+
+Required properties:
+- compatible : "cypress,hyperflash" for Hyperflash NOR chips
+- reg : Address where flash's memory mapped space
-- 
2.20.1
