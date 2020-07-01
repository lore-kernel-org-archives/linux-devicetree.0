Return-Path: <SRS0=V/11=AM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDABC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 01:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D25A20781
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Jul 2020 01:33:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20150623.gappssmtp.com header.i=@beagleboard-org.20150623.gappssmtp.com header.b="0JTT3bwG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgGABdf (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 30 Jun 2020 21:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgGABde (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 30 Jun 2020 21:33:34 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65ADEC061755
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 18:33:34 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id z17so18110209edr.9
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2020 18:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VYml6MLvVnH67ofYRYqVd160Mf/rDTxD1O5uDA9s3c=;
        b=0JTT3bwG/3G71Kq+zgpc6slp9fDtHbqeAZXEqcX5hauhtzWEnqI/CV0G2PuXoTzq6Q
         qpb34SgQD7+KNt//LUpiB5uK7fPW72OfRraXvy21ADOypcUqUVSeyngLagnFGXEKE1Qs
         Y+evYWYMZrGSR7/jCCQOJbnlEikeyGCZrotPgjfh7vrI+eWtXRjZKXddpOuhYlChfJRr
         EAFyaKlTvigdR8bQn9FnT+eGHUx/dOf6DUy57YBHDl00N5RdS8FjW8bUJZENylPSPqzO
         h4VOBtgYi5kizz3gOnvSHbcpFA46ecZ6Fjr1uTYTSgpzNywTCueRBaU1VwcCn7a0CoHw
         /VDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/VYml6MLvVnH67ofYRYqVd160Mf/rDTxD1O5uDA9s3c=;
        b=mNZBVeMLes53Lz/PTuFxJy9NZbOgl3FbZe618m0zuYvE6PgkdBdszqJ9h3rWCLONvy
         ptMwFL7dAkKwUP5V66R4sadl5BNk1XIqYax0WA17lWnOokhCRjVBKd7JiZe9Lxtl7xW/
         mGdXQOYkFG8u5464aIvPixGODBhi4wu75PdhCkyRCEKZ4oMRBfvNca8EPIh47wh0RU+S
         GrzccLXHDgYhPYZ306UFojlCXHSwfimc3hcHeMs31B8D7Gr3zJgOYUWBYDjqIaAq+yl2
         q6ZMQtUb3VW64FtCoxMDbbyitkBpMCQI2USlyWtPKOsRtCYtoAe/VufHts5o5ky5c93K
         pmbg==
X-Gm-Message-State: AOAM533eVB4L0/vjlyzldHLA0cZMTjikjn8FBri3kEtmzZBTRbuILqsL
        cgydSZZGBQXsCyiX1UtCxU242A==
X-Google-Smtp-Source: ABdhPJxUV3RPX54vZQ0QT0VrM5ktf5G9tcfaBT5ASwITZJ8pLiOxiO7nQqq6vhAytpCs66H7qUKwAw==
X-Received: by 2002:a50:e8c9:: with SMTP id l9mr19125444edn.272.1593567213062;
        Tue, 30 Jun 2020 18:33:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c28:7601:2d3c:7dcb:fbf0:3875])
        by smtp.gmail.com with ESMTPSA id d23sm3348571eja.27.2020.06.30.18.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 18:33:31 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
Date:   Wed,  1 Jul 2020 03:33:18 +0200
Message-Id: <20200701013320.130441-1-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Currently, pinctrl-single only allows #pinctrl-cells = 1.

This series will allow pinctrl-single to also support #pinctrl-cells = 2

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
get the value to store in the register.
    
To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
omap.h is modified to keep pin conf and pin mux values separate.

change log:
- v4: squash patches 2 and 3 together so that git biesct will not result
  in a boot failure

- v3: change order of patches to make sure the pinctrl-single.c patch
  does not break anything without the dts patches

- v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
  compile error in dtc.  I had added it per suggestion from checkpatch
  about having parentheses around complex values.

Drew Fustini (2):
  pinctrl: single: parse #pinctrl-cells = 2
  ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2

 arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
 drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
 include/dt-bindings/pinctrl/omap.h |  2 +-
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.25.1

