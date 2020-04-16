Return-Path: <SRS0=e4CZ=6A=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DD8C2BA2B
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 06:28:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D95A220857
	for <linux-devicetree@archiver.kernel.org>; Thu, 16 Apr 2020 06:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eZKdezR3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407996AbgDPG16 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 16 Apr 2020 02:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408025AbgDPG1m (ORCPT
        <rfc822;devicetree@vger.kernel.org>);
        Thu, 16 Apr 2020 02:27:42 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B2CC061A10
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 23:27:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d27so3464433wra.1
        for <devicetree@vger.kernel.org>; Wed, 15 Apr 2020 23:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=NphQLflFsc739n86OFq/OswVHPenGwS7GRnWjxbOy0k=;
        b=eZKdezR3g6Xn2sdj18nb6poilwEQvi0XhzT3b84gdka8hFqI84MwkeiMqYFtXmwQ2N
         IjiOjaeozalApJF1io3zj9hOAHdZ4Rvhfq9TYzogQzPOca1M8KYnL3h5TsfBjs5qSzzF
         Y8kO/oNwyK3ANIMUQ8KyetYw4guYdLLceHgUfaUsddQ5iFk1UkNmJkO8SV+TpdJMCKSJ
         FDr0Ckin+v6eFoPcEWdhkXBE3AbeMZ4HiGdpF+H75U7M8mPyaTQOvMs9jS6W17Xoy+Bw
         cDbD7pkdj26e9VODe+TlMR3xTHdtq5Mz/7nY/KEDvg7JZuX/BWY4lcoxBTTVSgQ1I+hT
         5EoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=NphQLflFsc739n86OFq/OswVHPenGwS7GRnWjxbOy0k=;
        b=qdhm5vrkWDX46zNolgcHTX6TuFZch91QUexicxc6ghKqfGvvrQUYH0xp9dmcKyYa18
         BRtLSuKf/BSyEnZDa5J1ufEVu9izeW+Nftf1IadzElKEC/rqR0xyNSvm5173vyB03S++
         /HJlAGr1OE0vuCgKEylblAztq4OD3mufTT6tRjV0LNBVGcY4v/cuUPw5bGRYEy9JUzYS
         sVF9tGtFg6Bi8CfQlWBNqK+3eHZJ9P6BFE/f7dYJwF7UyGecBOd/0kAqoP7ZMoolR92T
         ZdLg7HrMei41tfbQxiOg64EZz026qNK4ukHymMZbCrJLQfwF3uEB32UEepyKlv0ek+dH
         NocQ==
X-Gm-Message-State: AGi0PuYHnUiJYqg6SUcHRtW0G6GFFVaZPH+/FL34SUqLjRIbJtAQvuO/
        1idXIpFcwuMHFidCT5z1DoQvzA==
X-Google-Smtp-Source: APiQypJJWXw4mlnhjhyGW7fsUmpmvMSUe+Gva7ARSsUwl+dmWYkhEaXeloTJX9ki2MQdvOcyRHxLUQ==
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr5139486wrm.395.1587018459796;
        Wed, 15 Apr 2020 23:27:39 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id h13sm14976188wrs.22.2020.04.15.23.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 23:27:39 -0700 (PDT)
Date:   Thu, 16 Apr 2020 07:28:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/12] docs: dt: convert usage-model.txt to ReST
Message-ID: <20200416062831.GL2167633@dell>
References: <cover.1586961793.git.mchehab+huawei@kernel.org>
 <cfec677ffc34540f5f5b63c393f2d0fae4383787.1586961793.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cfec677ffc34540f5f5b63c393f2d0fae4383787.1586961793.git.mchehab+huawei@kernel.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed, 15 Apr 2020, Mauro Carvalho Chehab wrote:

> - Add a SPDX header;
> - Adjust document title;
> - Use footnoote markups;
> - Some whitespace fixes and new line breaks;
> - Mark literal blocks as such;
> - Add it to devicetree/index.rst.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/index.rst            |  1 +
>  Documentation/devicetree/of_unittest.txt      |  2 +-
>  .../{usage-model.txt => usage-model.rst}      | 35 +++++++++++--------

>  include/linux/mfd/core.h                      |  2 +-

Acked-by: Lee Jones <lee.jones@linaro.org>

>  4 files changed, 23 insertions(+), 17 deletions(-)
>  rename Documentation/devicetree/{usage-model.txt => usage-model.rst} (97%)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
