Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7066C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B94FB20885
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 16:49:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRN5xFCT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbfKTQtY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 Nov 2019 11:49:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41070 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfKTQtY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 Nov 2019 11:49:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id b18so618119wrj.8
        for <devicetree@vger.kernel.org>; Wed, 20 Nov 2019 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/tfNmuMMwyQORb9MmSyqJxqNXHVoAVkzV3jsy1XM7mo=;
        b=BRN5xFCTeldhvhmzSobTZawZRCXwUl4SMRKouHm315jXJg8aoic4Qfwp8AjzhvLKv0
         VuAUzil2nDpggMs2JfXZYFDd++7BH9kHGsbdCK4uaZiBCMCVQWxbS/D7KkRI18v6v45s
         iBuQ7IMZhu0n9MRxDSMopj3G5PG/z+4fItQYxK8HfG3XuecDm4PeCI8PqJ7IbhVEieqt
         Ir548yW1xvP6sxTXEiCU/UZ00/OVzJtFqpLGFsTrbY2P2Tse6uTMujTIih87TI3nYZqS
         AVqg3UzKMaK5pCuO0yjYY1RWc7c8CbET6aMlPGElb0Ob1Jjf1j+M3et2DxTsX4SJJISC
         jjHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/tfNmuMMwyQORb9MmSyqJxqNXHVoAVkzV3jsy1XM7mo=;
        b=gVF/OK1HpYBMEMXkX8+FIdwgmMQyhtW5Vxa0HaSFW8nE1xsocrcUxjscMcNKBsYlX/
         F7WjLAxCsxkAbhMajG+utOEsgZ3JlRdaYG9L/ZFChnUcu09Jzt6vOZA6s1nm/i9Lrlcx
         CgkUVygJ4nJlPOS4CUZGROOK0J8957LXV9wESyIKerWqp3Yzah81w1NVVU6jkR9ODl/v
         lQOSG4t20AhfgKfIkCd+ATtG33xjc4b81xt0JG2Wy/0XxiTGgiqOpFrlHfQp32VigbzA
         AsmlS6fEaXAb2KudO+GGn7V0dL1MrSntBvcCBcwsHrBGUH5VUUxLgMFT86E4pX4dBLJY
         INyA==
X-Gm-Message-State: APjAAAV5mQTAGHb7YrifJ5hyvDlu98jWNRe3YvhdQ/Xmr7dw6SbgGFjH
        FUh72+/nDlreJ/aFyMSEkpo=
X-Google-Smtp-Source: APXvYqwU5OvZpuB8HO7URS5VALwX3xIgNC29r6N4jPORB+576yjnLXrwHXsRbOBUUYFhNm+t3sW84A==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr4415174wrr.368.1574268562949;
        Wed, 20 Nov 2019 08:49:22 -0800 (PST)
Received: from localhost ([37.238.189.2])
        by smtp.gmail.com with ESMTPSA id h15sm34858641wrb.44.2019.11.20.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 08:49:22 -0800 (PST)
From:   Mohammad Rasim <mohammad.rasim96@gmail.com>
To:     linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Mohammad Rasim <mohammad.rasim96@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/2] dt-bindings: Add vendor prefix for Videostrong
Date:   Wed, 20 Nov 2019 19:49:15 +0300
Message-Id: <20191120164916.31698-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
References: <20191120164916.31698-1-mohammad.rasim96@gmail.com>
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
2.24.0

