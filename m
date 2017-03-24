From: Doug Berger <opendmb@gmail.com>
Subject: [PATCH 8/9] bus: brcmstb_gisb: add ARM64 SError support
Date: Fri, 24 Mar 2017 07:46:31 -0700
Message-ID: <20170324144632.5896-9-opendmb@gmail.com>
References: <20170324144632.5896-1-opendmb@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170324144632.5896-1-opendmb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: catalin.marinas@arm.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, will.deacon@arm.com, computersforpeace@gmail.com, gregory.0xf0@gmail.com, f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com, wangkefeng.wang@huawei.com, james.morse@arm.com, vladimir.murzin@arm.com, panand@redhat.com, andre.przywara@arm.com, cmetcalf@mellanox.com, mingo@kernel.org, sandeepa.s.prabhu@gmail.com, shijie.huang@arm.com, linus.walleij@linaro.org, treding@nvidia.com, jonathanh@nvidia.com, olof@lixom.net, mirza.krak@gmail.com, suzuki.poulose@arm.com, bgolaszewski@baylibre.com, horms+renesas@verge.net.au, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, opendmb@gmail.com
List-Id: devicetree@vger.kernel.org

Asynchronous external aborts (e.g. for buffered writes) trigger SError
aborts on the arm64 architecture.  This commit hooks the SError abort
handling to check for GISB arbitration errors.

Signed-off-by: Doug Berger <opendmb@gmail.com>
---
 drivers/bus/brcmstb_gisb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index bf26b4017a2c..52b5d96081eb 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -252,6 +252,28 @@ static int brcmstb_bus_error_handler(unsigned long addr, unsigned int fsr,
 	/* Always report unhandled exception */
 	return 1;
 }
+
+#ifdef CONFIG_ARM64
+static int (*serror_chain)(unsigned long addr, unsigned int esr,
+				struct pt_regs *regs);
+static int do_brahma_b53_serror(unsigned long addr, unsigned int esr,
+				struct pt_regs *regs)
+{
+	struct brcmstb_gisb_arb_device *gdev;
+
+	if (((esr & (3 << 22)) == 0) && ((esr & 3) == 2)) {
+		/* iterate over each GISB arb registered handlers */
+		list_for_each_entry(gdev, &brcmstb_gisb_arb_device_list, next)
+			brcmstb_gisb_arb_decode_addr(gdev, "bus error");
+	}
+
+	if (serror_chain)
+		return serror_chain(addr, esr, regs);
+
+	/* Always report unhandled exception */
+	return 1;
+}
+#endif
 #endif /* CONFIG_ARM || CONFIG_ARM64 */
 
 #ifdef CONFIG_MIPS
@@ -403,6 +425,8 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
 #ifdef CONFIG_ARM64
 	hook_fault_code(16, brcmstb_bus_error_handler, SIGBUS, 0,
 			"synchronous external abort");
+	if (list_is_singular(&brcmstb_gisb_arb_device_list))
+		serror_chain = hook_serror_handler(do_brahma_b53_serror);
 #endif
 #ifdef CONFIG_MIPS
 	board_be_handler = brcmstb_bus_error_handler;
-- 
2.12.0
