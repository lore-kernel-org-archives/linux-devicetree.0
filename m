Return-Path: <SRS0=Tykm=BJ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1AF3C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 11:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5A4620829
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Jul 2020 11:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mm45+XM1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgG3L53 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Jul 2020 07:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgG3L52 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 30 Jul 2020 07:57:28 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC6C061794
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 04:57:28 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id r4so21665495wrx.9
        for <devicetree@vger.kernel.org>; Thu, 30 Jul 2020 04:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Lk0vtaJ/HwDFlBgWWnoYso6B2Zcq+TTu5FHszftlqR0=;
        b=Mm45+XM1hEHj6wncZG4txKaVupTlTcQ/HnbDx+C3/9sBFXsM6SU/fwzotTVN5kUqTr
         VuOeSA+vXJuv8DV3H/p6koTsuRI/xKIJEdc9KTYBfotxpOeYwt/VmezgagcQ/HuVWoWd
         GtqUMCnOEsbzePC0ATALEq5DCKoBz8u1rob0Yc01ZvRf6TkgS4qmxzOshPHSBlaf37+T
         Y9gxLmwwG96YSzVoDwczXKH2McYjZowQAAb6J+Z9JA+8o7LpdnIlG/zdJxHUf5tjtzPm
         mVnfy39Y8/COKt6Woqsmm6EKiiAicHRpyMEFNZOuNMYOkNWMcrruFOEzUqWPN/pOLsQ3
         oDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Lk0vtaJ/HwDFlBgWWnoYso6B2Zcq+TTu5FHszftlqR0=;
        b=DanL/SF+wfekwXpM5srLyduFahH6eQLGKE/As/0tRWHXTuQTiAAz9YvqVHCkUZpuFm
         VkoX8RgQqF8B+GQVFn/zmXeQCIKdpS5rdYLTiHNaM9VQHnYRnR2D0ZcThg6Dh0uJIZRR
         oPlT8Cs3T9EchI9YEoGlOyMIMtRXhqOuC+C3qnhtWIoWG3iG4Qn5645SlxxxPN+0KZLY
         CdKGbtLwhsGq4uFo49MOWLNYWDFLX5WFbcpyzYxJxcA4SLfuoRkAgJyomBncn3tje0xC
         T2Po/+yWEPMcoI+j+QOD8Pc8NkCUUQOmhb0gLk9mg22xSA2XgVitbJxDKdewwoW8PSTO
         Nv6w==
X-Gm-Message-State: AOAM531YhPne6/2q2l5yc24HPxNYE0K5fyRarNI5FoupdcVmikoYZton
        m5Dt8REpeYr46fz8pYm8eZ9OPw==
X-Google-Smtp-Source: ABdhPJyJLQpjqs5e+nauT4xj/WRjIxKQlhAAydhv+/Ol5/5Ev4HmBpRX0WlricV0ioMnQDKza1LyhA==
X-Received: by 2002:adf:fe05:: with SMTP id n5mr26970112wrr.237.1596110247192;
        Thu, 30 Jul 2020 04:57:27 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s19sm11185960wrb.54.2020.07.30.04.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 04:57:26 -0700 (PDT)
References: <20200730100209.793-1-linux.amoon@gmail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
In-reply-to: <20200730100209.793-1-linux.amoon@gmail.com>
Date:   Thu, 30 Jul 2020 13:57:25 +0200
Message-ID: <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org


On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:

> These patch fix the Ethernet issue on Odroid C2 & Odroid N2 
> Some time Ethernet interface come up but no DHCP request
> is forwaded to the Router, this happens quite offern on
> my side. Adding Reset controller to ethernet node FIx the
> inilization issue.
>

I'm seeing this on other device as well. Strange that it pops up only
now. Change tested on S905x, seems to help.

> -Anand
>
> Anand Moon (3):
>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID

None of the patches apply, please rebase on kevin's dt64 branch.

With that, you can add

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

>
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 ++
>  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 3 +++
>  3 files changed, 7 insertions(+)

