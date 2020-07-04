Return-Path: <SRS0=KrzM=AP=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDF4C433DF
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 65DDE20870
	for <linux-devicetree@archiver.kernel.org>; Sat,  4 Jul 2020 10:28:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF+bK/Mi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbgGDK2P (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 4 Jul 2020 06:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgGDK2O (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 Jul 2020 06:28:14 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2FBC061794
        for <devicetree@vger.kernel.org>; Sat,  4 Jul 2020 03:28:14 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id h19so39791260ljg.13
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2020 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ChdzGdENdb3WewpqYoS1A7CP5uDoue3KfNFfd6bCwIA=;
        b=fF+bK/MiJoxHCkfg7qrlcScomt1i4osHKMgQvcelolBraTgtXUpwCB8jrvFyIPDP62
         1caqYhacM+ATxkb4nMabHg45uBsuM0RLFimP1cfJZQQTfTdkojDUeB39oFFUdMH9Ah6H
         XpnYIjftn9SnEACgOlFiBmWuVLk1m2UDLxjXP9KPQv0zSQ1VidFN79J2bxvk7htl9L/v
         qnLWpGVM0Ae8GxgQ1Mq2fu1crSqcdHCwecUD2TdJb/T//fRQOLpGYtQEK7zZHcFQfaxt
         zeN8XqfDlnqmmtoDlg4jGey+IkgjCAmbDeeBteth3g0jN7XfFbZ6n2MQK+CPfPIHFqi8
         SGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ChdzGdENdb3WewpqYoS1A7CP5uDoue3KfNFfd6bCwIA=;
        b=a3HyPCTfDDkRxCLCpcOp8bcC9dr5ObSKl9BaqrqHeSRKUV0X2XJgz1ZwhrW+WVaXZz
         KF5vGPqaVCPc5gGvMANxqtAziYnXHivtqY4/5Gmjj8mM8QpIRQVKl5Js9Vu2a/7hoHs7
         tO8B262MR5pH9h3s25ljAOBFhMeuuva+JIOmWKca2kU3fe25J9K8cBaNAukYQ1zvVKaH
         SqN2Bk11RGGts+d8nCzIwY/FNvPc8fLXXnh3KIEB65teTwpUEZ96RayxFh8gCSX6bNYw
         A8QlYw+YQCknGPl+um+G+SpdqYxxdS35QJjPkTKjeHBqtuY+TlMgJOQxMwZH9xPUO/4T
         Usww==
X-Gm-Message-State: AOAM530NqqQRCDwcRU8/Ku7zt3HlN9AFUFypejcwlU7Fr/hUlQidAUXz
        w2sXLXvHu79gg1EzXyxhurg=
X-Google-Smtp-Source: ABdhPJxVOX5CDm3eDrguOA0bMz3Bhuav996Y6x6qbdYp2fD2fnCwENNTrNAD0AjWmlnHnKvbHrMzxQ==
X-Received: by 2002:a2e:9853:: with SMTP id e19mr16421929ljj.436.1593858492750;
        Sat, 04 Jul 2020 03:28:12 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id z23sm5366913ljz.3.2020.07.04.03.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 03:28:11 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Chris Zhong <zyw@rock-chips.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/3] dt-bindings: display: convert panel bindings to DT Schema
Date:   Sat,  4 Jul 2020 12:28:03 +0200
Message-Id: <20200704102806.735713-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patch-set convert 3 of the remaining panel bindings to yaml.

This is a follow-up on v2 that converted a lot of panel bindings:
https://lore.kernel.org/dri-devel/20200408195109.32692-1-sam@ravnborg.org/
All was applied except for the reaming three patches included here.

One binding is a DSI binding so just added to panel-simple-dsi.
The other two bindings addressed review feedback from Rob.

Sebastian Reichel has a pending patch to address the remaining
panel binding in display/panel/

All bindings pass dt-binding-check.
Based on top of drm-misc-next.

	Sam


Sam Ravnborg (3):
      dt-bindings: display: convert innolux,p079zca to DT Schema
      dt-bindings: display: convert samsung,s6e8aa0 to DT Schema
      dt-bindings: display: convert sharp,lq101r1sx01 to DT Schema

 .../bindings/display/panel/innolux,p079zca.txt     |  22 -----
 .../bindings/display/panel/panel-simple-dsi.yaml   |   2 +
 .../bindings/display/panel/samsung,s6e8aa0.txt     |  56 ------------
 .../bindings/display/panel/samsung,s6e8aa0.yaml    | 100 +++++++++++++++++++++
 .../bindings/display/panel/sharp,lq101r1sx01.txt   |  49 ----------
 .../bindings/display/panel/sharp,lq101r1sx01.yaml  |  87 ++++++++++++++++++
 6 files changed, 189 insertions(+), 127 deletions(-)


