Return-Path: <SRS0=Fzrg=42=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E649BC10F27
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B7FBC22522
	for <linux-devicetree@archiver.kernel.org>; Mon,  9 Mar 2020 15:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sp3+MRjN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgCIPhE (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 9 Mar 2020 11:37:04 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40943 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgCIPhD (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 9 Mar 2020 11:37:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id p2so10978516wrw.7
        for <devicetree@vger.kernel.org>; Mon, 09 Mar 2020 08:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=CMCkUGWyUXDY9/+1nPPFR1H/NZon6xyDpMv3o0wXpjk=;
        b=sp3+MRjNFqYl1GEuzhd871RKEOfmb0kxaisfmQpLADTlUCnc3CyzZ92nDd2XD/DFyq
         s8sJNi6cTdoQnqaW6AQkeGQ5Jq+x9QhsCVhCY2aOCiwRW1Gm7oeBxTtd+29zSOxNCeob
         FSrdeVW8or6WRIphIRP/RiAK0THwtXdSI/XqRFPkPBlYbD2BlHfj+Rs5j2Ff8SbIOC7y
         qQGWzKU+09/9nNbRvt7IFIhtQIdvQqBoaSaw9nPVPX5CGa8bll6yJ+OYEHi/A/I9qalN
         tRG1hJ1U9m2kNdxN38+8yzgaeyaxpetIyCHBlBAvWZFDP47gc5kA37bsZF02RXfH5dan
         EAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CMCkUGWyUXDY9/+1nPPFR1H/NZon6xyDpMv3o0wXpjk=;
        b=hUMmERNW7HEdB3vQ3KrPbCp8sqq0j6JTDrq/PwnE1hxN8kjQMnNlm+fL74BNHYwN9c
         tVIGD9YmdiiFzOrFzCmBB9rLaAmyqUTDFGFTiTslXtfwb6kFiw8IG3hM+1aaZZaHmg/T
         hRxExCCLrpTAflhHlWA6ymcuekfTveZysmR/k2lHA6LNNzMtBVEDVjEhagxfcQW2sn8s
         fEerIAebHevgZLs02A9r2mXRNGFhtQQi9w1J+YTwbW0WwtPyWNqtcVPxLNr/ilmFxR8J
         Ap6oT2IRk6Pa0peBSkP0/C3485N68FQQQ66Ggzrcc9YQ7ERMys4IFZww9b6leoxKRcos
         aPwA==
X-Gm-Message-State: ANhLgQ2M/FY48uOOttPeJnwdXXHHLyEIGXfpuGGp99wElLXeOIG2ojQE
        AqDRlY/SnEvqCs8/lwhabll/4A==
X-Google-Smtp-Source: ADFU+vsvlJG1/jN/ClMPn1XK0ZP5cUyfrfwHKGeur1VcrE/o6jEioa58ZpxOLpU6/PnTdXryQ6vpMA==
X-Received: by 2002:a5d:69cc:: with SMTP id s12mr8476355wrw.20.1583768220640;
        Mon, 09 Mar 2020 08:37:00 -0700 (PDT)
Received: from localhost.localdomain (232.240.140.77.rev.sfr.net. [77.140.240.232])
        by smtp.gmail.com with ESMTPSA id h17sm63426792wro.52.2020.03.09.08.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 08:37:00 -0700 (PDT)
From:   Phong LE <ple@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        mark.rutland@arm.com, a.hajda@samsung.com, narmstrong@baylibre.com
Cc:     Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@siol.net, mripard@kernel.org, sam@ravnborg.org,
        heiko.stuebner@theobroma-systems.com, linus.walleij@linaro.org,
        stephan@gerhold.net, broonie@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 0/3] Add it66121 driver
Date:   Mon,  9 Mar 2020 16:36:51 +0100
Message-Id: <20200309153654.11481-1-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The IT66121 is a high-performance and low-power single channel HDMI
transmitter, fully compliant with HDMI 1.3a, HDCP 1.2 and backward
compatible to DVI 1.0 specifications.
It supports pixel rates from 25MHz to 165MHz.

This series contains document bindings, add vendor prefix, Kconfig to
enable or not.
For now, the driver handles only RGB without color conversion.
Audio, CEC and HDCP are not implemented yet.

Phong LE (3):
  dt-bindings: add ITE vendor
  dt-bindings: display: bridge: add it66121 bindings
  drm: bridge: add it66121 driver

 .../bindings/display/bridge/ite,it66121.yaml  |  95 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/bridge/Kconfig                |   8 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ite-it66121.c          | 983 ++++++++++++++++++
 5 files changed, 1089 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ite,it66121.yaml
 create mode 100644 drivers/gpu/drm/bridge/ite-it66121.c

-- 
2.17.1

