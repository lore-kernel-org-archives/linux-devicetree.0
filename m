Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC82C35247
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:21:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 62FD921741
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+Lea2T1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727532AbgBETVv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 14:21:51 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:36742 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgBETVu (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 14:21:50 -0500
Received: by mail-vk1-f195.google.com with SMTP id i4so895691vkc.3
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
        b=d+Lea2T1FikkJSXKbyM1VkmMu7+6OK51opstzFjKZqfVTWGc0HJyavyLb+VPLonbdH
         XamEHLtjdwui0xj8WnEoC7whi/BeT3DvPVSnA1XJbAN0mMEripODaa76GX6Q5KujvPEs
         uxYN8bYLDYx5xjHsKtyyQHKN8OKwwXdxQ/T74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iKWhr/qeopXFJ+ock8a5scgNwm8h5rGNiI2lQhosRco=;
        b=IPYmCZRsZxNVp34Vh28DT6jo1WDMMdumUTpJsXIeFzS/I26wcylO9GcuRmUcAbEZrW
         58DDSGbsukTEvE/w79Y2r9vkiW/sUGak558t8Ub5DWc386Ip0/GINUqh1Eme+zNjDmZh
         ThdWFJE6x0PvKfoiwYnxLU8MEEUvxE4OoTw76UZumi4JoN0fG5TkAyfGYUrKcPkwAVlv
         YvCd4SAbhK4IJNgS6IqzCITi0wrzU0VAL+mkVn4PN5gO0E0JUb86inUayCY9yQBFU4QC
         fKkSFBXHmHyowrOhQA4CXJX3D5MF4hdaFdB+KUR+0dkwLON3BrczcuaE/Qhc3jNN78kV
         0yZQ==
X-Gm-Message-State: APjAAAUkDert8+HRw31+BZUpxWapcAdpOzF5J9L9wW+I1UotLmVh0A2q
        vmjRgzbZTXTORVSLpJHRZABDS/SJuA8=
X-Google-Smtp-Source: APXvYqzpUQw5wCp+ksATC2StFVRzHW+u1JO4rGFPEt8OfqsUdfpn8Kz1uA43DX3Nt1YqluuHvzRCZg==
X-Received: by 2002:a1f:7d43:: with SMTP id y64mr2674516vkc.15.1580930507033;
        Wed, 05 Feb 2020 11:21:47 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id d8sm180970uan.13.2020.02.05.11.21.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:21:46 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id x18so2120097vsq.4
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:21:46 -0800 (PST)
X-Received: by 2002:a67:fbcb:: with SMTP id o11mr22314847vsr.109.1580930506045;
 Wed, 05 Feb 2020 11:21:46 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-2-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:21:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Message-ID: <CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:01 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> From: Taniya Das <tdas@codeaurora.org>
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>

Since you are re-posting Taniya's patch you need to add your own
Signed-off-by as per kernel policy.

Other than the SoB issue:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
