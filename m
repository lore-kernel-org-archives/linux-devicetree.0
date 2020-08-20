Return-Path: <SRS0=Ay4y=B6=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BE4C433E1
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:16:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EFC4208DB
	for <linux-devicetree@archiver.kernel.org>; Thu, 20 Aug 2020 08:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KFzmlhAi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uRW5sXGQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbgHTIOS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 20 Aug 2020 04:14:18 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:45370 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgHTILo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 20 Aug 2020 04:11:44 -0400
From:   Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1597911102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hrpOUDL8p2h587aT5pRggjpfAapiWVtaXRmeOe7Oj/M=;
        b=KFzmlhAiyaQWEFTcQmjZqhJdGtHKnD5lQVtIhaYPfRz26yjD4D/XMoeskXFs+hrlI78SIe
        AMRBq61ukYw8Q9AzlS+flpDPVfcnFz4qUeiPm31TyLYLMjhNtAb5BogFnUAaI5OAo1Qj1N
        2ba2dTvdk4pImxDBSP7JKCXCd2ppOMjfBT/dZeszciYNZ0MQKOsbpSIXYnUeNyc/VORz6F
        JVHxaWnj+Wpk1Zlp+c/iNJhiGHFyuaNTNoesjd9FeJj23358mLusa1fuA09Q91dlwV7S+7
        v2yaTB+TN9hpRudJ1HB1sZx17M+4cE67ARWdQy7oozmN+4304KjafdTkNqBCBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1597911102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hrpOUDL8p2h587aT5pRggjpfAapiWVtaXRmeOe7Oj/M=;
        b=uRW5sXGQAVaEPmaS0LOL2NIksld9Ezc5Ayycv/Nw7xceWCZL7r6Qv0/di3ZGvD/UE2hPOY
        crFS3fA82VYNT9Ag==
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Kamil Alkhouri <kamil.alkhouri@hs-offenburg.de>,
        ilias.apalodimas@linaro.org, Vladimir Oltean <olteanv@gmail.com>,
        Kurt Kanzenbach <kurt@linutronix.de>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 7/8] dt-bindings: Add vendor prefix for Hirschmann
Date:   Thu, 20 Aug 2020 10:11:17 +0200
Message-Id: <20200820081118.10105-8-kurt@linutronix.de>
In-Reply-To: <20200820081118.10105-1-kurt@linutronix.de>
References: <20200820081118.10105-1-kurt@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hirschmann is building devices for automation and networking. Add them to the
vendor prefixes.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2baee2c817c1..3ab8162d80c5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -433,6 +433,8 @@ patternProperties:
     description: HiDeep Inc.
   "^himax,.*":
     description: Himax Technologies, Inc.
+  "^hirschmann,.*":
+    description: Hirschmann Automation and Control GmbH
   "^hisilicon,.*":
     description: Hisilicon Limited.
   "^hit,.*":
-- 
2.20.1

