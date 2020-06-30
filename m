Return-Path: <SRS0=g9lS=AL=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEAA9C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 22:30:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FF4220771
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 22:30:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToEIYLPG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726095AbgF3Waq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 18:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbgF3Wap (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 18:30:45 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75984C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 15:30:45 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id c139so20290380qkg.12
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ayDLVTpqrRWCu2rwzj3x2w0PDrwipYQ4Na/NteQ3Y6I=;
        b=ToEIYLPGzxPgrQ7L3jZflV9PYsDrLwOpsOJOlSXTFMCBPV/SEltqv7XFy1pwdKfnAp
         3cmCK3JmxdGFkymbaOfEbUYcphfmjBVaCwAviummcOtbHwu/0f/9mmZWLbw2wErBTDJr
         fSW1oYCsWGIqEgXehlHZwIoTzvjEcNQ0eNPHAq9FeBpiCwFpyo0A3oOS+PhC59hXS/PX
         O8wTCp3oL6lcsG5p5WLsvbfBDXxTmdjStWLK9P7WuVPpd9NpQyxbHGsKODNK1ZUJobIH
         lEv9qWgbRK5NuLH5IQAg8OxkGXjfGYUIwp2PDySktEJMiJoFRJzUoQVs1bGEbYTryYpE
         kmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ayDLVTpqrRWCu2rwzj3x2w0PDrwipYQ4Na/NteQ3Y6I=;
        b=AMfrU/CyiQanJQCFyxfCigb0q3rMNtafxauoqf6wrHv4j9XstpiwfP3IfBIaDfb8H9
         9FdP05JIhrdnEynZs87njd7ArAjPjG5BKyG8jr5mNcoJUIVPTXL60f2CxjElhH+C490W
         o1bS1VnnvYv9H9Hcm+k/KlNr1Xs6VyT8FmHkrFUqGKtRh24rNOIEd/z62fDEUCaf1XM/
         D6k6TsjU6Bwhi6MYJfmRknL6BRbggNrJ8vDnVnwvk6FmSIh4p8TUo3FPQhtl85BOVtug
         QOK7WIP71swE25bc0U36VP1DnvQVn03seY23HDC97zuOe3qGggBXcM4rEM6UADesv08u
         lCYA==
X-Gm-Message-State: AOAM530oZG0Kabfc3TUfUkpLORSkDpZn2g5eONJaZX5X5cZBtrxTnAnH
        NGcNt+txMWY2C0kJ9UBh8HLlIJJyaRE=
X-Google-Smtp-Source: ABdhPJwWLjBICbFjUM8eRwUr1PD1j1fUXQS5UUelnMrxQ8PYmYr8AImcgcKzUDv2TX882UPRHMk9tA==
X-Received: by 2002:a37:2c41:: with SMTP id s62mr15987292qkh.165.1593556244486;
        Tue, 30 Jun 2020 15:30:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:d42f:2bc1:abe3:59f0])
        by smtp.gmail.com with ESMTPSA id o21sm4216556qtt.25.2020.06.30.15.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 15:30:43 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     broonie@kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: simple-card: Fix 'make dt_binding_check' warnings
Date:   Tue, 30 Jun 2020 19:30:20 -0300
Message-Id: <20200630223020.25546-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The following build warnings are seen with 'make dt_binding_check':

Documentation/devicetree/bindings/sound/simple-card.example.dts:209.46-211.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:213.37-215.15: Warning (unit_address_vs_reg): /example-4/sound/simple-audio-card,cpu@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:250.42-261.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:263.42-288.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:270.32-272.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:273.23-275.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:276.23-278.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@2: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:279.23-281.19: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@1/cpu@3: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/simple-card.example.dts:290.42-303.15: Warning (unit_address_vs_reg): /example-5/sound/simple-audio-card,dai-link@2: node has a unit name, but no reg or ranges property

Fix them all.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/sound/simple-card.yaml  | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 8132d0c0f00a..35e669020296 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -378,6 +378,8 @@ examples:
   - |
     sound {
         compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
         simple-audio-card,name = "rsnd-ak4643";
         simple-audio-card,format = "left_j";
@@ -391,10 +393,12 @@ examples:
                                     "ak4642 Playback", "DAI1 Playback";
 
         dpcmcpu: simple-audio-card,cpu@0 {
+            reg = <0>;
             sound-dai = <&rcar_sound 0>;
         };
 
         simple-audio-card,cpu@1 {
+            reg = <1>;
             sound-dai = <&rcar_sound 1>;
         };
 
@@ -418,6 +422,8 @@ examples:
   - |
     sound {
         compatible = "simple-audio-card";
+        #address-cells = <1>;
+        #size-cells = <0>;
 
         simple-audio-card,routing =
             "pcm3168a Playback", "DAI1 Playback",
@@ -426,6 +432,7 @@ examples:
             "pcm3168a Playback", "DAI4 Playback";
 
         simple-audio-card,dai-link@0 {
+            reg = <0>;
             format = "left_j";
             bitclock-master = <&sndcpu0>;
             frame-master = <&sndcpu0>;
@@ -439,22 +446,23 @@ examples:
         };
 
         simple-audio-card,dai-link@1 {
+            reg = <1>;
             format = "i2s";
             bitclock-master = <&sndcpu1>;
             frame-master = <&sndcpu1>;
 
             convert-channels = <8>; /* TDM Split */
 
-            sndcpu1: cpu@0 {
+            sndcpu1: cpu0 {
                 sound-dai = <&rcar_sound 1>;
             };
-            cpu@1 {
+            cpu1 {
                 sound-dai = <&rcar_sound 2>;
             };
-            cpu@2 {
+            cpu2 {
                 sound-dai = <&rcar_sound 3>;
             };
-            cpu@3 {
+            cpu3 {
                 sound-dai = <&rcar_sound 4>;
             };
             codec {
@@ -466,6 +474,7 @@ examples:
         };
 
         simple-audio-card,dai-link@2 {
+            reg = <2>;
             format = "i2s";
             bitclock-master = <&sndcpu2>;
             frame-master = <&sndcpu2>;
-- 
2.17.1

