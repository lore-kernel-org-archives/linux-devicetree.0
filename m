Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08608C433E6
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7F1B2075B
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 09:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yh9Pm9P9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729545AbgGMJjO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 05:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729534AbgGMJjN (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 05:39:13 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0199C061794
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:39:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id i14so5750484pfu.13
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2020 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=skXD+wsQgKq4LXd9xCnrPvK7KZqTAPrAbDnvMV4BILs=;
        b=yh9Pm9P9Gp+QKQfxeQtuY1E1Hp14L5t3EfCVWNCaO52OM6gUUeJFFQTyK8rEyutk0H
         BMoHaR7zBcRyTShlru8V/TjqVRzrZV4+B5MeBPC/AGQ5A+jfZAy8UEt43EkfDOpZu4V9
         01nPZo5Akte8gAWlUJLgaa0gem1j28CIN8cD49/resMQr46y6OMYdUiK3whKdoa5Uvy5
         +y3ZSH/GpTj9Dn49PXWKm4+8ovC5Z15loSyOKMRDKhb71xCepwG0+P+RLVfWt5RjYGZr
         eyLaucHvluqtxjaz0JZV9dp8AXvH8VzJNZTRd03H+RiGwVDyP5C9sdB0gGbOaJ4/YDFw
         iing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=skXD+wsQgKq4LXd9xCnrPvK7KZqTAPrAbDnvMV4BILs=;
        b=ZuBQVuEp5u5a928Le+lV7pt1NzgdL/zVaGlTiXL7f5if5BQ9wCIsd73HG8ehT4u13y
         X7UT9Jhdbf+DsDsFIk/PYainrNnXfftCPtqytWP9KlJbrjYlrYPEppTDmc3mMrkslOjr
         LMpcqAwh0/BzJQc3hnJQhwLiyQ1DMioOFXgyTRkkGc35uDY5EkhYCXtpal2osI+/yzci
         I/2Gb7IaHGB3B2jawW9+n+mIMf1O3O33CPa1KTmjnzp1aXi8npCXTayb01sQFRLE0sRO
         N5whZDz0UnHdyhmaEgtK2wMYDf8Rxakw74jVYAjXrFdS6uOCcIAdysxnTO1i5PIhwBbX
         0zog==
X-Gm-Message-State: AOAM531VvUSQr9d4u4zlarGtxXQj89qJqFoUa/cyNZzdMn50q/ylNrY2
        KBaR7MVW2I6zHqAMl3NnXFYlNw==
X-Google-Smtp-Source: ABdhPJyl0zjLReOR/+Xr6FqTuxKWo4RJ4CVE+9dKiMkEDH87gGW8e4TOm3obgjWYwEX/7dZWcfxkkA==
X-Received: by 2002:a63:3d01:: with SMTP id k1mr65845600pga.71.1594633152842;
        Mon, 13 Jul 2020 02:39:12 -0700 (PDT)
Received: from localhost ([122.172.34.142])
        by smtp.gmail.com with ESMTPSA id i13sm14062787pjd.33.2020.07.13.02.39.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 02:39:11 -0700 (PDT)
Date:   Mon, 13 Jul 2020 15:09:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 2/8] cpufreq: mediatek: Enable clock and regulator
Message-ID: <20200713093909.676v7wxjzsz4vbxv@vireshk-i7>
References: <1594348284-14199-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594348284-14199-3-git-send-email-andrew-sh.cheng@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 10-07-20, 10:31, Andrew-sh.Cheng wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> Need to enable regulator,
> so that the max/min requested value will be recorded
> even it is not applied right away.
> 
> Intermediate clock is not always enabled by ccf in different projects,
> so cpufreq should enable it by itself.
> 
> Change-Id: I9f4c8b1ea793794f5f9cdc65427daad1393f5df8

You are on V7 right now, these should have been gone long back.

> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 0c98dd08273d..4b479c110cc9 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -350,6 +350,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>  		ret = PTR_ERR(proc_reg);
>  		goto out_free_resources;
>  	}
> +	ret = regulator_enable(proc_reg);
> +	if (ret) {
> +		pr_warn("enable vproc for cpu%d fail\n", cpu);
> +		goto out_free_resources;
> +	}

This is already done by the OPP core now.

-- 
viresh
