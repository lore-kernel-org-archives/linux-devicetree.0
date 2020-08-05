Return-Path: <SRS0=mz9M=BP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CE0C433E0
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7422120842
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Aug 2020 19:51:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbgHETv1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Aug 2020 15:51:27 -0400
Received: from foss.arm.com ([217.140.110.172]:33354 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728219AbgHEQwb (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 5 Aug 2020 12:52:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AD3B11D4;
        Wed,  5 Aug 2020 05:56:56 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D43EB3FA31;
        Wed,  5 Aug 2020 05:56:54 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org
Cc:     devicetree@vger.kernel.org, alisaidi@amazon.com, tsahee@amazon.com,
        harb@amperecomputing.com, tuanphan@os.amperecomputing.com,
        james.yang@arm.com
Subject: [PATCH 0/2] Arm CMN-600 PMU driver
Date:   Wed,  5 Aug 2020 13:56:48 +0100
Message-Id: <cover.1596631695.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi all,

At long last, here's an initial cut of the CMN PMU driver that's been
festering in on-and-off development for years. It should be functionally
complete now, although there is still scope for improving the current
implementation (e.g. watchpoint register allocation could be cleverer).

Of particular interest at this point is the user interface - is it
sufficiently complete and useful? Is there any need for a third event
targeting method in between "single node ID" and "all nodes"? Is it
worth templating watchpoints by port and channel to mimic XP events? Do
we want to expose watchpoint-based bandwidth events as synthetic per-node
events? Not all of that would need to be implemented right now so as to
further stall upstreaming, but I really want to make sure that the initial
interface is solid and any further enhancements can cleanly extend it,
rather than painting ourselves into a corner in terms of ABI support.

Robin.


Robin Murphy (2):
  perf: Add Arm CMN-600 DT binding
  perf: Add Arm CMN-600 PMU driver

 Documentation/admin-guide/perf/arm-cmn.rst    |   65 +
 Documentation/admin-guide/perf/index.rst      |    1 +
 .../devicetree/bindings/perf/arm-cmn.yaml     |   57 +
 drivers/perf/Kconfig                          |    7 +
 drivers/perf/Makefile                         |    1 +
 drivers/perf/arm-cmn.c                        | 1653 +++++++++++++++++
 6 files changed, 1784 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/arm-cmn.rst
 create mode 100644 Documentation/devicetree/bindings/perf/arm-cmn.yaml
 create mode 100644 drivers/perf/arm-cmn.c

-- 
2.28.0.dirty

