Return-Path: <SRS0=OHRJ=ZN=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FC4C432C0
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 13:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49EB02070A
	for <linux-devicetree@archiver.kernel.org>; Thu, 21 Nov 2019 13:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VIOo/Pij"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfKUNrv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 21 Nov 2019 08:47:51 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40062 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKUNru (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 21 Nov 2019 08:47:50 -0500
Received: by mail-lf1-f67.google.com with SMTP id v24so2686298lfi.7
        for <devicetree@vger.kernel.org>; Thu, 21 Nov 2019 05:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=caR6qyLZA2YX7N7il9mca3/oNrJ97AvufKAxX/7X/t8=;
        b=VIOo/PijKlmTSU7k0uUlEiwuwGggZG8iMvFBgbHGqH3hmFkbc7hcNTpuA2Yt6Cn4Ad
         /lfSamtVILY6w7FdAeX0LJi3VKe0umgThLTkOJhBUEMxgI7AgmPV61OKo+0mS//DXmCh
         u9UnjJeDzQhddnd97dgJpVt9Z0YM7OEqiF7miH5p/LiPTrOS/czCCvaH/F1Y4NsmWsCq
         GpIg4Y0/44ndROWiiTsCfDKF2VAYDV248vAzZ3GJ3DIzDQo/H1DXLF8JYL/pE/UsjdZD
         VXfiOSZRONiaBM5yymz7ZzHrtf1sN3F1W+SpvLbJWMqPG565b9wKefLTwAM2HuZAuqpB
         jeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=caR6qyLZA2YX7N7il9mca3/oNrJ97AvufKAxX/7X/t8=;
        b=fEQ/nKuGxudHxdUnjVHsv03WqaIciwzv8Se9gl+FqJBp9Nl4F+xM1LlarJVsnCXQf/
         Y36LuLY4UdekAAc0NZfbNx/ujQYlMLIO3OXcuR8OmcM+hiyL1oB9Nly9Ga+dttdBk3pc
         iQNfST5SL/YxSCS65nkC+AqRWmsuUcV1BKd57peAur/YJS5pcyDcTDvwUvIcmDkE3X5c
         RClnlN24IvQjSeZpBt5BijB7zKJ2VyIXvd8IrK0NQKCGcFOxT0hnlFqss2qWAVT0PJ7J
         11j2iYyYepK1hCKml++lcByp5OPiXZJFHzeKbq34qom7W62Y0ILWBaGG1zTwVgBok2M5
         skSg==
X-Gm-Message-State: APjAAAUyNwLFL/x6s8VSkLeQ5iARieLjIz2faQIXVjDbsjzAFQZL4Zdg
        BWTp1bcSCDgXeN+LT3XkMHGb0QaBGEEaowWJ9E/z/Q==
X-Google-Smtp-Source: APXvYqwmI6/VvWRaqBNjK+cmiCSG+6Hkt0rYjH/6YkTQW3OXM2cQ1jv6rZofTokHslVnUliyq+XhtrmS88hodfLf9eU=
X-Received: by 2002:ac2:5b86:: with SMTP id o6mr7754208lfn.44.1574344067468;
 Thu, 21 Nov 2019 05:47:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1573797249.git.rahul.tanwar@linux.intel.com> <33e649758b70490f01724a887c490d5008c7656d.1573797249.git.rahul.tanwar@linux.intel.com>
In-Reply-To: <33e649758b70490f01724a887c490d5008c7656d.1573797249.git.rahul.tanwar@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Nov 2019 14:47:36 +0100
Message-ID: <CACRpkdaoiYvcMVCyJJTSyvSZUMAj6QsCcGG3=s4or31r08=hdg@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] pinctrl: Add pinmux & GPIO controller driver for a
 new SoC
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Andriy Shevchenko <andriy.shevchenko@intel.com>,
        qi-ming.wu@intel.com, yixin.zhu@linux.intel.com,
        cheol.yong.kim@intel.com
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi Rahul,

On Fri, Nov 15, 2019 at 10:25 AM Rahul Tanwar
<rahul.tanwar@linux.intel.com> wrote:

> Intel Lightning Mountain SoC has a pinmux controller & GPIO controller IP which
> controls pin multiplexing & configuration including GPIO functions selection &
> GPIO attributes configuration.
>
> This IP is not based on & does not have anything in common with Chassis
> specification. The pinctrl drivers under pinctrl/intel/* are all based upon
> Chassis spec compliant pinctrl IPs. So this driver doesn't fit & can not use
> pinctrl framework under pinctrl/intel/* and it requires a separate new driver.
>
> Add a new GPIO & pin control framework based driver for this IP.
>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>

Thanks a lot for quick iterations and hard work on getting this
driver in such a nice shape in such a short time!

Patch applied for kernel v5.5.

If there are any remaining issues I am sure we can fix them up
in-tree.

Yours,
Linus Walleij
