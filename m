Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD13C2BA16
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 18:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 60490206F5
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 18:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="l5k7RPdv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbgDCSXM (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 14:23:12 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37964 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728296AbgDCSXJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 14:23:09 -0400
Received: by mail-wm1-f67.google.com with SMTP id f6so8742166wmj.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 11:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=MwGha92408pxCYDxxspuAmHh54GTghbfJZy7VaH8q+U=;
        b=l5k7RPdvkJF+lxF7qzR+pXrsPckzYVQI+jdm925UI67HmNyhou2mP6kb3mHc6z7Tsd
         GuKHul7AwOV27kbgCEMGb62b79TxlGYREPMW8LF0nU+WsIIiuit4UeYU2rR6RTXCRoYQ
         RpQwlvPrqwmPsgIrDlCOXcrDej4rwVNk9KPXxOR5taQtXEt9IdKU9ItXnmuNMbNBEvJv
         MMrTZ9GsAXg2ELBDY4LOHPIZuxzAoYcdUDgy1hDCkzm1fV3oYRTyE+CToW3qfsJ9hwu1
         zCxfRRuMSdaGjlRNCc5pzsABAZZrtFeK5OO/Act1qAgVxr/2IqbHnTG1UBoTeRH4ZbsG
         tgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=MwGha92408pxCYDxxspuAmHh54GTghbfJZy7VaH8q+U=;
        b=ccpMmbwfLoxPIPI9Y3anR8J+ZRiebd/5xC+qJZLSGBeKgOYkip5IWkq8IqPJoJGnz0
         Z44HdNQrv1OAheTC0XHwF1MtP1e644I7pduL8SS3CV4M/bgCSeDot4q01p+8EYC+xZPz
         2cntlL9TO8IjL/iZbcORIXmMQCmNEocctp+fCZ+FCOlIM/v5UrVV0InJ33m8M9wpag8E
         rCwQJ9grYZBeV6F7jE1pEqa8+UHK7iFgyCAXyyBnFyZtOcddZXNdAbWfyHGb4xkQRKY+
         WgW0lE0iSwxSF0aC0MGgtk+FbY+OGt9qNHwQST/FQXvo/rwIxUkA826eSrFnuXb7wcxg
         e1wg==
X-Gm-Message-State: AGi0PubKY2l3QNN5zJ287RolQ8EMqIdXBppPSU61AWk5drIqk5lynV1p
        VHDUOuCLU9HiKHllySiy9Y1Tgi9EMV7PgIZGj7o=
X-Google-Smtp-Source: APiQypJritoWrsVYI2JU3TJzbEoC1DtW/I+hYQewcf/pDlmR+Oc2Sv4axyiXtp+KWKO5WWJLRoac5w==
X-Received: by 2002:a1c:f302:: with SMTP id q2mr5047552wmq.185.1585938185031;
        Fri, 03 Apr 2020 11:23:05 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id b199sm13630456wme.23.2020.04.03.11.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 11:23:04 -0700 (PDT)
Date:   Fri, 3 Apr 2020 20:23:42 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     devicetree@vger.kernel.org
Cc:     Jason Kridner <jkridner@gmail.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
        Caleb Robey <c-robey@ti.com>, Jason Kridner <jdk@ti.com>
Subject: [PATCH v3] dt-bindings: Add vendor prefix for BeagleBoard.org
Message-ID: <20200403182342.GA27383@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add vendor prefix for BeagleBoard.org Foundation

Signed-off-by: Jason Kridner <jdk@ti.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
Changes in v3:
  - add SoB from drew@beagleboard.org
  - email patch from drew@beagleboard.org

Changes in v2:
  - Use 'beagle' rather than 'beagleboard.org' to be shorter and avoid
    needing to quote within a yaml regular expression.
  - Assign 'from' to author e-mail address.
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 967e78c5ec0a..1cce6641b21b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -139,6 +139,8 @@ patternProperties:
     description: Shenzhen AZW Technology Co., Ltd.
   "^bananapi,.*":
     description: BIPAI KEJI LIMITED
+  "^beagle,.*":
+    description: BeagleBoard.org Foundation
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bitmain,.*":
-- 
2.17.1
