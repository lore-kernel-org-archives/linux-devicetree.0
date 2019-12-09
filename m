Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB81C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 03:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D337020663
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 03:37:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfLIDhy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 8 Dec 2019 22:37:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41064 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726748AbfLIDhy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 8 Dec 2019 22:37:54 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xB93b1lI163773;
        Sun, 8 Dec 2019 22:37:40 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wr8kvnyju-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 08 Dec 2019 22:37:40 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xB93bLl8164294;
        Sun, 8 Dec 2019 22:37:39 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2wr8kvnyj7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 08 Dec 2019 22:37:39 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB93VfgE004749;
        Mon, 9 Dec 2019 03:37:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma04wdc.us.ibm.com with ESMTP id 2wr3q5ya7x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 09 Dec 2019 03:37:37 +0000
Received: from b03ledav003.gho.boulder.ibm.com (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xB93bZi753018938
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 9 Dec 2019 03:37:35 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 69BFF6A051;
        Mon,  9 Dec 2019 03:37:35 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 06D3C6A047;
        Mon,  9 Dec 2019 03:37:35 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  9 Dec 2019 03:37:34 +0000 (GMT)
Subject: [PATCH V2 11/13] powerpc/vas: Return credits after handling fault
From:   Haren Myneni <haren@linux.ibm.com>
To:     mpe@ellerman.id.au
Cc:     hch@infradead.org, mikey@neuling.org, npiggin@gmail.com,
        herbert@gondor.apana.org.au, linuxppc-dev@lists.ozlabs.org,
        devicetree@vger.kernel.org, sukadev@linux.vnet.ibm.com
In-Reply-To: <1575861522.16318.9.camel@hbabu-laptop>
References: <1575861522.16318.9.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date:   Sun, 08 Dec 2019 19:35:56 -0800
Message-ID: <1575862556.16318.29.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-08_07:2019-12-05,2019-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=592
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912090030
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


NX expects OS to return credit for send window after processing each
fault. Also credit has to be returned even for fault window.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c  | 10 ++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 17 +++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        |  1 +
 3 files changed, 28 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index cf41b65..926fdf3 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -247,6 +247,11 @@ irqreturn_t vas_fault_handler(int irq, void *data)
 		memset(fifo, 0, CRB_SIZE);
 		mutex_unlock(&vinst->mutex);
 
+		/*
+		 * Return credit for the fault window.
+		 */
+		vas_return_credit(vinst->fault_win, 0);
+
 		pr_devel("VAS[%d] fault_fifo %p, fifo %p, fault_crbs %d\n",
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				vinst->fault_crbs);
@@ -273,6 +278,11 @@ irqreturn_t vas_fault_handler(int irq, void *data)
 		}
 
 		update_csb(window, crb);
+		/*
+		 * Return credit for send window after processing
+		 * fault CRB.
+		 */
+		vas_return_credit(window, 1);
 	} while (true);
 
 	return IRQ_HANDLED;
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 941582b..27848d3 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1312,6 +1312,23 @@ int vas_win_close(struct vas_window *window)
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
 
+/*
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
 struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 		uint32_t pswid)
 {
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index d7398b7..6332683 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -415,6 +415,7 @@ struct vas_winctx {
 extern void vas_window_free_dbgdir(struct vas_window *win);
 extern int vas_setup_fault_window(struct vas_instance *vinst);
 extern irqreturn_t vas_fault_handler(int irq, void *data);
+extern void vas_return_credit(struct vas_window *window, bool tx);
 extern struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 						uint32_t pswid);
 
-- 
1.8.3.1



