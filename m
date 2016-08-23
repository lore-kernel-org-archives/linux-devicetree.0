From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/4] dt-bindings: arm: Add Sierra Wireless modules bindings
Date: Tue, 23 Aug 2016 13:39:04 +0200
Message-ID: <1471952346-30676-3-git-send-email-narmstrong@baylibre.com>
References: <1471952346-30676-1-git-send-email-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1471952346-30676-1-git-send-email-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux@armlinux.org.uk, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/arm/swir.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/swir.txt

diff --git a/Documentation/devicetree/bindings/arm/swir.txt b/Documentation/devicetree/bindings/arm/swir.txt
new file mode 100644
index 0000000..042be73
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/swir.txt
@@ -0,0 +1,12 @@
+Sierra Wireless Modules device tree bindings
+--------------------------------------------
+
+Supported Modules :
+ - WP8548 : Includes MDM9615 and PM8018 in a module
+
+Sierra Wireless modules shall have the following properties :
+  Required root node property
+   - compatible: "swir,wp8548" for the WP8548 CF3 Module
+
+Board compatible values:
+  - "swir,mangoh-green-wp8548" for the mangOH green board with the WP8548 module
-- 
1.9.1
