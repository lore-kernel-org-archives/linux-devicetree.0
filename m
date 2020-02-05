Return-Path: <SRS0=uboK=3Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF76C352A2
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E879C20720
	for <linux-devicetree@archiver.kernel.org>; Wed,  5 Feb 2020 19:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IrCdKZxl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgBETYy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 5 Feb 2020 14:24:54 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:44415 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgBETYy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 5 Feb 2020 14:24:54 -0500
Received: by mail-vs1-f65.google.com with SMTP id p6so2097418vsj.11
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
        b=IrCdKZxlk9MGjOVLL8nvg7LIAvfP0+eaAMZGI14LPfO2Xsvm/Oni8/zwNx3GyuHFVk
         xSLsRYvA/h9GJOGwHl3TB+be2gSu88KN9DX+j1QFvvlPQfCSgm7+m++IUH5+Awt0SV1x
         kg/476pbpukR7JOK7GsTJOiWYUwIcxVk69Ivs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mAJctpXOp7118HERLXET2DrllCvao5vObxu/nw3+/Cg=;
        b=cuiVdkfX50uc0HOGHXPQF+pdgAOrHgym/QX7thbi5P3oMNp7ZNPTsSJEqpY1fiZKta
         OPwopZJF5gBv66S2NYZObADIl9nmHcvkQcFOoS4X1RPmyjNGQgmTuyMYEBJeQk37ocZa
         YXw6/CkzyPiyWdGmOEW+woyIYyVnd3zv0dUEVy+1urCuhJu8U5j08sLSJIFvE5ukeRiU
         tvuaeBsEjFxHb2zsLM6XY553XHieFNs4/GTAI6KdJXw8QHKjodZe3EUGs2505yx2MtTT
         /1PoPriEcxKhbOZ632w+eHB5Ef4qswfCld2qvn0G1sz3pRYg7HVMXTNwzZaUHzzIOiT0
         a6Iw==
X-Gm-Message-State: APjAAAXGuv5YCE6gjzuynRO0AYk61NGY3xj62AypcIuaefs6qiZY1FUB
        o3q+vLqTMhR4IGeVqtIsKJdsQcCcS/Y=
X-Google-Smtp-Source: APXvYqwLqEVVABRm5bytlfq+RCqYfxa640RE6s/+7PBLCc1azCuH9UY/Tm/4dbkdq3H8sYUogZEd5g==
X-Received: by 2002:a67:fc8c:: with SMTP id x12mr21593569vsp.96.1580930693363;
        Wed, 05 Feb 2020 11:24:53 -0800 (PST)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id j26sm172113ual.7.2020.02.05.11.24.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 11:24:52 -0800 (PST)
Received: by mail-vk1-f171.google.com with SMTP id p191so890862vkf.8
        for <devicetree@vger.kernel.org>; Wed, 05 Feb 2020 11:24:52 -0800 (PST)
X-Received: by 2002:a1f:c686:: with SMTP id w128mr2748451vkf.34.1580930691696;
 Wed, 05 Feb 2020 11:24:51 -0800 (PST)
MIME-Version: 1.0
References: <1580886097-6312-1-git-send-email-smasetty@codeaurora.org> <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1580886097-6312-4-git-send-email-smasetty@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 5 Feb 2020 11:24:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Message-ID: <CAD=FV=Ux9XjUQMy4zzaz9JxZzyuZJvNB_W9ANzE140W_pDmixA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:02 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> +                       power-domains = <&gpucc CX_GDSC>, <&gpucc GX_GDSC>;

I should note that this is going to be a PITA to land because the
patch adding "GX_GDSC" should technically land in the "clk" tree.
Without extra work that's going to mean waiting for a full Linux
release before Bjorn and Andy can land.  It might be worth sticking
the hardcoded "1" in for now instead of "GX_GDSC".  That's what we
often do in cases like this.

-Doug
