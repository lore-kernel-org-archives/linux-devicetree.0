From: Adrian Alonso <aalonso00@gmail.com>
Subject: [PATCH] xilinxfb: update tft comp versions
Date: Tue, 27 Jul 2010 16:24:13 -0500
Message-ID: <1280265853-21245-1-git-send-email-aalonso00@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: linuxppc-dev@lists.ozlabs.org
Cc: devicetree-discuss@lists.ozlabs.org, Adrian Alonso <aalonso00@gmail.com>
List-Id: devicetree@vger.kernel.org

* Add tft display module compatibility for new
  hardware modules

Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
---
 drivers/video/xilinxfb.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/video/xilinxfb.c b/drivers/video/xilinxfb.c
index 574dc54..29b5daa 100644
--- a/drivers/video/xilinxfb.c
+++ b/drivers/video/xilinxfb.c
@@ -485,6 +485,8 @@ static int __devexit xilinxfb_of_remove(struct of_device *op)
 /* Match table for of_platform binding */
 static struct of_device_id xilinxfb_of_match[] __devinitdata = {
 	{ .compatible = "xlnx,xps-tft-1.00.a", },
+	{ .compatible = "xlnx,xps-tft-2.00.a", },
+	{ .compatible = "xlnx,xps-tft-2.01.a", },
 	{ .compatible = "xlnx,plb-tft-cntlr-ref-1.00.a", },
 	{ .compatible = "xlnx,plb-dvi-cntlr-ref-1.00.c", },
 	{},
-- 
1.7.2
