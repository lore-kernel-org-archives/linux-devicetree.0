Return-Path: <SRS0=QtGe=7R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B99C433DF
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A772C2074B
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Jun 2020 10:13:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=antmicro.com header.i=@antmicro.com header.b="UIQtNB2N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgFDKNV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Jun 2020 06:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbgFDKNU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Jun 2020 06:13:20 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06696C03E96E
        for <devicetree@vger.kernel.org>; Thu,  4 Jun 2020 03:13:20 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a9so2989014ljn.6
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2020 03:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=antmicro.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WUmyTqxSfskM62xuisvKT7kgxPPBRtPkhWKMRB3p5tM=;
        b=UIQtNB2NQwTL6Nr699IX6cXcWtvFF+bvXPkCRURE8M7j5xtFCr28b919++lOSss6nv
         Ygr3gRXgzyrYHxJHZPj3/WoWgmX1q4o4Tu6QzsaQwPFVwJ4ejgZyef+t1l2Z6QiGBosq
         9JfINGMU9pztizvzzANuZLkn/n3jRZxIVpQh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUmyTqxSfskM62xuisvKT7kgxPPBRtPkhWKMRB3p5tM=;
        b=q+U77b0bzZf2kUfDrSlUtFzQ/4WsiRnTiCOBBAhWIsqs5hv5Q/KtIpywV3xbeldfB3
         gWVPBzkd5PiAnR59sfmNgS6DLRGA7nVa+5KShjUwgOGroy4vtmk0cnptWHCE1mGZg0k4
         D6v0GVdIPuo1zicDbf+OfZMNBRAy26jU5mj3gCnw2a3zGQ/6EOF6ylpnfj6sNPBnUzSn
         clS4v1bUWsDk36IAF5lZFFlfOWxDEPEPeopErgrkH0gVnKZL9elns5VBgwY68USiJ9pK
         vyIWvD05kJCtxBmLewCWfBZ1tuDVrmar6cpzeBGtzFI2OOgHq/UE8jIznD1KRxiVW+Rw
         Tdog==
X-Gm-Message-State: AOAM533NaOdSvvGG03E9Kujyd9uk0Jq0WvLHd4dPd9WigxI70nWy7Trw
        jCQN0WOZHh199a5bbm8u3C2muA==
X-Google-Smtp-Source: ABdhPJzhna3WAOIKLBaalRS3fGtym65ULihde2dV23JDTe/SV7Hmo1UgLnQB16v5MguATD5wzDVwRQ==
X-Received: by 2002:a2e:b4e7:: with SMTP id s7mr1689284ljm.336.1591265598323;
        Thu, 04 Jun 2020 03:13:18 -0700 (PDT)
Received: from localhost.localdomain (d79-196.icpnet.pl. [77.65.79.196])
        by smtp.gmail.com with ESMTPSA id w144sm1363613lff.67.2020.06.04.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2020 03:13:17 -0700 (PDT)
Date:   Thu, 4 Jun 2020 12:13:12 +0200
From:   Mateusz Holenko <mholenko@antmicro.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Stafford Horne <shorne@gmail.com>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz Holenko <mholenko@antmicro.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Filip Kokosinski <fkokosinski@antmicro.com>,
        Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
        Joel Stanley <joel@jms.id.au>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Icenowy Zheng <icenowy@aosc.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-kernel@vger.kernel.org, "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: [PATCH v7 1/5] dt-bindings: vendor: add vendor prefix for LiteX
Message-ID: <20200604121142.2964437-1-mholenko@antmicro.com>
References: <20200604121142.2964437-0-mholenko@antmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604121142.2964437-0-mholenko@antmicro.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Filip Kokosinski <fkokosinski@antmicro.com>

Add vendor prefix for LiteX SoC builder.

Signed-off-by: Filip Kokosinski <fkokosinski@antmicro.com>
Signed-off-by: Mateusz Holenko <mholenko@antmicro.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    No changes in v7.

    No changes in v6.

    No changes in v5.

    No changes in v4.

    Changes in v3:
    - added Acked-by tag
    
    No changes in v2.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 997934c58f9a..d2eaddc473ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -575,6 +575,8 @@ patternProperties:
     description: Linux-specific binding
   "^linx,.*":
     description: Linx Technologies
+  "^litex,.*":
+    description: LiteX SoC builder
   "^lltc,.*":
     description: Linear Technology Corporation
   "^logicpd,.*":
-- 
2.25.1

