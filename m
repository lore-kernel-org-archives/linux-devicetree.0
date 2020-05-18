Return-Path: <SRS0=92uP=7A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C988FC433E1
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F7B820671
	for <linux-devicetree@archiver.kernel.org>; Mon, 18 May 2020 07:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmO/e8bH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERHUq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 18 May 2020 03:20:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726127AbgERHUq (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 18 May 2020 03:20:46 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FC0C061A0C
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:20:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id x27so6971589lfg.9
        for <devicetree@vger.kernel.org>; Mon, 18 May 2020 00:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=srjDyr9S0oB/6VDYDy70mCau/zVOnj84hKg9e/vKVUc=;
        b=UmO/e8bHlXbOw6t5litf5UhEV90GLZNKTvruCwSC9H28yYSU/xOoYiclTIFgm3pdnO
         G2mJQ3KyMOKPyxPHdDN0tPhEj22mLv03EN6NEHH+nuquSeVze0Ec3cxhipC/zAyQBbvi
         fNOIkvZANckbPP2uhRAYt7O9BSVI/SbbzeYgycvK4gtnAV+iC6Q0nzy96a5/JGg8E/Ve
         /rtn1LovXJiq6BnEV32NdI6aqSsAOskxgHGNSwF3BdMJLlsPqH2SZfaJ8TJ+2e9pNE7R
         ts0J69gQDaEeKH3Q/j7cgPk+y8d2ApLd5urmJ+WiPGV+0UM70Twzx0MwclzzJc0DIJch
         Hycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=srjDyr9S0oB/6VDYDy70mCau/zVOnj84hKg9e/vKVUc=;
        b=c6WbIm5Ar1PhNnh9YfSK1OGACk+UDdwAfcfl6jcsf5JNIFHHc4xcQSH4zdjavUxmfv
         NTlX+d3ovX2jIXGuuyph+ZI99YdVPHAqZ2X6oaxdkAid0RK0vcVtJIf8zQ9kmWl5SYaT
         T/fyvw/x+nPds9SdxOeQn4Qxbtcd6yBx0/qZbNqJiHuGgYfxXLpC8BB0BtUuBZN4fKS0
         v5DkZGIQ9rGWzoSUFA9RJT2mltUyE96NSBRutnbnCiPH25IAMx0ea9gqeSX1WMFw9LXd
         gb1/AsEqykvZ1+muOJ1qzFNgAwiKr9a3A5QjFLeMVOWZqD7htpmSxHD7igtSmnkPegVB
         20eg==
X-Gm-Message-State: AOAM532Dm06gij+IRzs33+3UrYdZX2gKWIFtcz8Wo8zgVOkgDQAeMHQq
        G5JvWrKVsEuayO7QcBCdthMp6EyXHdwm9MuVjG7B0Bj8
X-Google-Smtp-Source: ABdhPJzRfqaofRPumXvphn7M6BnSMfYofnElhrI84EAZ3W5otCYBNBiXOugxiFN46j+QphGtW23HA+cXFzEqTcDNw+s=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr10546757lft.194.1589786443287;
 Mon, 18 May 2020 00:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200512203524.7317-1-jbx6244@gmail.com> <20200512203524.7317-2-jbx6244@gmail.com>
In-Reply-To: <20200512203524.7317-2-jbx6244@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 May 2020 09:20:32 +0200
Message-ID: <CACRpkdYrDHNp7esSYw9y7CQoZ1aZojWkhAU_MG4uvmk7nVJbOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: rockchip: update example
To:     Johan Jonker <jbx6244@gmail.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue, May 12, 2020 at 10:35 PM Johan Jonker <jbx6244@gmail.com> wrote:

> The Rockchip dtsi and dts files have been bulk-converted for the
> remaining raw gpio numbers into their descriptive counterparts and
> also got rid of the unhelpful RK_FUNC_x -> x and RK_GPIOx -> x
> mappings, so update the example as well.
>
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

This patch applied to the pinctrl tree.

Yours,
Linus Walleij
