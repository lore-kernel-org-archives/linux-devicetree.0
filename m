Return-Path: <SRS0=Nmyu=5B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1701BC0044D
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE08E20658
	for <linux-devicetree@archiver.kernel.org>; Mon, 16 Mar 2020 16:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qG8PxbkW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731875AbgCPQXa (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 16 Mar 2020 12:23:30 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45125 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731864AbgCPQXa (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 16 Mar 2020 12:23:30 -0400
Received: by mail-pg1-f194.google.com with SMTP id m15so10019476pgv.12
        for <devicetree@vger.kernel.org>; Mon, 16 Mar 2020 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ys4/S0tvAwTvTJf5RJkfy3c1yIHeW683iadOwgFcprg=;
        b=qG8PxbkWIbuy+9Qc3nMWdGGFXM1kqFsA1skjDvOKTMf7Up6HmyD9CPoLqXI2V5kpGy
         I3/5lAZuyWRnwHN+FhV5f5pIjwjRtEQu9DsII6msx1ddPDIDv9X0cKWTe9aJLO3mNoEQ
         Lp6vlkuNNWB34rdnv0HyMxwNgoAiDQ6c8379u6fb02bIYFNIZULMiWV6XpiyHOLKYFJ9
         vwIb4GVU28gTAhiuFIkXkFpODnnGuGFJvf9+cJ2D5Q8ZHYlpkhI7qXD8UA3N5+OZ1WME
         akPHRRVPOdQPPuqm1eOiYZfaR/KWrASRxj6StEwYQXgUOEAAJ0olraavqiILAmFiGikz
         iHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=ys4/S0tvAwTvTJf5RJkfy3c1yIHeW683iadOwgFcprg=;
        b=SkTFOWfdX8dTlyKS1PGBAfNT7D9JyWEpB47yB0tUaIFW+uiR5SHoGjbPkpS8eRJy0z
         /JN2RklWBGYToengCfvf/zRhkwCvjAZ0CTd2xWVma2t1LM+Tst+pNlbh4fr86+yG/3Y2
         mfNyb1nf+Xdihmn2A0VEGdHp2q12IPkUiF5wB2tJM7VXSgTfUnVss7J2+AglBjzZIB36
         8F+qFC6ycRo2JhWucYVtXWmmQPeT8qj3x12tiu9OmJHlHZJYgwMLnWqdAayS9RX2TIe9
         ZH/WmNMmxh4MZU4LRG73zY+SeQXi4AajoDNocIGB0mmxbGClQHZUaJpXAuzmNbsXKNap
         3+vg==
X-Gm-Message-State: ANhLgQ38tvep/+egPD50DyY4FG/4VJNsmB2h6ebYxJNpy3l+fZ5rtRAG
        7IFVhbfeliF0zhtdQMJyxYKEfBJIVC4=
X-Google-Smtp-Source: ADFU+vvIkI5Q4X0j5d7XavYPHjHZylGz9Mto6CG3F5sDaCzyi5q3jYipZTJ9iAg6VhbrUPWCeuQi7w==
X-Received: by 2002:a63:67c5:: with SMTP id b188mr605662pgc.111.1584375808216;
        Mon, 16 Mar 2020 09:23:28 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:dcc4:2a10:1b38:3edc])
        by smtp.gmail.com with ESMTPSA id q91sm313466pjb.11.2020.03.16.09.23.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 09:23:27 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        "Victor Wan" <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
Subject: Re: [PATCH v9 3/3] arm64: dts: meson: a1: Enable USB2 PHY and DWC3 controller
In-Reply-To: <1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com>
References: <1581990859-135234-1-git-send-email-hanjie.lin@amlogic.com> <1581990859-135234-4-git-send-email-hanjie.lin@amlogic.com>
Date:   Mon, 16 Mar 2020 09:23:26 -0700
Message-ID: <7hd09cw9oh.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Hanjie,

Hanjie Lin <hanjie.lin@amlogic.com> writes:

> Enable USB2 PHY and DWC3 controller for Meson A1 SoC.
>
> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 43 +++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 6fdc0dd..3b7ca50 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -6,6 +6,9 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/meson-a1-power.h>
> +#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +#include <dt-bindings/clock/a1-clkc.h>

The driver is now merged, but the DT cannot be merged because it has
dependencies on the A1 clock series which is still under review.

When that is merged, please resend this patch.

Thanks,

Kevin
