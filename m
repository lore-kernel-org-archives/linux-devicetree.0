Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C18C433E1
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:28:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AAA6207BB
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 19:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594841315;
	bh=LWNE7zXq9kCU5Nm7k5Qn/MHXBFjAq0SY8reU6vwgpDQ=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=sRA7hIllHB+ezc/qXFOiyCjHOSBHdDLmIHV3QqttCnz7S1eiJqLNYF6rymLQSfRFl
	 9E4A4832a+/p17mVLIhSqz2u9CzMNVTN+EMn4E1loY2mQWpCivIv2t4PF1p5eWJUQ1
	 Da/37A5KysmgcnRPNoCwflflCJf7p0PkQ44hIM1g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgGOT2e (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 15:28:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgGOT2e (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Jul 2020 15:28:34 -0400
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 648DC2065F;
        Wed, 15 Jul 2020 19:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594841313;
        bh=LWNE7zXq9kCU5Nm7k5Qn/MHXBFjAq0SY8reU6vwgpDQ=;
        h=From:To:Cc:Subject:Date:From;
        b=BbvinmRGG6OWza0FEJvSpk+PqPlHDlMCpIspavT1JQUW+PMdNY/DYlvKelTq2NVEg
         tBAPKmCsZsisftnt9cvum2ghGwgi0ioxDjneXN/A9/CdXElb+i/inYEcvtt7FXmib8
         gLdXRnU+DNttp7obW7VBlbHdK7XMQdzHLKY+7Eiw=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     linux-arm-kernel@lists.infradead.org
Cc:     dinguyen@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: agilex: add nand clocks
Date:   Wed, 15 Jul 2020 14:28:22 -0500
Message-Id: <20200715192824.22210-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the clock properties for the NAND dts node.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index e300330536b7..ac1b2422e8d4 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -309,6 +309,10 @@
 			      <0xffb80000 0x1000>;
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0 97 4>;
+			clocks = <&clkmgr AGILEX_NAND_CLK>,
+				 <&clkmgr AGILEX_NAND_X_CLK>,
+				 <&clkmgr AGILEX_NAND_ECC_CLK>;
+			clock-names = "nand", "nand_x", "ecc";
 			resets = <&rst NAND_RESET>, <&rst NAND_OCP_RESET>;
 			status = "disabled";
 		};
-- 
2.17.1

