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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C65AC432C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00EA1206D9
	for <linux-devicetree@archiver.kernel.org>; Sun, 17 Nov 2019 17:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND/M9msc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfKQRZH (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 17 Nov 2019 12:25:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37794 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfKQRZH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 17 Nov 2019 12:25:07 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so16173264wmj.2
        for <devicetree@vger.kernel.org>; Sun, 17 Nov 2019 09:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
        b=ND/M9mscgT+cliFMhwYfjCX+qBTbahBDoHQeILn1cjB0/pU78TBH5y6RZVYnQ2Xuiz
         WJzf19xR9AMpeWjTCa2e68F5epzypApCSPZmT99rz+UvtR66cNNssQg6GgZGvGa2ZWLR
         PWosJRqhGCYg8bFY/obsKXwlYTFfdQDp5GEvq3SXinkuLwjLHtNqnYUggvTGoEsYxK3d
         B3M9CllZuODcRy9v24jH/aCVDlYCDtpalpbjRk6pJkTEK+q95o0kZ1Npx7nsZuVQh2Rf
         NdOaEQbcGaoYPdYjId97ICUm9lqzIv3slYS/1vx4gyDkDSQ0u0ldmneym9yIn9E2eIsj
         PwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KQN6gwOKGkmVRkt+hwPxqq6Jnl9Fa2wsCKH+gEVtNFk=;
        b=WnxQNyqXTC8WmtooVnDcRPwBgeaank7Lyqvj6nXj6ZKunCk/gKnPp/hHzKHUAkdHf8
         JWu4xvq64xzgIXcd5TAisXMfypvIDsOa+hJrfd172OZoPjR8FHJw2ERtnKk5rLPB/BcJ
         3ogSrG7XlV36p2I1ldUMcqZMCYt8eS4DFNWav0gplNdaKYsFpNr5SNfS7Pg5jIFmfdrZ
         6rTMxHQoaKtwMadnzi49akbwLaEXxAechB/uf5wHmqeanrdO8LcpXQ2KP965mkOST1fe
         WVYadYmElki1BkxhUqR5eEH4Q8z7Po2Isv0TCdJ7fkBz05aFqhnWLhxYEUnk8/Z7IUc7
         0NuQ==
X-Gm-Message-State: APjAAAUv0ihnDDDmUzS3g9kCGONk5g3h7GLmf/Dp9oTvOtvtSeWsJEBN
        Dv6RteURIwIS0Lx3xPM87fs=
X-Google-Smtp-Source: APXvYqwYCkxH8WT5tnyVMQL8Y+OCQt9QGi+31SfNr+dAqz7TOYBP2GOBP00uQ6UxnDeC5KkdMUdbdg==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr26008436wmb.95.1574011505146;
        Sun, 17 Nov 2019 09:25:05 -0800 (PST)
Received: from localhost ([37.238.189.25])
        by smtp.gmail.com with ESMTPSA id m9sm19379328wro.66.2019.11.17.09.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2019 09:25:04 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH 1/4] dt-bindings: Add vendor prefix for Videostrong Technology Co., Ltd.
Date:   Sun, 17 Nov 2019 20:24:59 +0300
Message-Id: <20191117172459.12688-1-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.23.0
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

