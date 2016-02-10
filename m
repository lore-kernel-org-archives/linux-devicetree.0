From: Lars Persson <lars.persson@axis.com>
Subject: [PATCH 3/8] arm: add device-tree SoC bindings for Axis Artpec-6
Date: Wed, 10 Feb 2016 13:41:52 +0100
Message-ID: <06f7e5ffdef7ba79b5702f063512010329c40cba.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
In-Reply-To: <cover.1455107681.git.larper@axis.com>
References: <cover.1455107681.git.larper@axis.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, Lars Persson <larper@axis.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, galak@codeaurora.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lars Persson <larper@axis.com>
---
 Documentation/devicetree/bindings/arm/axis.txt | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/axis.txt

diff --git a/Documentation/devicetree/bindings/arm/axis.txt b/Documentation/devicetree/bindings/arm/axis.txt
new file mode 100644
index 0000000..4c98701
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/axis.txt
@@ -0,0 +1,8 @@
+Axis Communications AB
+ARTPEC series SoC Device Tree Bindings
+
+
+ARTPEC-6 ARM SoC
+
+Required root node properties:
+    - compatible = "axis,artpec6-dev-board", "axis,artpec6";
-- 
2.1.4
