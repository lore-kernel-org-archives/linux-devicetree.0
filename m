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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56732C433E0
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 22:45:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2652C20780
	for <linux-devicetree@archiver.kernel.org>; Tue, 30 Jun 2020 22:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3JQTxGh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgF3WpQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 18:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725763AbgF3WpQ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 18:45:16 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14771C061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 15:45:16 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id 145so17880331qke.9
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DWMvebG8Albfesqy4OFZUtlmMuyd/6eplwjz8gwUPII=;
        b=N3JQTxGhkMYr+82bxrPbWTcXdr9kCUAQbLd9v0lQnG0MM9xFHnuWutfPGZ5x6yk4tO
         7g0iHtJ5c/BQhc3y147Cro/EEN4ba0YTJVyfx1i/1OEui4NPB2VyOfEwVbcvJ7qcxoMk
         2FGyu/jmppew2DVFJe8gMz6LHKyTyTDEeSg85rwp0/9zUbsJpt5/2kYnvtZQHbu1p0Ti
         9BVKrK3nV/UKVO5/0xN+5F3ia55AhwgFgPPxc401bHbm9In+lMMXGHrg/LEp+LQEVn3B
         YrAMzuU2pbGpPsz00Yc4G6lqm/7AempAiftMeib5uBtcM36LoONbFV9yez68zajcQi+B
         Ma3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DWMvebG8Albfesqy4OFZUtlmMuyd/6eplwjz8gwUPII=;
        b=ZlnQaYLEaFPZKx+KUGR/w08uRqrGa5nsvwiODb33MD/q4nSV8isEMcqKA+ej6/pikg
         EyxRPvyOs91hRGp58aL3v1LTcu78cJPdbf53k2KCQrqp/W3A9gFeD5TwWq/efLntd7ix
         p1wsn5j07SEM8LLIuKz7BAp45bJX1yUrYL2yCQ36lTewPs38NYkl9N3sc6YNLri5danv
         L++VHodeaIdOV/6L/VrDMXMDkIpxDVOJhKU+IQ3Kj5nBJ0LO15I6B2hoYQJEAsCBYQj4
         ESuTSA53gf52FjrzCCjBoprGANe0qAbm0lXq0xwxABaIMwbniPnl/KCFlvAhnrPj7QYu
         j1+A==
X-Gm-Message-State: AOAM530o8m0f6MnbyTA+8t8X4SrV0MWJmaRC7BoIw60FDp9IySoj+bv5
        is6EmwskdqxZrOaOJhpWDeU=
X-Google-Smtp-Source: ABdhPJwVPWSXqgclpbsbjpHIGS59kxAMDggDD4wRd/Yyje4Esz+wTIzYY8DdVAZ6n0ZyB+6rvDH2Qw==
X-Received: by 2002:a05:620a:635:: with SMTP id 21mr22740927qkv.491.1593557115108;
        Tue, 30 Jun 2020 15:45:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:d42f:2bc1:abe3:59f0])
        by smtp.gmail.com with ESMTPSA id b186sm4093608qkd.28.2020.06.30.15.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 15:45:13 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     broonie@kernel.org
Cc:     robh+dt@kernel.org, jee.heng.sia@intel.com,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: keembay-i2s: Fix reg descriptions
Date:   Tue, 30 Jun 2020 19:44:59 -0300
Message-Id: <20200630224459.27174-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

intel,keembay-i2s has two register regions:
- I2S registers
- I2S gen configuration

Describe these regions accordingly to fix the following warning seen
with 'make dt_binding_check':

Documentation/devicetree/bindings/sound/intel,keembay-i2s.example.dt.yaml: example-0: i2s@20140000:reg:0: [538181632, 512, 539623588, 4] is too long

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/sound/intel,keembay-i2s.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index 175e4fb0c315..2e0bbc1c868a 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -23,7 +23,8 @@ properties:
 
   reg:
     items:
-      - description: I2S configuration
+      - description: I2S registers
+      - description: I2S gen configuration
 
   reg-names:
     items:
@@ -60,7 +61,8 @@ examples:
      i2s3: i2s@20140000 {
          compatible = "intel,keembay-i2s";
          #sound-dai-cells = <0>;
-         reg = <0x20140000 0x200 0x202a00a4 0x4>;
+         reg = <0x20140000 0x200>, /* I2S registers */
+               <0x202a00a4 0x4>; /* I2S gen configuration */
          reg-names = "i2s-regs", "i2s_gen_cfg";
          interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
          clock-names = "osc", "apb_clk";
-- 
2.17.1

