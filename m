Return-Path: <SRS0=m/NK=3J=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF230C32771
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:06:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9744F22522
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Jan 2020 20:06:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9zyeElq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgATUG7 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Jan 2020 15:06:59 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43489 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgATUG7 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Jan 2020 15:06:59 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so234987lfq.10
        for <devicetree@vger.kernel.org>; Mon, 20 Jan 2020 12:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FL32bHaS8nfyXz1mQQIzdzLjz5B0ZDSg8dlC9DoT6E=;
        b=W9zyeElqSKpsXbUWbKSxkOicXHP8N6G8qLJZxrOqsY//4BFO5G9S16Mq5N0IZ2oGXv
         ytBEFLCodBuoLkU43zTfBwQGedTXvmV+kbkWr26/iKrDRgACzdIIcp/36D/ecbjxpmM1
         7DLB9hfma2zafXbkJ4y/qM6BNZClwhAblgyTlLYi94PydEjI+AlTFTpS59iHzN6OLXTk
         rdfIIXFuUNJQAsSs1F/SGevQlWvTnYqnVIJlJwEIJbsGk+GOn01dqjPifI21qkcImprC
         /In+fZ5q/l4Tgi4E4ff8tXUAU0NavePmU9frRal/IW1LJVbhrLk87zkYs3baAAXFLKMn
         31BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=5FL32bHaS8nfyXz1mQQIzdzLjz5B0ZDSg8dlC9DoT6E=;
        b=WX4zFppVisYyJHeazJb2wZwtVbbe+q+OvQI3+Rxe8JG16wYZFsZCcbQfH3nqHW6yfM
         tuwdsxX0/jOKNRpyRlvg07difDQuSbMen9ca3Mib2uXa0YDsDwcrrTc8RzJiXzG87GFY
         Mhi3vLuTbbQyDJjZFl83bp+CLCZ6N7/6ncsPOgEJqF/s9/Ht4WCJWf+d24M6ZyjnYh5M
         n4RKJOF4Wczwh+ARekUh0dL9PAxuEcHvXRPyuN6w3rb5Gs8xw76R8lvJK6fi5w8EceVy
         XLHl5dz1UipA0AOy5Kz3fjtiT8U7E1HGjHItWtB62WmGvzvPEBBOLS7iXd5fq5CtP0mP
         wOvA==
X-Gm-Message-State: APjAAAVOlWSBwhSko62/WI4byiI8mwddCa/UHFq2Fmxa7kYAV89yUlLW
        wEhENmoNnRFnghOs1yZkiqk=
X-Google-Smtp-Source: APXvYqy1EeeGOi/vIE+zij/0Kic9meZSEaxyH7Okhtvky/es1JnSbkjfYGZZ2ltcUQMGLpOO9l2TwQ==
X-Received: by 2002:ac2:4add:: with SMTP id m29mr545652lfp.190.1579550816750;
        Mon, 20 Jan 2020 12:06:56 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id o12sm17332476ljj.79.2020.01.20.12.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 12:06:55 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 0/3] dt-bindings: convert timing + panel-dpi to DT schema
Date:   Mon, 20 Jan 2020 21:06:38 +0100
Message-Id: <20200120200641.15047-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This set of patches convert display-timing.txt to DT schema.
To do that add a panel-timing.yaml file that include all the
panel-timing properties and use this in panel-common and in display-timings.

panel-dpi was also converted so we have no .txt users left of panel-timing
in panel/

Everything passed dt_binding_check - and the trivial errors I tried in
the examples was all catched during validation.

This work was triggered by a patch-set from Oleksandr Suvorov aiming
at updating panel-lvds to support panel-dpi too.
This will make it simple to add additional properties to panel-dpi.

The .yaml file are all (GPL-2.0-only OR BSD-2-Clause).
There are some parts copied or inspired from other files,
but there is also a lot of content written by me.

The license can be questioned - and I just used
the default for new bindings.

Feedback welcome!

	Sam

Sam Ravnborg (3):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema

 .../bindings/display/panel/display-timing.txt      | 124 +---------
 .../bindings/display/panel/display-timings.yaml    |  67 ++++++
 .../bindings/display/panel/panel-common.yaml       |   7 +-
 .../bindings/display/panel/panel-dpi.txt           |  50 ----
 .../bindings/display/panel/panel-dpi.yaml          |  71 ++++++
 .../bindings/display/panel/panel-timing.yaml       | 253 +++++++++++++++++++++
 6 files changed, 395 insertions(+), 177 deletions(-)


