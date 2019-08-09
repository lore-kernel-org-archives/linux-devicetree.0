From: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 5/6] dt-bindings: pinctrl: k3: Introduce pinmux definitions
 for J721E
Date: Fri, 9 Aug 2019 13:59:46 +0530
Message-ID: <20190809082947.30590-6-lokeshvutla@ti.com>
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

Add pinctrl macros for J721E SoC. These macro definitions are
similar to that of AM6, but adding new definitions to avoid
any naming confusions in the soc dts files.

Acked-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 include/dt-bindings/pinctrl/k3.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
index 45e11b6170ca..499de6216581 100644
--- a/include/dt-bindings/pinctrl/k3.h
+++ b/include/dt-bindings/pinctrl/k3.h
@@ -32,4 +32,7 @@
 #define AM65X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM65X_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
 
+#define J721E_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
+#define J721E_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
+
 #endif
-- 
2.22.0
