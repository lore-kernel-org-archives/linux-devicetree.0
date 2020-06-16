Return-Path: <SRS0=Wk2R=75=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ED6C433E1
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 18:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC27208D5
	for <linux-devicetree@archiver.kernel.org>; Tue, 16 Jun 2020 18:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbgFPSYl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 16 Jun 2020 14:24:41 -0400
Received: from v6.sk ([167.172.42.174]:47662 "EHLO v6.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730110AbgFPSYP (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 16 Jun 2020 14:24:15 -0400
Received: from localhost (v6.sk [IPv6:::1])
        by v6.sk (Postfix) with ESMTP id 76ED561631;
        Tue, 16 Jun 2020 18:24:14 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 11/13] ARM: dts: mmp2-olpc-xo-1-75: Enable the GPU
Date:   Tue, 16 Jun 2020 20:23:39 +0200
Message-Id: <20200616182341.944473-12-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200616182341.944473-1-lkundrak@v3.sk>
References: <20200616182341.944473-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Enable the 3D + 2D (GC860) GPU core.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
index 5f1da58550987..f1a41152e9dd7 100644
--- a/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
+++ b/arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts
@@ -272,3 +272,7 @@ sspa0_0: endpoint {
 		};
 	};
 };
+
+&gpu {
+	status = "okay";
+};
-- 
2.26.2

