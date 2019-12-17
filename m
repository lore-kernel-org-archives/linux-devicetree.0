Return-Path: <SRS0=r3bb=2H=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBB1C3F68F
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 22:36:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E5C162465E
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Dec 2019 22:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hpI+f7SS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbfLQWgG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Dec 2019 17:36:06 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39459 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfLQWgG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Dec 2019 17:36:06 -0500
Received: by mail-pf1-f194.google.com with SMTP id q10so34450pfs.6
        for <devicetree@vger.kernel.org>; Tue, 17 Dec 2019 14:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yUR3VGXqcEyFpDj03ashPmu0D0HK7H7Djn3POx5wsk8=;
        b=hpI+f7SS3jE6F9WghLjeR6FFfhRaI/Dl0bjq4N1UHVAwzEa0E+35JRO9yCK2LtqHDE
         8XBHKDEf33L2oT3cbE+2OoqgsEUn+kmBgb4ORJqXy8USwnbqd97H9gayACgUHc4qMMqL
         XIxJX9Y7YV0LYpNPa7HtcL7PvCgjumxAhTcmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yUR3VGXqcEyFpDj03ashPmu0D0HK7H7Djn3POx5wsk8=;
        b=WlWjuRQN6Sk17R37q9N73l/w+TiD91M91vM751tyvu5Vn/SBM1lEHQWkK83Kf49wIK
         Z2bntJmXtkaWYiGyY5e1baVa66ostcU75/BFa4PKIrsfB22bbKgdwuYoenTnfSzPjCZ/
         KMVMLwCERNecRuhOX8FfVZNKpTgfaZhJBgt8D4X+AYSLq92dJ3GPwU8s/anA+b4DMtWl
         el56EpRbtm5S8hnw2VCPsaeMLF7gE0Kk/6qYhtV/0UzDGDdTTvGywoDHbTjiIJ0m5shp
         FV9il37EZG/++BsegRuUgz8JtCLn0Lpx/IzvCzT1qQjYHt4TbMFOQXK02U0EHu2xeDFj
         iXVQ==
X-Gm-Message-State: APjAAAWbyhJHsIJHamUhvu/xVdU6nzL/iEs+b0KZxxP2citKSkg8FIby
        x4I5rrlipZnCeNQ+qa8L5kFXfA==
X-Google-Smtp-Source: APXvYqyse3yodh4Y8GBmMY60C4nZ1Ex8BE7BiinQNGmJIpqd+FR49bz6zBoTrFGG9uLrMKjtWT07ag==
X-Received: by 2002:a63:1908:: with SMTP id z8mr28108344pgl.350.1576622165581;
        Tue, 17 Dec 2019 14:36:05 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 189sm35588pfw.73.2019.12.17.14.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 14:36:05 -0800 (PST)
Date:   Tue, 17 Dec 2019 14:36:03 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linus.walleij@linaro.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix I2C/UART numbers 2, 4, 7,
 and 9
Message-ID: <20191217223603.GX228856@google.com>
References: <20191217130352.1.Id8562de45e8441cac34699047e25e7424281e9d4@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191217130352.1.Id8562de45e8441cac34699047e25e7424281e9d4@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, Dec 17, 2019 at 01:04:07PM -0800, Douglas Anderson wrote:
> Commit f4a73f5e2633 ("pinctrl: qcom: sc7180: Add new qup functions")
> has landed which means that we absolutely need to use the proper names
> for the pinmuxing for I2C/UART numbers 2, 4, 7, and 9.  Let's do it.
> 
> For reference:
> - If you get only one of this commit and the pinctrl commit then none
>   of I2C/UART 2, 4, 7, and 9 will work.
> - If you get neither of these commits then I2C 2, 4, 7, and 9 will
>   work but not UART.
> 
> ...but despite the above it should be fine for this commit to land in
> the Qualcomm tree because sc7180.dtsi only exists there (it hasn't
> made it to mainline).
> 
> Fixes: ba3fc6496366 ("arm64: dts: sc7180: Add qupv3_0 and qupv3_1")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
