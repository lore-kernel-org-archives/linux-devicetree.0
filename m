Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C973FC433E0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A25182074B
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eaxr1G/x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgFAIdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgFAIdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCAFC05BD43
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:17 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so5617465ljc.8
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8Yer3urQYiOMXfRZ9l+aQabnMndlBrbK8V5JUt5mhHI=;
        b=Eaxr1G/xdxbYkLuYx88rNIWZHLBEBrWPJTpzxgrV+T71VRLI9TeBmPh8q03bEk5Cr5
         WKhDUS3LqGw9nK22aPl6TUaeYYl0t54CK/+zFGnQ/SXwP/rAZttgjmuPEtyBEuI64k2H
         /qMNZzUyeF4I46o9LWfd2SieboteA4/dIipxTqpkoKuy9fiGxxBgTr6H46CVkCsedhst
         sGrG2BaoTdHIuQtsNzhuS1Km7+ykqmJJequuecJpN1r5LJnpNn/pT19WXKqInVLkMmoP
         naMYcItKiz5kEQFTWfzk3jkjfgY0I5Yhyf3i0E3UcGNGOtFXfI8pN0uNU9gv8wJ2tywR
         RWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8Yer3urQYiOMXfRZ9l+aQabnMndlBrbK8V5JUt5mhHI=;
        b=fKYKh0o8QgwUio5zQkvkECyAW5QxT2NNjntjRlF9nIeV84BiQfYHw3zOvxiHH1ofZe
         7BUzBPe128eGPoEQMa5nPsUw9n3JLTpXZyIwSteD74IB4AG4T9rDnyozqPPkpJV8Zvrx
         FQTXvuoHuOZnoU669ETSAzDyUXoyUyDJOrzeDNw6vrap1zZEbJmq3CWDRmhogqP+Tsje
         U7Sv+9E3bza8P072XJX1fLRmOmru+J3+/ottEeP9OME9Se5B2gTaz4HJiecKNXbwLzhL
         9rxpLmZfhd/5t8w7Gx2QVHcSgUVdcoVQjT9ibNdKHm+618UxNEDmLNB6ZznWTldHwqIx
         wPBg==
X-Gm-Message-State: AOAM5321Uy3jHGgAdMTKem8Kbf8UkTdWmv7tk/LaP+f2BIdeZyAAVSMa
        Cz/EHeKOTDLKa9N11i1h76E=
X-Google-Smtp-Source: ABdhPJyM06YDjm3IwmPKPeeF0RPISmSSuI3RSxjZq9mwb2e1/wrOilfm6lIy/U+oPxjpnBiQsd54yA==
X-Received: by 2002:a2e:95c5:: with SMTP id y5mr10278128ljh.229.1591000395626;
        Mon, 01 Jun 2020 01:33:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:15 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v1 1/6] dt-bindings: panel: add Seiko 70WVW2T 7" panel
Date:   Mon,  1 Jun 2020 10:33:04 +0200
Message-Id: <20200601083309.712606-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601083309.712606-1-sam@ravnborg.org>
References: <20200601083309.712606-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add compatible for Seiko Instruments 7" TFT LCD.
This panel is a dumb panel that matches the panel-simple binding.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Søren Andersen <san@skov.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca1479633..60cc093fbd75 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -239,6 +239,8 @@ properties:
       - sharp,ls020b1dd01d
         # Shelly SCA07010-BFN-LNN 7.0" WVGA TFT LCD panel
       - shelly,sca07010-bfn-lnn
+        # Seiko Instruments Inc. 7.0" WVGA (800x480) TFT with Touch-Panel
+      - sii,70wvw2t
         # Starry KR070PE2T 7" WVGA TFT LCD panel
       - starry,kr070pe2t
         # Starry 12.2" (1920x1200 pixels) TFT LCD panel
-- 
2.25.1

