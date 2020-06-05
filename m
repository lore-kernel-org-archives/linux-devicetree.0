Return-Path: <SRS0=PVp5=7S=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD8EC433DF
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B97E20738
	for <linux-devicetree@archiver.kernel.org>; Fri,  5 Jun 2020 03:49:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CKsaViqh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgFEDtx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 23:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgFEDtx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 23:49:53 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D3BAC08C5C0
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 20:49:52 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id y5so2371197qto.10
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 20:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jCKvwkQZSa1fCIJgRci4SNm+ecTY7BLQ/n3YL8J5gJ8=;
        b=CKsaViqhw2d9KHrAB8tPbJOWXOsP2J7LAiZdqefwat20nJjXJoMsZsder6wp3aDa7t
         zipnI1U/z3PwikCcVYDXrkwZqGHkYxSOsHFMO1nRrBRRaw5rxn6J9oxryTzII7AzMNT1
         7zvAAHsXxMv7ahYncyzE4YxuEEJel3Y+40dKdR61r39jOPGwNprCjj9MfchBK4RiIF1s
         1ifH9c+Dri38GJhhDX9/PltRk5pmLXAbGqf3EDF8EyCEqC/JZAU9zU6R3ZVcdF3bdDv8
         XTFJbTE5/STektjUEJXGSMpVgQxWFziqhFOa+kGcGOqT3Dl+22HtSOnC8xxWEVji/XN3
         TG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jCKvwkQZSa1fCIJgRci4SNm+ecTY7BLQ/n3YL8J5gJ8=;
        b=lvFLiaaPh4QYLBJrf1tAJfrjHtaapgFMBuqmzbaKCBnUFmp4SixT3gE206S9P/adgL
         aHrViXGYHr7HLz6vt1/ETF0HNGw+tWEIFTUb1pu/tTnohijKoFUhpibm8mX+edvnRqDM
         CbU89zGaaAg1SJz45SlSnffOXpnilybBPsQGINWsLkSIS16cmHYv4Qt4hn301wy7GFuC
         uvca/o27UiDorztHXB+GLKFm0vG+XyPHydT+1WeePIYysIBITd29H5wofuccmv+SyUY4
         Tk8Jbn8PBoTlyYt8Oac2F4AHV879jBq1mvcdLaF+t171Tb+8y5UsYsoyojOWgsXgDDZb
         3nDw==
X-Gm-Message-State: AOAM532zrUIMNCVD0hN1mfpOfNwnii3WfaHl/Z7GjEHdkPKeEQ9+f3wV
        +6wlN11E7J9Gp14JKWHaVUf5oS54zZiU
X-Google-Smtp-Source: ABdhPJz95KhsyQun9QYEz+apHIZfhyAEfeiqcXg7IbVhQZOOg3TMrjIsXxA+nrLSiH5jnauwUMWJQhC4EBjy
X-Received: by 2002:a0c:f6c3:: with SMTP id d3mr8089108qvo.138.1591328991352;
 Thu, 04 Jun 2020 20:49:51 -0700 (PDT)
Date:   Fri,  5 Jun 2020 11:49:31 +0800
In-Reply-To: <20200605034931.107713-1-tzungbi@google.com>
Message-Id: <20200605034931.107713-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200605034931.107713-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
Subject: [PATCH 2/2] ASoC: dt-bindings: add compatible string for MAX98360A
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Maxim MAX98360A audio amplifier is functionally identical to MAX98357A.
Adds compatible string "maxim,max98360a" for driver reuse.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/max98357a.txt          | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
index 4bce14ce806f..75db84d06240 100644
--- a/Documentation/devicetree/bindings/sound/max98357a.txt
+++ b/Documentation/devicetree/bindings/sound/max98357a.txt
@@ -1,9 +1,10 @@
-Maxim MAX98357A audio DAC
+Maxim MAX98357A/MAX98360A audio DAC
 
-This node models the Maxim MAX98357A DAC.
+This node models the Maxim MAX98357A/MAX98360A DAC.
 
 Required properties:
-- compatible   : "maxim,max98357a"
+- compatible   : "maxim,max98357a" for MAX98357A.
+                 "maxim,max98360a" for MAX98360A.
 
 Optional properties:
 - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
@@ -20,3 +21,8 @@ max98357a {
 	compatible = "maxim,max98357a";
 	sdmode-gpios = <&qcom_pinmux 25 0>;
 };
+
+max98360a {
+	compatible = "maxim,max98360a";
+	sdmode-gpios = <&qcom_pinmux 25 0>;
+};
-- 
2.27.0.278.ge193c7cf3a9-goog

