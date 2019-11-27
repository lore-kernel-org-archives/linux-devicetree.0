Return-Path: <SRS0=XuEv=ZT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DD7C432C3
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CD10206CC
	for <linux-devicetree@archiver.kernel.org>; Wed, 27 Nov 2019 01:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbfK0BFD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 26 Nov 2019 20:05:03 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43010 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725851AbfK0BFD (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 26 Nov 2019 20:05:03 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAR13wkY105065;
        Tue, 26 Nov 2019 20:04:48 -0500
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3hkb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:04:47 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xAR14lmj107105;
        Tue, 26 Nov 2019 20:04:47 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxq3hk0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Nov 2019 20:04:47 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAR1015e022360;
        Wed, 27 Nov 2019 01:04:46 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma03wdc.us.ibm.com with ESMTP id 2wevd6g80u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Nov 2019 01:04:46 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id xAR14kTF35717422
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Nov 2019 01:04:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A9A2112062;
        Wed, 27 Nov 2019 01:04:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id BC355112061;
        Wed, 27 Nov 2019 01:04:45 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Wed, 27 Nov 2019 01:04:45 +0000 (GMT)
Subject: [PATCH 02/14] Revert "powerpc/powernv: remove the unused
 vas_win_paste_addr and vas_win_id functions"
From:   Haren Myneni <haren@linux.vnet.ibm.com>
To:     linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
        mpe@ellerman.id.au, npiggin@gmail.com, mikey@neuling.org,
        herbert@gondor.apana.org.au
Cc:     sukadev@linux.vnet.ibm.com, hbabu@us.ibm.com
Content-Type: text/plain; charset="UTF-8"
Date:   Tue, 26 Nov 2019 17:03:27 -0800
Message-ID: <1574816607.13250.6.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270006
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


This reverts commit 452d23c0f6bd97f2fd8a9691fee79b76040a0feb.

User space send windows (NX GZIP compression) need vas_win_paste_addr()
to mmap window paste address and vas_win_id() to get window ID when
window address is given.

Added vas_win_id() and vas_win_paste_addr() with:
commit 61f3cca8cda97 ("powerpc/vas: Define vas_win_id()")
commit 5676be2fb7035 ("powerpc/vas: Define vas_win_paste_addr()")

Signed-off-by:Haren Myneni <haren@us.ibm.com>
---
 arch/powerpc/include/asm/vas.h              | 10 ++++++++++
 arch/powerpc/platforms/powernv/vas-window.c | 19 +++++++++++++++++++
 arch/powerpc/platforms/powernv/vas.h        | 20 ++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index f93e6b0..da0b198 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -163,4 +163,14 @@ struct vas_window *vas_tx_win_open(int vasid, enum vas_cop_type cop,
  */
 int vas_paste_crb(struct vas_window *win, int offset, bool re);
 
+/*
+ * Return a system-wide unique id for the VAS window @win.
+ */
+extern u32 vas_win_id(struct vas_window *win);
+
+/*
+ * Return the power bus paste address associated with @win so the caller
+ * can map that address into their address space.
+ */
+extern u64 vas_win_paste_addr(struct vas_window *win);
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 0c0d27d..ea5ca02 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -40,6 +40,16 @@ static void compute_paste_address(struct vas_window *window, u64 *addr, int *len
 	pr_debug("Txwin #%d: Paste addr 0x%llx\n", winid, *addr);
 }
 
+u64 vas_win_paste_addr(struct vas_window *win)
+{
+	u64 addr;
+
+	compute_paste_address(win, &addr, NULL);
+
+	return addr;
+}
+EXPORT_SYMBOL(vas_win_paste_addr);
+
 static inline void get_hvwc_mmio_bar(struct vas_window *window,
 			u64 *start, int *len)
 {
@@ -1254,3 +1264,12 @@ int vas_win_close(struct vas_window *window)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(vas_win_close);
+
+/*
+ * Return a system-wide unique window id for the window @win.
+ */
+u32 vas_win_id(struct vas_window *win)
+{
+	return encode_pswid(win->vinst->vas_id, win->winid);
+}
+EXPORT_SYMBOL_GPL(vas_win_id);
diff --git a/arch/powerpc/platforms/powernv/vas.h b/arch/powerpc/platforms/powernv/vas.h
index 5574aec..9cc5251 100644
--- a/arch/powerpc/platforms/powernv/vas.h
+++ b/arch/powerpc/platforms/powernv/vas.h
@@ -444,6 +444,26 @@ static inline u64 read_hvwc_reg(struct vas_window *win,
 	return in_be64(win->hvwc_map+reg);
 }
 
+/*
+ * Encode/decode the Partition Send Window ID (PSWID) for a window in
+ * a way that we can uniquely identify any window in the system. i.e.
+ * we should be able to locate the 'struct vas_window' given the PSWID.
+ *
+ *	Bits	Usage
+ *	0:7	VAS id (8 bits)
+ *	8:15	Unused, 0 (3 bits)
+ *	16:31	Window id (16 bits)
+ */
+static inline u32 encode_pswid(int vasid, int winid)
+{
+	u32 pswid = 0;
+
+	pswid |= vasid << (31 - 7);
+	pswid |= winid;
+
+	return pswid;
+}
+
 static inline void decode_pswid(u32 pswid, int *vasid, int *winid)
 {
 	if (vasid)
-- 
1.8.3.1



