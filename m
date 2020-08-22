Return-Path: <SRS0=iyGu=CA=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02113C433E1
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 15:41:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D646120855
	for <linux-devicetree@archiver.kernel.org>; Sat, 22 Aug 2020 15:41:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd1KfyOD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgHVPlC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 22 Aug 2020 11:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgHVPk7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 22 Aug 2020 11:40:59 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF9CC061573
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2020 08:40:59 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id l2so43768eji.3
        for <devicetree@vger.kernel.org>; Sat, 22 Aug 2020 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=apKIgyBBu2/J9e0hh6C3aEh4+s6ARZOZAgMSwcEU1Rs=;
        b=dd1KfyODS3VpoosAdWHvTWjcEpsHgEzsKA62Rw1vEH7wqZHtwSf8aHvCgnZC7MpRb1
         W/ZAAnZjl6RAskoC0Na0JDHr783w/aP7PabhLEMrrWjcgqhM/7rv4zjurP3P+WPhy/wF
         1yA4Pjdkmluc3xjZAnw5VXMeGz0jUkWjt0Bb6pD1S2bn9zD2ECRRdn66BQ2pP0NrHQJ+
         BAfiZy/RkFJkHC3SD3ofpUfNyaCKNSHi0MMuNnJXg4D5TsQM/n3LlvXUXnAr/Vb1MBF0
         iPDeh0KsBPfde73SO/HZ/IH0GVekoHGLvVrMU8qfuSfCMHSRQtUz70qY1zq694NC9sn0
         fjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=apKIgyBBu2/J9e0hh6C3aEh4+s6ARZOZAgMSwcEU1Rs=;
        b=UosenUSGRDXUR+eOxtl+1WX/lEolx70J77ZHsiO2y2xGrnulPTpWPQsMpQZ0t94Uwe
         DpJD8MMTYDrsK7vsfecFtuzGB5gFro9zXUOBkBd8QwltvYL+pDn2s3Uwb1J/jn9Svup2
         GIrct7hKxlhXhn+OvhmvYJuqJcvDoWgcl0Gj98MPrt1hQzucT370J99GHKQzLpgMJvnr
         ZAqW1sJ4vAB7W0Y6MVFI7dPX7z9EEaxZXo2B8xUs4t/EyawbRnOLsmqRKu+FpSP3LkOF
         aTdSAqtnG9tI7qlfVCNQhCIYXGNoA0wmVLoeUAzNpwpwuzo3u2V5C59bST+nqs0unjjZ
         w83g==
X-Gm-Message-State: AOAM532I5b1Udko3/3u3dhbDBJjQLOVGBV8CGKM6osQrGP7UYSrylp+X
        CE44GiEIBZ4hwjZmc25hbkwXkQI3UaY=
X-Google-Smtp-Source: ABdhPJw8zCprYze8ibULfS/C1LjwJtP57POSVU+wCUVsDFhqAF21k7BwhWDgpgnuLlWAtn7bbdF96A==
X-Received: by 2002:a17:906:4c97:: with SMTP id q23mr8043909eju.11.1598110857505;
        Sat, 22 Aug 2020 08:40:57 -0700 (PDT)
Received: from debian64.daheim (p4fd09171.dip0.t-ipconnect.de. [79.208.145.113])
        by smtp.gmail.com with ESMTPSA id m4sm3699387ejn.31.2020.08.22.08.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 08:40:56 -0700 (PDT)
Received: from chuck by debian64.daheim with local (Exim 4.94)
        (envelope-from <chunkeey@gmail.com>)
        id 1k9VdO-0004BP-1h; Sat, 22 Aug 2020 17:40:46 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Cc:     f.fainelli@gmail.com, Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] dt-bindings: vendor-prefixes: Add Cisco Meraki vendor prefix
Date:   Sat, 22 Aug 2020 17:40:45 +0200
Message-Id: <20200822154045.16036-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Meraki was founded in 2006. The start-up quickly rose to prominence
by being based in part on the MIT Roofnet Project.
In December 2012, Cisco Systems, Inc. bought Meraki.
The "Meraki" branding is still around to this day.

Web site of the company: https://meraki.cisco.com/

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---

v1 -> v2:
	Split from Meraki MR32 upstreaming attempt. (Florian Fainelli)
	(This patch will be needed for the MR24 upstreaming series as well)
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2baee2c817c1..febe7f00b1f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -643,6 +643,8 @@ patternProperties:
     description: MEMSIC Inc.
   "^menlo,.*":
     description: Menlo Systems GmbH
+  "^meraki,.*":
+    description: Cisco Meraki, LLC
   "^merrii,.*":
     description: Merrii Technology Co., Ltd.
   "^micrel,.*":
-- 
2.28.0

