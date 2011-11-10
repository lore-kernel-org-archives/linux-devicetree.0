From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 1/1] microblaze: Added fdt chosen capability for timer
Date: Thu, 10 Nov 2011 14:10:23 +0100
Message-ID: <1320930623-15060-3-git-send-email-monstr@monstr.eu>
References: <1320930623-15060-1-git-send-email-monstr@monstr.eu>
 <1320930623-15060-2-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320930623-15060-2-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Peter A. G. Crosthwaite" <peter.crosthwaite-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>

This lets a dts author flag a particular timer in the system as the system timer.
If the chosen node contains a "system-timer=<&foo>" entry than that handle will
be used to determine the system timer. In no such entry exists then the first
found timer will be used (current behaviour).

Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org>
Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/kernel/timer.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index 91804cd..c289412 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -267,11 +267,15 @@ void __init time_init(void)
 		NULL
 	};
 
-	for (i = 0; timer_list[i] != NULL; i++) {
+	prop = of_get_property(of_chosen, "system-timer", NULL);
+	if (prop)
+		timer = of_find_node_by_phandle(be32_to_cpup(prop));
+	else
+		printk(KERN_INFO "No chosen timer found, using default\n");
+
+	for (i = 0; timer_list[i] != NULL && !timer; i++)
 		timer = of_find_compatible_node(NULL, NULL, timer_list[i]);
-		if (timer)
-			break;
-	}
+
 	BUG_ON(!timer);
 
 	timer_baseaddr = be32_to_cpup(of_get_property(timer, "reg", NULL));
-- 
1.7.5.4
