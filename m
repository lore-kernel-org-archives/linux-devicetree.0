From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH 01/11] devicetree: binding: add missing Marvell Dove SoC
 documentation
Date: Sat, 25 Jan 2014 19:34:06 +0100
Message-ID: <1390674856-4993-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1390674856-4993-1-git-send-email-sebastian.hesselbarth@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1390674856-4993-1-git-send-email-sebastian.hesselbarth@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Marvell Dove SoC binding was not documented, yet. Add the documentation
and also describe Global Configuration register node in it.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
I chose not to send this to each DT maintainer but devicetree ml only.
Is that right or wrong now?

Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@free-electrons.com>
Cc: devicetree@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 .../devicetree/bindings/arm/marvell,dove.txt       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell,dove.txt

diff --git a/Documentation/devicetree/bindings/arm/marvell,dove.txt b/Documentation/devicetree/bindings/arm/marvell,dove.txt
new file mode 100644
index 000000000000..aaaf64c56e44
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/marvell,dove.txt
@@ -0,0 +1,22 @@
+Marvell Dove Platforms Device Tree Bindings
+-----------------------------------------------
+
+Boards with a Marvell Dove SoC shall have the following properties:
+
+Required root node property:
+- compatible: must contain "marvell,dove";
+
+* Global Configuration registers
+
+Global Configuration registers of Dove SoC are shared by a syscon node.
+
+Required properties:
+- compatible: must contain "marvell,dove-global-config" and "syscon".
+- reg: base address and size of the Global Configuration registers.
+
+Example:
+
+gconf: global-config@e802c {
+	compatible = "marvell,dove-global-config", "syscon";
+	reg = <0xe802c 0x14>;
+};
-- 
1.8.5.2
