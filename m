Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F2AC2D0EF
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AB2820732
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fAbQt8ec"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439391AbgDPHez (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:34:55 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6243 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHex (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 03:34:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a900000>; Thu, 16 Apr 2020 00:34:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:53 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 16 Apr 2020 00:34:53 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:53 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:53 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a9a0000>; Thu, 16 Apr 2020 00:34:52 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 3/4] usb: gadget: tegra-xudc: Add Tegra194 support
Date:   Thu, 16 Apr 2020 13:04:19 +0530
Message-ID: <1587022460-31988-4-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022480; bh=0rPpKqpqRbtyPXXtz80/VGnqoHPuk5t0Vx4KqrlFy8s=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=fAbQt8ecdW2IERu56PRjLOTuSxlM8Wl3/NFUmYofdqMjkcEj2pMmd0TUM22eZQV+b
         DtE/cyKyJJoFcZYPUME0SkZmqC3xEYe6S2rYl+i1hLJhBrgQcaDIO2/Ce8xZ6dYFPT
         cgx4OygOWrK6/7PSG6chvxVz8UIaxbVw0AjyUhKqDb7ulHHDjMkgth2wdYQ2EtfhZZ
         JjC1n9aWYhNxZajjoBHgKqOf5KaICXXhUuioFYOACSl055cxDSOOB12XoMOmJVEaW6
         cBHh3pSwRqCIUaCzJl2K6K8lWZfHQ/8cUJQe3A6Iwvd0DBFx4RRSHUnmkMyrtl+qHm
         cegzaLZ9NPQfw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This commit adds support for XUSB device mode controller support on
Tegra194 SoC. This is very similar to the existing Tegra186 XUDC, with lpm
support added in addition.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 52a6add..fb01117 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3494,6 +3494,13 @@ static const char * const tegra186_xudc_clock_names[] = {
 	"fs_src",
 };
 
+static const char * const tegra194_xudc_clock_names[] = {
+	"dev",
+	"ss",
+	"ss_src",
+	"fs_src",
+};
+
 static struct tegra_xudc_soc tegra210_xudc_soc_data = {
 	.supply_names = tegra210_xudc_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra210_xudc_supply_names),
@@ -3522,6 +3529,19 @@ static struct tegra_xudc_soc tegra186_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra194_xudc_soc_data = {
+	.clock_names = tegra194_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra194_xudc_clock_names),
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
@@ -3531,6 +3551,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
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

