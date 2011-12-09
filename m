From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 3/5] microblaze: Use irq_of_parse_and_map for timer
Date: Fri,  9 Dec 2011 12:45:19 +0100
Message-ID: <1323431121-12780-3-git-send-email-monstr@monstr.eu>
References: <1323431121-12780-1-git-send-email-monstr@monstr.eu>
 <1323431121-12780-2-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323431121-12780-2-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

It is necessary to call generic function for irq finding.
The main reason is that this generic function calls irq_create_of_mapping
which can add some shift because of NO_IRQ.

Signed-off-by: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
---
 arch/microblaze/kernel/timer.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/microblaze/kernel/timer.c b/arch/microblaze/kernel/timer.c
index 3ba1e1c..52e3eaf 100644
--- a/arch/microblaze/kernel/timer.c
+++ b/arch/microblaze/kernel/timer.c
@@ -263,7 +263,7 @@ void __init time_init(void)
 
 	timer_baseaddr = be32_to_cpup(of_get_property(timer, "reg", NULL));
 	timer_baseaddr = (unsigned long) ioremap(timer_baseaddr, PAGE_SIZE);
-	irq = be32_to_cpup(of_get_property(timer, "interrupts", NULL));
+	irq = irq_of_parse_and_map(timer, 0);
 	timer_num = be32_to_cpup(of_get_property(timer,
 						"xlnx,one-timer-only", NULL));
 	if (timer_num) {
-- 
1.7.5.4
