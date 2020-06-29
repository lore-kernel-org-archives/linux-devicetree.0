Return-Path: <SRS0=mth2=AK=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF20C433E0
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEBD920656
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:13:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxYH2BiF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbgF2WNy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 18:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgF2WNx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 18:13:53 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B50C6C061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 15:13:53 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id e13so16824417qkg.5
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 15:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WaeN+BPizh0oD4lgsc2IXCnccXq/tl6lrLlep28vPpE=;
        b=XxYH2BiFhwqoGonCdHt8VMwAcPxxTYxOi6Wd9noxQQ3E+F+llRAho067kSK1cPBhIU
         Rn7sbDIc06n/nLGF94FKRkmazbRnK6PY0u8hyapgwNqYucjpY0DPDCbbj8CESwyh3SKt
         LYV9VG/hGYeBR8SRiLMTwR2sg6voojNvXNe1hv1v0Xy+PLLqAJSNA5Teg+4JwQS2vhTu
         d9sgGwHTM+lqc82sCVmIvRp69uOOxE+eQ8pu03K4v5rLNtL6t1TZfRXFpitf1kEireuO
         Y2RNaTtxf8UeHFntY30YVfbEe8AOVpGlItmdXSOmAitSldDRAHY3D1RU7zoGLUI4WUPb
         s30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WaeN+BPizh0oD4lgsc2IXCnccXq/tl6lrLlep28vPpE=;
        b=h5bRSPsCP1IzfO4cPAG2VPUUxzgPnNzsXt2FknS6oMQ0sxjvs97fKfQArfAmZZH5xP
         FF7ktvIuKvIzOT0UIZgij6po0NWS8mC0cpU8zuTq01bgYyUr0AjQn1oGbpAZzqWkHOwh
         GESFeo/NvUqZMamXbi+l8SIdwayL8U5nqO96or81GCzgA+vKvr4O6Hc0ACTInocbxE6Z
         0cDJRWqxAGrELaCToE4SYy/qqgGShZC4NGn4ZeOvLaCh1/ZmvQns1kKj/+Yl3MsK51b2
         WGVDU5KZpdhX4ApEj5RIgqcGZsNPVJ0b+wlI+VRXlhsGEv4zyWRMbVTTm7xMejpoo2j/
         HFNw==
X-Gm-Message-State: AOAM530HBWgCf1mTGkbr1Xextb/sje10ei9FLAUvy7eF6GvpfXUjT/VC
        VPOFPbXpPghFTgZZ3bC4/pM=
X-Google-Smtp-Source: ABdhPJybzmB4veGNSBHIAsbA003nVTo+WzLqmEaoRWj9oihFxukT/Jh/ZFEGze4wq7LdQNGjZ0gtnw==
X-Received: by 2002:a37:4d0f:: with SMTP id a15mr17053518qkb.313.1593468832915;
        Mon, 29 Jun 2020 15:13:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
        by smtp.gmail.com with ESMTPSA id y23sm1390365qkj.25.2020.06.29.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:13:52 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     maxime@cerno.tech
Cc:     eric@anholt.net, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: display: vc4: dpi: Pass the required 'power-supply' prorperty
Date:   Mon, 29 Jun 2020 19:13:27 -0300
Message-Id: <20200629221327.19885-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629221327.19885-1-festevam@gmail.com>
References: <20200629221327.19885-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Pass the required 'power-supply' prorperty to fix the following warning
seen with 'make dt_binding_check': 

Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml: panel: 'power-supply' is a required property

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 24119411b007..7ab03614a8ea 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -47,6 +47,7 @@ examples:
 
     panel: panel {
         compatible = "ontat,yx700wv03";
+        power-supply = <&panel_reg>;
 
         port {
             panel_in: endpoint {
-- 
2.17.1

