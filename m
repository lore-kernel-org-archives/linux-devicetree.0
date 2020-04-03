Return-Path: <SRS0=qh1l=5T=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE77C43331
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 19:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4D4120737
	for <linux-devicetree@archiver.kernel.org>; Fri,  3 Apr 2020 19:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="fUZBkk0P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgDCTS4 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 3 Apr 2020 15:18:56 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:35591 "EHLO
        mail-wr1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728276AbgDCTS4 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 3 Apr 2020 15:18:56 -0400
Received: by mail-wr1-f48.google.com with SMTP id g3so7529908wrx.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2020 12:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=N0ZrXQIKqbDhYM8K0a95EEPnDOREAzkDY3xwjR3QE9g=;
        b=fUZBkk0PhNTb+ey56oINy9UW+39P1UcXUkAHpMEExuHv0oozUZ0Nu9FCVz46WwbsHY
         f8k9KaVfKH9JIWaMMYz6eCskEHxh56tJRQw4ZGTzb/eBQf04BlaMitXapYqwSmf/TQIO
         gSxv0fqg4+Ms1yEEIQavDNirll1KAujBFn2Q7/+6MrZYAml0f2ZO39eHK4opPOUk/WrL
         x60gXgzRbKwLaW7PgqHy+tfGHmecpG59DFC7LhzjdwYqpSqvM4YXam1K24GVVw1Ege5f
         5M1ypTcd3MwXyahJarMx9cTzNCg//SFZLW41HXZWutY4xpED45Wpf4t19LAfTYHlHHyf
         gXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=N0ZrXQIKqbDhYM8K0a95EEPnDOREAzkDY3xwjR3QE9g=;
        b=fIb9Zih8iqIJJ8V5DUO5E3ExRkTxFhdDmUlbXyByc6TPfRxrX6wEYHilmbUuXt4FkP
         htRX2uoPh5cZTw0c3WQhps8kPILtlnX/FgeFJq1GsYQ1BakukNQu9wIt4WoXM0jJyVqb
         yvpefNIKM4zJ8VWX6px+t1Uh0JH0dW24jM3K3POEfBM46vZ+A/nIIh/T81C5cBo95FWX
         Xauvu4P7fO/zyTtcCbB++tQd/Lmp6XLR8dvCZM1XtfRm1uliWmWsvivSbL96CqZIp9jL
         viYY4n3dmFuCs/aOGuc1aOPVXpPs12hNbwuGE1tnlZSRgsgYrpfJ+naOg5fBPk/n+O+N
         I/4g==
X-Gm-Message-State: AGi0Pub2qQpjY36B2KA51u3BVC2GxQI+Wn8/EQ9Dd9ZBkkqURlgu5hV6
        dVIp341LzHrQlMPCckW4377gorZn+rNQ4LXOZsg=
X-Google-Smtp-Source: APiQypLAxu26bg9htF93iWKRV7HD6fnYqKlOaLwxLqdv49TjyzgBXtUE1jbFaf66McWWDRTLBWjVXA==
X-Received: by 2002:adf:ee8b:: with SMTP id b11mr10390353wro.404.1585941533898;
        Fri, 03 Apr 2020 12:18:53 -0700 (PDT)
Received: from x1 ([2001:16b8:5cf5:3201:5571:c686:dfa8:6662])
        by smtp.gmail.com with ESMTPSA id 25sm7539904wmf.13.2020.04.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 12:18:53 -0700 (PDT)
Date:   Fri, 3 Apr 2020 21:19:31 +0200
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
Subject: [PATCH v4] dt-bindings: Add vendor prefix for BeagleBoard.org
Message-ID: <20200403191931.GA31296@x1>
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
Changes in v4:
  - rebase on robh/for-next branch

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
index 65e78b25715f..e26785f5cc38 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -143,6 +143,8 @@ patternProperties:
     description: BIPAI KEJI LIMITED
   "^beacon,.*":
     description: Compass Electronics Group, LLC
+  "^beagle,.*":
+    description: BeagleBoard.org Foundation
   "^bhf,.*":
     description: Beckhoff Automation GmbH & Co. KG
   "^bitmain,.*":
-- 
2.20.1

