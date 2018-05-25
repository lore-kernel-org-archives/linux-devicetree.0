From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v2 3/4] dt-bindings: soc: Add TmFifo binding for Mellanox
 BlueField SoC
Date: Fri, 25 May 2018 16:17:15 -0400
Message-ID: <1527279436-14773-3-git-send-email-lsun@mellanox.com>
References: <1527279436-14773-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1527279436-14773-1-git-send-email-lsun@mellanox.com>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>
Cc: devicetree@vger.kernel.org, Liming Sun <lsun@mellanox.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 .../devicetree/bindings/soc/mellanox/tmfifo.txt      | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt

diff --git a/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
new file mode 100644
index 0000000..0a362f5
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mellanox/tmfifo.txt
@@ -0,0 +1,20 @@
+* Mellanox BlueField SoC TmFifo
+
+BlueField TmFifo provides a shared FIFO between the target and the
+external host machine, which can be accessed via USB or PCIe.
+
+Required properties:
+
+- compatible:	Should be "mellanox,bf-tmfifo"
+- reg:		Physical base address and length of Rx/Tx block
+- interrupts:	The interrupt number of Rx low water mark, Rx high water mark
+		Tx low water mark, Tx high water mark respectively.
+
+Example:
+
+tmfifo@800a20 {
+	compatible = "mellanox,bf-tmfifo";
+	reg = <0x00800a20 0x00000018
+	       0x00800a40 0x00000018>;
+	interrupts = <41, 42, 43, 44>;
+};
-- 
1.8.3.1
