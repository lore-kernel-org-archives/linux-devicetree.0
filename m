From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 1/7] dt-bindings: soc: new driver for DaVinci genpd
Date: Wed,  7 Feb 2018 14:45:47 +0100
Message-ID: <20180207134553.13510-2-brgl@bgdev.pl>
References: <20180207134553.13510-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180207134553.13510-1-brgl@bgdev.pl>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, David Lechner <david@lechnology.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple document for the DaVinci genpd driver. We use clock pm
exclusively hence no reg property.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../devicetree/bindings/soc/ti,davinci-pm-domains.txt       | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt

diff --git a/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
new file mode 100644
index 000000000000..935d063c7b35
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/ti,davinci-pm-domains.txt
@@ -0,0 +1,13 @@
+Device tree bindings for the genpd driver for Texas Instruments DaVinci SoCs
+
+Required properties:
+
+- compatible:           must be "ti,davinci-pm-domains"
+- #power-domain-cells:  must be 0
+
+Example:
+
+pwc1: power-controller@227000 {
+	compatible = "ti,davinci-pm-domains";
+	#power-domain-cells = <0>;
+};
-- 
2.16.1
