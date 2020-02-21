Return-Path: <SRS0=98KY=4J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE358C35646
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A0E5206EF
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Feb 2020 19:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgBUTfh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Feb 2020 14:35:37 -0500
Received: from foss.arm.com ([217.140.110.172]:46638 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgBUTfh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 21 Feb 2020 14:35:37 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7944D30E;
        Fri, 21 Feb 2020 11:35:36 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A54343F6CF;
        Fri, 21 Feb 2020 11:35:35 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] arm64 CPU DT binding updates
Date:   Fri, 21 Feb 2020 19:35:27 +0000
Message-Id: <cover.1582312530.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.23.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

Here's a quick turnaround from v1 so I don't have to remember where
to pick up from next week :)

Thanks,
Robin.


Robin Murphy (5):
  dt-bindings: ARM: Add recent Cortex/Neoverse CPUs
  dt-bindings: ARM: Add recent Cortex/Neoverse PMUs
  dt-bindings: ARM: Clean up PMU compatible list
  arm64: perf: Refactor PMU init callbacks
  arm64: perf: Support new DT compatibles

 .../devicetree/bindings/arm/cpus.yaml         |   9 +
 .../devicetree/bindings/arm/pmu.yaml          |  41 +++--
 arch/arm64/kernel/perf_event.c                | 168 ++++++++----------
 3 files changed, 111 insertions(+), 107 deletions(-)

-- 
2.23.0.dirty

