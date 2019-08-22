From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 8/8] MAINTAINERS: Add entry for BM1880 SoC clock driver
Date: Thu, 22 Aug 2019 22:54:26 +0530
Message-ID: <20190822172426.25879-9-manivannan.sadhasivam@linaro.org>
References: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190822172426.25879-1-manivannan.sadhasivam@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, darren.tsao@bitmain.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, fisher.cheng@bitmain.com, alec.lin@bitmain.com, linux-clk@vger.kernel.org, haitao.suo@bitmain.com
List-Id: devicetree@vger.kernel.org

Add MAINTAINERS entry for Bitmain BM1880 SoC clock driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997a4f8fe88e..280defec35b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1503,8 +1503,10 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	arch/arm64/boot/dts/bitmain/
+F:	drivers/clk/clk-bm1880.c
 F:	drivers/pinctrl/pinctrl-bm1880.c
 F:	Documentation/devicetree/bindings/arm/bitmain.yaml
+F:	Documentation/devicetree/bindings/clock/bitmain,bm1880-clk.yaml
 F:	Documentation/devicetree/bindings/pinctrl/bitmain,bm1880-pinctrl.txt
 
 ARM/CALXEDA HIGHBANK ARCHITECTURE
-- 
2.17.1
