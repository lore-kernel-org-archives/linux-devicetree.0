Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A00C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:07:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36F8A2068E
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfK0BHF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:07:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16856 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbfK0BHF (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:07:05 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR13xI5105072;
        Tue, 26 Nov 2019 20:06:53 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3k9n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:06:53 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR14H7Z105526;
        Tue, 26 Nov 2019 20:06:52 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3k96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:06:52 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR15txw003580;
        Wed, 27 Nov 2019 01:06:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma02dal.us.ibm.com with ESMTP id 2wevd6ragh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:06:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR16oTR33882456
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:06:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DC45AB2068;
        Wed, 27 Nov 2019 01:06:50 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 2D758B2065;
        Wed, 27 Nov 2019 01:06:50 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:06:50 +0000 (GMT)
Subject: [PATCH 04/14] powerpc/vas: Setup IRQ mapping and register port for
 each window
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:05:31 -0800
Message-ID: <1574816731.13250.9.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=2
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270006
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Read interrupt and port values from the device tree, setup IRQ
mapping and register IRQ for each VAS instance. Set port value for
each NX window. When NX sees a fault on CRB, kernel gets an interrupt
and handles the fault.

IRQ setup and fault handling is needed only for user space send
windows. So for kernel requests, ignore if interrupts property is
not available.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-window.c | 14 ++++++
 arch/powerpc/platforms/powernv/vas.c        | 68 ++++++++++++++++++++++++++---
 arch/powerpc/platforms/powernv/vas.h        |  2 +
 3 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index ea5ca02..ad6be91 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -758,6 +758,8 @@ static void init_winctx_for_rxwin(struct vas_window *rxwin,
 
 	winctx->min_scope = VAS_SCOPE_LOCAL;
 	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
+	if (rxwin->vinst->virq)
+		winctx->irq_port = rxwin->vinst->irq_port;
 }
 
 static bool rx_win_args_valid(enum vas_cop_type cop,
@@ -959,6 +961,8 @@ static void init_winctx_for_txwin(struct vas_window *txwin,
 	winctx->tc_mode = txattr->tc_mode;
 	winctx->min_scope = VAS_SCOPE_LOCAL;
 	winctx->max_scope = VAS_SCOPE_VECTORED_GROUP;
+	if (txwin->vinst->virq)
+		winctx->irq_port = txwin->vinst->irq_port;
 
 	winctx->pswid = 0;
 }
@@ -1050,6 +1054,16 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
 		}
 	} else {
 		/*
+		 * Interrupt hanlder setup failed. Means NX can not generate
+		 * fault for page fault. So not opening for user space tx
+		 * window.
+		 */
+		if (!vinst->virq) {
+			rc = -ENODEV;
+			goto free_window;
+		}
+
+		/*
 		 * A user mapping must ensure that context switch issues
 		 * CP_ABORT for this thread.
 		 */
diff --git a/arch/powerpc/platforms/powernv/vas.c b/arch/powerpc/platforms/powernv/vas.c
index ed9cc6d..71bddaa 100644
--- a/arch/powerpc/platforms/powernv/vas.c
+++ b/arch/powerpc/platforms/powernv/vas.c
@@ -14,6 +14,8 @@
 #include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of.h>
+#include <linux/irqdomain.h>
+#include <linux/interrupt.h>
 #include <asm/prom.h>
 
 #include "vas.h"
@@ -23,9 +25,33 @@
 
 static DEFINE_PER_CPU(int, cpu_vas_id);
 
+static irqreturn_t vas_irq_handler(int virq, void *data)
+{
+	struct vas_instance *vinst = data;
+
+	pr_devel("VAS %d: virq %d\n", vinst->vas_id, virq);
+
+	return IRQ_HANDLED;
+}
+
+static void vas_irq_fault_handle_setup(struct vas_instance *vinst)
+{
+	int rc;
+	char devname[64];
+
+	snprintf(devname, sizeof(devname), "vas-inst-%d", vinst->vas_id);
+	rc = request_irq(vinst->virq, vas_irq_handler, 0, devname, vinst);
+	if (rc) {
+		pr_err("VAS[%d]: Request IRQ(%d) failed with %d\n",
+				vinst->vas_id, vinst->virq, rc);
+		vinst->virq = 0;
+	}
+}
+
 static int init_vas_instance(struct platform_device *pdev)
 {
-	int rc, cpu, vasid;
+	int rc, cpu, vasid, nresources = 5;
+	uint64_t port;
 	struct resource *res;
 	struct vas_instance *vinst;
 	struct device_node *dn = pdev->dev.of_node;
@@ -36,7 +62,18 @@ static int init_vas_instance(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (pdev->num_resources != 4) {
+	rc = of_property_read_u64(dn, "ibm,vas-port", &port);
+	if (rc) {
+		pr_err("No ibm,vas-port property for %s?\n", pdev->name);
+		/* No interrupts property */
+		nresources = 4;
+	}
+
+	/*
+	 * interrupts property is available with 'ibm,vas-port' property.
+	 * 4 Resources and 1 IRQ if interrupts property is available.
+	 */
+	if (pdev->num_resources != nresources) {
 		pr_err("Unexpected DT configuration for [%s, %d]\n",
 				pdev->name, vasid);
 		return -ENODEV;
@@ -51,6 +88,7 @@ static int init_vas_instance(struct platform_device *pdev)
 	mutex_init(&vinst->mutex);
 	vinst->vas_id = vasid;
 	vinst->pdev = pdev;
+	vinst->irq_port = port;
 
 	res = &pdev->resource[0];
 	vinst->hvwc_bar_start = res->start;
@@ -66,12 +104,23 @@ static int init_vas_instance(struct platform_device *pdev)
 		pr_err("Bad 'paste_win_id_shift' in DT, %llx\n", res->end);
 		goto free_vinst;
 	}
-
 	vinst->paste_win_id_shift = 63 - res->end;
 
-	pr_devel("Initialized instance [%s, %d], paste_base 0x%llx, "
-			"paste_win_id_shift 0x%llx\n", pdev->name, vasid,
-			vinst->paste_base_addr, vinst->paste_win_id_shift);
+	/* interrupts property */
+	if (pdev->num_resources == 5) {
+		res = &pdev->resource[4];
+		vinst->virq = res->start;
+		if (vinst->virq <= 0) {
+			pr_err("IRQ resource is not available for [%s, %d]\n",
+				pdev->name, vasid);
+			vinst->virq = 0;
+		}
+	}
+
+	pr_devel("Initialized instance [%s, %d] paste_base 0x%llx paste_win_id_shift 0x%llx IRQ %d Port 0x%llx\n",
+			pdev->name, vasid, vinst->paste_base_addr,
+			vinst->paste_win_id_shift, vinst->virq,
+			vinst->irq_port);
 
 	for_each_possible_cpu(cpu) {
 		if (cpu_to_chip_id(cpu) == of_get_ibm_chip_id(dn))
@@ -82,6 +131,13 @@ static int init_vas_instance(struct platform_device *pdev)
 	list_add(&vinst->node, &vas_instances);
 	mutex_unlock(&vas_mutex);
 
+	/*
+	 * IRQ and fault handling setup is needed only for user space
+	 * send windows.
+	 */
+	if (vinst->virq)
+		vas_irq_fault_handle_setup(vinst);
+
 	vas_instance_init_dbgdir(vinst);
 
 	dev_set_drvdata(&pdev->dev, vinst);
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 9cc5251..bf7d3db 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -313,6 +313,8 @@ struct vas_instance {
 	u64 paste_base_addr;
 	u64 paste_win_id_shift;
 
+	u64 irq_port;
+	int virq;
 	struct mutex mutex;
 	struct vas_window *rxwin[VAS_COP_TYPE_MAX];
 	struct vas_window *windows[VAS_WINDOWS_PER_CHIP];
-- 
1.8.3.1



