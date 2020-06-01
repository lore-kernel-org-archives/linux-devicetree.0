Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC62C433E4
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB526207D0
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7cVNHhE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgFAIdW (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727124AbgFAIdV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:21 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA59C05BD43
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z6so7015095ljm.13
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l6EWP19aRaD+4jQ4w5XaCMBbBuo29gOghE8kK7mZeLA=;
        b=e7cVNHhEF5oLVK6Z/774yExJ1p50RNQ+Ohpx19HwJYJ1j7M6C18K9YQ1uUP59geDXT
         A/dvTH6r93r1BYWbaL0obD+CYgR3rbGq37RYV5A0kqtOEEaeVCUk6QKfOva+4DcD2UMW
         kiXBzRuEnFIQ/BxO6mSM3tflpnxzMxxsvjtk+q8qjmN4GB50WFkeBU75qPzZ8jcvdxv7
         9kfxIC7eo78GP1R2CROPFycXwz+tWNXPsGT49reA2F5C9dhIPYKfxsq+LQFmuXDFxXOj
         njGC8gOEaAheCl7ApW8OMl5Ma5bScgS4LtSobCvZyaQ1KhKxT2pegaBlofyoappEXr+x
         X9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=l6EWP19aRaD+4jQ4w5XaCMBbBuo29gOghE8kK7mZeLA=;
        b=HV91mqp6qcpVOrWr4pFOUNN/8anmx5V7Bged9BTpRAoR3qdcFPaCST2t7/kvn5UkfW
         F1L5YyHKXVevg1NTonZCJI3zPXFzrnkOmCkhslU4gpZeT3A+jzu6w/uzgljiz37+yRBN
         az3QWZNUgoX7NY3TaI7mv691gzMjNLlMyhUOFNoKmpodc3xmsb0cWRuefKaPtnxit/aL
         XrzIerbWM+NWdiC8lpPI0uyEwj5CYzhpwD0tzpbwBnGKNqbu5QBIERs0K2N9bzuU86y1
         TEUxt+/lrmV0p0AkfGOCO60EkNFRFPY6uH7xTvILAApzCmqGkXGo4uS2pbjvzqRwXCr1
         1DDw==
X-Gm-Message-State: AOAM533qh+HI8GRw65ZBoXEyDawMC65B+2elocuIrVPJNmOWi0dbbzDL
        zbZvRHLdG6KRQYTa2lajOn8=
X-Google-Smtp-Source: ABdhPJxcTe5+uWSaOKBKacGkZollxrVMlCckDg8YCCT9b6X/XEaFwDSZdSev/8FfZVetIHzyFraDUg==
X-Received: by 2002:a2e:140a:: with SMTP id u10mr4691553ljd.56.1591000399727;
        Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:19 -0700 (PDT)
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
Subject: [PATCH v1 5/6] dt-bindings: panel: add LOGIC Technologies panels
Date:   Mon,  1 Jun 2020 10:33:08 +0200
Message-Id: <20200601083309.712606-6-sam@ravnborg.org>
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

Add support for the following panels from LOGIC Technologies, Inc:
- LTTD800480070-L2RT
- LTTD800480070-L6WH-RT

The LTTD800480 L2RT is discontinued, but it may be used in
existing products.

Both panels are dumb panels that matches the panel-simple binding.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Søren Andersen <san@skov.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 6fe0ac86696d..a4910d4af96b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -183,6 +183,10 @@ properties:
       - logictechno,lt161010-2nhr
         # Logic Technologies LT170410-2WHC 10.1" 1280x800 IPS TFT Cap Touch Mod.
       - logictechno,lt170410-2whc
+        # LOGIC Technologies Inc. LTTD800480070-L2RT 7" (800x480) TFT LCD panel
+      - logictechno,lttd800480070-l2rt
+        # LOGIC Technologies Inc. LTTD800480070-L6WH-RT 7" (800x480) TFT LCD panel
+      - logictechno,lttd800480070-l6wh-rt
         # Mitsubishi "AA070MC01 7.0" WVGA TFT LCD panel
       - mitsubishi,aa070mc01-ca1
         # NEC LCD Technologies, Ltd. 12.1" WXGA (1280x800) LVDS TFT LCD panel
-- 
2.25.1

