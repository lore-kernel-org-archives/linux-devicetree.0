From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] powerpc: use for_each_compatible_node() macro
Date: Mon, 11 Mar 2013 22:24:18 +0800
Message-ID: <CAPgLHd_CZXucALyD4JrDsA9ffYFrcufTyw-Nh0o2sAjg10YsvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: benh@kernel.crashing.org, paulus@samba.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Use for_each_compatible_node() macro instead of open coding it.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 arch/powerpc/include/asm/parport.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/parport.h b/arch/powerpc/include/asm/parport.h
index 6dc2577..a452968 100644
--- a/arch/powerpc/include/asm/parport.h
+++ b/arch/powerpc/include/asm/parport.h
@@ -21,9 +21,7 @@ static int parport_pc_find_nonpci_ports (int autoirq, int autodma)
 	int count = 0;
 	int virq;
 
-	for (np = NULL; (np = of_find_compatible_node(np,
-						      "parallel",
-						      "pnpPNP,400")) != NULL;) {
+	for_each_compatible_node(np, "parallel", "pnpPNP,400") {
 		prop = of_get_property(np, "reg", &propsize);
 		if (!prop || propsize > 6*sizeof(u32))
 			continue;
