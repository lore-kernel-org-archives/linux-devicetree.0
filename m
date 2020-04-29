Return-Path: <SRS0=VloT=6N=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536DDC83004
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 16:24:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD952083B
	for <linux-devicetree@archiver.kernel.org>; Wed, 29 Apr 2020 16:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfg9FBtz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD2QYo (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 29 Apr 2020 12:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726815AbgD2QYo (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Wed, 29 Apr 2020 12:24:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B390C035493
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 09:24:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j1so3316711wrt.1
        for <devicetree@vger.kernel.org>; Wed, 29 Apr 2020 09:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADiqVCpvp8u+dzB9ke1O/BxJ8B4T05czfzaYmje6w94=;
        b=nfg9FBtzRkNNFB895zwDXF5h1SCzLtHIHEArxQOIypisEW+sLJeEFFsl5jQZOAQUm1
         Gk2W/HepcONJybmjc7yjUPdCpz45ff/0ZoYTN8+ncWXr18rhjybizCruAH25c3QdQBnC
         InPigL/BxQnpb6RwI+uNMKDmQ+FA65z8S7lVPXLYPDGV6s+r0nmcwrDvCdMxbpkQCay3
         Zj5oe0cn2dguQVi883e+4v3r19aNtH2BbOZK1DfS8UHBvUIdTvlDrKumUW3PHp4MYIpe
         CcIKR8XPnWNp9FFyqHJUNSLb2QZuAFgwmKX+txpPHgeXMyUySi2VEXNcmiY1Lcsm/0fu
         mjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADiqVCpvp8u+dzB9ke1O/BxJ8B4T05czfzaYmje6w94=;
        b=uTFb3XCBbheM4F60mwHb4U1GdiDEOuARPWXiRS/sp7sejd48jPu1yvwK1rdWQxKabA
         NiLNwETJyoz1RQOmweLVETCUYoMYjLbz3N4aJkwGyl1Vg6tV3SF9KcD8qBWu9gc/GUxh
         3DOOiaPyInWOCgb5pv80sTEyNZLay3Mp+CfizTJh3BFuDsr40AKEvLtuxXB0LnP7k3OE
         +KYUrSYDb5aB9/hFe6LC/oJgX47Tnc9P1nBRDFTbfjfDTJD7WC2kK3fBeTEgRlgxCAIE
         /au2xrD4e1vOAGieORhJrwisgzB8gbCfZhj+WqEJNHwdLP1wHC1Uw9E4FZuzK0v3Y/Gi
         r7OQ==
X-Gm-Message-State: AGi0PuZUCoZ5+ogAHSYX3YbtsErKMT293dp5m2Pj/sI7Z0hxPkbMQEpi
        LHrI1EqxVKOHNKGiLSRPHsgedw==
X-Google-Smtp-Source: APiQypLrrX5chyfQ776G/ANPebYHVEwsF2r9aqYcDy10DPmWsl+HRRFigDXqGRIWFJXTPDwD5WMOTQ==
X-Received: by 2002:adf:ce02:: with SMTP id p2mr39887093wrn.173.1588177481814;
        Wed, 29 Apr 2020 09:24:41 -0700 (PDT)
Received: from xps7590.local ([37.120.81.28])
        by smtp.gmail.com with ESMTPSA id h2sm32616554wro.9.2020.04.29.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:24:41 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Robert Foss <robert.foss@linaro.org>
Subject: [PATCH v6 v6 0/3] media: ov8856: Add devicetree support
Date:   Wed, 29 Apr 2020 18:24:34 +0200
Message-Id: <20200429162437.2025699-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This adds devicetree support to the ov8856 driver.
In order to to aid debugging and enable future sensor
modes to be supported, module revision detection is also added.


Dongchun Zhu (1):
  media: dt-bindings: ov8856: Document YAML bindings

Robert Foss (2):
  media: ov8856: Add devicetree support
  media: ov8856: Implement sensor module revision identification

 .../devicetree/bindings/media/i2c/ov8856.yaml | 140 +++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 190 ++++++++++++++++--
 3 files changed, 317 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.25.1

