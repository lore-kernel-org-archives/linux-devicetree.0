Return-Path: <SRS0=mzwU=6O=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ADAC8300A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 10:09:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7438D2186A
	for <linux-devicetree@archiver.kernel.org>; Thu, 30 Apr 2020 10:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t49vxaG1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgD3KJh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 30 Apr 2020 06:09:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3KJh (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 30 Apr 2020 06:09:37 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 277A6C035495
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 03:09:37 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j2so6149316wrs.9
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2020 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=3HsF1h0CUb6ZIwcELngTnPN65Z4Ft11y60QYjfOQPSU=;
        b=t49vxaG1b7bhYqwwP1Xm0juuQ8u6cz2ywZMFDoUn58CPRGTL2h/Tk/zBjDHjVRLXVp
         jO2wMYW7Enn7qCu30n1KVwjb75wHPPJzFhof7n02PoCncR2G0XaTgo6q/7MMLEZ9ULM/
         UlrrIIDZTlYsetBI3M3kAw8OTK2TgPshgcB4rt4MwtzWF+xu4dbFQ2ZipdEO3jBGd6cm
         WyZg1ETxIpLVq8cOsi3QmfQwnKzAeAE5iuLXc9KHQ0x4/jhJ7vKGzQFV01eI6zl3pgap
         7vl5niDqPu9+txexT3qjlNcQGlPx2m5PaVOacNJiDbaNTUYtTk0jI4gmiqbtcs2iYer4
         kStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3HsF1h0CUb6ZIwcELngTnPN65Z4Ft11y60QYjfOQPSU=;
        b=hurlpwGGTgmIYEJT7NgTTuKe5/jXaRyAloVbv5T11BHo2Lngk78rMhZiPYhqJ7ys4S
         WjLfSC7GIkN8bNlk386iseFdVzWcdTiTNFme3u8N07Vs7OEd3Lg1IOctHAnsDMl7lBa5
         nvN08KITfTdK6FZmayU6Y3+J19JWHJBtuILVE3waTJmCeWuX7zKrnITQvutlNIbWSjw/
         ma880agZQGT5I5JGnYqQfTkaXgLpDuEGqLXr07a25FpehCLU8AoJpcbB3849sWlehdQF
         Lb5Cb5h3PWNaanjlajZE5z8zKE04+HxR7w78eQfVIOT/Xx8GC5pM+NfuThO72ir7jXE3
         563Q==
X-Gm-Message-State: AGi0PuanZ1wDDwUdmM3BFBqGGuVXf5ziDwQcLh4ST6fDTU5Cu9JAs+ww
        Ri8jrjinhKm1mkMabe26hg9ujA==
X-Google-Smtp-Source: APiQypJbuuShSqw4bzCv+LyaadxHKFAIJlNvA7pIqJkPxlKX/BmHox0nLe6xR2oR++6NgjMfaeXu3w==
X-Received: by 2002:a5d:438c:: with SMTP id i12mr3239337wrq.14.1588241375856;
        Thu, 30 Apr 2020 03:09:35 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id g186sm11889535wme.7.2020.04.30.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 03:09:35 -0700 (PDT)
Date:   Thu, 30 Apr 2020 11:09:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Dilip Kota <eswara.kota@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kishon@ti.com, vkoul@kernel.org,
        devicetree@vger.kernel.org, arnd@arndb.de, robh@kernel.org,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com,
        yixin.zhu@intel.com
Subject: Re: [PATCH v7 0/3] Add Intel ComboPhy driver
Message-ID: <20200430100933.GA298816@dell>
References: <cover.1588230494.git.eswara.kota@linux.intel.com>
 <20200430082503.GA3118@dell>
 <cbeeda50-1ac8-7b4e-2df5-94049b1cf6b9@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbeeda50-1ac8-7b4e-2df5-94049b1cf6b9@linux.intel.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, 30 Apr 2020, Dilip Kota wrote:

> 
> On 4/30/2020 4:25 PM, Lee Jones wrote:
> > On Thu, 30 Apr 2020, Dilip Kota wrote:
> > 
> > > This patch series adds Intel ComboPhy driver, respective yaml schemas
> > > 
> > > Changes on v7:
> > >    As per System control driver maintainer's inputs remove
> > >      fwnode_to_regmap() definition and use device_node_get_regmap()
> > > Changes on v6:
> > >    Rebase patches on the latest maintainer's branch
> > >    https://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git/?h=phy-for-5.7
> > > Dilip Kota (3):
> > >    dt-bindings: phy: Add PHY_TYPE_XPCS definition
> > >    dt-bindings: phy: Add YAML schemas for Intel ComboPhy
> > >    phy: intel: Add driver support for ComboPhy
> > > 
> > >   .../devicetree/bindings/phy/intel,combo-phy.yaml   | 101 ++++
> > >   drivers/phy/intel/Kconfig                          |  14 +
> > >   drivers/phy/intel/Makefile                         |   1 +
> > >   drivers/phy/intel/phy-intel-combo.c                | 627 +++++++++++++++++++++
> > >   include/dt-bindings/phy/phy.h                      |   1 +
> > Why have you sent this to me?

> The main reason for this patch series is removing fwnode_to_regmap() and
> using device_node_get_regmap() compared to previous patch series.
> This has been done as per your review comments.

I see.  Yes, dropping fwnode_to_regmap() was the right thing to do.

> To keep you updated that changes are done as per your review comments, sent
> to you along with PHY maintainers.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
