Return-Path: <SRS0=biny=ZJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A71C432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10D522084C
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSeJy5g3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfKQR4S (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 12:56:18 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35603 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfKQR4S (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 Nov 2019 12:56:18 -0500
Received: by mail-wr1-f68.google.com with SMTP id s5so16798772wrw.2
        for <devicetree@vger.kernel.org>; Sun, 17 Nov 2019 09:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
        b=eSeJy5g3gv+YTAl+bQkUerbEkkqew528sHN1YJqT7ZXDps4MWSlYhAv55GIVXDYpfj
         sYh9VIv36Yato1zA7vjZzWQkRZmbkx2YeL/kfH45zVSNfJ6TmnlLI0nxxnepr2o2Cona
         NplR5KK6X+hGLuGFtjeZ2u65+RTRg6PY/TXcAso3OfSPFbjRFxwp+7y019CeekaoMd0g
         vQS0RQjAHvuTZvyQGu0Z8sXyzebdQCvDpIN81njD+k8gIKWYT2pq4ZZuzw0Mt0QUhGlG
         iHf0sOPhRGjluG3a31Yb4jzRZ8msA8BQCwj5ot6T0nbZJPpa6UYUQ32ZmhZlfMozDwye
         k97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
        b=KYliymJHkMuJigbt/GxiTbdy7P3nNGozrnaJOJKaKK9MzrqRkOkaXOwNNLOzH3Rmga
         roQPEYzDREyrKBfgxGyel5Kx3/8GHC0UqJOpwNWVoJkFd2vzfX61MrQVfFJhhjUu831Q
         I9aGMNjnSly+WBk7tTkpEJTlLEjRQHNvaI4aU2xY0lPbVx8HXv4JpQDHyqGAaOwPBV5f
         EPIMWRnwgtuMgaWd7VGyMdtJQRKT9jxn+9C6fbdd8jh+Vf9Mdz58POchbsiBiRkXilkP
         lMdBorIu1g3l5KF5nMjVQhABQNJ9m5MhOoM5MGhpJs0x3OZsMmxy5bDps3fVNixMue7a
         qkiA==
X-Gm-Message-State: APjAAAVw9+pkGnLNwG+GWzNpU8MyFTBLGcWBJxnGFgiFbsx45st+X1tC
        k/FGT5fG++slGDn5boS0a4g=
X-Google-Smtp-Source: APXvYqwy9tcGuT7hTcbnXIMNvbu3T1d3rU2SQ4YzmMMVn7sXKSP5lJ4lS7dr/LvPdANiaeZuUsfRYA==
X-Received: by 2002:a5d:522e:: with SMTP id i14mr10330423wra.27.1574013376288;
        Sun, 17 Nov 2019 09:56:16 -0800 (PST)
Received: from localhost ([37.238.189.25])
        by smtp.gmail.com with ESMTPSA id j11sm19574118wrq.26.2019.11.17.09.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 09:56:15 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH 1/4] dt-bindings: Add vendor prefix for Videostrong Technology Co., Ltd.
Date:   Sun, 17 Nov 2019 20:56:03 +0300
Message-Id: <20191117175606.5050-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
References: <20191117175606.5050-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB( Android with DVB Hybrid box &DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC,,)as well as HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..e4bd0a9fd4e5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1006,6 +1006,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
-- 
2.23.0

