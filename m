Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F339AC432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 01:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C50CA2075A
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 01:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfKUBSq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 20:18:46 -0500
Received: from foss.arm.com ([217.140.110.172]:48432 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbfKUBSq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 20 Nov 2019 20:18:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D272DA7;
        Wed, 20 Nov 2019 17:18:45 -0800 (PST)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 509933F6C4;
        Wed, 20 Nov 2019 17:18:44 -0800 (PST)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] arm/arm64: dts: allwinner: Add PMU nodes
Date:   Thu, 21 Nov 2019 01:18:32 +0000
Message-Id: <20191121011835.8467-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.14.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Arm Cortex cores contain a Performance Monitoring Unit (PMU), that needs
to be connected to the GIC distributor to be able to trigger interrupts.
The actual interrupt IDs are an integration choice, so need to be
advertised via the DT.

This series adds the DT nodes to the H3, H5 and H6 SoC .dtsi files.
The interrupt IDs are not always as described in the manual (off by 4
for the A64 and H5), so the IRQs have been both tested in U-Boot and
verified in Linux, using "perf record" (which requires working IRQs).

Cheers,
Andre.

Andre Przywara (3):
  arm64: dts: allwinner: H6: Add PMU mode
  arm64: dts: allwinner: H5: Add PMU node
  arm: dts: allwinner: H3: Add PMU node

 arch/arm/boot/dts/sun8i-h3.dtsi              | 15 ++++++++++++---
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 16 +++++++++++++---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 10 ++++++++++
 3 files changed, 35 insertions(+), 6 deletions(-)

-- 
2.14.5

