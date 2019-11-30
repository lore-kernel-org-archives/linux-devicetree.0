Return-Path: <SRS0=1K1h=ZW=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECF1C432C0
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 116752075A
	for <linux-devicetree@archiver.kernel.org>; Sat, 30 Nov 2019 11:58:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pnZc9lD8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfK3L6j (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 30 Nov 2019 06:58:39 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36528 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbfK3L6j (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 30 Nov 2019 06:58:39 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so38122398wru.3
        for <devicetree@vger.kernel.org>; Sat, 30 Nov 2019 03:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ua3UF7OJvvMmYzZQhlb5rwLMVQGrclyM0ANoVUA74bc=;
        b=pnZc9lD8W4KAAKZBNOJY2IugbPFNKnDx2Lpbfg9vy3JN6+6xy0Q5+1K/eyzjycUhnY
         wKfFdstLYJSwLQdvz4FceqUJ5qgyWIkI7dmIkS8BsUxf3IvxA58uB1waH/HaCbB6MReh
         w8Et+bSqbHA4t4Bs9naDO4VM1ig5rNFMQ6o1fDrttxXt+wRLpQsPPgQkgxzeDmKB5sqr
         OiJS5VTaV3mkkHeFsh0taY7leLaTN9ghW+R7bs5GCpRHMjGuVEI/vIAkUWE6depAGon+
         NeF5FJv648GuR7EVxvC1NzbLvtx7hjhjr4jij0r40ZQZO4YcascwLgHoyckn6Y7YU3OP
         WHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ua3UF7OJvvMmYzZQhlb5rwLMVQGrclyM0ANoVUA74bc=;
        b=PU7dlHn/HGUC7Q4GkVxZ1pPbWryChqQ9ybVezn2sbvlGyArA7ibbHXup+Ep9SvlZ11
         5wFSNNsttQ2mXPiIf6NaVcUSOFwXF4YaPsvW41uDH51Njnzip33zskhCWQb0cU3fk1MN
         XdcvygZXQen3P5jWhUbVHJFZ+OvgoR0QE2f+d2IrOhrw+Yfm825ZAULUys2EhzH20h+M
         B1Xu27lMHslNUH72zKUeS3anEXEZnDZ9AjXdmHYxIdyKv9CCfs8ONbUF+7UfqgOReXq5
         KqM9pU2W5GY7QrkEDEsyFwSAQwCsJWMVBkncTYO8bnkk016P3xvFxvW5TS7rkwMIt16z
         ju1A==
X-Gm-Message-State: APjAAAXAPJzzX45W56HZO3vXVINgdmUNBfepmv4gWT6fs2DChH2lnC3H
        qCzB2mlR6+sNaRn5CoYsZwNT8tMC1n/ygw==
X-Google-Smtp-Source: APXvYqzlKGqg/jIJyhOhJPSVxWuX3dyaXOX1s2Pmv92grnLa2ou3Ona7DHcgrXvlsFfHZQlOursNqA==
X-Received: by 2002:a5d:5381:: with SMTP id d1mr35160039wrv.259.1575115116011;
        Sat, 30 Nov 2019 03:58:36 -0800 (PST)
Received: from localhost ([37.238.189.59])
        by smtp.gmail.com with ESMTPSA id b17sm31742286wrp.49.2019.11.30.03.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 03:58:35 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v3 1/2] dt-bindings: Add vendor prefix for Videostrong
Date:   Sat, 30 Nov 2019 14:58:23 +0300
Message-Id: <20191130115824.31778-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Videostrong Technology Co., Ltd., A manufacturer of Android Players & STB
(Android with DVB Hybrid box & DVB-T2/S2/C/ISDB-T/DTMB-TH/ATSC )as well as
HD media players.

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fd6fa07c45b8..a6c83d70aa74 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1008,6 +1008,8 @@ patternProperties:
     description: Variscite Ltd.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^videostrong,.*":
+    description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
     description: Virtual I/O Device Specification, developed by the OASIS consortium
   "^vishay,.*":
--
2.24.0

