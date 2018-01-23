From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH 1/2] soc: imx: gpc: ARM power domain should be always-on
Date: Wed, 24 Jan 2018 00:42:13 +0800
Message-ID: <1516725734-32745-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com, robh+dt@kernel.org, aisheng.dong@nxp.com, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: Linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

ARM power domain does NOT support runtime off, always-on
flag should be set to avoid incorrect power state in
pm_genpd_summary:

Before:

root@imx6qpdlsolox:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          slaves
    /device                                             runtime status
----------------------------------------------------------------------
ARM                             off-0

After:

root@imx6qpdlsolox:~# cat /sys/kernel/debug/pm_genpd/pm_genpd_summary
domain                          status          slaves
    /device                                             runtime status
----------------------------------------------------------------------
ARM                             on

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/soc/imx/gpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/imx/gpc.c b/drivers/soc/imx/gpc.c
index 53f7275..6cafa9b 100644
--- a/drivers/soc/imx/gpc.c
+++ b/drivers/soc/imx/gpc.c
@@ -254,6 +254,7 @@ static struct imx_pm_domain imx_gpc_domains[] = {
 	{
 		.base = {
 			.name = "ARM",
+			.flags = GENPD_FLAG_ALWAYS_ON,
 		},
 	}, {
 		.base = {
-- 
2.7.4
