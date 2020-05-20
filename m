Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29BD4C433DF
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 00:07:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08FBD20823
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 00:07:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Un58eWjK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgETAHv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 May 2020 20:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbgETAHv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 May 2020 20:07:51 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8CFC061A0F
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 17:07:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s69so424916pjb.4
        for <devicetree@vger.kernel.org>; Tue, 19 May 2020 17:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7E+96xLWXR0/8hTuHXZFZz8+gdr1UiuXEJRZqhXw6X8=;
        b=Un58eWjKctefrHRqJ7dvLIb7h0CPEt1iuXzxR4n6qCP42XpGpHDwdTrRBb8PUXaAQg
         RhZKNOwt+EIDA2KgD0SaK8LdZNQoP5sJrMbj7Y7Zq0E0V78tPE0/lRWWYF5QX2c2bikH
         1FIhVCjJGAAbPHuYgUelWXSgf4gKjJSGu3XBaBBsjuZi0BuZ9qdywxDNVGK/AYtr/hOH
         uy9nwtgdpyyFM+uk1CRZCJEn59m+0tfqRpdHwerg5gK1G/Vb+oSrlru5xR86WxFzNat7
         XgZ9n1GZAEuOty9dXFkbRVOcYUXb492Fyay+gUFKaQytL0zjwZ3/Wdd+PczxxDQ/0jjL
         5yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7E+96xLWXR0/8hTuHXZFZz8+gdr1UiuXEJRZqhXw6X8=;
        b=NGM2XSzEBpgLSVEQC/McC18tiRm4tIldNiJZnQXcP5agQlGit2lDrokEB1P4MUWiHw
         UZxR5X84Kpz/WUqd4GcNclT5rJxDszGXqrEK+A5c97ji/PaSEKXI7BpOJ5+TEUX77eIT
         cl1mF9z5jJAX/HcfSgjXUt8Gp5xQze3Rk04RjXo/YZSjN0MCvvty9HXymZlYnNa45XqM
         CknDPv9fKrg7Z4ER1XG6VvdDYvGGkLnXRXbCEOCwKFry7QPrXbhAF6LBowo7ih9FeGCg
         JYe0GWn0n0vnwFXSQOoGtD5oSCZEY2Wj2j0gwWM1FqKmmRKnONMbvgRQuLnVvyxUPqYt
         rSSw==
X-Gm-Message-State: AOAM530PDHoKUM2fJH5qJjHJui43ycTGlyzO1ZC3xLP9PJQT9Hd7oGDg
        4taYAUUgdDcBMC9vRSfX0+q7HA==
X-Google-Smtp-Source: ABdhPJwJXapV3XSyLdWBlyJa/j1Qrxy4J3disNJEFzP9hMGHSRWKAhJBD6HgUG+V+BJQnf+U8c014w==
X-Received: by 2002:a17:90a:2a03:: with SMTP id i3mr2158657pjd.29.1589933270413;
        Tue, 19 May 2020 17:07:50 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id y13sm501497pfq.107.2020.05.19.17.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 17:07:49 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v8 0/3] arm64: dts: meson: add dts/bindings for SmartLabs SML-5442TW
Date:   Tue, 19 May 2020 17:07:44 -0700
Message-Id: <158993320300.34448.2467899478322210990.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
References: <20200510124129.31575-1-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun, 10 May 2020 12:41:26 +0000, Christian Hewitt wrote:
> This series adds new bindings and a device-tree file for the Smartlabs
> SML-5442TW set-top box which is based on the P231 reference design.
> 
> As requested, I have reworked the device-tree on the p23x-q20x dtsi. I
> have also re-added the BT device with new bindings that have now  been
> merged in bluetooth-next for inclusion in Linux 5.8. See [1].
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: add vendor prefix for Smartlabs LLC
      commit: bc15895e142396fed5ebf1f60139d9ca9a56a4e4
[2/3] dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
      commit: 341e85047bdbc0196c91ccb4612ffab87bae9cfe
[3/3] arm64: dts: meson: add support for the Smartlabs SML-5442TW
      commit: 1d6ece87b750cf26fed4eb794ea0b2fc7ff2be10

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>
