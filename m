From: Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH 3/6] dt-bindings: tq: add compatible for i.MX7 boards
Date: Mon,  4 Mar 2019 17:56:27 +0100
Message-ID: <20190304165630.18225-4-bruno.thomsen@gmail.com>
References: <20190304165630.18225-1-bruno.thomsen@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304165630.18225-1-bruno.thomsen@gmail.com>
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
Cc: devicetree@vger.kernel.org, bruno.thomsen@gmail.com, robh+dt@kernel.org, linux-imx@nxp.com, shawnguo@kernel.org, markus.niebel@tq-group.com
List-Id: devicetree@vger.kernel.org

Add documentation about the following TQ boards:
- TQMa7S
- TQMa7D
- MBa7

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 Documentation/devicetree/bindings/arm/tq.txt | 35 ++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tq.txt

diff --git a/Documentation/devicetree/bindings/arm/tq.txt b/Documentation/devicetree/bindings/arm/tq.txt
new file mode 100644
index 000000000000..b0c22a22007b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/tq.txt
@@ -0,0 +1,35 @@
+TQ Systems GmbH Device Tree Bindings
+====================================
+
+TQMa series
+-----------
+
+TQMa is a series of System-on-Modules (SoM) targeting industrial control
+systems due to the long-term availability and extended temperature range.
+They are available with a number of different System-on-Chips (SoC).
+The TQMa7 module can only be mounted with NXP i.MX7 Solo or Dual SoCs.
+Primary compatible strings are of the form "tq,<SoC>-<SoM>".
+
+TQMa7S SoM
+Required root node properties:
+	- compatible = "tq,imx7s-tqma7", "fsl,imx7s";
+
+TQMa7D SoM
+Required root node properties:
+	- compatible = "tq,imx7d-tqma7", "fsl,imx7d";
+
+MBa series
+----------
+
+MBa is a series of Carrier Boards / Single Board Computers (SBC) for
+evaluation of TQMa SoMs.
+The MBa7 carrier board can only interface with TQMa7 modules.
+Primary compatible strings are of the form "tq,<SoC>-<SBC>".
+
+MBa7 with TQMa7S SoM
+Required root node properties:
+	- compatible = "tq,imx7s-mba7", "tq,imx7s-tqma7", "fsl,imx7s";
+
+MBa7 with TQMa7D SoM
+Required root node properties:
+	- compatible = "tq,imx7d-mba7", "tq,imx7d-tqma7", "fsl,imx7d";
-- 
2.20.1
