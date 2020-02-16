Return-Path: <SRS0=AK1n=4E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE65C76199
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4712208C4
	for <linux-devicetree@archiver.kernel.org>; Sun, 16 Feb 2020 18:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS6eYJ4j"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgBPSPb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 16 Feb 2020 13:15:31 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44118 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgBPSPb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 16 Feb 2020 13:15:31 -0500
Received: by mail-lj1-f195.google.com with SMTP id q8so16165280ljj.11
        for <devicetree@vger.kernel.org>; Sun, 16 Feb 2020 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SfHlVAnH/ccSjGXvc2AU7CfY4JiqCtEZu0lrLGdWkG8=;
        b=LS6eYJ4jE18P0XW64xlvQPq9yX54ItuCELBjzkOeGY669IvJufudSr/bu29DYTuQuG
         oboKilMMlajKzbEy8GHC9UDabTFKLE3TYx7RAyj5YJW4Li8HSPgch6M0XQGD/y28DfGF
         96wJxmSuWZd9CHPDqXOaND6DwHu5jGGfzBroGPHRTnlwQUjWDRAKTsK0st9q/lWg0ht2
         USTTPvoY3bDsnQqPbLNUS5H5HydiKx9xMKbrD7wq9wesRVWtXB2ktjkwbGrkdOEtkA5z
         BR9sbsY2XAxaufgght22aVMIbPI+jeagR3MaEz24+8ccpaQPbxOIcuRtMMjvzWCQF1no
         DTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=SfHlVAnH/ccSjGXvc2AU7CfY4JiqCtEZu0lrLGdWkG8=;
        b=RShcwGo6tn0jIvc+FeWqk1wH72Hnk1SgKrY3Efm2wflhXKJbNwPO7lkTfYpOCbsAEL
         WdadeRkn0NCivc/Na9Km0vUKJtEfw+KNDKPn1aaJn9sSl3rCuESa/eJAJ0g++hP4oeBx
         MlYE8W3YgjHGGrYmOVTlbL4IOLbF77g7O6pqz0kvI6q61ScRJ6PY6fwOmbs/nPSvLp+a
         hCyZhE61sQjCF+CmZrKsVbDtT485ERpj8NX1l4/wUfA94AbeIJfcCAiU/10pkk41ghXc
         Wq0v/IKPxCwiuehNh8aZMajzuA90fRPSZCiodB8a2dfOkxSubl8ZYVscfQv+2DIgq1LI
         Y1lQ==
X-Gm-Message-State: APjAAAWfr+l7fJdkXW/qHzsHKKiXWc1kI2x0jhqtAU/lL4IGRGpP5zBb
        8Z832EbC0lKv6M/hsT1ytZqPHHLOn1Y=
X-Google-Smtp-Source: APXvYqx/41CIvs7Q4tFA4Bw/bUOPzDWehieZO6S867gJzb9e1HNuprIU2zKmYJZWhPdcgXmRb+nXKw==
X-Received: by 2002:a2e:965a:: with SMTP id z26mr8151145ljh.104.1581876928759;
        Sun, 16 Feb 2020 10:15:28 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id u15sm6157431lfl.87.2020.02.16.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2020 10:15:27 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Maxime Ripard <mripard@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v3 0/5] dt-bindings: convert timing + panel-dpi to DT schema
Date:   Sun, 16 Feb 2020 19:15:08 +0100
Message-Id: <20200216181513.28109-1-sam@ravnborg.org>
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
at updating panel-lvds to support panel-dpi.
This will make it simple to add additional properties to panel-dpi.

Thanks for the quick responses on v2 and likewise the quick
feedback on the request for the license change!

Highlight from v3 - se individual patches for details.
- Added panel-dpi support to panel-simple.
  We can now add a simple panel just by addding timing parameters
  in a DT node
  The patch [5/5] is RFC as test is pending
- To support panel-dpi in panel-simple - add a data-mapping
  property to panel-dpi

Highlights from v2 - see individual patches for details.
- Got acks for the license change
- Simplfied panel-timings bindings
- panel-dpi can now be used without a panel specific compatible
  So panel-dpi can be used as a generic binding for dumb panels

Feedback welcome!

	Sam

Sam Ravnborg (5):
      dt-bindings: display: add panel-timing.yaml
      dt-bindings: display: convert display-timings to DT schema
      dt-bindings: display: convert panel-dpi to DT schema
      dt-bindings: display: add data-mapping to panel-dpi
      drm/panel: simple: add panel-dpi support

 .../bindings/display/panel/display-timing.txt      | 124 +----------
 .../bindings/display/panel/display-timings.yaml    |  77 +++++++
 .../bindings/display/panel/panel-common.yaml       |  15 +-
 .../bindings/display/panel/panel-dpi.txt           |  50 -----
 .../bindings/display/panel/panel-dpi.yaml          |  82 ++++++++
 .../bindings/display/panel/panel-timing.yaml       | 227 +++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               |  74 ++++++-
 7 files changed, 470 insertions(+), 179 deletions(-)


