Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78C1C54FC9
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:14:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8028121D82
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 03:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qa/QPTce"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbgDTDO2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 19 Apr 2020 23:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725988AbgDTDO1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Sun, 19 Apr 2020 23:14:27 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A54C061A0C
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:14:27 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id r20so4271240pfh.9
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 20:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T0lF99uLQLnyfKTe/QvdKgO5tiY6oaeN5iApPBgVKXs=;
        b=Qa/QPTce1Nvr39mGg1qJ6fJuqbaUygqB59ZfVi7Ix4Vwtg4wLN+eHK/SJC/cntMZxd
         Mh80/wuh9k6+H1W1dlPKnWF+/BcEWbN2syaU8u4gFPaQ5snReTBsg+xd0YWR3BxzVTlJ
         Er/4BUr0Ciu2gmRpB0Se9YzOmkh/wqZo164VF4QKQxzac3uaV1nn4vK90b26Tt6yNIY+
         BoLPtSn5cf43ZBPbi35RHCF3TLbMnpSI1Fan4T7gHZ1JeLvHIERhhZKa4bKQZzxdjZHE
         kfLg9NxplVOD2U06xN1WkKDkqgSo+zKvDIst6I3l7E9CnTB4D0hudhoQ2nFRPX5MiBzy
         ipSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T0lF99uLQLnyfKTe/QvdKgO5tiY6oaeN5iApPBgVKXs=;
        b=REWkIpz0SVAFhxHRHJxB5rJ8HxngoJ75VzEgjiBiGRwYt23bcdq/1hOPYb4OxgOdho
         U052KPccyfP3q3jYup/jZH3q/zEJ7CPLrf5OCYIZmc0g79IxkTstM+8+m5ibhp8tDGAU
         EUHS7+0z31HM4lz6uJ2e0YZKyHYc9x914ohWEhOLHMJNthhnuXrskKeXNO4BcqEdQNon
         oAbHk2Z5EPf5LyYRUpP2V4Ig82gywdoogwzoJWXRpKlYDbmmYXWknC4guPEi/GWpp8GW
         V7wcBbNdpsf63b5jP2XD2iVnECYiodlBWRNIypYBmlijf5clnoC3YISPUmmNgXIuV4GY
         J7Zg==
X-Gm-Message-State: AGi0PuYDbBnXFdXqC7shVgpJJZUY08B8lu7Q3a5R5JvTzlrRzogLWIDj
        F2zYkfaa1ZpuoFcqjzrCQonehQ==
X-Google-Smtp-Source: APiQypK84uc4ognzeD0viab/AZZOf9OkE9vw89Glm4qOs/xTJrWIPnM60HbOQ9wQITjs0qQbLxQfEQ==
X-Received: by 2002:aa7:9724:: with SMTP id k4mr512138pfg.309.1587352467446;
        Sun, 19 Apr 2020 20:14:27 -0700 (PDT)
Received: from devnote (NE2965lan1.rev.em-net.ne.jp. [210.141.244.193])
        by smtp.gmail.com with ESMTPSA id mu15sm12792830pjb.30.2020.04.19.20.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 20:14:27 -0700 (PDT)
Date:   Mon, 20 Apr 2020 12:14:03 +0900
From:   Linaro <masami.hiramatsu@linaro.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: Add Akebi96 board support
Message-Id: <20200420121403.aff9fb209ee0da7f20ed3ae2@linaro.org>
In-Reply-To: <158735030084.17831.6159788305648251972.stgit@localhost>
References: <158735030084.17831.6159788305648251972.stgit@localhost>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add uniphier-ld20-akebi96 compatible string for
Akebi96 board support.

Signed-off-by: Masami Hiramatsu <masami.hiramatsu@linaro.org>
---
 .../bindings/arm/socionext/uniphier.yaml           |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
index 113f93b9ae55..6caf1f9be390 100644
--- a/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/uniphier.yaml
@@ -51,6 +51,7 @@ properties:
       - description: LD20 SoC boards
         items:
           - enum:
+              - socionext,uniphier-ld20-akebi96
               - socionext,uniphier-ld20-global
               - socionext,uniphier-ld20-ref
           - const: socionext,uniphier-ld20

