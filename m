Return-Path: <SRS0=Vyee=AT=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDBC433DF
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1790C20772
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jul 2020 11:32:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sPcXnGBL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgGHLct (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jul 2020 07:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728410AbgGHLct (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jul 2020 07:32:49 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C057C08C5DC
        for <devicetree@vger.kernel.org>; Wed,  8 Jul 2020 04:32:49 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 205so10248348yby.19
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2020 04:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=6FhChgNsjWl6gND82XH9wwnoBKtHa/ehVm4YKI17cOw=;
        b=sPcXnGBLHEBpPbBJvUpkHZegzNgRAmYuS35JMlanSO4OXGf1no4O8LwlkN10MsXmT0
         woWxbfr8kxWXB5jN/x+fgGwjBhbek/ClIz/A1sHpu15kcPjinWcITugsqapMsQSOeuOz
         EMnUbUyYZ8hVX/3BiQL/8MI2MokaU9tixu4/Amx9WmDVfXvNX/FYwmMqZw4VXzkQM36P
         +0cYobVv2Q6eVyjCyIelbjVWY//lVn53g5HiSeWtOXv1cdrUeYXlFH5VfVVBtscikjJ6
         zjLU/VDONk7IuyQ0nAJBLWXXIHwlEpmbFhGQrCm56JzmVsxu15aiO1k3G+fmS5Y7DpFf
         TatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=6FhChgNsjWl6gND82XH9wwnoBKtHa/ehVm4YKI17cOw=;
        b=XsZwdF9zTga8wZ/eseTbzL1staBWpH7SS1V9+TcCt1EEh+BkRneOF5Bokz8j2n9zeR
         1pLrfK2ibTdhj4z5cMxwrRzL0E7fKgpKoLluVtLFpmP3fZhQFqITlxOKtQCDzjI7+gu6
         vOEL5wlQnuwIJpTLjfWrOrzAAWPvxlppUeI6HgVrhy+TPPsKIac8LK7DABK3EEpvYIdv
         hiRIlGxeQajGRRoWtI25tVntVoujPaaWt12yYsHqzdsrcp2t2STf9S5pmTG46DVIxGA2
         swL0R4OGP5LHlo7j4kbLYrI188funbESKtF7NmSUyna9ZyNmg3D5rmSzX5WY6yqXW3iy
         M5MQ==
X-Gm-Message-State: AOAM532iXI1WmjGE/xUAm71kfWM4SdnaHEEMCC3jj2zNlpeGCl8ktf0M
        qAW2uRJeKG2vEO4DQtQUiQP8oyRD0qAA
X-Google-Smtp-Source: ABdhPJyjfU9P0otQHIiqz1zn8C0iSCfzci2MI/wGNecYetCRSI0gPiU2S0h0PyrgUg3b/oDtQ9c6KUCNTeiM
X-Received: by 2002:a25:8008:: with SMTP id m8mr37507113ybk.104.1594207968592;
 Wed, 08 Jul 2020 04:32:48 -0700 (PDT)
Date:   Wed,  8 Jul 2020 19:32:31 +0800
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
Message-Id: <20200708113233.3994206-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 1/3] ASoC: mediatek: mt8183: sort header inclusions in alphabetical
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Sorts header inclusions in alphabetical.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 1fca8df109b4..8cd53403a080 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -7,13 +7,13 @@
 // Author: Shunli Wang <shunli.wang@mediatek.com>
 
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/jack.h>
-#include <linux/pinctrl/consumer.h>
 
-#include "mt8183-afe-common.h"
 #include "../../codecs/ts3a227e.h"
+#include "mt8183-afe-common.h"
 
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
-- 
2.27.0.383.g050319c2ae-goog

