From: Sebastien Jan <sjan@baylibre.com>
Subject: [PATCH v2] mfd: arizona: Add DT binding for irq-gpios
	property
Date: Tue,  3 Nov 2015 15:10:06 +0100
Message-ID: <1446559806-3315-1-git-send-email-sjan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, Sebastien Jan <sjan@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Sebastien Jan <sjan@baylibre.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 2 ++
 drivers/mfd/arizona-core.c                        | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index a8fee60..f9405ad 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -46,6 +46,8 @@ Optional properties:
   - wlf,reset : GPIO specifier for the GPIO controlling /RESET
   - wlf,ldoena : GPIO specifier for the GPIO controlling LDOENA
 
+  - irq-gpios : GPIO specifier for the GPIO connected to /IRQ
+
   - wlf,gpio-defaults : A list of GPIO configuration register values. Defines
     for the appropriate values can found in <dt-bindings/mfd/arizona.txt>. If
     absent, no configuration of these registers is performed. If any entry has
diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 44cfdbb..2046617 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -814,6 +814,11 @@ static int arizona_of_get_core_pdata(struct arizona *arizona)
 		count++;
 	}
 
+	arizona->pdata.irq_gpio = of_get_named_gpio(arizona->dev->of_node,
+							"irq-gpios", 0);
+	if (arizona->pdata.irq_gpio < 0)
+		arizona->pdata.irq_gpio = 0;
+
 	return 0;
 }
 
-- 
1.9.1
