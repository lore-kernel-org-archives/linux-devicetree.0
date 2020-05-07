Return-Path: <SRS0=rqTW=6V=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE30C54E4A
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:25:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 274E221582
	for <linux-devicetree@archiver.kernel.org>; Thu,  7 May 2020 11:25:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgEGLZF (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 7 May 2020 07:25:05 -0400
Received: from foss.arm.com ([217.140.110.172]:56924 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726743AbgEGLZE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 7 May 2020 07:25:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A90EA106F;
        Thu,  7 May 2020 04:25:03 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CFC03F68F;
        Thu,  7 May 2020 04:25:02 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 15/17] arm64: dts: juno: Fix SCPI shared mem node name
Date:   Thu,  7 May 2020 12:24:28 +0100
Message-Id: <20200507112430.183940-16-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507112430.183940-1-andre.przywara@arm.com>
References: <20200507112430.183940-1-andre.przywara@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The SRAM DT binding requires child nodes to use a certain node name
scheme.

Change the naming from scp-shmem to scp-sram to comply with that.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
index e9b4f0004cd4..614e58187363 100644
--- a/arch/arm64/boot/dts/arm/juno-base.dtsi
+++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
@@ -521,12 +521,12 @@
 		#size-cells = <1>;
 		ranges = <0 0x0 0x2e000000 0x8000>;
 
-		cpu_scp_lpri: scp-shmem@0 {
+		cpu_scp_lpri: scp-sram@0 {
 			compatible = "arm,juno-scp-shmem";
 			reg = <0x0 0x200>;
 		};
 
-		cpu_scp_hpri: scp-shmem@200 {
+		cpu_scp_hpri: scp-sram@200 {
 			compatible = "arm,juno-scp-shmem";
 			reg = <0x200 0x200>;
 		};
-- 
2.17.1

