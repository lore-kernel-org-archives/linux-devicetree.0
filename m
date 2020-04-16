Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD81C38A29
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23B5F20784
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 07:34:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="iZq8Kd3A"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439369AbgDPHet (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 03:34:49 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6238 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438944AbgDPHer (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 16 Apr 2020 03:34:47 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e980a8a0000>; Thu, 16 Apr 2020 00:34:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 16 Apr 2020 00:34:47 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 16 Apr 2020 00:34:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr
 2020 07:34:47 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 16 Apr 2020 07:34:47 +0000
Received: from nkristam-ubuntu.nvidia.com (Not Verified[10.19.67.128]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e980a940001>; Thu, 16 Apr 2020 00:34:46 -0700
From:   Nagarjuna Kristam <nkristam@nvidia.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <mark.rutland@arm.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [PATCH V1 1/4] dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
Date:   Thu, 16 Apr 2020 13:04:17 +0530
Message-ID: <1587022460-31988-2-git-send-email-nkristam@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
References: <1587022460-31988-1-git-send-email-nkristam@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587022474; bh=xXeyeOzrJxjRg6qxD+Id9IV03wPtXpCgjlMCvQwVdc8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=iZq8Kd3AWSN5BGra4tM++nPBdjCJj9BrumkIeBnNqmVBmxW5v/++eYk2PNuC00HKF
         paufb7qiGTd/sTGaotqfV/prsELoNRXbF2i0xdsLUkGGdlVoevmJ/ZkRReHoeH4pjn
         j0EOuxN6cNqq9tUm1flk1SDJ0N7vFHzF/8BCsmABxnBxbFRnBZq9hK9zvjW4TWGjmU
         kKHsYHhE15BlQLcBZCIO1nHgiFRcualtMclCs3u00XHaiCXmB7AsqaT0agkSvo0ZJG
         zaW7Sap1VGHev3im4zE12f79mIE88YaYEAJI/yn78LbDnWWd4HHmmqTOxEGKyQ6OPp
         OL8cJwX9sFMfw==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Extend the Tegra XUSB controller device tree binding with Tegra194
support.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index b84ed8e..75ea946 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - nvidia,tegra210-xudc # For Tegra210
           - nvidia,tegra186-xudc # For Tegra186
+          - nvidia,tegra194-xudc # For Tegra194
 
   reg:
     minItems: 2
@@ -144,6 +145,7 @@ allOf:
           contains:
             enum:
               - nvidia,tegra186-xudc
+              - nvidia,tegra194-xudc
     then:
       properties:
         reg:
-- 
2.7.4

