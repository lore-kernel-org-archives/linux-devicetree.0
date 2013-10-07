From: Rob Herring <robherring2@gmail.com>
Subject: [PATCH v2 17/29] openrisc: use early_init_dt_scan
Date: Mon,  7 Oct 2013 11:29:25 -0500
Message-ID: <1381163377-21044-18-git-send-email-robherring2@gmail.com>
References: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <1381163377-21044-1-git-send-email-robherring2@gmail.com>
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

Convert openrisc to use new early_init_dt_scan function.

Signed-off-by: Rob Herring <rob.herring@calxeda.com>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: linux@lists.openrisc.net
---
 arch/openrisc/kernel/prom.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/openrisc/kernel/prom.c b/arch/openrisc/kernel/prom.c
index 3b94972..fbed459 100644
--- a/arch/openrisc/kernel/prom.c
+++ b/arch/openrisc/kernel/prom.c
@@ -55,20 +55,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 
 void __init early_init_devtree(void *params)
 {
-	/* Setup flat device-tree pointer */
-	initial_boot_params = params;
-
-
-	/* Retrieve various informations from the /chosen node of the
-	 * device-tree, including the platform type, initrd location and
-	 * size, TCE reserve, and more ...
-	 */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
-
-	/* Scan memory nodes and rebuild MEMBLOCKs */
-	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-	of_scan_flat_dt(early_init_dt_scan_memory, NULL);
-
+	early_init_dt_scan(params);
 	memblock_allow_resize();
 }
 
-- 
1.8.1.2
