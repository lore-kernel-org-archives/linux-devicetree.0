Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B56C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:05:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A11A222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 16:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729128AbgBUQFE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 11:05:04 -0500
Received: from foss.arm.com ([217.140.110.172]:42528 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729050AbgBUQFD (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 11:05:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D30731B;
        Fri, 21 Feb 2020 08:05:03 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 98DBB3F68F;
        Fri, 21 Feb 2020 08:05:02 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: ARM: Add recent Cortex/Neoverse CPUs
Date:   Fri, 21 Feb 2020 16:04:56 +0000
Message-Id: <79ef74956befe089d7994ad24ab25132e95e9ac9.1582300927.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
In-Reply-To: <cover.1582300927.git.robin.murphy@arm.com>
References: <cover.1582300927.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The CPU group has been busy since we last updated these bindings...
Add definitions for all the new Cortex-A and Neoverse cores now
available.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 7a9c3ce2dbef..41e22b5320da 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -123,11 +123,18 @@ properties:
       - arm,cortex-a12
       - arm,cortex-a15
       - arm,cortex-a17
+      - arm,cortex-a32
+      - arm,cortex-a34
+      - arm,cortex-a35
       - arm,cortex-a53
       - arm,cortex-a55
       - arm,cortex-a57
+      - arm,cortex-a65
       - arm,cortex-a72
       - arm,cortex-a73
+      - arm,cortex-a75
+      - arm,cortex-a76
+      - arm,cortex-a77
       - arm,cortex-m0
       - arm,cortex-m0+
       - arm,cortex-m1
@@ -136,6 +143,8 @@ properties:
       - arm,cortex-r4
       - arm,cortex-r5
       - arm,cortex-r7
+      - arm,neoverse-e1
+      - arm,neoverse-n1
       - brcm,brahma-b15
       - brcm,brahma-b53
       - brcm,vulcan
-- 
2.23.0.dirty

