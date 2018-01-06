From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v2 2/5] pinctrl: imx7d: simplify imx7d_pinctrl_probe
Date: Sat,  6 Jan 2018 15:25:50 +0100
Message-ID: <20180106142553.15322-3-stefan@agner.ch>
References: <20180106142553.15322-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180106142553.15322-1-stefan@agner.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de
Cc: aisheng.dong@nxp.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, fabio.estevam@nxp.com, Arvind Yadav <arvind.yadav.cs@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Using of_device_get_match_data in imx7d_pinctrl_probe simplifies
the function. Also get rid of the void pointer cast since
imx_pinctrl_probe now accepts const struct imx_pinctrl_soc_info.

Cc: Arvind Yadav <arvind.yadav.cs@gmail.com>
Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/pinctrl/freescale/pinctrl-imx7d.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx7d.c b/drivers/pinctrl/freescale/pinctrl-imx7d.c
index 754159ee7b1e..0b0a2f33b06a 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx7d.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx7d.c
@@ -378,16 +378,12 @@ static const struct of_device_id imx7d_pinctrl_of_match[] = {
 
 static int imx7d_pinctrl_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
-	struct imx_pinctrl_soc_info *pinctrl_info;
+	const struct imx_pinctrl_soc_info *pinctrl_info;
 
-	match = of_match_device(imx7d_pinctrl_of_match, &pdev->dev);
-
-	if (!match)
+	pinctrl_info = of_device_get_match_data(&pdev->dev);
+	if (!pinctrl_info)
 		return -ENODEV;
 
-	pinctrl_info = (struct imx_pinctrl_soc_info *) match->data;
-
 	return imx_pinctrl_probe(pdev, pinctrl_info);
 }
 
-- 
2.15.1
