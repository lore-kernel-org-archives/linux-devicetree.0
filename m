From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 2/3] nvmem: imx-ocotp: Implement i.MX6ULL/ULZ support
Date: Tue, 11 Dec 2018 14:51:12 +0100
Message-ID: <1544536273-17909-3-git-send-email-stefan.wahren@i2se.com>
References: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1544536273-17909-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-imx@nxp.com, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In comparision to the i.MX6UL the lower cost variants i.MX6ULL/ULZ only
supports 8 OTP banks a 8 words.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/nvmem/imx-ocotp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index afb429a..a433a41 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -427,6 +427,12 @@ static const struct ocotp_params imx6ul_params = {
 	.set_timing = imx_ocotp_set_imx6_timing,
 };
 
+static const struct ocotp_params imx6ull_params = {
+	.nregs = 64,
+	.bank_address_words = 0,
+	.set_timing = imx_ocotp_set_imx6_timing,
+};
+
 static const struct ocotp_params imx7d_params = {
 	.nregs = 64,
 	.bank_address_words = 4,
@@ -438,6 +444,7 @@ static const struct of_device_id imx_ocotp_dt_ids[] = {
 	{ .compatible = "fsl,imx6sl-ocotp", .data = &imx6sl_params },
 	{ .compatible = "fsl,imx6sx-ocotp", .data = &imx6sx_params },
 	{ .compatible = "fsl,imx6ul-ocotp", .data = &imx6ul_params },
+	{ .compatible = "fsl,imx6ull-ocotp", .data = &imx6ull_params },
 	{ .compatible = "fsl,imx7d-ocotp",  .data = &imx7d_params },
 	{ .compatible = "fsl,imx6sll-ocotp", .data = &imx6sll_params },
 	{ },
-- 
2.7.4
