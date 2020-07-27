Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,WEIRD_QUOTING autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C58C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 12:41:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CCF52074F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 12:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbgG0Mlb convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 08:41:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28096 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728125AbgG0Mla (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 08:41:30 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RCVaku191278;
        Mon, 27 Jul 2020 08:41:25 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32hs0s2xgc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 08:41:24 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
        by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RCaUDd026811;
        Mon, 27 Jul 2020 12:41:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma06ams.nl.ibm.com with ESMTP id 32gcqgj7qe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 12:41:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06RCfKGS26804644
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 12:41:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D120511C052;
        Mon, 27 Jul 2020 12:41:20 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C728611C054;
        Mon, 27 Jul 2020 12:41:19 +0000 (GMT)
Received: from [9.85.68.232] (unknown [9.85.68.232])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 27 Jul 2020 12:41:19 +0000 (GMT)
From:   vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH 2/2] rainier: Add LEDs that are controlled by ASPEED
Message-Id: <FCA5474B-8A73-4D2B-9EF7-8B2E49DDFDD2@linux.vnet.ibm.com>
Date:   Mon, 27 Jul 2020 18:10:51 +0530
Cc:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
To:     devicetree@vger.kernel.org, eajames@linux.ibm.com, joel@jms.id.au,
        openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_07:2020-07-27,2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=937 spamscore=0
 mlxscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270090
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


These are the LEDs that have direct GPIO connection from ASPEED

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 24 ++++++++++++++++++++++--
1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index ecbce50..dc68c49 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -72,6 +72,26 @@
	leds {
		compatible = "gpio-leds";

+		/* BMC Card fault LED at the back */
+		bmc-ingraham0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure ID LED at the back */
+		rear-enc-id0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure fault LED at the back */
+		rear-enc-fault0 {
+			gpios = <&gpio0 ASPEED_GPIO(H, 3) GPIO_ACTIVE_LOW>;
+		};
+
+		/* PCIE slot power LED */
+		pcieslot-power {
+			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+		};
+
		/* System ID LED that is at front on Op Panel */
		front-sys-id0 {
			retain-state-shutdown;
@@ -112,7 +132,7 @@
	/*E0-E7*/	"","","","","","","","",
	/*F0-F7*/	"","","","","","","","",
	/*G0-G7*/	"","","","","","","","",
-	/*H0-H7*/	"","","","","","","","",
+	/*H0-H7*/	"","bmc-ingraham0","rear-enc-id0","rear-enc-fault0","","","","",
	/*I0-I7*/	"","","","","","","","",
	/*J0-J7*/	"","","","","","","","",
	/*K0-K7*/	"","","","","","","","",
@@ -120,7 +140,7 @@
	/*M0-M7*/	"","","","","","","","",
	/*N0-N7*/	"","","","","","","","",
	/*O0-O7*/	"","","","","","","","",
-	/*P0-P7*/	"","","","","","","","",
+	/*P0-P7*/	"","","","","pcieslot-power","","","",
	/*Q0-Q7*/	"cfam-reset","","","","","","","",
	/*R0-R7*/	"","","","","","","","",
	/*S0-S7*/	"presence-ps0","presence-ps1","presence-ps2","presence-ps3",
-- 
1.8.3.1


