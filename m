Return-Path: <SRS0=BM7I=BC=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230AAC43445
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 08:17:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F21C22086A
	for <linux-devicetree@archiver.kernel.org>; Thu, 23 Jul 2020 08:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ubwSm9P7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LZPJn49j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGWIRm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 23 Jul 2020 04:17:42 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:56176 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbgGWIRg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 23 Jul 2020 04:17:36 -0400
From:   Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1595492253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2WWBGPChZ4CkHfgjBC+nnXOcukUa/QY/X5qssqdPo7o=;
        b=ubwSm9P7w8t5mr5qgkhC/cCNPsHJRf8/QPLTxGOZiMKgXmEwb1ToR/ptltiDsUn+nqwk89
        QWAmoajGjy0ua+3aSTMQcfZVvet96UowCUrpe9amUPesaDD3yPyINTqv7SU/XLB9NTtTwL
        dOvFsoHa50yr58xL+L52pTx99i0bKJA9gbVH/8fXx1XP+t3i0Ci3j8Or7v8ZZTv5pyOXLA
        OSRE8/R9oH2HoSR2W76SUn4QamD6IArkFnwVzKDtv0qTWMTkDW3p+mUyAK8MNpvQtBid30
        Ts1ZFTBLo8jhfbbAEuA/EvW+pkoYcc+WbImWtSJynA7Y8+1hHzxDly3xBrtRiA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1595492253;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2WWBGPChZ4CkHfgjBC+nnXOcukUa/QY/X5qssqdPo7o=;
        b=LZPJn49jMNJk9Y2w0HMtS7/OJ70fAwBFpbDqS+7rFKozhi9Cuhkd8yhlS4VZxeRaGeEjTC
        5tMZc21E0t6BgTDA==
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
Subject: [PATCH v2 7/8] dt-bindings: Add vendor prefix for Hirschmann
Date:   Thu, 23 Jul 2020 10:17:13 +0200
Message-Id: <20200723081714.16005-8-kurt@linutronix.de>
In-Reply-To: <20200723081714.16005-1-kurt@linutronix.de>
References: <20200723081714.16005-1-kurt@linutronix.de>
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
index 9aeab66be85f..279a10418ce8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -429,6 +429,8 @@ patternProperties:
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

