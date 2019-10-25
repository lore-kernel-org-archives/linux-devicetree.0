Return-Path: <SRS0=V00+=YS=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B945CA9EA0
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 11:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E88421D71
	for <linux-devicetree@archiver.kernel.org>; Fri, 25 Oct 2019 11:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408721AbfJYLOM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 25 Oct 2019 07:14:12 -0400
Received: from mx1.unisoc.com ([222.66.158.135]:16749 "EHLO
        SHSQR01.spreadtrum.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726369AbfJYLOM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 25 Oct 2019 07:14:12 -0400
Received: from ig2.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
        by SHSQR01.spreadtrum.com with ESMTPS id x9PBDrCR066405
        (version=TLSv1 cipher=AES256-SHA bits=256 verify=NO);
        Fri, 25 Oct 2019 19:13:53 +0800 (CST)
        (envelope-from Chunyan.Zhang@unisoc.com)
Received: from localhost (10.0.74.79) by BJMBX01.spreadtrum.com (10.0.64.7)
 with Microsoft SMTP Server (TLS) id 15.0.847.32; Fri, 25 Oct 2019 19:13:53
 +0800
From:   Chunyan Zhang <chunyan.zhang@unisoc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
CC:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
Subject: [PATCH 0/5] Add clocks for Unisoc's SC9863A
Date:   Fri, 25 Oct 2019 19:13:33 +0800
Message-ID: <20191025111338.27324-1-chunyan.zhang@unisoc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.0.74.79]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com x9PBDrCR066405
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


Add SC9863A specific clock driver and devicetree bindings for it.

Also this patchset added support gate clock for pll which need to
wait a certain time for stable after being switched on.

Chunyan Zhang (4):
  dt-bindings: clk: sprd: rename the common file name sprd.txt to SoC
    specific
  dt-bindings: clk: sprd: add bindings for sc9863a clock controller
  clk: sprd: Add dt-bindings include file for SC9863A
  clk: sprd: add clocks support for SC9863A

Xiaolong Zhang (1):
  clk: sprd: add gate for pll clocks

 .../clock/{sprd.txt => sprd,sc9860-clk.txt}   |    2 +-
 .../bindings/clock/sprd,sc9863a-clk.txt       |   59 +
 drivers/clk/sprd/Kconfig                      |    8 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/gate.c                       |   19 +
 drivers/clk/sprd/gate.h                       |   21 +-
 drivers/clk/sprd/sc9863a-clk.c                | 1711 +++++++++++++++++
 include/dt-bindings/clock/sprd,sc9863a-clk.h  |  353 ++++
 8 files changed, 2171 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/clock/{sprd.txt => sprd,sc9860-clk.txt} (98%)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.txt
 create mode 100644 drivers/clk/sprd/sc9863a-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,sc9863a-clk.h

-- 
2.20.1


