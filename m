Return-Path: <SRS0=byNV=46=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99C7C10DCE
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:04:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C29E620724
	for <linux-devicetree@archiver.kernel.org>; Fri, 13 Mar 2020 11:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vjrkrms1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbgCMLEI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 13 Mar 2020 07:04:08 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:32891 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgCMLEI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 13 Mar 2020 07:04:08 -0400
Received: by mail-wm1-f48.google.com with SMTP id r7so7579096wmg.0
        for <devicetree@vger.kernel.org>; Fri, 13 Mar 2020 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2E4KEZKaVDRYwIZNq87wG0kGHEBrb12/0HT+rY65w0=;
        b=Vjrkrms13ezAAsNBrf4Aw3643PvilA7lHREO2Rje7EPz5HKIhn6PK7nFyIG10khzhI
         gjQgVYI8w2j/TCZmWE4/qsTEYFwgLErPxhhX893U8Qg0gq9D23tV/AanxjmUS6mGI7Nu
         dJ4WZmX8l5nPI005siYUimKql3oZc062Ruvly56AaIpSlKikWM42Xx1/SNfXR456D2Uy
         4Nm2keDF+/LIPRvjYhJV2u7oMLrc19xBe1vjw15IUjIYCoZo/T3dhg3wCCaCvMqdJ7vK
         loIGsgKy0neWEonPTWCs9EQ/OXPNeJ3yGblU/tp9iKqPmCNVyYHyg23E0FwcfUVKbe7H
         A4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w2E4KEZKaVDRYwIZNq87wG0kGHEBrb12/0HT+rY65w0=;
        b=fLe/Qd97g/IFC8PsjFqTggqO+OOOvpyqbLotz/QCcDQE8ztEOKSexusjvSv19/UkN/
         AKWg8Ij+/0B/ohuPG3h2PzkSu/pDHGjMOQWMkt3+YFmHkjpU1ZPNXlrZfa76v42rVOQB
         L7aMoeM2UPGKSN1u0J2ZX7QrFxyvmdyfymnEwBKeLQ7SSurf8sQl3hwlcLF9S/HVauk8
         VFTAGcWVh0ogVkkZa+2rBVNvoeYxt79m/vUG9PcooJjutbYHD3FJ3543PspbC6+6svav
         crVG+MYSODZ8By1hOirtstS61AHPwKNnKsVmjlFUa9hJay2YVABJoP49sTpP4C+dQ4BX
         A77w==
X-Gm-Message-State: ANhLgQ3rcjuNDOUWVQFEKcyLG2EnTOLm+PaqqdGEWuerI+cW/4fM5wui
        4H9Gk0oh4pDQNaaSiwpaTnPEIw==
X-Google-Smtp-Source: ADFU+vt0bW6bGGlAkijDQUDmrP+c49Qo/GdKOBADGoqQJMl248Gzb6VsDZxp8+EgPXENT81KeoRFXw==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr10541710wma.28.1584097446011;
        Fri, 13 Mar 2020 04:04:06 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:c814:5be4:577e:3bd5])
        by smtp.gmail.com with ESMTPSA id r23sm23578052wrr.93.2020.03.13.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:04:05 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 0/3] media: ov8856: Add devicetree support
Date:   Fri, 13 Mar 2020 12:03:47 +0100
Message-Id: <20200313110350.10864-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
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

 .../devicetree/bindings/media/i2c/ov8856.yaml | 133 +++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/media/i2c/ov8856.c                    | 151 +++++++++++++++++-
 3 files changed, 283 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

-- 
2.20.1

