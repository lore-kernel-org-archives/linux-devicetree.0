Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DACC433F7
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 612CE2086A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 12:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IG2tZ+6u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728934AbgGWMki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 08:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728931AbgGWMkh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 08:40:37 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EC4C0619E2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id l6so2504581plt.7
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2020 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hXbW2PVaC3lLD/ZeUkg3ooPwhxoNUpa6YPQ+2nLIYKg=;
        b=IG2tZ+6uMlWO/2+NhlbELUrCsdJ+5TPG+gq8/3D87tDiIFIrMEufOBuQa0lbCwQhGT
         8cCK6ZrCkU/icvJi5SySEKwidL7wYgXw1tnUM+llhzuzcPAVBUqM0Cma9xt+SIcNIPG3
         IkY9/TZw1uYqeIxwtmx8T2M5dUqVXaMZRpLe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hXbW2PVaC3lLD/ZeUkg3ooPwhxoNUpa6YPQ+2nLIYKg=;
        b=hnq24PvDz0SNjmF+aVBKQ/vageSfsUGZIYVmtVfGoOx2YTLfINPL3f6p3cudJVezn+
         9l3P5h4EXgQlBpHI9KiZef10ENzjwJjH3du0p8JN2PymjA6U6Jhg3Bz6zGJa76jTGr6Q
         6aIDGE/l7+GCnTSi1gtDVGSh4iQbroIWkUvHqFqrtuAvq4LFExAkjPYmQjyV8aq17uz3
         2Vu2rhGweXJ/cqB4ggiebEHCW8WVn9u6qEm+yr4LBNjJI7O/kFBToyzeTzbnWl1VS+vA
         oie2Dynso4ChxyqJbfk5laRGqETcFDhMH4n5s+V89YITmuLAQ2yY/dAfDqzdCJe2BWR4
         Zyyg==
X-Gm-Message-State: AOAM5312aYteKVFOTx/8y5Se8GoQHYiaIwLYXlNRc3lNHLwuspqYxG+F
        8tjy2NkjDtbPQdyobM49pvv5Gg==
X-Google-Smtp-Source: ABdhPJwirZCjmeByQrs8lItuz6qQRUoRGpHK7nhdq7cuuQUX0CjJagqYq7dVcuBjULEROZX/Ghp8sQ==
X-Received: by 2002:a17:90a:c003:: with SMTP id p3mr243031pjt.120.1595508037311;
        Thu, 23 Jul 2020 05:40:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:cbf:ea0:8a30:a3af])
        by smtp.gmail.com with ESMTPSA id m26sm3051270pff.84.2020.07.23.05.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:40:36 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc:     Suniel Mahesh <sunil@amarulasolutions.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 6/7] arm64: dts: rockchip: px30: Add Engicam C.TOUCH 2.0 10.1" OF
Date:   Thu, 23 Jul 2020 18:09:50 +0530
Message-Id: <20200723123951.149497-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723123951.149497-1-jagan@amarulasolutions.com>
References: <20200723123951.149497-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Engicam C.TOUCH 2.0 10.1" Open Frame is a Carrier board with
Capacitive touch 10.1" open frame.

Genaral features:
- TFT 10.1" industrial, 1280x800 LVDS display
- Ethernet 10/100
- Wifi/BT
- USB Type A/OTG
- Audio Out
- CAN

SOM's like PX30.Core needs to mount on top of this Carrier board
for creating complete PX30.Core C.TOUCH 2.0 10.1" Open Frame.

Add support for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi
new file mode 100644
index 000000000000..cb00988953e9
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/px30-engicam-ctouch2-of10.dtsi
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 Engicam srl
+ * Copyright (c) 2020 Amarula Solutions(India)
+ */
+
+#include "px30-engicam-common.dtsi"
-- 
2.25.1

