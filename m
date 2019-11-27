Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22CFC432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BF9DA20835
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbfK0BGL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:06:11 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:29002 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725794AbfK0BGL (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:06:11 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR12JYs130909;
        Tue, 26 Nov 2019 20:05:57 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpugxq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:05:57 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR13bHW133590;
        Tue, 26 Nov 2019 20:05:57 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpugx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:05:57 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR15tDJ028901;
        Wed, 27 Nov 2019 01:05:56 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma03wdc.us.ibm.com with ESMTP id 2wevd6g883-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:05:56 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR15tRo48431392
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:05:55 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A0F50AC05B;
        Wed, 27 Nov 2019 01:05:55 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E81BFAC059;
        Wed, 27 Nov 2019 01:05:54 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:05:54 +0000 (GMT)
Subject: [PATCH 03/14] powerpc/vas: Define nx_fault_stamp in
 coprocessor_request_block
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:04:36 -0800
Message-ID: <1574816676.13250.8.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=896 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270006
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Kernel sets fault address and status in CRB for NX page fault on user
space address after processing page fault. User space gets the signal
and handles the fault mentioned in CRB by bringing the page in to
memory and send NX request again.

Signed-off-by: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/include/asm/icswx.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
index 9872f85..c071471 100644
--- a/arch/powerpc/include/asm/icswx.h
+++ b/arch/powerpc/include/asm/icswx.h
@@ -108,6 +108,21 @@ struct data_descriptor_entry {
 	__be64 address;
 } __packed __aligned(DDE_ALIGN);
 
+/* 4.3.2 NX-stamped Fault CRB */
+
+#define NX_STAMP_ALIGN          (0x10)
+
+#define NX_STAMP_ACCESS_MASK    (0x01)
+#define NX_STAMP_ACCESS_READ    0
+#define NX_STAMP_ACCESS_WRITE   1
+
+struct nx_fault_stamp {
+	__be64 fault_storage_addr;
+	__be16 reserved;
+	__u8   flags;
+	__u8   fault_status;
+	__be32 pswid;
+} __packed __aligned(NX_STAMP_ALIGN);
 
 /* Chapter 6.5.2 Coprocessor-Request Block (CRB) */
 
@@ -135,11 +150,26 @@ struct coprocessor_request_block {
 
 	struct coprocessor_completion_block ccb;
 
-	u8 reserved[48];
+	union {
+		struct nx_fault_stamp nx;
+		u8 reserved[16];
+	} stamp;
+
+	u8 reserved[32];
 
 	struct coprocessor_status_block csb;
 } __packed __aligned(CRB_ALIGN);
 
+#define crb_csb_addr(c)		__be64_to_cpu(c->csb_addr)
+#define crb_nx_fault_addr(c)	__be64_to_cpu(c->stamp.nx.fault_storage_addr)
+#define crb_nx_flags(c)		c->stamp.nx.flags
+#define crb_nx_fault_status(c)	c->stamp.nx.fault_status
+
+static inline uint32_t crb_nx_pswid(struct coprocessor_request_block *crb)
+{
+	return __be32_to_cpu(crb->stamp.nx.pswid);
+}
+
 
 /* RFC02167 Initiate Coprocessor Instructions document
  * Chapter 8.2.1.1.1 RS
-- 
1.8.3.1



