Return-Path: <SRS0=lZ7l=YM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9108ACA9EAB
	for <linux-devicetree@archiver.kernel.org>; Sat, 19 Oct 2019 07:03:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6354220872
	for <linux-devicetree@archiver.kernel.org>; Sat, 19 Oct 2019 07:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zj28yV8M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfJSHDu (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 19 Oct 2019 03:03:50 -0400
Received: from mail-pf1-f201.google.com ([209.85.210.201]:54031 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfJSHD0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 19 Oct 2019 03:03:26 -0400
Received: by mail-pf1-f201.google.com with SMTP id x10so6371323pfr.20
        for <devicetree@vger.kernel.org>; Sat, 19 Oct 2019 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=jlOtWXCNhHtlDG+k17B3fk8K3J30slAGte+uW0UmF+E=;
        b=Zj28yV8MdULZozKF/ciYqHOiJNUsZuYg6lzBq/c7cRDga/k0ZyF94c3VRnllYQzJFN
         WvooI71td9MPxNhl0g++L3A1QdERbBBpet5NvI30B7vkdpVEy/nfXMWuVvrjgRFYGia+
         wv8n437eF9DwM6eG5+cn/fWxfSH7hGmYmYt9zzFc+bfO37Cor3XbweS8a5wOm/sBr3/c
         8ia0J85/f6knnD3ReK3N2qSqHyfh/+6xlqd5ko1TpsHtv2PDXHT9VUw4RWuo5FCrkFWR
         QPi0YY/zRUM2eONtUgKQnuclfMlqIaXJeCb6uvdS1WLNQL4vvdSpA2Lsj1kuwGMYmDFP
         aMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=jlOtWXCNhHtlDG+k17B3fk8K3J30slAGte+uW0UmF+E=;
        b=EJMl5g78Qkr8qEZYft3Uku68ZMz8B7Rhfwb5hhEEibYqVJJOiaN9xv1sYrqjhRF1BD
         BmAYVoQV+gXjQvgRjf5kqMNS0AIvO/4F3EbnjRC4+i0uK4+SCsgoNNdi63IkHJoKkEMK
         jhJZsbrDBIPZDgXpXXo4g46OsHdT0ptZaBu2XNIvKV348Meu8f7t52ajupuW/fkeApMm
         dI/a8t51ts0ASfszpZMMe4jinU8erugEuzzE1CiOeqcHSdDCRVtnEiGyXP7i7ATFr74i
         vZlc/SOHgebiOSxccHluQvtAIfvbCPraRWN7X9W9KjZQfje6sxpKjKGSfCvMQRFi7jzW
         5qxA==
X-Gm-Message-State: APjAAAX6gq/lGA39863rKNijVtn2Neg1ETQvjDRZgIVuLvgCypUJ27VY
        iwfDTmD26IobrWpHdD1Y2P7VJaFVmlKq
X-Google-Smtp-Source: APXvYqx3MAr9bPPwbRL5AclIQKxFR+7nucK3CkegVw1UL1Ev5Bs31ronYhQEQ5GPP5Uoceu3Rg3QMDMUu9wx
X-Received: by 2002:a63:f810:: with SMTP id n16mr14032502pgh.176.1571468604085;
 Sat, 19 Oct 2019 00:03:24 -0700 (PDT)
Date:   Sat, 19 Oct 2019 15:02:53 +0800
In-Reply-To: <20191019070254.23870-1-tzungbi@google.com>
Message-Id: <20191019143504.3.Iec97a3f137148cdf316056612590b3e0b302f5f3@changeid>
Mime-Version: 1.0
References: <20191019070254.23870-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
Subject: [PATCH v5 3/4] ASoC: dt-bindings: mt8183: add ec-codec
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org
Cc:     alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, enric.balletbo@collabora.com,
        bleung@google.com, gwendal@google.com, drinkcat@google.com,
        cychiang@google.com, dgreid@google.com, tzungbi@google.com,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add an optional property "ec-codec".  If specified, mt8183 could use the
"wake on voice" feature offered by EC codec.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8183-mt6358-ts3a227-max98357.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 17ff3892f439..decaa013a07e 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -6,12 +6,15 @@ Required properties:
 
 Optional properties:
 - mediatek,headset-codec: the phandles of ts3a227 codecs
+- mediatek,ec-codec: the phandle of EC codecs.
+                     See google,cros-ec-codec.txt for more details.
 
 Example:
 
 	sound {
 		compatible = "mediatek,mt8183_mt6358_ts3a227_max98357";
 		mediatek,headset-codec = <&ts3a227>;
+		mediatek,ec-codec = <&ec_codec>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.23.0.866.gb869b98d4c-goog

