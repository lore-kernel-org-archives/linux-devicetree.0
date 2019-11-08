Return-Path: <SRS0=K2IH=ZA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3164FC6196
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 22:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 80671215EA
	for <linux-devicetree@archiver.kernel.org>; Fri,  8 Nov 2019 22:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729951AbfKHWjI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 8 Nov 2019 17:39:08 -0500
Received: from mga07.intel.com ([134.134.136.100]:9337 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731203AbfKHWjE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 8 Nov 2019 17:39:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Nov 2019 14:39:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,283,1569308400"; 
   d="scan'208";a="206137930"
Received: from tthayer-hp-z620.an.intel.com ([10.122.105.146])
  by orsmga003.jf.intel.com with ESMTP; 08 Nov 2019 14:39:03 -0800
From:   thor.thayer@linux.intel.com
To:     dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     richard.gong@intel.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Thor Thayer <thor.thayer@linux.intel.com>
Subject: [PATCH 2/2] arm64: dts: agilex: Add SysMgr to Ethernet nodes
Date:   Fri,  8 Nov 2019 16:40:54 -0600
Message-Id: <1573252854-25801-3-git-send-email-thor.thayer@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573252854-25801-1-git-send-email-thor.thayer@linux.intel.com>
References: <1573252854-25801-1-git-send-email-thor.thayer@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Ethernet needs the System Manager to setup the low-level
interface and PHY.

Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 7e8dc85fcebc..d8caa3f609b5 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -150,6 +150,7 @@
 			iommus = <&smmu 1>;
 			clocks = <&clkmgr AGILEX_EMAC0_CLK>;
 			clock-names = "stmmaceth";
+			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			status = "disabled";
 		};
 
@@ -167,6 +168,7 @@
 			iommus = <&smmu 2>;
 			clocks = <&clkmgr AGILEX_EMAC1_CLK>;
 			clock-names = "stmmaceth";
+			altr,sysmgr-syscon = <&sysmgr 0x48 8>;
 			status = "disabled";
 		};
 
@@ -184,6 +186,7 @@
 			iommus = <&smmu 3>;
 			clocks = <&clkmgr AGILEX_EMAC2_CLK>;
 			clock-names = "stmmaceth";
+			altr,sysmgr-syscon = <&sysmgr 0x4c 16>;
 			status = "disabled";
 		};
 
-- 
2.7.4

