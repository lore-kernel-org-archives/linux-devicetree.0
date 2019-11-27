Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19619C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:10:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D022E2068E
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:10:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfK0BKv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:10:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:16582 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfK0BKv (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:10:51 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR1951l043514;
        Tue, 26 Nov 2019 20:10:38 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqunrg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:10:37 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR1AbWM047007;
        Tue, 26 Nov 2019 20:10:37 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxqunrb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:10:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1A3RV024508;
        Wed, 27 Nov 2019 01:10:36 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma01dal.us.ibm.com with ESMTP id 2wevd6rd1k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:10:36 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR1AZ6h41419078
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:10:35 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 55E1A124052;
        Wed, 27 Nov 2019 01:10:35 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A566F124053;
        Wed, 27 Nov 2019 01:10:34 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:10:34 +0000 (GMT)
Subject: [PATCH 07/14] powerpc/vas: Read and process fault CRBs
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:09:16 -0800
Message-ID: <1574816956.13250.13.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270007
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


NX pastes CRB in fault FIFO and generates interrupt whenever faults
on CRB. OS reads CRBs from fault FIFO and process them by setting
faulting address in fault_storge_addr in CRB and update CSB. When CSB
status is changed, process sends NX request after touching the fault
address.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 81 +++++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 51 ++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  3 ++
 3 files changed, 135 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index c6c105c..7a8b2b5 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <linux/kthread.h>
 #include <linux/sched/signal.h>
+#include <linux/mmu_context.h>
 #include <asm/icswx.h>
 
 #include "vas.h"
@@ -36,6 +37,84 @@ void vas_wakeup_fault_handler(int virq, void *arg)
 }
 
 /*
+ * Process CRBs that we receive on the fault window.
+ */
+static void process_fault_crbs(struct vas_instance *vinst)
+{
+	void *fifo;
+	struct vas_window *window;
+	struct coprocessor_request_block buf;
+	struct coprocessor_request_block *crb;
+	u64 csb_addr;
+
+	crb = &buf;
+
+	/*
+	 * VAS can interrupt with multiple page faults. So process all
+	 * valid CRBs within fault FIFO until reaches invalid CRB.
+	 * For valid CRBs, csb_addr should be valid address points to CSB
+	 * section within CRB. After reading CRB entry, it is reset with
+	 * 0's in fault FIFO.
+	 *
+	 * In case kernel receives another interrupt with different page
+	 * fault and is processed by the previous handling, will be returned
+	 * from this function when it sees invalid CRB (means 0's).
+	 */
+	do {
+		mutex_lock(&vinst->mutex);
+
+		/*
+		 * Advance the fault fifo pointer to next CRB.
+		 * Use CRB_SIZE rather than sizeof(*crb) since the latter is
+		 * aligned to CRB_ALIGN (256) but the CRB written to by VAS is
+		 * only CRB_SIZE in len.
+		 */
+		fifo = vinst->fault_fifo + (vinst->fault_crbs * CRB_SIZE);
+		csb_addr = ((struct coprocessor_request_block *)fifo)->csb_addr;
+
+		/*
+		 * Return if reached invalid CRB.
+		 */
+		if (!csb_addr) {
+			mutex_unlock(&vinst->mutex);
+			return;
+		}
+
+		vinst->fault_crbs++;
+		if (vinst->fault_crbs == vinst->fault_fifo_size/CRB_SIZE)
+			vinst->fault_crbs = 0;
+
+		memcpy(crb, fifo, CRB_SIZE);
+		memset(fifo, 0, CRB_SIZE);
+		mutex_unlock(&vinst->mutex);
+
+		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d pending %d\n",
+				vinst->vas_id, vinst->fault_fifo, fifo,
+				vinst->fault_crbs,
+				atomic_read(&vinst->pending_fault));
+
+		window = vas_pswid_to_window(vinst, crb_nx_pswid(crb));
+
+		if (IS_ERR(window)) {
+			/*
+			 * What now? We got an interrupt about a specific send
+			 * window but we can't find that window and we can't
+			 * even clean it up (return credit).
+			 * But we should not get here.
+			 */
+			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d, pending %d bad CRB?\n",
+				vinst->vas_id, vinst->fault_fifo, fifo,
+				crb_nx_pswid(crb), vinst->fault_crbs,
+				atomic_read(&vinst->pending_fault));
+
+			WARN_ON_ONCE(1);
+			return;
+		}
+
+	} while (true);
+}
+
+/*
  * Fault handler thread for each VAS instance and process fault CRBs.
  */
 static int fault_handler_func(void *arg)
@@ -54,6 +133,8 @@ static int fault_handler_func(void *arg)
 			break;
 
 		atomic_dec(&vinst->pending_fault);
+		process_fault_crbs(vinst);
+
 	} while (!kthread_should_stop());
 
 	return 0;
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 5f1faeb..7fc1542 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1294,3 +1294,54 @@ u32 vas_win_id(struct vas_window *win)
 	return encode_pswid(win->vinst->vas_id, win->winid);
 }
 EXPORT_SYMBOL_GPL(vas_win_id);
+
+struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+		uint32_t pswid)
+{
+	int winid;
+	struct vas_window *window;
+
+	if (!pswid) {
+		pr_devel("%s: called for pswid 0!\n", __func__);
+		return ERR_PTR(-ESRCH);
+	}
+
+	decode_pswid(pswid, NULL, &winid);
+
+	if (winid >= VAS_WINDOWS_PER_CHIP)
+		return ERR_PTR(-ESRCH);
+
+	/*
+	 * If application closes the window before the hardware
+	 * returns the fault CRB, we should wait in vas_win_close()
+	 * for the pending requests. so the window must be active
+	 * and the process alive.
+	 *
+	 * If its a kernel process, we should not get any faults and
+	 * should not get here.
+	 */
+	window = vinst->windows[winid];
+
+	if (!window) {
+		pr_err("PSWID decode: Could not find window for winid %d pswid %d vinst 0x%p\n",
+			winid, pswid, vinst);
+		return NULL;
+	}
+
+	/*
+	 * Do some sanity checks on the decoded window.  Window should be
+	 * NX GZIP user send window. FTW windows should not incur faults
+	 * since their CRBs are ignored (not queued on FIFO or processed
+	 * by NX).
+	 */
+	if (!window->tx_win || !window->user_win || !window->nx_win ||
+			window->cop == VAS_COP_TYPE_FAULT ||
+			window->cop == VAS_COP_TYPE_FTW) {
+		pr_err("PSWID decode: id %d, tx %d, user %d, nx %d, cop %d\n",
+			winid, window->tx_win, window->user_win,
+			window->nx_win, window->cop);
+		WARN_ON(1);
+	}
+
+	return window;
+}
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index ee284b3..eb929c7 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -317,6 +317,7 @@ struct vas_instance {
 	int virq;
 	int fault_fifo_size;
 	void *fault_fifo;
+	int fault_crbs;
 	atomic_t pending_fault;
 	wait_queue_head_t fault_wq;
 	struct task_struct *fault_handler;
@@ -420,6 +421,8 @@ struct vas_winctx {
 extern void vas_wakeup_fault_handler(int virq, void *arg);
 extern int vas_setup_fault_handler(struct vas_instance *vinst);
 extern void vas_cleanup_fault_handler(struct vas_instance *vinst);
+extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
+						uint32_t pswid);
 
 static inline void vas_log_write(struct vas_window *win, char *name,
 			void *regptr, u64 val)
-- 
1.8.3.1



