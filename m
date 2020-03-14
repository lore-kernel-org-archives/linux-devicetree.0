Return-Path: <SRS0=kXhk=5A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D47C0044D
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:03:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9D6392051A
	for <linux-devicetree@archiver.kernel.org>; Sun, 15 Mar 2020 02:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWIjeJP0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgCOCDV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 14 Mar 2020 22:03:21 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44475 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbgCOCDV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 14 Mar 2020 22:03:21 -0400
Received: by mail-ed1-f65.google.com with SMTP id g19so17300739eds.11
        for <devicetree@vger.kernel.org>; Sat, 14 Mar 2020 19:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z7DU2t7m+cderg8EaFPtaxoNn5hdLKVNHAy6HvbA6dc=;
        b=mWIjeJP0nPIupxChcDDlB54fia4NXdGKZF0e4EDtiifIbpvl6Zm4hhE7J8QlRFZggE
         69lH1XwtORjB5Oar3rJWx5oDXqn7sjtgj0mFSSfmuWAyJGs9wc8o8pFtnrFeB+47isuK
         V65ixdoWDA7pPmR0b9UrAsdpFx4EAqSzhjQRHEviQPxZZ1ZcXy/G6p4nrYu1Kj2evFAS
         tJOPcsHyOaKZlMv159hBMcq4fclyLtSAiGmzTYT1H8A2yKVlo4gTnur3AOUTLJoKQFbb
         BMV3cotzSYuNtMFHyp+M/IMJYxiiD0aQvci5e8C+Vx0CNOpORejskDHs2+/QfLPwgGbq
         6dUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=z7DU2t7m+cderg8EaFPtaxoNn5hdLKVNHAy6HvbA6dc=;
        b=OT6FhUhzrmtQxdwNzz6u2Bf6DWAFZyDSMYLuwlWevRuHrHs0oyIzLybccxd1Y/6uUS
         YI7DnVmPvY65fLLSSeq8K2qyTLm7yvhuYOuYab1yDZQqFLPmaU7yT9k1DCnS+Z51rCi2
         GfXfRU6fn8sPlpLYu9MD0zM5/+oxUzUX9p/32+AauFWxdJ+11H0va+1WSCGhTA1KhA59
         F6DRsXWpIFNIiCHQcOd/x0OD5Z/4604THZwiyQNNhgl3BxtorpNQ2itvQ90pGw1hEn2i
         A7tKWHyVxyi6nVILPpYNIbpBTotdz66NeP2vM+QqKf5u6CxCN/oXbjxgFU3kjFSiB6GG
         kxGw==
X-Gm-Message-State: ANhLgQ3ER9tx8hGcFhmRfP9Vwil6D3Xc0CSJY5XdfUo26pWtkN3zej1P
        SDNZkgXPnFDciLV4paSoizFEOUc3
X-Google-Smtp-Source: ADFU+vvMNhFlIzGt4mHsSF+8Dtoa4Q7tmYluiY7kijokV6DgmoM/JC2yCdvw1k3HvS9iYBpzGhEUVg==
X-Received: by 2002:a19:c7cd:: with SMTP id x196mr11508387lff.106.1584199857333;
        Sat, 14 Mar 2020 08:30:57 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id n200sm15650418lfa.50.2020.03.14.08.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2020 08:30:56 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 1/3] dt-bindings: display: drop data-mapping from panel-dpi
Date:   Sat, 14 Mar 2020 16:30:45 +0100
Message-Id: <20200314153047.2486-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200314153047.2486-1-sam@ravnborg.org>
References: <20200314153047.2486-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

data-mapping may not be the best way to describe the
data format used between panels and display interface.

Drop it from the panel-dpi binding so we do not start to rely on it.
We can then work out how to best describe this mapping and when
we know it, we can add it to this binding.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-dpi.yaml   | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
index f63870384c00..0cd74c8dab42 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-dpi.yaml
@@ -21,15 +21,6 @@ properties:
       - {}
       - const: panel-dpi
 
-  data-mapping:
-    enum:
-      - rgb24
-      - rgb565
-      - bgr666
-    description: |
-      Describes the media format, how the display panel is connected
-      to the display interface.
-
   backlight: true
   enable-gpios: true
   height-mm: true
@@ -52,7 +43,6 @@ examples:
         compatible = "osddisplays,osd057T0559-34ts", "panel-dpi";
         label = "osddisplay";
         power-supply = <&vcc_supply>;
-        data-mapping = "rgb565";
         backlight = <&backlight>;
 
         port {
-- 
2.20.1

