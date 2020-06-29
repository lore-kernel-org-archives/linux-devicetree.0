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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17881C433DF
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDFF320656
	for <linux-devicetree@archiver.kernel.org>; Mon, 29 Jun 2020 22:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF9smog+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgF2WNv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 29 Jun 2020 18:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgF2WNv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 29 Jun 2020 18:13:51 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13B7BC061755
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 15:13:51 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id j80so16834205qke.0
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2020 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Cuh/C/o4/2xMCVX7Ug07E0pgB6dYuyyTbPP3iEiCt0o=;
        b=fF9smog+rhnIxwze4Z6P52mRZneR+4MVVkKzIYai46NOU3R+tNxBI39u1qTItNVfwm
         Z5ADdFv8bwFqBGdEXSi0QNDkElMW9tg5Tzz/TEKxRRDCBsJ26lDPC4295f431hRE5Eoy
         EZF6We/27t62AIiEM0a4KZJUtnmJV/rzuUeLmzcx2k5eQxdYxd8h+1XbXPNyC3jwz6WD
         68plmaBEgXiEzDWcHE1TlnZl09RFJwVj4DF+DbXFUDBQ9wLkdqIFOJ0L4GrJaVfY9O2h
         5w/nxXToT4XohW8oqdALsjfAWuVY+Jnuu65HP3EWzzy+h3YpD9lBQBOAxd+pH7Z93Aqs
         1ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Cuh/C/o4/2xMCVX7Ug07E0pgB6dYuyyTbPP3iEiCt0o=;
        b=Ocyx9JvNQQ+7tQZwdF4ZL2WYDOXvA/Sp/SaxH9XoOGXmVpg82oU3l/peoag2xSqEMZ
         wXoFgKNN6fqJwrNgpoIE6JCl9+pr0CfRpeyABOLGV8JZppY0cBkP7oLhxpso+EnKELkW
         PiyHjbGBvvj3Vk53XYVlKa0m9XWlssRdIPWCwTNEXam8bYsV5ZGunpjxzPzmgJLGep2l
         djseWKqzkVEqxVGm1lyS74tb63R3LEFNwVVKAxXVzJ7T/GVYsenQ0ifYKyiVMLUefu+Q
         PFkHMXLfI3raNX8GH1vRlc9cmYhP/17R7D+PMxIVPxtrfEqU/ebLj4iMC81EWjqCX84e
         UjyA==
X-Gm-Message-State: AOAM533J1AYQYWd54YDAA1+ue8wLotAFw5EFULPzv0pI/tHAKxtFkiDR
        EhUq4ZBrDpY/2gJ7Gk4QtaA=
X-Google-Smtp-Source: ABdhPJymBGvWgOSu6/RlXOqDTDIjioaiXxuPHsle6prNy56s83I+OAPn5g3M3S3X+fC5ADgpeZY9cg==
X-Received: by 2002:a37:2c41:: with SMTP id s62mr10784877qkh.165.1593468830199;
        Mon, 29 Jun 2020 15:13:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:92b:9524:444f:ca0e:d637])
        by smtp.gmail.com with ESMTPSA id y23sm1390365qkj.25.2020.06.29.15.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 15:13:49 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     maxime@cerno.tech
Cc:     eric@anholt.net, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: vc4: dpi: Remove unneeded 'simple-panel' property
Date:   Mon, 29 Jun 2020 19:13:26 -0300
Message-Id: <20200629221327.19885-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Remove the unneeded "simple-panel" property to fix the following warning
seen with 'make dt_binding_check': 

Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml: panel: compatible: Additional items are not allowed ('simple-panel' was unexpected)
Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml: panel: compatible: ['ontat,yx700wv03', 'simple-panel'] is too long

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
index 58213c564e03..24119411b007 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
@@ -46,7 +46,7 @@ examples:
     #include <dt-bindings/clock/bcm2835.h>
 
     panel: panel {
-        compatible = "ontat,yx700wv03", "simple-panel";
+        compatible = "ontat,yx700wv03";
 
         port {
             panel_in: endpoint {
-- 
2.17.1

