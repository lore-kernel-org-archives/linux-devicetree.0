Return-Path: <SRS0=Zx7r=7O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5BEC433DF
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38FF0207FB
	for <linux-devicetree@archiver.kernel.org>; Mon,  1 Jun 2020 08:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIZ65Sfj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgFAIdV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 1 Jun 2020 04:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgFAIdU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 1 Jun 2020 04:33:20 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454AFC061A0E
        for <devicetree@vger.kernel.org>; Mon,  1 Jun 2020 01:33:16 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id z13so7066569ljn.7
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2020 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mpxe8RjpMW5DpayumaX4Kfk6OnL4xAaQL+RDtMaTSdY=;
        b=aIZ65SfjREaq0XuCaxGf7NARmqZzIJ7gr5rjIHchheeg7vYxAbgZjf9UwM3pJIfJYC
         Pb/l8xsqOCRSLchWv7zyFZTlPsyTWUdVThjCMNH223JDUR+FbJi6rBQBeL2cjxuQLgvb
         vd5TDVAmaq6kxPNX9/1eVPEVeRdc5gD7M++AlrPSMBP/xXcUl1RiEZuAmzCjpgunoUCv
         9fxsbj6xn6E37GWy2rWCaVdcvbD01muRqEfVkvmxPQiPexoy7itKaoAN4okNPgCIwZzB
         p+ZuKUi//fQ55vVGCryB/TenMCAkF9mF0DipN/drlrAPM89B5N+XjL2tP7r+HHDqMiZJ
         /4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=mpxe8RjpMW5DpayumaX4Kfk6OnL4xAaQL+RDtMaTSdY=;
        b=VHKOqyHTSW9sl/3BmbjQYQ7cs72o7z80IZusMFRvD5kUL6CM/QEE8Xl9ZtQUPcE3WX
         1yP6IgFJ4K7edB0QrTPVqlqGLkU0qd3G32kl+8Lq2me6bsJbTNubEo/fmaqYoYCfPyd3
         yHMJUxREqIqLG4RPNL4cG6j6IUMihKefLH/dWLTeZB5+3u6q5sTtyyVvR3mmhR8oFcrO
         mj9M4uRAJcEQOnjtpS6godDJKFJTAVLNYFwmigGLLnhAaBh5L0LQwZyznD9fSjobIinw
         wXZzg6KIWNgdP/XiitJ64E8Qp33uZlHHMi/i1RwDkNhLW96vufsd3/oVQbFFQPz5w1W+
         Licg==
X-Gm-Message-State: AOAM533KB7DC6CL5wVTCLDVF6H8PAuWTnSlQewcyPJOm6C+qqW3ZJYr4
        aRnttSJKdwlK/jBD4KaoEY9YBOx42PA=
X-Google-Smtp-Source: ABdhPJw6taJK49jkCCaMb/dSqpSzU0Cd+iiRUpQY93CUje0Fa2ggawOMOk7cMJdWts8CbJjisKhQDg==
X-Received: by 2002:a2e:9a05:: with SMTP id o5mr258849lji.60.1591000394587;
        Mon, 01 Jun 2020 01:33:14 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
        by smtp.gmail.com with ESMTPSA id f14sm3871433ljp.118.2020.06.01.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 01:33:13 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@skov.dk>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v1 0/6] drm: add a few simple panels
Date:   Mon,  1 Jun 2020 10:33:03 +0200
Message-Id: <20200601083309.712606-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Push a few patches that has been sitting in my tree for
far too long time.
Adds a few more panels to panel-simple, including
documentation of the compatible.

I have added the last few people that added new
panels to panel-simple to the cc list,
in the hope to speed up the review process a little.

	Sam

Sam Ravnborg (6):
      dt-bindings: panel: add Seiko 70WVW2T 7" panel
      drm: panel-simple: add Seiko 70WVW2T 7" simple panel
      dt-bindings: panel: add Hitachi 3,5" QVGA panel
      drm: panel-simple: add Hitachi 3.5" QVGA panel
      dt-bindings: panel: add LOGIC Technologies panels
      drm: panel-simple: add LOGIC Technologies panels

 .../bindings/display/panel/panel-simple.yaml       |   8 ++
 drivers/gpu/drm/panel/panel-simple.c               | 127 +++++++++++++++++++++
 2 files changed, 135 insertions(+)


