Return-Path: <SRS0=C9Bv=4K=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F1C35666
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D8AEB206ED
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Feb 2020 16:25:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R8Zns9Uf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgBVQZX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Feb 2020 11:25:23 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36626 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727206AbgBVQZW (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Feb 2020 11:25:22 -0500
Received: by mail-pj1-f66.google.com with SMTP id gv17so2142505pjb.1
        for <devicetree@vger.kernel.org>; Sat, 22 Feb 2020 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gg7bS1nflOAaxyupRzfc5VSU36LQb9MIJVDzdfFhX04=;
        b=R8Zns9UfFCLkk51MpnD30Zt7kTfhnWJpFVg858FZmvU0SYaspwl+hj5Dxmf5F7KdtD
         JczjkiLhNwc7OEFMuPNntrvRuDR2bN3B/ojiXZIyhC8X7rCs9cwpxZW+yrCQMtzyoOck
         Rhr9fF1Y/yrtEdcNZz3R8bAEOiooSfmj7GWb2LqUX3jEiKpf3B2T1bPfuY0xEtvy/71e
         /eRpU73u+8zxiqOln+O1XpGxRiP4u3ilob3CVnzvNXJoKFZMrdSZ0VIQq+9/1tfFY9zE
         HDXFIGXM2PO47j3ow9xSshARQrJjsqQ05SKzLMziSVIkKeT1+YzyRhbGx/X+EufB195z
         Mzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gg7bS1nflOAaxyupRzfc5VSU36LQb9MIJVDzdfFhX04=;
        b=EuB4pK9KGOrNQ6hReDNF2HBNKk+vLw1eFXDAgTR8mKvmH2X9lbEhyosB6Pk/Uj1wes
         IFfivN2fNcRLyxqlIwsYFT6cmAOZoscYjSpDt49JtlEig4Y+zNhR2+CDuz52fDUFK4Fo
         luZ+7W8glwXifXq4BXlcZk39KDjPxCg71aiOOYBtXf3ohCHKI1mKQwOUAfMMQKOUtSip
         hHJWiM2gaj2N1C2FwP3mddgt7xY1A55b7CuKTbPR9S+SKAbELErheiroU2kXFrw64CZ0
         UI90gseZ+xJPauI5VCPPWZXoPxZrVmuU9wE538CYiZHrWlsffzAYabGebA3EDAXfu5Dr
         lHmQ==
X-Gm-Message-State: APjAAAUN2l0pLDcXcy7qJmoo9z0ZpRwGVVQUhKo9J1GsMX5XtJZKfKj8
        3w0XR0Unk3TQysAnCy4BysKY
X-Google-Smtp-Source: APXvYqyya8y7D5YQFJCiWMM9h4XXO/EBmT5VgPITYvRx6kw0b7p7kv+JpJQey18UWknHAr5CfF29wA==
X-Received: by 2002:a17:90a:cf07:: with SMTP id h7mr9838281pju.66.1582388722406;
        Sat, 22 Feb 2020 08:25:22 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:801:b38c:89e8:305c:23c4:b77f])
        by smtp.gmail.com with ESMTPSA id q17sm6851296pfg.123.2020.02.22.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2020 08:25:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     matthias.bgg@gmail.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        adamboardman@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 4/4] arm64: dts: mediatek: Switch to SPDX license identifier for MT6797 SoC
Date:   Sat, 22 Feb 2020 21:54:44 +0530
Message-Id: <20200222162444.11590-5-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
References: <20200222162444.11590-1-manivannan.sadhasivam@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Switch to SPDX license identifier for MT6797 SoC.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 22f093960d27..c1295bf7080c 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -1,14 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2017 MediaTek Inc.
  * Author: Mars.C <mars.cheng@mediatek.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <dt-bindings/clock/mt6797-clk.h>
-- 
2.17.1

