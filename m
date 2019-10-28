Return-Path: <SRS0=uucL=YV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CAFCA9EA0
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:21:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F86B20679
	for <linux-devicetree@archiver.kernel.org>; Mon, 28 Oct 2019 07:21:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="buMahIY2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbfJ1HVX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 28 Oct 2019 03:21:23 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36455 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfJ1HVX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Oct 2019 03:21:23 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so4550009plp.3
        for <devicetree@vger.kernel.org>; Mon, 28 Oct 2019 00:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SjvUltuh2v1/qjjUiDFm1v63Jt23MLQuB40iH2adgOI=;
        b=buMahIY2QkRhxUMbtrIj3QU2PwGHfajv7+ks2hGSjMkp72N2uLGZOgxlF9/W6Fwu5A
         mkL0SiRP70ryL4HwrbZhXGjw82cfTiIZERn9FuzGmR3FYXWw5EIZaQKjD+rZuvl4bjHV
         ZpFBOdPdzHyMDjCJr9cA+29/2iblFNKU///AE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SjvUltuh2v1/qjjUiDFm1v63Jt23MLQuB40iH2adgOI=;
        b=MzucrOil84qqPCoye7NI4Ph3kx29NKhXTEWwwk4J8ru0g5xWFw27+vIVuwIi9CEJCN
         k8LF8OHTa8eKom+s45Rq+RTbLm/0IxkRcz5Eqoy+TyuAhIsIMGOeFbgjFMtWGi+gpAOS
         wPbYoWRKb9DMPOTPrwdsJnNtmkm/Q4VvyhqNH5QwHq5iaDycUDuvoIGHNHtT52KOmIyA
         TKm04ggFUqGUdmhyRH/nad0JqL+kXowrn4vlBOFrJ4Gsv+da4JLLy+eRVxGf5MZzmVIi
         szyv5JlXOFp78iAoBqu/ONmeVyqUj/+MjjdwNXlGKjPF1wk+IVFqFx11jUbgbw1J9hSH
         r+9w==
X-Gm-Message-State: APjAAAXygcdBZmTWlT/lG82fCRSLRGKb8Jjre9xw5xa8yc225NodRIrO
        u4HbkaNIkIq+tfJ1/7S8RGbPiw==
X-Google-Smtp-Source: APXvYqwQobGd2yy0h+d8xDL2+pMj+A5vCdvqmHiGo4UYL5LngwD8QHY8Y1z1VloRFcuJdF2lxCaDwQ==
X-Received: by 2002:a17:902:bc48:: with SMTP id t8mr17749026plz.167.1572247282658;
        Mon, 28 Oct 2019 00:21:22 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:79b4:bd83:e4a5:a720])
        by smtp.gmail.com with ESMTPSA id 18sm9589688pfp.100.2019.10.28.00.21.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2019 00:21:21 -0700 (PDT)
From:   Cheng-Yi Chiang <cychiang@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Jonas Karlman <jonas@kwiboo.se>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dianders@chromium.org,
        dgreid@chromium.org, tzungbi@chromium.org,
        alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Cheng-Yi Chiang <cychiang@chromium.org>
Subject: [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to rk3288-veyron-analog-audio
Date:   Mon, 28 Oct 2019 15:19:29 +0800
Message-Id: <20191028071930.145899-6-cychiang@chromium.org>
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
In-Reply-To: <20191028071930.145899-1-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

All boards using rk3288-veyron-analog-audio.dtsi have HDMI audio.
Specify the support of HDMI audio on machine driver using
rockchip,hdmi-codec property so machine driver creates HDMI audio device.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
index 445270aa136e..51208d161d65 100644
--- a/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
+++ b/arch/arm/boot/dts/rk3288-veyron-analog-audio.dtsi
@@ -17,6 +17,7 @@
 		rockchip,hp-det-gpios = <&gpio6 RK_PA5 GPIO_ACTIVE_HIGH>;
 		rockchip,mic-det-gpios = <&gpio6 RK_PB3 GPIO_ACTIVE_LOW>;
 		rockchip,headset-codec = <&headsetcodec>;
+		rockchip,hdmi-codec = <&hdmi>;
 	};
 };
 
-- 
2.24.0.rc0.303.g954a862665-goog

