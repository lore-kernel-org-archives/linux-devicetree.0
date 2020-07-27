Return-Path: <SRS0=xnVj=BG=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B0C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 12:41:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E8EC2074F
	for <linux-devicetree@archiver.kernel.org>; Mon, 27 Jul 2020 12:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgG0Ml3 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 27 Jul 2020 08:41:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:46470 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728125AbgG0Ml3 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 27 Jul 2020 08:41:29 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06RCW4qG189784;
        Mon, 27 Jul 2020 08:41:24 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32hs8t2mvn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 08:41:24 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
        by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RCeLGY028030;
        Mon, 27 Jul 2020 12:41:21 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma02fra.de.ibm.com with ESMTP id 32gcq0sbs0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 27 Jul 2020 12:41:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06RCfJBi19988984
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 27 Jul 2020 12:41:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7757E11C04A;
        Mon, 27 Jul 2020 12:41:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7584311C058;
        Mon, 27 Jul 2020 12:41:18 +0000 (GMT)
Received: from [9.85.68.232] (unknown [9.85.68.232])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 27 Jul 2020 12:41:18 +0000 (GMT)
From:   vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: [PATCH 1/2] rainier: Add leds that are off 9551 on Operator Panel
Message-Id: <125895BF-8477-4107-9A80-47A5128D296C@linux.vnet.ibm.com>
Date:   Mon, 27 Jul 2020 18:10:45 +0530
Cc:     vishwanatha subbanna <vishwa@linux.vnet.ibm.com>
To:     openbmc@lists.ozlabs.org, joel@jms.id.au, eajames@linux.ibm.com,
        devicetree@vger.kernel.org
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-27_08:2020-07-27,2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 mlxlogscore=974 priorityscore=1501
 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270090
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


These are LEDs that are controlled by 9551

Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
---
arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 82 ++++++++++++++++++++++++++++
1 file changed, 82 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0b5c6cc..ecbce50 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -69,6 +69,38 @@
		};
	};

+	leds {
+		compatible = "gpio-leds";
+
+		/* System ID LED that is at front on Op Panel */
+		front-sys-id0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System Attention Indicator ID LED that is at front on Op Panel */
+		front-check-log0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		/* Enclosure Fault LED that is at front on Op Panel */
+		front-enc-fault1 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 2 GPIO_ACTIVE_LOW>;
+		};
+
+		/* System PowerOn LED that is at front on Op Panel */
+		front-sys-pwron0 {
+			retain-state-shutdown;
+			default-state = "keep";
+			gpios = <&pca1 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
};

&gpio0 {
@@ -514,6 +546,56 @@
		};
	};

+	pca1: pca9551@60 {
+		compatible = "nxp,pca9551";
+		reg = <0x60>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		gpio@0 {
+			reg = <0>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@1 {
+			reg = <1>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@2 {
+			reg = <2>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@3 {
+			reg = <3>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@4 {
+			reg = <4>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@5 {
+			reg = <5>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@6 {
+			reg = <6>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+
+		gpio@7 {
+			reg = <7>;
+			type = <PCA955X_TYPE_GPIO>;
+		};
+	};
+
	dps: dps310@76 {
		compatible = "infineon,dps310";
		reg = <0x76>;
-- 
1.8.3.1



