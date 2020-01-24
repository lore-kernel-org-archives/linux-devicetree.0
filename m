Return-Path: <SRS0=u7up=3N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB78C2D0DB
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:27:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 064772075D
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jan 2020 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579876057;
	bh=qrQvkU+aV1DaKdMny9iBbnqh9o3QeD2Mk64oFml+xUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=RmQ8UQDwk/QOV4PxQA0yySMKpPzIJNnJx8yj3WlMBpPkQIFuUMGcFp7ATCYWYofYu
	 J+a8DNbITdl5nD1QVAYpsFTSssRKH22yIJPEDnVmNPf5lRiGw06g6rqYThu5CgA0Ev
	 V7IKM4PixYKYN404qI8uxMaW37JiVbEUxpOLlLsY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390461AbgAXO1f (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jan 2020 09:27:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:43036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387426AbgAXOVW (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 24 Jan 2020 09:21:22 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5CC762087E;
        Fri, 24 Jan 2020 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579875682;
        bh=qrQvkU+aV1DaKdMny9iBbnqh9o3QeD2Mk64oFml+xUo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BpJWH2AqDy/5YbiNFI6su06fOu2g6qrUwc02pwfgqHF19dI6DJKqQ2m58MPJomWqW
         ffdigt5EVV/ywKdy4ZPxO5gHMuQ41yEDoDg3HiPFLw/OTSwYCGs2t1iXjkqbVX0q+A
         1HgY+pN5WD1xpLL1GzNWC9O5p9nGI/vETtr866DE=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 02/32] dt-bindings: reset: meson8b: fix duplicate reset IDs
Date:   Fri, 24 Jan 2020 09:20:49 -0500
Message-Id: <20200124142119.30484-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200124142119.30484-1-sashal@kernel.org>
References: <20200124142119.30484-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit 4881873f4cc1460f63d85fa81363d56be328ccdc ]

According to the public S805 datasheet the RESET2 register uses the
following bits for the PIC_DC, PSC and NAND reset lines:
- PIC_DC is at bit 3 (meaning: RESET_VD_RMEM + 3)
- PSC is at bit 4 (meaning: RESET_VD_RMEM + 4)
- NAND is at bit 5 (meaning: RESET_VD_RMEM + 4)

Update the reset IDs of these three reset lines so they don't conflict
with PIC_DC and map to the actual hardware reset lines.

Fixes: 79795e20a184eb ("dt-bindings: reset: Add bindings for the Meson SoC Reset Controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/dt-bindings/reset/amlogic,meson8b-reset.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/reset/amlogic,meson8b-reset.h b/include/dt-bindings/reset/amlogic,meson8b-reset.h
index 614aff2c7affe..a03e86fe2c570 100644
--- a/include/dt-bindings/reset/amlogic,meson8b-reset.h
+++ b/include/dt-bindings/reset/amlogic,meson8b-reset.h
@@ -95,9 +95,9 @@
 #define RESET_VD_RMEM			64
 #define RESET_AUDIN			65
 #define RESET_DBLK			66
-#define RESET_PIC_DC			66
-#define RESET_PSC			66
-#define RESET_NAND			66
+#define RESET_PIC_DC			67
+#define RESET_PSC			68
+#define RESET_NAND			69
 #define RESET_GE2D			70
 #define RESET_PARSER_REG		71
 #define RESET_PARSER_FETCH		72
-- 
2.20.1

