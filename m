Return-Path: <SRS0=eA0J=A2=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C517DC433E2
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:49:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F436206F4
	for <linux-devicetree@archiver.kernel.org>; Wed, 15 Jul 2020 07:49:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yfvzjf4u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbgGOHtW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 15 Jul 2020 03:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgGOHtV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 15 Jul 2020 03:49:21 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AC5C08C5C1
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:49:21 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so2686221pgf.0
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2020 00:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AvUYaZdTBJOJT4skplAAvkJuJ1Wq6R9AP4tH75ZrRy8=;
        b=Yfvzjf4uQhFQ3iiZ5Gopk0tjd4eTIzdPUwdWjIhr83TAMELSaGbvOPrOOcdrLn+8Ag
         W3UC77VHMkmg0jEQ6MY6S8qFzt4J4KBytWDGraf+22OAp9jVSpoO++6zNHYM2JPgi3eF
         0dzNj78rTpDvxvwNT+eEwUlOEO2c44ExSxuhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AvUYaZdTBJOJT4skplAAvkJuJ1Wq6R9AP4tH75ZrRy8=;
        b=oGCtXmWByQlAWzEKGpp12o6ORReQZzjmxYDoowezjPeMwTfeJZeLrE2LvR9/tvrZkn
         7NJnEZ+jJcEeNee+zlI2FvkxILCSf6WaqbqwisN7Gq2V2CvmUekPmtFa6q3eEb2IDE4W
         I+CA6fCQvUfuN9ju+uQOWNHIBmkaU4ClGIkUfWv3zRilElHVtBWF8WQ2NO/STyvTXqPy
         9INW1urn+Q08hCEdmSnFzZ+15rRxdQcX9RP6YqxzyTrfrq6H/3Ogo0y/aEd8lhiuVAmc
         dPNa+d2I9eCa5vqBP2ko9dHUoD9JC/pRwHR9nJp7ztTIwTDNpl10QgAW9Im5pZbu2Mtz
         MARw==
X-Gm-Message-State: AOAM530J+6C4U7mCqiWXmn6OmWW2bRHPksxqTPbvq2By6UHzaLmtbuiS
        fl4ze5MXDn/6kzkHr5tsSe9HkQ==
X-Google-Smtp-Source: ABdhPJzL1M78tbYggyyVZ6z0szvFqkdhrNRhCxOjhcPk+1HQ4/2RhGd7uaOXdyjkI7gmrmd1BvGCmw==
X-Received: by 2002:a62:3587:: with SMTP id c129mr7799705pfa.212.1594799361142;
        Wed, 15 Jul 2020 00:49:21 -0700 (PDT)
Received: from bhanumaiya-glaptop.hsd1.ca.comcast.net ([2601:646:9500:590:250:b6ff:fe8e:b459])
        by smtp.gmail.com with ESMTPSA id ci23sm1203329pjb.29.2020.07.15.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 00:49:20 -0700 (PDT)
From:   Bhanu Prakash Maiya <bhanumaiya@chromium.org>
X-Google-Original-From: Bhanu Prakash Maiya <bhanumaiya@google.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Lee Jones <lee.jones@linaro.org>,
        Furquan Shaikh <furquan@chromium.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Eric Peers <epeers@google.com>,
        Duncan Laurie <dlaurie@google.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.Kernel.org,
        Bhanu Prakash Maiya <bhanumaiya@google.com>
Subject: [PATCH v2 2/2] dt-bindings: mfd: Add DT compatible string "google,cros_ec_uart"
Date:   Wed, 15 Jul 2020 00:49:07 -0700
Message-Id: <20200715074907.1756034-2-bhanumaiya@google.com>
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
In-Reply-To: <20200715074907.1756034-1-bhanumaiya@google.com>
References: <20200715074907.1756034-1-bhanumaiya@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Bhanu Prakash Maiya <bhanumaiya@chromium.org>

Add DT compatible string in
Documentation/devicetree/bindings/mfd/cros_ec.txt

Series-to: LKML <linux-kernel@vger.kernel.org>
Series-cc: Raul E Rangel <rrangel@chromium.org>, Furquan Shaikh <furquan@chromium.org>, Duncan Laurie <dlaurie@google.com>, Eric Peers <epeers@google.com>, Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org

Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@chromium.org>
Change-Id: Icfeab15fa04daaffc61280faf5a75cd9b23ee822
Signed-off-by: Bhanu Prakash Maiya <bhanumaiya@google.com>
---
 Documentation/devicetree/bindings/mfd/cros-ec.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/cros-ec.txt b/Documentation/devicetree/bindings/mfd/cros-ec.txt
index 4860eabd0f729..ec8c5d7ecc266 100644
--- a/Documentation/devicetree/bindings/mfd/cros-ec.txt
+++ b/Documentation/devicetree/bindings/mfd/cros-ec.txt
@@ -3,7 +3,7 @@ ChromeOS Embedded Controller
 Google's ChromeOS EC is a Cortex-M device which talks to the AP and
 implements various function such as keyboard and battery charging.
 
-The EC can be connect through various means (I2C, SPI, LPC, RPMSG) and the
+The EC can be connect through various means (I2C, SPI, UART, LPC, RPMSG) and the
 compatible string used depends on the interface. Each connection method has
 its own driver which connects to the top level interface-agnostic EC driver.
 Other Linux driver (such as cros-ec-keyb for the matrix keyboard) connect to
@@ -17,6 +17,10 @@ Required properties (SPI):
 - compatible: "google,cros-ec-spi"
 - reg: SPI chip select
 
+Required properties (UART):
+- compatible: "google,cros-ec-uart"
+- reg: UART baudrate, flowcontrol
+
 Required properties (RPMSG):
 - compatible: "google,cros-ec-rpmsg"
 
@@ -72,5 +76,6 @@ spi@131b0000 {
 	};
 };
 
-
 Example for LPC is not supplied as it is not yet implemented.
+
+Example for UART is not supplied as it is not yet implemented.
-- 
2.27.0.389.gc38d7665816-goog

