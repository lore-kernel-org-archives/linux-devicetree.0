Return-Path: <SRS0=8MPa=5Y=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9D7C2D0F4
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 506F72075E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Apr 2020 19:51:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bHS7qaEq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730170AbgDHTvm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Apr 2020 15:51:42 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:36702 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgDHTvl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Apr 2020 15:51:41 -0400
Received: by mail-lj1-f195.google.com with SMTP id b1so9035920ljp.3
        for <devicetree@vger.kernel.org>; Wed, 08 Apr 2020 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vKqNr/2OY3y1JwLr1v1LEruLN8ujEKMCeTY+OOF8/84=;
        b=bHS7qaEqvgeEmoXrdQAsSmgXvwjipMph7e2NhwD3DcZERvCsfX+fgHl2RzAZKQuwfc
         smDlse3qwJ7qVawxoHhHo5bWQabgy4Ghd4cWBGSdq9rGoKI2op9gp1ozuOwbXPLEMwkN
         DJFpNHC3K+VRp1PV4AhfVQ6p5/xpo8v0CgEJvsd4GQS/xuyIA2k3OZzDrseHQulq0/1B
         lj3rvJ8Ioo1pv7g5g8w4X5/SRFnw3b/sD//bkFKCCEFLEWLKer+Q/D3P5KLfK6fo27wp
         c+GgJD7ikj4wFLo7s2cFqdZsmd1CnZYRsE9VBFUFxP+pHEjrOjWPCqfnAKNQdUnE/6OZ
         kfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=vKqNr/2OY3y1JwLr1v1LEruLN8ujEKMCeTY+OOF8/84=;
        b=TMNLsZCvP8PU/3orji0F8l7ZK6086ngaLko0Ee4Oiw/S4MenlePvAMxOs6RFzKIhGK
         cCgJyiAsLUrPZmVDGGap2o4o1Wzd6jrmb851n7PRbwG+bLcAGqP5VwqkT6fGr+fuu/wO
         yYQN3A0hSlXUyBS6q9FtfG9XFR6KYNuJvFQmXZAm+N4dBYAl6YtxIBj7yuKpN/obO7hU
         tSCvbSfHA6dFvEKd/1uedIQsgMog5RS7SwDKy3Yuj0shYl7gycS9HqnvWaQrHlSljT90
         hfetosHaICDKGwePAE3u4ZWqQMTNVHz5jVE4tEnZulOTBxfV8HsWZ4Gnek/cZ2BBFWvW
         tPgA==
X-Gm-Message-State: AGi0PuaTDRxlcwlZd6jpnjM89AinXPz6k8iP+A+pI6X2rC0b5ENS2LMr
        WIfCF1lyRfdbx4t0dgSBStU=
X-Google-Smtp-Source: APiQypJtn86WxJVj9pRVPHicvxUhAn0189Nw+j+tpzho9zVSCakjfHSw3LA2tLqOp2qOJOFhe6zNcg==
X-Received: by 2002:a2e:9a89:: with SMTP id p9mr6061321lji.222.1586375499702;
        Wed, 08 Apr 2020 12:51:39 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id i20sm3961304lfe.15.2020.04.08.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 12:51:39 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 01/36] dt-bindings: display: allow port and ports in panel-lvds
Date:   Wed,  8 Apr 2020 21:50:34 +0200
Message-Id: <20200408195109.32692-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Both port and ports names may be used.
port - for a single port
ports - if there is more than one port in sub-nodes

Fixes the following warning:
advantech,idk-2121wr.example.dt.yaml: panel-lvds: 'port' is a required property

advantech,idk-2121wr.yaml needs several ports, so uses a ports node.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 Documentation/devicetree/bindings/display/panel/lvds.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
index d0083301acbe..f9132d50821c 100644
--- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
@@ -102,6 +102,12 @@ required:
   - width-mm
   - height-mm
   - panel-timing
-  - port
+
+if:
+  required:
+    - port
+else:
+  required:
+    - ports
 
 ...
-- 
2.20.1

