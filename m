From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/pcmcia: m8xx_pcmcia.c: Fix build failures
Date: Thu,  3 Jun 2010 01:38:57 +0200
Message-ID: <1275521937-11130-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-pcmcia-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fixes build errors caused by the:
- OF device_node pointer being moved into struct device
- typo in match_table field in the struct device_driver
  (which shoud be of_match_table)

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/pcmcia/m8xx_pcmcia.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/m8xx_pcmcia.c b/drivers/pcmcia/m8xx_pcmcia.c
index 1a648b9..25e5e30 100644
--- a/drivers/pcmcia/m8xx_pcmcia.c
+++ b/drivers/pcmcia/m8xx_pcmcia.c
@@ -1157,7 +1157,7 @@ static int __init m8xx_probe(struct of_device *ofdev,
 	unsigned int i, m, hwirq;
 	pcmconf8xx_t *pcmcia;
 	int status;
-	struct device_node *np = ofdev->node;
+	struct device_node *np = ofdev->dev.of_node;
 
 	pcmcia_info("%s\n", version);
 
@@ -1301,7 +1301,7 @@ static struct of_platform_driver m8xx_pcmcia_driver = {
 	.driver = {
 		.name = driver_name,
 		.owner = THIS_MODULE,
-		.match_table = m8xx_pcmcia_match,
+		.of_match_table = m8xx_pcmcia_match,
 	},
 	.probe = m8xx_probe,
 	.remove = m8xx_remove,
-- 
1.7.0.4
