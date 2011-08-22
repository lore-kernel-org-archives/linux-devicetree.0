From: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] [v2] sound/soc/fsl/fsl_dma.c: add missing of_node_put
Date: Mon, 22 Aug 2011 09:22:41 -0500
Message-ID: <1314022961-27513-1-git-send-email-timur__19066.1357868978$1314023025$gmane$org@freescale.com>
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
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_parse_phandle increments the reference count of np, so this should be
decremented before trying the next possibility.

Since we don't actually use np, we can decrement the reference count
immediately.

Reported-by: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Signed-off-by: Timur Tabi <timur-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 sound/soc/fsl/fsl_dma.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 6680c0b..b300f4b 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -877,10 +877,12 @@ static struct device_node *find_ssi_node(struct device_node *dma_channel_np)
 		 * assume that device_node pointers are a valid comparison.
 		 */
 		np = of_parse_phandle(ssi_np, "fsl,playback-dma", 0);
+		of_node_put(np);
 		if (np == dma_channel_np)
 			return ssi_np;
 
 		np = of_parse_phandle(ssi_np, "fsl,capture-dma", 0);
+		of_node_put(np);
 		if (np == dma_channel_np)
 			return ssi_np;
 	}
-- 
1.7.3.4
