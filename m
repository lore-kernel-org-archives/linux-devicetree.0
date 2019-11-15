Return-Path: <SRS0=ud5f=ZH=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157D7C43141
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EF58220748
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 Nov 2019 12:11:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbfKOMLR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 Nov 2019 07:11:17 -0500
Received: from mail-eopbgr730086.outbound.protection.outlook.com ([40.107.73.86]:56352
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727210AbfKOMLR (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Nov 2019 07:11:17 -0500
Received: from CY4PR02CA0009.namprd02.prod.outlook.com (2603:10b6:903:18::19)
 by BY5PR02MB6611.namprd02.prod.outlook.com (2603:10b6:a03:205::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23; Fri, 15 Nov
 2019 12:11:15 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::209) by CY4PR02CA0009.outlook.office365.com
 (2603:10b6:903:18::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.23 via Frontend
 Transport; Fri, 15 Nov 2019 12:11:14 +0000
Authentication-Results: spf=softfail (sender IP is 149.199.60.83)
 smtp.mailfrom=gmail.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 149.199.60.83 as permitted sender)
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2451.23
 via Frontend Transport; Fri, 15 Nov 2019 12:11:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQK-0000L4-6g; Fri, 15 Nov 2019 04:10:00 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQF-0005Ws-24; Fri, 15 Nov 2019 04:09:55 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id xAFC9srV016656;
        Fri, 15 Nov 2019 04:09:54 -0800
Received: from [10.140.6.59] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@gmail.com>)
        id 1iVaQD-0005WA-Pm; Fri, 15 Nov 2019 04:09:54 -0800
From:   shubhrajyoti.datta@gmail.com
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH 2/2] dt-bindings: add documentation of xilinx clocking wizard
Date:   Fri, 15 Nov 2019 17:39:45 +0530
Message-Id: <1573819785-6762-2-git-send-email-shubhrajyoti.datta@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1573819785-6762-1-git-send-email-shubhrajyoti.datta@gmail.com>
References: <1573819785-6762-1-git-send-email-shubhrajyoti.datta@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-Result: No--9.223-7.0-31-1
X-imss-scan-details: No--9.223-7.0-31-1;No--9.223-5.0-31-1
X-TM-AS-User-Approved-Sender: No;No
X-TM-AS-Result-Xfilter: Match text exemption rules:No
X-EOPAttributedMessage: 0
X-Matching-Connectors: 132182934747511531;(f9e945fa-a09a-4caa-7158-08d2eb1d8c44);()
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(396003)(136003)(189003)(199004)(16586007)(76176011)(9786002)(316002)(50226002)(26005)(4326008)(446003)(2906002)(107886003)(11346002)(486006)(2616005)(476003)(126002)(426003)(73392003)(305945005)(498600001)(336012)(76482006)(55446002)(6306002)(5660300002)(450100002)(82202003)(61266001)(47776003)(86362001)(8676002)(70586007)(50466002)(81166006)(81156014)(48376002)(8936002)(51416003)(36756003)(70206006)(356004)(9686003)(6666004);DIR:OUT;SFP:1101;SCL:1;SRVR:BY5PR02MB6611;H:xsj-pvapsmtpgw01;FPR:;SPF:SoftFail;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaac3cd5-3034-45b1-4730-08d769c4e967
X-MS-TrafficTypeDiagnostic: BY5PR02MB6611:
X-MS-Exchange-PUrlCount: 1
X-Microsoft-Antispam-PRVS: <BY5PR02MB6611D01FE8C80F564602062C87700@BY5PR02MB6611.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 02229A4115
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HkxB2z4FfWG52SIzxzRgwP4t3LxOGV9qkL11SPD5rPzNkUlSaLdFqjWe2V3Da8AdBmTl7krb5GuXEpy/XuBqSzHaCBQmq6Kvc6LfHgfM0VhjAsDU5OBllQbooPoyhle9tUwY1ZUTxksAQIxxQ9QFtlTZQVYFvqKh3eKkj2KzpBrAWW8TklVkarW4l4vP8N7FfPVDXp5Ks0QXE5MwyF4k/zDZ3MGcK4T4LehvQGFJy7yPqhwN7oZ3D8wq/695ndKQviIMMlj3Rw3b/oX3sGI1TQLPBG5HXeXtW7Z86MoCw983S4KsbSb+5l3rSNtOT7EZJkEnDqWb9sj+GsyQoYzA39iza6iRoHypUDTXETe4mRrmogOrtzjf+RDnxRDGn9kHFBuwHMTj92/8BjT/DslxsxRHlttkU85hXXQXT/hDsulKViGJrhTvOZ4NRPEqSftTjYSX9eseB1M6bvsJ3w/c2MW9uENLoNRyg7Yy8w6LJOo=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 12:11:14.4849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaac3cd5-3034-45b1-4730-08d769c4e967
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6611
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

Add the devicetree binding for the xilinx clocking wizard.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
moving from drivers/staging/clocking-wizard/dt-binding.txt

 .../bindings/clock/xlnx,clocking-wizard.txt        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.txt

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.txt b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.txt
new file mode 100644
index 0000000..aedac84
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.txt
@@ -0,0 +1,32 @@
+Binding for Xilinx Clocking Wizard IP Core
+
+This binding uses the common clock binding[1]. Details about the devices can be
+found in the product guide[2].
+
+[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+[2] Clocking Wizard Product Guide
+http://www.xilinx.com/support/documentation/ip_documentation/clk_wiz/v5_1/pg065-clk-wiz.pdf
+
+Required properties:
+ - compatible: Must be 'xlnx,clocking-wizard'
+ - #clock-cells: Number of cells in a clock specifier. Should be 1
+ - reg: Base and size of the cores register space
+ - clocks: Handle to input clock
+ - clock-names: Tuple containing 'clk_in1' and 's_axi_aclk'
+ - clock-output-names: Names for the output clocks
+
+Optional properties:
+ - speed-grade: Speed grade of the device (valid values are 1..3)
+
+Example:
+	clock-generator@40040000 {
+		#clock-cells = <1>;
+		reg = <0x40040000 0x1000>;
+		compatible = "xlnx,clocking-wizard";
+		speed-grade = <1>;
+		clock-names = "clk_in1", "s_axi_aclk";
+		clocks = <&clkc 15>, <&clkc 15>;
+		clock-output-names = "clk_out0", "clk_out1", "clk_out2",
+				     "clk_out3", "clk_out4", "clk_out5",
+				     "clk_out6", "clk_out7";
+	};
-- 
2.1.1

