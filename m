Return-Path: <SRS0=Z42x=52=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A509C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3BF3206F7
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Apr 2020 09:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOcr3V3h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgDJJSo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Apr 2020 05:18:44 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36557 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbgDJJSo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Apr 2020 05:18:44 -0400
Received: by mail-wm1-f67.google.com with SMTP id a201so1712025wme.1
        for <devicetree@vger.kernel.org>; Fri, 10 Apr 2020 02:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OdnQLTnOvB12M24Pr4c69P5R/lSQvyTtU4gEPmP1v0g=;
        b=sOcr3V3hRa3ETDqJ/pJcZqnqiBQPBUzk16i8VA/Z9iW9GSafzJLX/dRzjXeXBdKOvb
         Lrp4sLQ1o9EXPyuB4oC20qD7ReTACvc7f+kBqr7sx826+B6QnRQqUjCengxzQFUOm5wu
         /IH3v7c4TDWBGHDv6QHEK/FZameLJwYh4Y15EjHiR7l5vSZTH9yjcKFJG5DSkFUFCRRv
         4RsfEXthCzbVt3tJyAWjA0XSJ4vwJN5B5IyhHhZ13rsQhzQ5elS45cdUCLuEEbBU1YbC
         Uw6YF4IWOLzHqsZfFLrfP9OpUNJ78ZCAslrlLj9Em+6MMHJmWOoJhEQS1Ei8/Bpqs5ee
         b2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OdnQLTnOvB12M24Pr4c69P5R/lSQvyTtU4gEPmP1v0g=;
        b=a9PotHLDFbODomXg8Qu4zUGkNhmv/GI5gIYYRwjJsElCOJwDFgHavCDXe2+T4vnczL
         uYAmgPI3exa27SfjP+i0uIvQZxkvubEjTsvRso8EDGq5neeDH28dGDp+xXwdrnPiNgFa
         qQP5ATdisw1N2YeOaxghuVGBy7LhcpElCLhJ1emXtEllVMcFbHL6hx/SMDzKh7T7FdDb
         tm+1QKsLN4jE0XfUTeisAkPo3gBpkvF3Q/RsO7T685YNGQrNCn/K0xLfY1Jh+Io7P3P3
         9SE7mQxXTPFeMnMgEg1H2pP+qqffLWQm7OjKLDWLuSvVbK6ARHcFPTYse19gErYl9uCN
         2tdQ==
X-Gm-Message-State: AGi0PuaMC1ERgN/wvixRbgOiUEX5FJwyW5xhL01Onjpvjnn+XiPLPATc
        FAH+wxqyHA9490VL3xmENaMXyT3p
X-Google-Smtp-Source: APiQypItdFvKeWN/l74OgaUoD5nI51kudUXUwdYn5L9X/nFHG2Fgv19A4Bm+FBGfKAbMvK4R4xjnjg==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr4157673wmb.123.1586510322051;
        Fri, 10 Apr 2020 02:18:42 -0700 (PDT)
Received: from localhost.localdomain (134.red-83-46-193.dynamicip.rima-tde.net. [83.46.193.134])
        by smtp.gmail.com with ESMTPSA id p3sm2049066wrq.97.2020.04.10.02.18.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2020 02:18:41 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     gregkh@linuxfoundation.org
Cc:     neil@brown.name, driverdev-devel@linuxdriverproject.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 2/2] staging: mt7621-pci-phy: dt: bindings: remove bindings txt file
Date:   Fri, 10 Apr 2020 11:18:36 +0200
Message-Id: <20200410091836.13068-3-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
References: <20200410091836.13068-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Yaml file for bindings has been properly added. Hence, remove
the old txt file.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../mediatek,mt7621-pci-phy.txt               | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt

diff --git a/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt b/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
deleted file mode 100644
index a369d715378b..000000000000
--- a/drivers/staging/mt7621-pci-phy/mediatek,mt7621-pci-phy.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Mediatek Mt7621 PCIe PHY
-
-Required properties:
-- compatible: must be "mediatek,mt7621-pci-phy"
-- reg: base address and length of the PCIe PHY block
-- #phy-cells: must be <1> for pcie0_phy and for pcie1_phy.
-
-Example:
-	pcie0_phy: pcie-phy@1e149000 {
-		compatible = "mediatek,mt7621-pci-phy";
-		reg = <0x1e149000 0x0700>;
-		#phy-cells = <1>;
-	};
-
-	pcie1_phy: pcie-phy@1e14a000 {
-		compatible = "mediatek,mt7621-pci-phy";
-		reg = <0x1e14a000 0x0700>;
-		#phy-cells = <1>;
-	};
-
-	/* users of the PCIe phy */
-
-	pcie: pcie@1e140000 {
-		...
-		...
-		phys = <&pcie0_phy 0>, <&pcie0_phy 1>, <&pcie1_phy 0>;
-		phy-names = "pcie-phy0", "pcie-phy1", "pcie-phy2";
-	};
-- 
2.25.1

