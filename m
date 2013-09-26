From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH 05/21] openrisc: remove unnecessary prom.h include
Date: Thu, 26 Sep 2013 13:50:40 -0500
Message-ID: <1380221456-11192-6-git-send-email-robherring2@gmail.com>
References: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <1380221456-11192-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux@lists.openrisc.net
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring@calxeda.com>

Remove unnecessary prom.h include in preparation to make prom.h optional.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: linux@lists.openrisc.net
---
 arch/openrisc/kernel/prom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/openrisc/kernel/prom.c b/arch/openrisc/kernel/prom.c
index a63e768..a915dc7 100644
--- a/arch/openrisc/kernel/prom.c
+++ b/arch/openrisc/kernel/prom.c
@@ -37,7 +37,6 @@
 #include <linux/memblock.h>
 #include <linux/of_fdt.h>
 
-#include <asm/prom.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 #include <asm/irq.h>
-- 
1.8.1.2
