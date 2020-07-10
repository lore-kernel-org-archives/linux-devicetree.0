Return-Path: <SRS0=VTvW=AV=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF24C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D6E62076A
	for <linux-devicetree@archiver.kernel.org>; Fri, 10 Jul 2020 05:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="maYPiFAt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgGJF3J (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 10 Jul 2020 01:29:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbgGJFZa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 10 Jul 2020 01:25:30 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121FBC08E806
        for <devicetree@vger.kernel.org>; Thu,  9 Jul 2020 22:25:30 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id p22so5785593ybg.21
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2020 22:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1jgnVvQzDsXT/ABFTj8+H2Are3uSraKIFsDEibLg2UM=;
        b=maYPiFAtUWbNvEVYCQbJ0xZgO544WdZF+qGkUgj5D0CAMiaMnNp8ukl9f8ziqkaRRX
         KxTO6PQouhv2cl/ipll0JDu2CYJbji4IsHatUzHX2N/ItDIeXvIEI2xtW1o8PRkGKzST
         naAk9HBTvAJQ0in2CLfoZAUmIkU5/Qh+Lu8IcXa58hMs5+23Fi6ea37BaVVmz001xdFJ
         KhZWDWjgMq8LsZnOor8E7vgSSv6YZhe5HGrOjj+07qN6uCGaytnHvMH9xBsLK0zCjrFC
         B3b8PkJqDFt7ZAu2/j1m911rsgdHlgimf4GL1eoKvVtkm9IAMa/pnVxnzI9AmXheYIYp
         KYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1jgnVvQzDsXT/ABFTj8+H2Are3uSraKIFsDEibLg2UM=;
        b=VXd+nzA6KVJNwEU76WWjJVrQerXQd5LOxI+fmUdoRn4himun0V306nXjAbYn5h1hfy
         NxUTBJl6r9p2b8n7udbyk8KYnVii4s5YNQ7TwZcD+KlSUzDDu60RMdK4laKDwJqfFvHz
         LQACtXmgU8rcq55Mdjf5s2qNpKivRlHSPZquCZQFG9MmwwZgcu1dH8IDjRv4FZMdEd21
         MMWdxoov+zo6y3yvP5O22jCYIpM8gSFdfLrXd5Qjy/Qs4JrPGBezL1xPiAimN7gocY20
         hEiV3zHuWH8eOBv+nJB7SZTEcQM4sHOSKCHvocmplCY8Gf2QZaRu3XnhRXu+mOCRYa9x
         T25A==
X-Gm-Message-State: AOAM531sWtm4xqKDhcqJseuQVnvH7tThMGo5/YHY++Gk4Orw/Gd57Vxp
        +AG3FkLAXSaWPf3Z0xX37Ehar+U7cEh0
X-Google-Smtp-Source: ABdhPJyx/h8lcECiwFUQlr3JTA9UJv+40MDFq2/PvWa59T/tFgBoeQhHHSGd7vysVm70fuwLFQLRvZcyhcUi
X-Received: by 2002:a25:e481:: with SMTP id b123mr98012144ybh.126.1594358729312;
 Thu, 09 Jul 2020 22:25:29 -0700 (PDT)
Date:   Fri, 10 Jul 2020 13:25:03 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 4/6] ASoC: dt-bindings: mt8183-da7219: add a property "mediatek,hdmi-codec"
From:   Tzung-Bi Shih <tzungbi@google.com>
To:     broonie@kernel.org, robh+dt@kernel.org
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        tzungbi@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Adds an optional property "mediatek,hdmi-codec".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-da7219-max98357.txt      | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
index f7f3b83da630..6787ce8789dd 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-da7219-max98357.txt
@@ -6,11 +6,15 @@ Required properties:
 - mediatek,headset-codec: the phandles of da7219 codecs
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
+Optional properties:
+- mediatek,hdmi-codec: the phandles of HDMI codec
+
 Example:
 
 	sound {
 		compatible = "mediatek,mt8183_da7219_max98357";
 		mediatek,headset-codec = <&da7219>;
+		mediatek,hdmi-codec = <&it6505dptx>;
 		mediatek,platform = <&afe>;
 	};
 
-- 
2.27.0.383.g050319c2ae-goog

