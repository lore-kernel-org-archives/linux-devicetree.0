Return-Path: <SRS0=leSB=Z7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E92C43603
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:51:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B6B2207FD
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Dec 2019 14:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XogCXVx2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726783AbfLIOvr (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Dec 2019 09:51:47 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45175 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfLIOvq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Dec 2019 09:51:46 -0500
Received: by mail-pl1-f193.google.com with SMTP id w7so5897421plz.12
        for <devicetree@vger.kernel.org>; Mon, 09 Dec 2019 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
        b=XogCXVx2RXzDAutpzGtBCHE+T8kLmeCQvQsMdlbs1tDq7y1UrkAwc/k+g7CufIO+PA
         dpQKZ4iazoJSwFFuHkVnZErr6o6mC7eXyQQPeDi2oYU+ZfEdPXZgi7FkAEORJ/7BN9k1
         evO2wVdIGUA1AbJjhA2vmOqgRcmVLhvVO95t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jJwCq9E5sHUES1apw52pvzBBVDCgoOmF9UzMrlF+I9Y=;
        b=jPkC3t2ZR0KtfKtBv7hsKtRMlkCKBvLJN7RHjVlxDbcPbtDzVRz6PxTS+XJTL7koCN
         6VSW8I18f90S6rZx/5HOqzrwIJH7V0MjeUpHAPR1GEqIH0VgWkgwtV09qs25ac30ASti
         BlKc2OvAmbPzrIfG4Mlx3/idobDgkbfEaY/NaJ3bYe4IKS92WaiVEbbBQsE/G6LrZW06
         N2Y/6dhOmWVhwPKLQxqnF2FopK5nmW0Plal9Lkh3qdzu/rSdqpwzwBQWlFCqpkJXCY6T
         Ka4w9urzFG0/bn2ZIIICB7Q78icMqTtu7U2eh2O1CWovGN6QQz4m2xaJorRer6q9sVhP
         H++g==
X-Gm-Message-State: APjAAAX6fS7J0dL5h4AgPYihoLfpfTqmYM78IVti5qp424n9CQ6RVPvS
        28MkGgymhlZUz9ifib45IXz1jg==
X-Google-Smtp-Source: APXvYqxU02o6BtUzY2uYrPaZe5xjkP17fMbo/9XayXiUcb1MB3mIfbRhi9fLq+g8w3r6KCxzsaaOJw==
X-Received: by 2002:a17:902:a503:: with SMTP id s3mr5631915plq.38.1575903106015;
        Mon, 09 Dec 2019 06:51:46 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:b852:bd51:9305:4261])
        by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 06:51:45 -0800 (PST)
From:   Hsin-Yi Wang <hsinyi@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Archit Taneja <architt@codeaurora.org>, p.zabel@pengutronix.de,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>
Subject: [PATCH RESEND 3/4] dt-bindings: drm/bridge: analogix-anx78xx: support bypass GPIO
Date:   Mon,  9 Dec 2019 22:50:15 +0800
Message-Id: <20191209145016.227784-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191209145016.227784-1-hsinyi@chromium.org>
References: <20191209145016.227784-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Support optional feature: bypass GPIO.

Some SoC (eg. mt8173) have a hardware mux that connects to 2 ports:
anx7688 and hdmi. When the GPIO is active, the bridge is bypassed.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/display/bridge/anx7688.txt       | 40 ++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/anx7688.txt b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
index 78b55bdb18f7..44185dcac839 100644
--- a/Documentation/devicetree/bindings/display/bridge/anx7688.txt
+++ b/Documentation/devicetree/bindings/display/bridge/anx7688.txt
@@ -15,10 +15,13 @@ Required properties:
 Optional properties:
 
  - Video port for HDMI input, using the DT bindings defined in [1].
+ - bypass-gpios        : External GPIO. If this GPIO is active, we assume
+ the bridge is bypassed (e.g. by a mux).
+ - pinctrl-0, pinctrl-names: the pincontrol settings to configure bypass GPIO.
 
 [1]: Documentation/devicetree/bindings/media/video-interfaces.txt
 
-Example:
+Example 1:
 
 	anx7688: anx7688@2c {
 		compatible = "analogix,anx7688";
@@ -30,3 +33,38 @@ Example:
 			};
 		};
 	};
+
+Example 2:
+
+       anx7688: anx7688@2c {
+               compatible = "analogix,anx7688";
+               status = "okay";
+               reg = <0x2c>;
+               ddc-i2c-bus = <&hdmiddc0>;
+
+               bypass-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+               pinctrl-names = "default";
+               pinctrl-0 = <&hdmi_mux_pins>;
+
+               ports {
+                       #address-cells = <1>;
+                       #size-cells = <0>;
+
+                       port@0 { /* input */
+                               reg = <0>;
+
+                               anx7688_in: endpoint {
+                                       remote-endpoint = <&hdmi_out_anx>;
+                               };
+                       };
+
+                       port@1 { /* output */
+                               reg = <1>;
+
+                               anx7688_out: endpoint {
+                                       remote-endpoint = <&hdmi_connector_in>;
+                               };
+                       };
+               };
+       };
+
-- 
2.24.0.393.g34dc348eaf-goog

