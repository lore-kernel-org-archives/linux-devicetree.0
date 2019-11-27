Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71374C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:13:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CB632071E
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:13:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfK0BN6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:13:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43018 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725794AbfK0BN5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:13:57 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR1CGq9022652;
        Tue, 26 Nov 2019 20:13:42 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2whcxqur6d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:13:42 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR1DgD8025434;
        Tue, 26 Nov 2019 20:13:42 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2whcxqur62-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:13:42 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1A3X9024502;
        Wed, 27 Nov 2019 01:13:41 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma01dal.us.ibm.com with ESMTP id 2wevd6rdp8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:13:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR1De2Y47907078
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:13:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 512CF112062;
        Wed, 27 Nov 2019 01:13:40 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 95F88112061;
        Wed, 27 Nov 2019 01:13:39 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:13:39 +0000 (GMT)
Subject: [PATCH 10/14] powerpc/vas: Print CRB and FIFO values
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:12:21 -0800
Message-ID: <1574817141.13250.18.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=847 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270008
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Dump FIFO values if could not find send window and print CRB for
debugging.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/platforms/powernv/vas-fault.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
index dd27649..ad594c8 100644
--- a/arch/powerpc/platforms/powernv/vas-fault.c
+++ b/arch/powerpc/platforms/powernv/vas-fault.c
@@ -36,6 +36,27 @@ void vas_wakeup_fault_handler(int virq, void *arg)
 	wake_up(&vinst->fault_wq);
 }
 
+static void dump_crb(struct coprocessor_request_block *crb)
+{
+	struct data_descriptor_entry *dde;
+	struct nx_fault_stamp *nx;
+
+	dde = &crb->source;
+	pr_devel("SrcDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	dde = &crb->target;
+	pr_devel("TgtDDE: addr 0x%llx, len %d, count %d, idx %d, flags %d\n",
+		be64_to_cpu(dde->address), be32_to_cpu(dde->length),
+		dde->count, dde->index, dde->flags);
+
+	nx = &crb->stamp.nx;
+	pr_devel("NX Stamp: PSWID 0x%x, FSA 0x%llx, flags 0x%x, FS 0x%x\n",
+		be32_to_cpu(nx->pswid), crb_nx_fault_addr(crb),
+		nx->flags, be32_to_cpu(nx->fault_status));
+}
+
 static void notify_process(pid_t pid, u64 fault_addr)
 {
 	int rc;
@@ -154,6 +175,23 @@ static void update_csb(struct vas_window *window,
 	}
 }
 
+static void dump_fifo(struct vas_instance *vinst)
+{
+	int i;
+	unsigned long *fifo = vinst->fault_fifo;
+
+	pr_err("Fault fifo size %d, max crbs %d, crb size %lu\n",
+			vinst->fault_fifo_size,
+			vinst->fault_fifo_size / CRB_SIZE,
+			sizeof(struct coprocessor_request_block));
+
+	pr_err("Fault FIFO Dump:\n");
+	for (i = 0; i < 64; i += 4, fifo += 4) {
+		pr_err("[%.3d, %p]: 0x%.16lx 0x%.16lx 0x%.16lx 0x%.16lx\n",
+			i, fifo, *fifo, *(fifo+1), *(fifo+2), *(fifo+3));
+	}
+}
+
 /*
  * Process CRBs that we receive on the fault window.
  */
@@ -211,6 +249,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 				vinst->fault_crbs,
 				atomic_read(&vinst->pending_fault));
 
+		dump_crb(crb);
 		window = vas_pswid_to_window(vinst, crb_nx_pswid(crb));
 
 		if (IS_ERR(window)) {
@@ -220,6 +259,7 @@ static void process_fault_crbs(struct vas_instance *vinst)
 			 * even clean it up (return credit).
 			 * But we should not get here.
 			 */
+			dump_fifo(vinst);
 			pr_err("VAS[%d] fault_fifo %p, fifo %p, pswid 0x%x, fault_crbs %d, pending %d bad CRB?\n",
 				vinst->vas_id, vinst->fault_fifo, fifo,
 				crb_nx_pswid(crb), vinst->fault_crbs,
-- 
1.8.3.1



