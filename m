Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E25C3F2C6
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DF605227BF
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SJyQyDq1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbgCIPhE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 11:37:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37361 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgCIPhE (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 11:37:04 -0400
Received: by mail-wr1-f65.google.com with SMTP id 6so11788862wre.4
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JO9jA4wej8z6bMbXqjXhIPH6eryZ9XPj06LBS6ZMiaw=;
        b=SJyQyDq1UM/YXSj13kwT6lG3Cw4qlRKIIB5rVBJQJZBk66vcCUV43NSa0mQw998LTW
         3/yFd0eYGzErGlIbsW3W1BRwI5uTvEGf0wVteh1+TzxEoL+XpKlX8K+6pypcRVsR30Bs
         APf3RYYMZMy3KreQjXA+BpkUnieIhrg1+cbQzQMnyXwyhmS0hbnr7vAadq9J9LLeulbF
         JijmXbof3bIN5Ydd/ZME4reRqI8PSgqCzUkYj+sU5eSX9QBt/zF3GMXPIyEfbr8mq29Q
         zfVE+ec/ZTUNt5yL425PhSOe0rAHG1ud7c4iHbbfJ1t8m5An1wGnoyUfyiDXrML+xAnz
         YYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JO9jA4wej8z6bMbXqjXhIPH6eryZ9XPj06LBS6ZMiaw=;
        b=tdOYM3koWbhbaryzuSwpeLE4NLALOSFir+fBF3Ww9wdhc1GKkkwH+yBBFnj3R9E8sY
         CP3iNJbCH5a6qxbx8ZaSKzbSUj1I4+mpgHXpgyFcJC+u0SMcpQcedSQpg1Td1ncsw/NY
         7oEtSCteUQxTUTfSpsR2uEgy3DL3qLdaXuXU76TFWz0Tr7UweBxeyUBZCRShIssHMlPN
         uHTmkkfla4D2pJ0aN0xOSAxEg9muM6pR57A9Y8hU9jzSeqPIzE7nIvtxx+nVLrVlzgYu
         KoISRRiRJ9e3AdKAMLAJrheFC1+fg7ZqeCboWe+msh5uOyp4A2j2DKcxlbAoQMrUQY5a
         Zqrw==
X-Gm-Message-State: ANhLgQ3+2iqqi5MtWFZjHkUyKQtNQZBPy+ovL09gqe5zcNfWmCCke5og
        gbbRtiaawT+tTCYxzK0dAzlRCA==
X-Google-Smtp-Source: ADFU+vu7wtHOwNH6jHCcBKAE2TrwI+DBD+gaVAejfY4fo+ZZNqs7U5/kBjDVupFE9ZhVLQNelfT7Og==
X-Received: by 2002:a5d:6150:: with SMTP id y16mr18425625wrt.352.1583768222000;
        Mon, 09 Mar 2020 08:37:02 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net. [77.140.240.232])
        by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:37:01 -0700 (PDT)
From:   Phong LE <ple@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Cc:     Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org, sam@ravnborg.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: add ITE vendor
Date:   Mon,  9 Mar 2020 16:36:52 +0100
Message-Id: <20200309153654.11481-2-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309153654.11481-1-ple@baylibre.com>
References: <20200309153654.11481-1-ple@baylibre.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add ITE Tech Inc. prefix "ite" in vendor-prefixes

Signed-off-by: Phong LE <ple@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9e67944bec9c..16d4c776fdc7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -469,6 +469,8 @@ patternProperties:
     description: Intersil
   "^issi,.*":
     description: Integrated Silicon Solutions Inc.
+  "^ite,.*":
+    description: ITE Tech Inc.
   "^itead,.*":
     description: ITEAD Intelligent Systems Co.Ltd
   "^iwave,.*":
-- 
2.17.1

