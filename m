From: Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH] OF: Add a warning in case chosen node is not present
Date: Sat, 10 Nov 2018 02:53:17 +0200
Message-ID: <20181110005317.5631-1-mick@ics.forth.gr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+glpr-linux-riscv=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org, robh+dt@kernel.org, frowand.list@gmail.com, palmer@sifive.com
List-Id: devicetree@vger.kernel.org

On architectures that only get their bootargs through devicetree's
chosen node (such as RISC-V), that node is mandatory. After a
discussion with Rob [1] I'm adding a warning in case chosen node
is not present, to let users know about it.

[1]: https://patchwork.ozlabs.org/patch/984224/#2016136

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 drivers/of/fdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index bb532aae0d92..7ff67bf1f6d6 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1200,8 +1200,12 @@ bool __init early_init_dt_verify(void *params)
 
 void __init early_init_dt_scan_nodes(void)
 {
+	int rc = 0;
+
 	/* Retrieve various information from the /chosen node */
-	of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	rc = of_scan_flat_dt(early_init_dt_scan_chosen, boot_command_line);
+	if (!rc)
+		pr_warn("No chosen node found, continuing without\n");
 
 	/* Initialize {size,address}-cells info */
 	of_scan_flat_dt(early_init_dt_scan_root, NULL);
-- 
2.16.4
