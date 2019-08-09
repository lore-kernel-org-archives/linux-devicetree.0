From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 1/6] dt-bindings: gpio: davinci: Add new compatible for J721E
 SoCs
Date: Fri, 9 Aug 2019 13:59:42 +0530
Message-ID: <20190809082947.30590-2-lokeshvutla@ti.com>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809082947.30590-1-lokeshvutla@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>, linus.walleij@linaro.org
Cc: Device Tree Mailing List <devicetree@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, Keerthy <j-keerthy@ti.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

J721e SoCs have same gpio IP as K2G davinci gpio. Add a new compatible to
handle J721E SoCs.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 Documentation/devicetree/bindings/gpio/gpio-davinci.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index bc6b4b62df83..cd91d61eac31 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -6,6 +6,7 @@ Required Properties:
 						66AK2E SoCs
 			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
 			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
+			"ti,j721e-gpio", "ti,keystone-gpio": for J721E SoCs
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
-- 
2.22.0
