From: Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/3] nvmem: imx-ocotp: Add support for i.MX6UL
Date: Fri, 2 Dec 2016 15:45:47 +0100
Message-ID: <1480689949-17957-1-git-send-email-d.schultz@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

This patch adds OCOTP support for the i.MX6UL SoC.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 5 +++--
 drivers/nvmem/imx-ocotp.c                             | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index 383d588..fcb1a48 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -1,13 +1,14 @@
 Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
 
 This binding represents the on-chip eFuse OTP controller found on
-i.MX6Q/D, i.MX6DL/S, i.MX6SL, and i.MX6SX SoCs.
+i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX and i.MX6UL SoCs.
 
 Required properties:
 - compatible: should be one of
 	"fsl,imx6q-ocotp" (i.MX6Q/D/DL/S),
 	"fsl,imx6sl-ocotp" (i.MX6SL), or
-	"fsl,imx6sx-ocotp" (i.MX6SX), followed by "syscon".
+	"fsl,imx6sx-ocotp" (i.MX6SX), or
+	"fsl,imx6ul-ocotp" (i.MX6UL), followed by "syscon".
 - reg: Should contain the register base and length.
 - clocks: Should contain a phandle pointing to the gated peripheral clock.
 
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index ac27b9b..d2f78d3 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -71,6 +71,7 @@ static int imx_ocotp_read(void *context, unsigned int offset,
 
 static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-ocotp",  (void *)128 },
+	{ .compatible = "fsl,imx6ul-ocotp", (void *)128 },
 	{ .compatible = "fsl,imx6sl-ocotp", (void *)32 },
 	{ .compatible = "fsl,imx6sx-ocotp", (void *)128 },
 	{ },
-- 
1.9.1
