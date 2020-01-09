Return-Path: <SRS0=GIEZ=26=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D339C282DD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:54:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 290182077B
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Jan 2020 14:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="DF6ZFxQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731822AbgAIOyG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Jan 2020 09:54:06 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:23224 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731813AbgAIOyG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Jan 2020 09:54:06 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 009Erngq011603;
        Thu, 9 Jan 2020 15:53:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=+ND5CjHMeUis+Fgum1owaxE711vUexvCa9xmQAs4TX0=;
 b=DF6ZFxQylDQHqp/3YUXtPT2okAUsawVy7VeuvUcXlfKkTzUcMMkGC/nfctiWENJuMa3p
 p1yXnRsmN9Oa+Y5Wth2OFq5d7iyP/Wlsyyk38rZtqytL20oKfr2LzqYd+1kvE7sydCPD
 gXdqczgiPP7WCDDFffc9j6RHH5HIDc8SNFAmhsszI0MZfikQrMZiTm+46efaAozQfPKV
 2PPeQxfvRvjsqb5CxgstXzPmYcvD9Jib5X6yiyrMPNHiV5ZNkoAuozqC31QH5LU4Rjfn
 VJ01t3cQVquUVYR+dhbLQdLFPqt4P1qTcbF+jZsZgb2iqHOyDSHJgDgrJY6gYW6sAypP Uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xakm5tamb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jan 2020 15:53:49 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD93910003B;
        Thu,  9 Jan 2020 15:53:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CEA372BD410;
        Thu,  9 Jan 2020 15:53:40 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 9 Jan 2020 15:53:40
 +0100
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>,
        <linux@armlinux.org.uk>, <p.paillet@st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH 3/3] ARM: stm32: select STM32 low power timer clock event driver
Date:   Thu, 9 Jan 2020 15:53:33 +0100
Message-ID: <20200109145333.12260-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200109145333.12260-1-benjamin.gaignard@st.com>
References: <20200109145333.12260-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-09_02:2020-01-09,2020-01-09 signatures=0
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Select STM32 low power clock event driver by default

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 arch/arm/mach-stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 57699bd8f107..441fc6923f7f 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -9,6 +9,7 @@ menuconfig ARCH_STM32
 	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
+	select CLKSRC_STM32_LP
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI
-- 
2.15.0

