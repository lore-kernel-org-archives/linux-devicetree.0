Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CB3C433E0
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 14:35:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6302120885
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 14:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLpBGuIN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgGDOfz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 10:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgGDOfz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 10:35:55 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B86E8C061794;
        Sat,  4 Jul 2020 07:35:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so40220666ljg.13;
        Sat, 04 Jul 2020 07:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RSyrJuSDknNeqRlmj8bIK5Vdtz9ftR4YhPWSIC5vrws=;
        b=RLpBGuINGz2ZbLXoy4Vf+xPYxukzPyyNkyZPUXphO/NcTiHZr6EZiIzVfUz0eJB9S2
         /EwTLsnPTdfEh9SrjKe8mufzhLkxu4gtDthSydKXdh84OV3U2P27lNzGuM+jpyboqZO5
         7zYQUYdzu4FPoiT2YxMWm+5i5YEaKIdGkqAANYE+1ft0joETvBwJsXZbqiKnpVAGJlna
         tNgakSH74CfB21LNALNjr2OIg8J+pUt2gBPAG3WGpRIRej0ylq/HRLwF0BkSF+IdG82B
         rITznNiV11h706fwv4GhllZfTeR5AqW5NRdZ6LobmE9B4csHObfYMf6EMjnnZRCo3ZiN
         Q/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=RSyrJuSDknNeqRlmj8bIK5Vdtz9ftR4YhPWSIC5vrws=;
        b=K/WYdBdufo1AJ/7DkfvOnSYleS2TMsfrvC0Wm3T2HQP6j8B0beaaaxpiIdXNn/pU7T
         WqndAwiJnTx3G0LvKJ55U4veXtUV9h61Hc0TWEmVBXdScR/7gjYZ6D2QauTrmd1PrN9N
         Bh6aO8JR1+7RhzE75ZtAXWKVxXgUYEdJv15EwOfsONyWXGslU5rlH0CHrPXn4XJ+S/G5
         p+0eEaadJfdsovnCB5ehwStY/iQm1YZt/PUwTlTZ83WWwNpj8Hu6QBMwc4TnC5QAPq8k
         YM2Eqm1xdY+7f/oDUGrODAJN3lp61aLs1647rRL6wFItKwB7aSiXf3PIQL1N8jc/zC66
         rXDA==
X-Gm-Message-State: AOAM530PMftDbJbHOBueXLP7wFy6KcjNCqGz+npPxie3tc6eA6T9bCIL
        d3z3K82iXynw2l6iNapA7mU=
X-Google-Smtp-Source: ABdhPJzbguWBoqpi25Z8FzFDM9eW6IcGJ+/Tpa4yANpYepPYeCKwCoc+EFIJ4dSuk161JDTB5tcogw==
X-Received: by 2002:a2e:920e:: with SMTP id k14mr23393141ljg.430.1593873353261;
        Sat, 04 Jul 2020 07:35:53 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id 144sm6407556lfm.87.2020.07.04.07.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 07:35:52 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org
Subject: [PATCH v1 1/1] dt-bindings: fix simple-framebuffer example
Date:   Sat,  4 Jul 2020 16:35:44 +0200
Message-Id: <20200704143544.789345-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704143544.789345-1-sam@ravnborg.org>
References: <20200704143544.789345-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Now that dt-extract-example gained support for using root nodes
in examples, update the example for the simple-frambuffer binding to use it.

This gives us a better example and kill a long standing warning:

simple-framebuffer.example.dts:23.16-39.11:
Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node

Note: To get the update dt-extract-example execute:
pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-fbdev@vger.kernel.org
---
 .../bindings/display/simple-framebuffer.yaml  | 45 ++++++++++---------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 1db608c9eef5..6f23ea14132b 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -152,28 +152,29 @@ additionalProperties: false
 
 examples:
   - |
-    aliases {
-      display0 = &lcdc0;
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            stdout-path = "display0";
+            framebuffer0: framebuffer@1d385000 {
+                compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
+                allwinner,pipeline = "de_be0-lcd0";
+                reg = <0x1d385000 3840000>;
+                width = <1600>;
+                height = <1200>;
+                stride = <3200>;
+                format = "r5g6b5";
+                clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
+                lcd-supply = <&reg_dc1sw>;
+                display = <&lcdc0>;
+            };
+        };
     };
 
-    chosen {
-      #address-cells = <1>;
-      #size-cells = <1>;
-      stdout-path = "display0";
-      framebuffer0: framebuffer@1d385000 {
-        compatible = "allwinner,simple-framebuffer", "simple-framebuffer";
-        allwinner,pipeline = "de_be0-lcd0";
-        reg = <0x1d385000 3840000>;
-        width = <1600>;
-        height = <1200>;
-        stride = <3200>;
-        format = "r5g6b5";
-        clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
-        lcd-supply = <&reg_dc1sw>;
-        display = <&lcdc0>;
-      };
-    };
-
-    lcdc0: lcdc { };
-
 ...
-- 
2.25.1

