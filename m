Return-Path: <SRS0=wnEW=6Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C142DC47255
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D4D920643
	for <linux-devicetree@archiver.kernel.org>; Mon, 11 May 2020 15:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="yQRdWTUU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbgEKPIi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 11 May 2020 11:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730300AbgEKPIg (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Mon, 11 May 2020 11:08:36 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC984C05BD0A
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:08:35 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id 50so10881475wrc.11
        for <devicetree@vger.kernel.org>; Mon, 11 May 2020 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
        b=yQRdWTUUY8BtpgYf0O6+JxCpTQQ7YY5DMoBHZh8lfcBtgFmcmYRFvaqU5qMeGhFDWm
         CDpXAd4jp+N5aZunI52e7jbDLHpfUyC9o5by8J/55R1jm0qIu1qYfQvBHJO+tNsKWB1p
         AolpfCzCBQBM2ESWJvao6fiQ/CS9fG2NadGPhDtw4J3JQ2dJL7QuxIM/MknGHbUu5wIv
         wZY8Yr8s+nmwW5TODaI1j7Uq9uLSRlxnSfYy5+qg50Ah1fgmd50NMNW6QYL9yX70K7E/
         yGbZ1CcIgQcQCmmebj6kZ2+Yp5FhiwtSlR45BZow7MfGMl2dI+79rr2j+m0UEUkUaGdI
         +pjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3BhZ5w2nZuK3+ZudhXc+00fKQMrXVNQ6trbR5U2M5Y=;
        b=dmnfpwic9hP792lqw+LnRy2kNFveVRkv0iRKOamx4+LAh+9mUkXRwMoSF3BSu6meON
         X2oGZHqlyyK9mmG7DQMcf/0z/6QKokssKlT37ewIfKkQ0El+6mdWwzAFgeEoq7qYPKYw
         AFHXShWYYP2oX5bBkLHqTTngvkI9qyHXDMsbNj/X3U5Za9Aa/1QQ883XbWchlL8+mDlM
         LA6zlaSnMajRUazORZ/wYpWR4e1SJPYgRmZxUZWO5ydynz4cgBs9N1oHfCAl8CAHGxvy
         rRg5UE8p/UjwtHXg94uRIX5vhRhb/A/K6wAXwzq5t8cXczNqRJ3iG0+GsKpybkNAXdJE
         reDg==
X-Gm-Message-State: AGi0PubjS1vaod8nFUF8Evj3Bzzu+Tn5KhJd5srLcNN6gUN91ybPOgtA
        MY4mb/TblC5rvKZPgIKV0sv5xQ==
X-Google-Smtp-Source: APiQypLYCrKbbP67ZuW6k/GvCnVZzqnJrj+rFWSiKDfJIOmzuY0m86IY8Y+0AfqHvjKqDVcpGVV22Q==
X-Received: by 2002:a5d:4f06:: with SMTP id c6mr20552983wru.12.1589209714391;
        Mon, 11 May 2020 08:08:34 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr. [2.15.156.232])
        by smtp.gmail.com with ESMTPSA id 94sm3514792wrf.74.2020.05.11.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 08:08:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Fabien Parent <fparent@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Edwin Peer <edwin.peer@broadcom.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Stephane Le Provost <stephane.leprovost@mediatek.com>,
        Pedro Tsai <pedro.tsai@mediatek.com>,
        Andrew Perepech <andrew.perepech@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 10/14] ARM64: dts: mediatek: add pericfg syscon to mt8516.dtsi
Date:   Mon, 11 May 2020 17:07:55 +0200
Message-Id: <20200511150759.18766-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200511150759.18766-1-brgl@bgdev.pl>
References: <20200511150759.18766-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds support for the PERICFG register range as a syscon. This will
soon be used by the MediaTek Ethernet MAC driver for NIC configuration.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 2f8adf042195..8cedaf74ae86 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -191,6 +191,11 @@ infracfg: infracfg@10001000 {
 			#clock-cells = <1>;
 		};
 
+		pericfg: pericfg@10003050 {
+			compatible = "mediatek,mt8516-pericfg", "syscon";
+			reg = <0 0x10003050 0 0x1000>;
+		};
+
 		apmixedsys: apmixedsys@10018000 {
 			compatible = "mediatek,mt8516-apmixedsys", "syscon";
 			reg = <0 0x10018000 0 0x710>;
-- 
2.25.0

