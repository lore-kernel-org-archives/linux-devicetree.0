Return-Path: <SRS0=Wk4Z=ZO=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8B5C432C0
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 13:01:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C0032068E
	for <linux-devicetree@archiver.kernel.org>; Fri, 22 Nov 2019 13:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3iDSlAs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbfKVNBt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 22 Nov 2019 08:01:49 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44801 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727834AbfKVNBt (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 22 Nov 2019 08:01:49 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so4403744lfa.11
        for <devicetree@vger.kernel.org>; Fri, 22 Nov 2019 05:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dn2Q+lxc2hD365R8dpx/qDcvh0SW6iReRcimhdnvJVs=;
        b=T3iDSlAsyuLG+UJUCmoncxR1Bu/bnkXL+KTq5dtWsOPEk5RpZ8edNc98Onwl6slav+
         /6e8hX+pTkWaSIXGqEuy9X9rZyNwmY4TERtxiAfEDekog4Gkz38xdZQ0RSgGTrgjfXWm
         Owq4J8pZTVADQ/t5uY4imCraJJ2dIrTT2uwE0EY2E3x+Uro8T1zF0BkVxkc8pF0FsqBl
         y6GKP5K6axb8BQ38YAG8H8sPZiX4W7XuFOsvWqrZ1MviJOCm684lRjpNZpMzH8na0jOx
         wqdeYsaHigtxhdjowwJZrUBM8VUa8C/SZB2DM3PbahSmncXpmbcvjBgy4Xy+mo3eR0h4
         1WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dn2Q+lxc2hD365R8dpx/qDcvh0SW6iReRcimhdnvJVs=;
        b=KapqUYpJ9e40K6+84+kkLVSLbeiMIR/VXIUx+QfwUCpwUE9OH3JWkujZuPOe2Yg90E
         vSiMhLtitYD6GA/iVNKULuiPJL4U/NCfoKubr+xF/oopBLouGjGPBC3teLQ9XsgHbbo5
         WcVU0zls7BdwLg60A+cz0RYyzYQfIpMe6bkKY1asVxmIKENOWFpuzH5m3KwUDRoLSOTM
         5vOrc0bpvdGBPYaY6Oa0dzPm6yyRk0XF+apUcSk2RB5Ep4Ifsi6HdQQmll5z1rW9uqB+
         sbmKqIL347vrg/25Wr3rg6D/lI4LC9daqQWoHJ2yPkLAKipFfIIGFqAfzxvRa7LH7Fh6
         Pgeg==
X-Gm-Message-State: APjAAAUtOAerKSbLc0LSoqelBFHOvdOcrcjJHwZ8oAlMbWkbnntw4zXn
        PQLffHbF2e72PcwD314wn/sMCC0UpR4/GL5YgAFqFg==
X-Google-Smtp-Source: APXvYqzo/k0rIsJGGL399pE+GzotZ33QW/YQlNt/JpZVm7SU204RwrS3/eFE+xu+DFtDva5eWFhzGzqC/njjDmo3YqM=
X-Received: by 2002:ac2:4945:: with SMTP id o5mr11596350lfi.93.1574427707515;
 Fri, 22 Nov 2019 05:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20191122061839.24904-1-hui.song_1@nxp.com>
In-Reply-To: <20191122061839.24904-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Nov 2019 14:01:35 +0100
Message-ID: <CACRpkdYhLoGdGQt_jzj5aFa-EY_kMimoVShi7QFLG3sZbC436w@mail.gmail.com>
Subject: Re: [PATCH v1] gpio : mpc8xxx : ls1088a/ls1028a edge detection mode
 bug fixs.
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri, Nov 22, 2019 at 7:18 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> On these boards, the irq_set_type must point one valid function pointer
> that can correctly set both edge and falling edge.
>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>

Patch applied!

Yours,
Linus Walleij
