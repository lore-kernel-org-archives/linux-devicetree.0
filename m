Return-Path: <SRS0=5/ta=3R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C3EC33CB2
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 12:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8054824687
	for <linux-devicetree@archiver.kernel.org>; Tue, 28 Jan 2020 12:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="Dn7uHddz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbgA1MHb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 28 Jan 2020 07:07:31 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:1774 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbgA1MHb (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Tue, 28 Jan 2020 07:07:31 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00SBw5kg018195;
        Tue, 28 Jan 2020 13:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BI//wb5fPPLjSkwvNcKt9uKWn+48xiSr4KOhhmCaYTU=;
 b=Dn7uHddzkXN1yTpnUkL/D5G9WHI7Ki7DpPHxr3B3sBG6izAEdrztv+8ul3bAeDexK30a
 wTG6lZH76Yd/u2zbNlhUVBIQJry/aTA3Qoy/hCauAA2l2D/DEkD2u/+JwOKFYGPFKOhF
 bRO6TwvIrv91YG5CoHESmi5cQOFZ5imWq8hXkyRRuKZGJHGjrcSjgRgXwVqQIuBLc7mv
 RYgYy/E6P+acKQwoZp5XtNU1zIpJwDy+r6fWxRrggqXet5oe30KPPrV2wiztr3S0JxbG
 LAotDOuMY1Jh6xcchOo4vQV8ndLY3uFTsGFc+9EAA2S3skIY5FUyNFQLS9diADjlWjaZ zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xrc135r11-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jan 2020 13:07:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87CAC10002A;
        Tue, 28 Jan 2020 13:07:04 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6D6772A4D97;
        Tue, 28 Jan 2020 13:07:04 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jan 2020 13:07:03
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux@armlinux.org.uk>, <p.paillet@st.com>,
        <linus.walleij@linaro.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <fabrice.gasnier@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v3 0/2] clockevent: add low power STM32 timer
Date:   Tue, 28 Jan 2020 13:07:00 +0100
Message-ID: <20200128120702.26166-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-28_03:2020-01-24,2020-01-28 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This series add low power timer as boadcast clockevent device.
Low power timer could runs even when CPUs are in idle mode and 
could wakeup them.

version 3:
- fix timer set sequence
- don't forget to free irq on remove function
- use devm_kzalloc to simplify errors handling in probe function

version 2:
- stm32 clkevent driver is now a child of the stm32 lp timer node
- add a probe function and adpat the driver to use regmap provide
  by it parent
- stop using timer_of helpers
- document the bindings inside stm32 lptimer yaml

Benjamin Gaignard (2):
  dt-bindings: mfd: Document STM32 low power clkevent bindings
  clocksource: Add Low Power STM32 timers driver

 .../devicetree/bindings/mfd/st,stm32-lptimer.yaml  |  14 ++
 drivers/clocksource/Kconfig                        |   4 +
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-stm32-lp.c               | 248 +++++++++++++++++++++
 4 files changed, 267 insertions(+)
 create mode 100644 drivers/clocksource/timer-stm32-lp.c

-- 
2.15.0

