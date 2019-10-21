Return-Path: <SRS0=tRzh=YO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B1DCA9EB0
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 401C32070B
	for <linux-devicetree@archiver.kernel.org>; Mon, 21 Oct 2019 14:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="nXUr7mZH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbfJUOJQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 21 Oct 2019 10:09:16 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:18612 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728851AbfJUOJQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 21 Oct 2019 10:09:16 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x9LE7o5v004219;
        Mon, 21 Oct 2019 10:07:53 -0400
Received: from nam01-sn1-obe.outbound.protection.outlook.com (mail-sn1nam01lp2055.outbound.protection.outlook.com [104.47.32.55])
        by mx0b-00128a01.pphosted.com with ESMTP id 2vqv8akt8s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 21 Oct 2019 10:07:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaq5rTSzqDTy3LjjfU5cINhRylgSGFcE69AU7lcgELuhDBK56uAtDremftWS9iTqC/QabC/I7SRW9rpa0L7kXs6CBmxubZsST+ER/eFX79A0ZqcRgbr5wPr/cm8pYZzFB8TkWquKc7Q/b44eupCHhTMWcSXqVrhHVmNMA6PY5SFor6izjP5yTbFJdvLgeDNpt6+cKLCkvJsbMTaJrBkOtbuQ8AxmR1zcPTF8IPUUbWuR3v0TulpVBcuyek+j2ZbQ5QT60BZj9dSC2J0h61KXWZam9K3IHU7w6g3jP16J6svuZaGp3LkQl7A2CLG+zpaiNozIcIAsDyeTXbEq9ijkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+i6sGtZxvcrwzX4SjQToH0Dizu5BMKV9kHoANdcp44=;
 b=mZK1sRBdI2cys8VjvkOsYb1Nbh4yif5T0Gp5w/GH5UYOSgJMcTTYqIe/DBB/Sj6P37Jlezq7h1ctde0r3+yC3znQPPqo7+tvchDqgrh16bZI9Pp4VX3kAobAK+c8WtINzlwVZNH9YTzqeqL2fgBp0Mo6H25Fio0Crk6kn0MqUX/d9EZVvvd8hTvdplBZ6TEnLwbWAXCCWJbPk3H8aALTcxlqAMPOHQLHh5NLlZBohHPByTJBxQMh7Yncx5rkzKRrZaJSBEVoIbXtzZCeKms1yRaITjskHna+i8Y20ZGdkftHf9JO4dMN5zVywi729fTSA/ODO881cUTjINqijLCS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=gmail.com smtp.mailfrom=analog.com;
 dmarc=bestguesspass action=none header.from=analog.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+i6sGtZxvcrwzX4SjQToH0Dizu5BMKV9kHoANdcp44=;
 b=nXUr7mZHWxhteC+A1+Cwae7W3PZl5Q1/G/R7k+ggMQVfnvwn1RVpymj76pbqhtD2L2VC7xdFB1NP7Kn4+uYaIuFe+Vrn/9VBMMxUYr+9DBnFkVFKejQlo4SC0BJUQNmK42bAvfFThMFR2KCLFoiqw+7Z31Uc6JAfCFFEztBrl9E=
Received: from DM6PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:100::31)
 by CY4PR03MB2855.namprd03.prod.outlook.com (2603:10b6:903:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.24; Mon, 21 Oct
 2019 14:07:52 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::206) by DM6PR03CA0054.outlook.office365.com
 (2603:10b6:5:100::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2367.21 via Frontend
 Transport; Mon, 21 Oct 2019 14:07:52 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2367.14
 via Frontend Transport; Mon, 21 Oct 2019 14:07:51 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com [10.64.69.107])
        by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id x9LE7iIG013900
        (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
        Mon, 21 Oct 2019 07:07:44 -0700
Received: from nsa.sphairon.box (10.44.3.90) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 21 Oct
 2019 10:07:50 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>
CC:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: asoc: adau7118: Cleanup
Date:   Mon, 21 Oct 2019 16:08:15 +0200
Message-ID: <20191021140816.262401-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021140816.262401-1-nuno.sa@analog.com>
References: <20191021140816.262401-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.44.3.90]
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(446003)(246002)(86362001)(1076003)(356004)(6666004)(50466002)(478600001)(8676002)(8936002)(50226002)(70206006)(426003)(45776006)(70586007)(5820100001)(126002)(486006)(476003)(11346002)(186003)(53416004)(5660300002)(2616005)(26005)(16526019)(336012)(47776003)(76176011)(23676004)(3846002)(7736002)(305945005)(7636002)(6116002)(4326008)(36756003)(2870700001)(106002)(2906002)(54906003)(110136005)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:CY4PR03MB2855;H:nwd2mta2.analog.com;FPR:;SPF:Pass;LANG:en;PTR:nwd2mail11.analog.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8842ffd0-e0ee-4181-74de-08d756300fd2
X-MS-TrafficTypeDiagnostic: CY4PR03MB2855:
X-Microsoft-Antispam-PRVS: <CY4PR03MB28552A51997644968AD7A70899690@CY4PR03MB2855.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-Forefront-PRVS: 0197AFBD92
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8o6ecUpMD5MzBKQ4hRaM6ccNitxNem/R5tW3tASw3x7rBrTLnFXnxdrI9Y10Jqc6n0Tzp9y22p86D61Kq6Y0OIkM1xy6oXEU4NFNWV5QKvbWFWJ33KvkCv3i+55S6uJkZNs6AEdz7YWA0k/R9fGQ3b6XwAHYyzkDXk7niN3BFEiDburMmcCUzJ6jHfATiyc4ljlz6AgnzqIykgtT85j9VH41LsjlUbZpg61InOzxqRnCFSH1G9B7rXK61Mf7L93+h1s1JO7JYe7zwlt2xTjHsZHNpBktjaRcOmkxx6nkJkOBSaBwv6sSGWS4kp8BOzWhxjDPQhERVkMMgQWghpey5OYRuyHrReWDEfgDlcrYqbWNWe/DNsntzSBfxIHEVgeMvcjXNthdGXMYDTG7VUc1udpys8PllL8Z+yeStfflvgDE+iaHRUxOmmyf0d5kz7E
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2019 14:07:51.7432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8842ffd0-e0ee-4181-74de-08d756300fd2
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a;Ip=[137.71.25.57];Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2855
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910210134
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This changes are in accordance with the review done to this bindings.
This is a follow-up patch to 969d49b2cdc8.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../bindings/sound/adi,adau7118.yaml          | 25 ++++++++-----------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
index cfcef602b3d9..c3f10afbdd6f 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
@@ -26,13 +26,11 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  IOVDD-supply:
+  iovdd-supply:
     description: Digital Input/Output Power Supply.
-    $ref: "/schemas/types.yaml#/definitions/phandle"
 
-  DVDD-supply:
+  dvdd-supply:
     description: Internal Core Digital Power Supply.
-    $ref: "/schemas/types.yaml#/definitions/phandle"
 
   adi,decimation-ratio:
     description: |
@@ -58,23 +56,21 @@ properties:
 required:
   - "#sound-dai-cells"
   - compatible
-  - IOVDD-supply
-  - DVDD-supply
+  - iovdd-supply
+  - dvdd-supply
 
 examples:
   - |
-    i2c0 {
+    i2c {
         /* example with i2c support */
         #address-cells = <1>;
         #size-cells = <0>;
-        status = "okay";
-        adau7118_codec: adau7118-codec@14 {
+        adau7118_codec: audio-codec@14 {
                 compatible = "adi,adau7118";
                 reg = <14>;
                 #sound-dai-cells = <0>;
-                status = "okay";
-                IOVDD-supply = <&supply>;
-                DVDD-supply = <&supply>;
+                iovdd-supply = <&supply>;
+                dvdd-supply = <&supply>;
                 adi,pdm-clk-map = <1 1 0 0>;
                 adi,decimation-ratio = <16>;
         };
@@ -84,7 +80,6 @@ examples:
     adau7118_codec_hw: adau7118-codec-hw {
             compatible = "adi,adau7118";
             #sound-dai-cells = <0>;
-            status = "okay";
-            IOVDD-supply = <&supply>;
-            DVDD-supply = <&supply>;
+            iovdd-supply = <&supply>;
+            dvdd-supply = <&supply>;
     };
-- 
2.23.0

