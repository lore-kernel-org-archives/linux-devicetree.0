From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] TTY: hvsi: use for_each_compatible_node() macro
Date: Tue, 4 Dec 2012 00:16:18 -0500
Message-ID: <CAPgLHd-bpkWo6PeKrB1VqCiYMxCvphvMbs34Raoh89Wm0ubK-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use for_each_compatible_node() macro instead of open coding it.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/tty/hvc/hvsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/hvc/hvsi.c b/drivers/tty/hvc/hvsi.c
index 5b95b4f..70e0ef7 100644
--- a/drivers/tty/hvc/hvsi.c
+++ b/drivers/tty/hvc/hvsi.c
@@ -1187,9 +1187,7 @@ static int __init hvsi_console_init(void)
 	hvsi_wait = poll_for_state; /* no irqs yet; must poll */
 
 	/* search device tree for vty nodes */
-	for (vty = of_find_compatible_node(NULL, "serial", "hvterm-protocol");
-			vty != NULL;
-			vty = of_find_compatible_node(vty, "serial", "hvterm-protocol")) {
+	for_each_compatible_node(vty, "serial", "hvterm-protocol") {
 		struct hvsi_struct *hp;
 		const uint32_t *vtermno, *irq;
 
