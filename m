From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 3/3] nvmem: imx-ocotp: Fix wrong register size
Date: Fri, 2 Dec 2016 15:45:49 +0100
Message-ID: <1480689949-17957-3-git-send-email-d.schultz@phytec.de>
References: <1480689949-17957-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1480689949-17957-1-git-send-email-d.schultz@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

All i.MX6 SoCs have an OCOTP Controller with 4kbit fuses. The i.MX6SL is
an exception and has only 2kbit fuses.

In the TRM for the i.MX6DQ (IMX6QDRM - Rev 2, 06/2014) the fuses size is
described in chapter 46.1.1 with:
"32-bit word restricted program and read to 4Kbits of eFuse OTP(512x8)."

In the TRM for the i.MX6SL (IMX6SLRM - Rev 2, 06/2015) the fuses size is
described in chapter 34.1.1 with:
"32-bit word restricted program and read to 2 kbit of eFuse OTP(128x8)."

Since the Freescale Linux kernel OCOTP driver works with a fuses size of
2 kbit for the i.MX6SL, it looks like the TRM is wrong and the formula
to calculate the correct fuses size has to be 256x8.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 drivers/nvmem/imx-ocotp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index d2f78d3..8482c53 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -72,7 +72,7 @@ static int imx_ocotp_read(void *context, unsigned int offset,
 static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-ocotp",  (void *)128 },
 	{ .compatible = "fsl,imx6ul-ocotp", (void *)128 },
-	{ .compatible = "fsl,imx6sl-ocotp", (void *)32 },
+	{ .compatible = "fsl,imx6sl-ocotp", (void *)64 },
 	{ .compatible = "fsl,imx6sx-ocotp", (void *)128 },
 	{ },
 };
-- 
1.9.1
