Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF65C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:15:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E4382071E
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:15:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfK0BP0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:15:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:45672 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfK0BP0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:15:26 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR1C9u0042052;
        Tue, 26 Nov 2019 20:15:15 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpur4n-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:15:15 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR1CAw0042166;
        Tue, 26 Nov 2019 20:15:15 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpur3s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:15:15 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1A3p4031548;
        Wed, 27 Nov 2019 01:15:14 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma02wdc.us.ibm.com with ESMTP id 2wevd6ran5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:15:14 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR1FD7x49283548
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:15:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 98A8528059;
        Wed, 27 Nov 2019 01:15:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DBCA828058;
        Wed, 27 Nov 2019 01:15:12 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:15:12 +0000 (GMT)
Subject: [PATCH 12/14] powerpc/VAS: Return credits after handling fault
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:13:54 -0800
Message-ID: <1574817234.13250.20.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=596 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270008
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


NX expects OS to return credit for send window after processing each
fault. Also credit has to be returned even for fault window.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  |  9 +++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 17 +++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  1 +
 3 files changed, 27 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index ad594c8..2a3ee9f 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -244,6 +244,10 @@ static void process_fault_crbs(struct vas_instance *vinst)
 		memset(fifo, 0, CRB_SIZE);
 		mutex_unlock(&vinst->mutex);
 
+		/*
+		 * Return credit for the fault window.
+		 */
+		vas_return_credit(vinst->fault_win, 0);
 		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d pending %d\n",
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				vinst->fault_crbs,
@@ -270,6 +274,11 @@ static void process_fault_crbs(struct vas_instance *vinst)
 		}
 
 		update_csb(window, crb);
+		/*
+		 * Return credit for send window after processing
+		 * fault CRB.
+		 */
+		vas_return_credit(window, 1);
 	} while (true);
 }
 
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index ca208a3..1c0788c 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1323,6 +1323,23 @@ int vas_win_close(struct vas_window *window)
 EXPORT_SYMBOL_GPL(vas_win_close);
 
 /*
+ * Return credit for the given window.
+ */
+void vas_return_credit(struct vas_window *window, bool tx)
+{
+	uint64_t val;
+
+	val = 0ULL;
+	if (tx) { /* send window */
+		val = SET_FIELD(VAS_TX_WCRED, val, 1);
+		write_hvwc_reg(window, VREG(TX_WCRED_ADDER), val);
+	} else {
+		val = SET_FIELD(VAS_LRX_WCRED, val, 1);
+		write_hvwc_reg(window, VREG(LRX_WCRED_ADDER), val);
+	}
+}
+
+/*
  * Return a system-wide unique window id for the window @win.
  */
 u32 vas_win_id(struct vas_window *win)
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 75bea1d..b8b90f3 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -421,6 +421,7 @@ struct vas_winctx {
 extern void vas_wakeup_fault_handler(int virq, void *arg);
 extern int vas_setup_fault_handler(struct vas_instance *vinst);
 extern void vas_cleanup_fault_handler(struct vas_instance *vinst);
+extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
-- 
1.8.3.1



