From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH] ASoC: tda998x: Fix lack of required reg in DT documentation
Date: Thu, 20 Mar 2014 09:58:10 +0100
Message-ID: <20140320092639.48F68A6279@smtp3-g21.free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The I2C address (reg) is required for the TDA998x driver to be loaded
and initialized.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
This patch applies to linux-next.
---
 Documentation/devicetree/bindings/drm/i2c/tda998x.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
index d7df01c..fc7effa 100644
--- a/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
+++ b/Documentation/devicetree/bindings/drm/i2c/tda998x.txt
@@ -3,6 +3,8 @@ Device-Tree bindings for the NXP TDA998x HDMI transmitter
 Required properties;
   - compatible: must be "nxp,tda998x"
 
+  - reg: I2C address - must be <0x70>
+
 Optional properties:
   - interrupts: interrupt number and trigger type
 	default: polling
-- 
1.9.1
