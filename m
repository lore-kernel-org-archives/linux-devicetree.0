Return-Path: <SRS0=r6ca=Y6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DB8C47E49
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 17:59:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECD5D217F5
	for <linux-devicetree@archiver.kernel.org>; Wed,  6 Nov 2019 17:59:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xwxnzklr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727397AbfKFR7T (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 6 Nov 2019 12:59:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32877 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbfKFR7T (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 6 Nov 2019 12:59:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id a17so2143185wmb.0
        for <devicetree@vger.kernel.org>; Wed, 06 Nov 2019 09:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohhCdIQyNDGo4eqK+kLi0fkekXyA+TQ2KHQjimtJFL0=;
        b=XwxnzklrwC7y3u9+CJmI5+Kwk+goAsS84fqa3fC4ttevbOLPLvyc1qHPKZkfYp3eqn
         PJYm2IjM899Qslu4NSr4KvWp7bztE5VUhWkxEXVzmVd633mUbMFL3MziKJHt4Voq/3GH
         UY7nyq6IMb5q2xrmmikKdx4LlD9hyFCkN4LR00NnRDZ6oqdJvaBBYFMZuFZJEqXp1hRx
         Cyi3LUFmqD7TxhsfUH9pe4WKQHp8JAuG7Uqs8rH//Goq6iCMSCBAHSWudtANXzP4B/vR
         tg3+zB3jVKbNlCNkTAZIcY3Z+R0HzF2AxDf4t6WK7193moPvxvsJWeOeoBwLugGZF9FR
         Zejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ohhCdIQyNDGo4eqK+kLi0fkekXyA+TQ2KHQjimtJFL0=;
        b=ofNunsg5unkyKicoYL3N0daaDrv8FYt1RM9/lXwtXwUHmfMl7kEBxpzgeeYrVTHCK5
         VbYJo+0z0ek4Ggvs8dh2YRBOhdh4YTEyLNDTxCO4Net0tvNrRU/IBKAe+9i3GabqFqbW
         i4hK+OSdcJHQ/kVGbLmUSvc5SNncAMeLMMtr2WJ3hT0lduSN7Qg93HxkSm29VWkJlzV9
         dmsK0m8ulFS0MSE/I6/r/pJr5yNpwSgwy/w1MjfZUUrXlZrxBBZ5YLzS98BM/mEK/LDL
         L5k2zDHxB9hWLmF57EfTt2PjpC+GY65eKBI8xAIAeyUAyPlbVeApElrnqooIq5N5rD84
         TWuQ==
X-Gm-Message-State: APjAAAU5CQfCZgJkVueG9zE3o0RRgUqu0t0t/LPX7aylrRLvvPwpwWIm
        o9Yg1aEJQ3nGuTZFh/jXexPpbfIA3zI=
X-Google-Smtp-Source: APXvYqyz6kIMCTBVSrcHZYaOttuckNTvYf5lfHiASZp9OADbEVDbjDa5pyxJcAz4ASlpA4jnAsPYsw==
X-Received: by 2002:a05:600c:12:: with SMTP id g18mr3966165wmc.44.1573063157626;
        Wed, 06 Nov 2019 09:59:17 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id u4sm14546463wrq.22.2019.11.06.09.59.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 09:59:16 -0800 (PST)
From:   kholk11@gmail.com
To:     devicetree@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>
Subject: [RESEND,v4,2/7] dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
Date:   Wed,  6 Nov 2019 18:59:05 +0100
Message-Id: <20191106175905.59745-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

These two clocks aren't present in all versions of the MDP5 HW:
where present, they are needed to enable the Translation Buffer
Unit(s).

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/msm/mdp5.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
index 4e11338548aa..43d11279c925 100644
--- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
+++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
@@ -76,6 +76,8 @@ Required properties:
 Optional properties:
 - clock-names: the following clocks are optional:
   * "lut"
+  * "tbu"
+  * "tbu_rt"
 
 Example:
 
-- 
2.21.0

