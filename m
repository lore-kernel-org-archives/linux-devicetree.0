Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4835CC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14D88222C3
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 10:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vM8v/vmd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgABKRX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 05:17:23 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33227 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727990AbgABKRX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 05:17:23 -0500
Received: by mail-lf1-f68.google.com with SMTP id n25so29595236lfl.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 02:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9+i1xRykP5uv9X8ny4A0J+Qps3PIBxztMEkk3ewgFGA=;
        b=vM8v/vmdGQCKaZpPhBATGVmk7XhHVJTWBTVqXUPFl24NXuIe6gv+WZwBGJqW8O1c3y
         loe6323y+s6fWCC1ZqmyXBJcMrGmZldshtSFEUI0N++5eFxP5gKuCrx+TP/iHxg/duf2
         P2Cvt3UUqUIp2xJbA3RWX+PPoQc96e9Wzr+44dHJ8sqwZxiD28KuW2xzNRmJFEBHPC9K
         2q1zi81qma/Ei8u7S5LttHR+xfdjYz9dFB2tbxMZ9/h6xMVr92yAjA1VCZpejs5PY0se
         pAODJiDeNgYdDHpBj9vBRLZeBU/3gouz5mQRhACHUDUmZleFsy8ijP0XgQ8gKOey4Z1d
         j0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=9+i1xRykP5uv9X8ny4A0J+Qps3PIBxztMEkk3ewgFGA=;
        b=k4s92yjc3qTsSHQFe4pftiagFtHxq1cp9aceVCdlHwN/eUr+1XE61s/vNvO8DDq8IP
         r8ZYN0Ie+q3saXrUPimEBZXLmdq+R5nFswJhUKlE8lVQ8ZbJDr293SUP2jBpuBgu+plF
         EnRBqR+w48uvTnkRU225j4vBKMWI8OXuDpegrwjBQpzeKAAvte2dKQP/+bKPyRMysUAv
         CFLdVPJmdOf6TSGIlWF5jlQgajASiln4FfBHuzo/Y3GzTUoplW2PJmI3xFWqy1nNtHpr
         CjPAEI0YmMzzhcnmAmmq58mb6ZcJ5SFfCQCOpNApWxuKBq1AM/NlPL3hCk/N2P455yIg
         7i6A==
X-Gm-Message-State: APjAAAWfH/uleQzfDSAn/ouq41gjbC5YTN1AKnn9zTJR0ChKDjQCS7YA
        s0SAh5GWxucSlVOotbp69ww=
X-Google-Smtp-Source: APXvYqymNyc0QLFnUptpOrq0JxPbqMdtMbzqFjc2QtF0PLfXsINKI71/OMdHVF6jfoSQdtFGWB8kww==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr43352664lfl.125.1577960241084;
        Thu, 02 Jan 2020 02:17:21 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m21sm23025892lfh.53.2020.01.02.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 02:17:20 -0800 (PST)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <mripard@kernel.org>,
        Yannick Fertre <yannick.fertre@st.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] combine bindings for simple panels in a few files
Date:   Thu,  2 Jan 2020 11:17:10 +0100
Message-Id: <20200102101712.5085-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

This patchset introduces two files:

    panel-simple.yaml
    panel-simple-dsi.yaml

The two files will be used for bindings for simple
panels that have only a single power-supply.

For now only a few bindings are migrated - the
reamining bindings will be migrated when we have agreed
on the format.

v2:
  - updated binding description in panel-simple.yaml
  - fixed exampe in panel-simple.yaml
    (I was missing libyaml-dev - now the examples are checked properly here)
  - added panel-simple-dsi.yaml

	Sam 

Sam Ravnborg (2):
      dt-bindings: one binding file for all simple panels
      dt-bindings: one file of all simple DSI panels

 .../display/panel/ampire,am-480272h3tmqw-t01h.yaml | 42 --------------
 .../display/panel/ampire,am800480r3tmqwa1h.txt     |  7 ---
 .../display/panel/panasonic,vvx10f034n00.txt       | 20 -------
 .../bindings/display/panel/panel-simple-dsi.yaml   | 67 ++++++++++++++++++++++
 .../bindings/display/panel/panel-simple.yaml       | 59 +++++++++++++++++++
 5 files changed, 126 insertions(+), 69 deletions(-)


