Return-Path: <SRS0=Dihy=4Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0C2AC3F2CD
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 00:43:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7EEEB246A3
	for <linux-devicetree@archiver.kernel.org>; Fri, 28 Feb 2020 00:43:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lhRclAoj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730144AbgB1Anc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 27 Feb 2020 19:43:32 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33251 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgB1Anb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 27 Feb 2020 19:43:31 -0500
Received: by mail-pl1-f196.google.com with SMTP id ay11so520360plb.0
        for <devicetree@vger.kernel.org>; Thu, 27 Feb 2020 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
        b=lhRclAojaWh7DXh2Fy7nrZd8SyMa2JcnmOKVrBR+FQiN1Mp028BI+MGpcddDUXGFCo
         JVM/kWmCyIpvTdqmy3Mp4rlnHT6E8MxWgHEdVS/cOIvQC91hdqRkEyRVVWVfhwxJ6h4X
         Gnc/1uU0weocAgDStM+BvrwkpxoNH/IGzP4P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8t+QF1jUrbFLO8yI08wmjsR+GeHNrEjF1Md3xiMC8NA=;
        b=qYoSQlDnztZbQ6hvwE+Qmy8pffKqazifFPp7r3IfpqVk17K1eBVHJnE6pkyT2cn/M8
         JvvcNcsGbl73NfQT+FBoED/u5aW1JmhIzHM4wQO62ezuGdhNZm2s5aNQeosVp7cXuRAo
         RlDR1iurOVJQ0v2cTjGAz37Bdv16RuSj7kI2dKXl4BkjtzF5OTLmo2c2t5TFqgFpPK62
         2E4qTS2jkGrNPgO31/eHbo1Mw9VrpBHIW6/gu2msKVaBPET+PRDmuIw5SE3hpbusL85V
         +ubc2k/zYb7eQvpAiJb5HZLWLBKDAEypH2UwJ5DY9LTqnFxSfJEqgaLiLqUP7ubOdmba
         KoCw==
X-Gm-Message-State: APjAAAX2xsPuJXRlRURRUy6Yp6l9hjoCaP0+G0d+JKRkcXj1bhMC92al
        CeLHpBhlPO/Lm7Q0QlrSAqosug==
X-Google-Smtp-Source: APXvYqwWMiiJ4fXkvydaOnQd5+1b2ygxswq4zp1nvGJdIdnG9xiMkdkUMdjzVxim7xA7gB0Eus81Qg==
X-Received: by 2002:a17:90a:8586:: with SMTP id m6mr1724274pjn.121.1582850610811;
        Thu, 27 Feb 2020 16:43:30 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 13sm7713961pgo.13.2020.02.27.16.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 16:43:29 -0800 (PST)
Date:   Thu, 27 Feb 2020 16:43:28 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, seanpaul@chromium.org,
        abhinavk@codeaurora.org, hoegsberg@google.com,
        dri-devel@lists.freedesktop.org
Subject: Re: [DPU PATCH v3 3/5] drm/msm/dp: add displayPort driver support
Message-ID: <20200228004328.GM24720@google.com>
References: <1575294437-6129-1-git-send-email-chandanu@codeaurora.org>
 <0101016ec6df0e54-2af1f4a6-8f72-4799-89e0-0ff87b514eb2-000000@us-west-2.amazonses.com>
 <20200227215433.GK24720@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200227215433.GK24720@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Thu, Feb 27, 2020 at 01:54:33PM -0800, Matthias Kaehlcke wrote:
> On Mon, Dec 02, 2019 at 01:48:57PM +0000, Chandan Uddaraju wrote:
> > Add the needed displayPort files to enable DP driver
> > on msm target.
> > 
> > "dp_display" module is the main module that calls into
> > other sub-modules. "dp_drm" file represents the interface
> > between DRM framework and DP driver.
> > 
> > changes in v2:
> > -- Update copyright markings on all relevant files.
> > -- Change pr_err() to DRM_ERROR()
> > -- Use APIs directly instead of function pointers.
> > -- Use drm_display_mode structure to store link parameters in the driver.
> > -- Use macros for register definitions instead of hardcoded values.
> > -- Replace writel_relaxed/readl_relaxed with writel/readl
> >    and remove memory barriers.
> > -- Remove unnecessary NULL checks.
> > -- Use drm helper functions for dpcd read/write.
> > -- Use DRM_DEBUG_DP for debug msgs.
> > 
> > changes in V3:
> > -- Removed changes in dpu_io_util.[ch]
> > -- Added locking around "is_connected" flag and removed atomic_set()
> > -- Removed the argument validation checks in all the static functions
> >    except initialization functions and few API calls across msm/dp files
> > -- Removed hardcoded values for register reads/writes
> > -- Removed vreg related generic structures.
> > -- Added return values where ever necessary.
> > -- Updated dp_ctrl_on function.
> > -- Calling the ctrl specific catalog functions directly instead of
> >    function pointers.
> > -- Added seperate change that adds standard value in drm_dp_helper file.
> > -- Added separate change in this list that is used to initialize
> >    displayport in DPU driver.
> > -- Added change to use drm_dp_get_adjust_request_voltage() function.
> > 
> > Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> > ---
> > +++ b/drivers/gpu/drm/msm/dp/dp_power.c
> >
> > ...
> >
> > +int dp_power_init(struct dp_power *dp_power, bool flip)
> > +{
> > +	int rc = 0;
> > +	struct dp_power_private *power;
> > +
> > +	if (!dp_power) {
> > +		DRM_ERROR("invalid power data\n");
> > +		rc = -EINVAL;
> > +		goto exit;
> > +	}
> 
> drive-by comment:
> 
> this would lead to calling 'pm_runtime_put_sync(&power->pdev->dev)'
> below with 'power' being NULL, which doesn't seem a good idea.

correction: with 'power' being uninitialized, which isn't a good idea
either.

> It is probably sane to expect that 'dp_power' is not NULL, if that's
> the case the check can be removed. Otherwise the function should just
> return -EINVAL instead of jumping to 'exit'.
> 
> > +
> > +	power = container_of(dp_power, struct dp_power_private, dp_power);
> > +
> > +	pm_runtime_get_sync(&power->pdev->dev);
> > +	rc = dp_power_regulator_enable(power);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable regulators, %d\n", rc);
> > +		goto exit;
> > +	}
> > +
> > +	rc = dp_power_pinctrl_set(power, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to set pinctrl state, %d\n", rc);
> > +		goto err_pinctrl;
> > +	}
> > +
> > +	rc = dp_power_config_gpios(power, flip);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable gpios, %d\n", rc);
> > +		goto err_gpio;
> > +	}
> > +
> > +	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
> > +	if (rc) {
> > +		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
> > +		goto err_clk;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_clk:
> > +	dp_power_disable_gpios(power);
> > +err_gpio:
> > +	dp_power_pinctrl_set(power, false);
> > +err_pinctrl:
> > +	dp_power_regulator_disable(power);
> > +exit:
> > +	pm_runtime_put_sync(&power->pdev->dev);
> > +	return rc;
> > +}
