Return-Path: <SRS0=QJws=63=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18DFCC2D0F8
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D98E5206A5
	for <linux-devicetree@archiver.kernel.org>; Wed, 13 May 2020 06:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iiIHnvne"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgEMGki (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 13 May 2020 02:40:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728097AbgEMGki (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 13 May 2020 02:40:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1954C061A0F
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 23:40:37 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 23so1542pfy.8
        for <devicetree@vger.kernel.org>; Tue, 12 May 2020 23:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OIQYxN0drZOAEHo9yCmLQaZoQizu+u7jnHq31+ZplXg=;
        b=iiIHnvneP2z1jk8I3wWR4QAmnW+Vj6eDQ4MF/8mgzVDPV+bsMSsYtzBncTmjla2oyB
         y65VlpFXlZ7mixiPQV4BAro1nMcioFqadCIpkKS57WtngHNdYmHxIoVeuV9haIyxzUMM
         Rpv0lcc8U/GKf3uCRaS9WX+iJrMZ2KZ/KwmNaLZ5bkdNY8NJhNgyGPruDbbE4EN21W7P
         b+JHgElAM+xeamNa87VdCXbOCIcR1OAM/c6fGGy87P+1qKaMWpmX4g0cr9o4Xu04l+3x
         LnivZJvPyoEmOAwvgChhkTFmaE+OLgSyxofyMTRcU6LdcDxU+bGBbeOyo8OAXn6pbMLs
         gvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OIQYxN0drZOAEHo9yCmLQaZoQizu+u7jnHq31+ZplXg=;
        b=e/ok7ZAZeg3eqeNBKtOJ/NYsNPt4NUS3lf4yivjHVXQHY4DUfQTWlXbm73bq1wA5qN
         5+h57s+y5YWsr9bA8nLMgVJqZOqiz4miqADIZ8bwMaeI9+Z2MnhjCPQXNL+Di4HrGA+Q
         jtdBuYdawlg26bK3Uh33PJRKuSr2vrS1TUcIKMYTpiHS7/ckN3lzt2MFcVda4LXAIqoI
         +fu37uwPOZs1LYb9xmFrVCP8deCGzVgAXTiYP4T0kYzdlOm3AHpNp7MMCotBLoQQpAl1
         7+T5MNTMywq/ttv5RHruLlBrpBO/76R27AxJeEuyrKJyaqVjSN579s6s6R6ysGtAlYov
         6mAA==
X-Gm-Message-State: AGi0Pubw/cKuUamAts0PbmvkPAzH1gKP+Ip7WnrTEN2IHA0Wk4v0+iCZ
        CX1jiUTg7wBwXzClJMTJXAhLQw==
X-Google-Smtp-Source: APiQypI1+pqcLAKzyinEccL70VMvcXaX/Tm3CNUYsFJxdmGD890CGgwWQ6X2kLiefLCRhYAMNHRdGw==
X-Received: by 2002:a63:a61:: with SMTP id z33mr22823838pgk.440.1589352037298;
        Tue, 12 May 2020 23:40:37 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id w69sm13705056pff.168.2020.05.12.23.40.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 23:40:36 -0700 (PDT)
Date:   Wed, 13 May 2020 12:10:34 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, rjw@rjwysocki.net,
        saravanak@google.com, sibis@codeaurora.org, mka@chromium.org,
        robh+dt@kernel.org, rnayak@codeaurora.org,
        bjorn.andersson@linaro.org, vincent.guittot@linaro.org,
        jcrouse@codeaurora.org, evgreen@chromium.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 02/10] OPP: Add helpers for reading the binding
 properties
Message-ID: <20200513064034.vj66ldzam7qnatbe@vireshk-i7>
References: <20200512125327.1868-1-georgi.djakov@linaro.org>
 <20200512125327.1868-3-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200512125327.1868-3-georgi.djakov@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 12-05-20, 15:53, Georgi Djakov wrote:
> diff --git a/drivers/opp/of.c b/drivers/opp/of.c

> @@ -558,26 +580,13 @@ static struct dev_pm_opp *_opp_add_static_v2(struct opp_table *opp_table,
>  	if (!new_opp)
>  		return ERR_PTR(-ENOMEM);
>  
> -	ret = of_property_read_u64(np, "opp-hz", &rate);
> -	if (ret < 0) {
> -		/* "opp-hz" is optional for devices like power domains. */
> -		if (!opp_table->is_genpd) {
> -			dev_err(dev, "%s: opp-hz not found\n", __func__);
> -			goto free_opp;
> -		}
> -
> -		rate_not_available = true;
> -	} else {
> -		/*
> -		 * Rate is defined as an unsigned long in clk API, and so
> -		 * casting explicitly to its type. Must be fixed once rate is 64
> -		 * bit guaranteed in clk API.
> -		 */
> -		new_opp->rate = (unsigned long)rate;
> +	ret = _read_opp_key(new_opp, np, &rate_not_available);
> +	/* The key is optional for devices like power domains. */

Dropped this comment as key isn't optional for genpd as well as you
handled that in a later patch..

> +	if (ret < 0 && !opp_table->is_genpd) {
> +		dev_err(dev, "%s: opp key field not found\n", __func__);
> +		goto free_opp;
>  	}

-- 
viresh
