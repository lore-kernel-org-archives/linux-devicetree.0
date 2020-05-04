Return-Path: <SRS0=58Ja=6S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9792BC47257
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:33:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76BDB2054F
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 May 2020 06:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="h1qhi0oT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgEDGdh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 May 2020 02:33:37 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19627 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgEDGdh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 4 May 2020 02:33:37 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eafb6c10001>; Sun, 03 May 2020 23:31:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sun, 03 May 2020 23:33:36 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sun, 03 May 2020 23:33:36 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 06:33:36 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 4 May 2020 06:33:36 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eafb73d0001>; Sun, 03 May 2020 23:33:35 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V2 2/3] usb: gadget: tegra-xudc: Add Tegra194 support
Date:   Mon, 4 May 2020 12:04:40 +0530
Message-ID: <1588574081-23160-3-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
References: <1588574081-23160-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588573889; bh=B/ZJ2skrpSXMvGZJlSiYl3vlRxjANNqiNcO1sk0Y1NY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=h1qhi0oTWOd5yKzgJeIgfCsb7GvnGBWGhN4FmIGV8K2+a2qGoeuyFRgpOPke7Ur1D
         EHDYmBC1H6R/BJPTGaVJ1TNCekvREuDGOhUgt88OBkk5+Ig9lRp7mYZ2gxlN663nZk
         gjvFb8451NVcnxdQalQ4dhJNEcH2gzSDiRQpu0xC5JzKaxu8dCjPmEYvA13XaVQOrp
         Boau1yt4k2GY48Y65tKZaq6sIfGT9rQJDUzWhN11TS67x2oHhd0iSJv56E5n3lU6Co
         KY15RFu9Bw10lVqIboXz0dj9eCLrgT2OrFPMLmde8FKz1jxIjbL3uApJYdsEiQMGX1
         DATID44yy/10w==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds support for XUSB device mode controller support on
Tegra194 SoC. This is very similar to the existing Tegra186 XUDC, with lpm
support added in addition.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V2:
 - Added Acked-by updates to commit message.
 - Re-used T186 clock names for T194 SoC data.
---
 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 52a6add..04c6a06 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3522,6 +3522,19 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra194_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3531,6 +3544,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra186-xudc",
 		.data = &tegra186_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra194-xudc",
+		.data = &tegra194_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
-- 
2.7.4

