Return-Path: <SRS0=G+GX=2B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2EEDC3F68F
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 07:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79E14214AF
	for <linux-devicetree@archiver.kernel.org>; Wed, 11 Dec 2019 07:02:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbQPfpnX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfLKHCU (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 11 Dec 2019 02:02:20 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43566 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfLKHCU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 11 Dec 2019 02:02:20 -0500
Received: by mail-pl1-f195.google.com with SMTP id q16so1028621plr.10
        for <devicetree@vger.kernel.org>; Tue, 10 Dec 2019 23:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R08vSO6u5igpmjKjGC9D9Rc8bVfKHww3KSNBkb72big=;
        b=EbQPfpnXvegQePc3hEqXeNp6CZ97qUrsRtSRXq3taulR6nVc6G9mVUWISzUOH4Wla+
         oDz+BSHgoD4gSfPif3/OxzS0cGYLYNFMxS4PnLqnht4hjOR3LU3dfOl5RHbvwo5AMMPP
         jFbsJWCaAcIxNaYFAXnONMXtYIdo6Vx1uhk3zi8qAJPxBZRQV+pWRUUrGv2ZAe+b39A4
         jiPlzCt8fn3zg1a6vHQqDuJjgI2mU8GjFmpgUwMGQOM7J1ZpNypch3s+bpnJxBX/SjV2
         gIp1JkyEhHB/dZykup6Ucnd5mQOlMnf8QkEidHOaMT1nr9nks0jd/MWuNTkOhYi9iESc
         nTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R08vSO6u5igpmjKjGC9D9Rc8bVfKHww3KSNBkb72big=;
        b=OnBiXHs1oaj0i5kDQlpETJZaaLtPWjXVTosdaVRjwWZyfPoZGWseD2qHboTvsZQwYZ
         BZi2LBov0+rsoSCE+eIMwjKLuUEbmO2JhQb9kJiaTpX54GvJk3ZfESkplvR143Shziyg
         aDKe3/WG3SJEILqtUlFZ4jVYoGi/BScCDEFDMg7EkSNJB5YK4LQbdb+AsaguJbDJyVOz
         kFv+QfVLEzDtfoEhyYIvff+eII4muGwkTv9D2cWQQbBk1dLBwNC1b2p4MdoiVmgr/D1v
         H84RgA/R85cje0GqMuB0A81sZdDrDG6hnd2tGQ/aGlX2stSsE3zxVs3TrOYBZTYeCPp6
         SMgQ==
X-Gm-Message-State: APjAAAU3SJJsiXD20tyqvZkG3/1KQ2Cl1Uj7mi84T6zVgJCz5R0uUU3q
        RvPZXQKriZTuouWs/K1Bg0vIWg==
X-Google-Smtp-Source: APXvYqxHIlKXfSm0XPqRQmElKLjwtt+RZCLKkIRACmHo2HN9+dAciIGlYFN98DvSZJzP54TeBK13ag==
X-Received: by 2002:a17:90a:1aa3:: with SMTP id p32mr1877886pjp.8.1576047739635;
        Tue, 10 Dec 2019 23:02:19 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e27sm1483040pfm.26.2019.12.10.23.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:02:19 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:02:16 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 0/3] Add DT nodes for watchdog and llcc for SC7180 and
 SM8150 SoCs
Message-ID: <20191211070216.GF3143381@builder>
References: <0101016ef3391259-59ec5f0a-2ae7-45a8-881e-edc2d0bf7b26-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ef3391259-59ec5f0a-2ae7-45a8-881e-edc2d0bf7b26-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Tue 10 Dec 20:30 PST 2019, Sai Prakash Ranjan wrote:

> This series adds device tree node for watchdog on SC7180 and SM8150.
> It also adds a node for LLCC (Last level cache controller) on SC7180.
> 
> Patch 3 depends on the dt binding change to LLCC node name:
>  - https://patchwork.kernel.org/patch/11246055/
> 

Series applied

Thanks,
Bjorn

> Sai Prakash Ranjan (3):
>   arm64: dts: qcom: sc7180: Add APSS watchdog node
>   arm64: dts: qcom: sm8150: Add APSS watchdog node
>   arm64: dts: qcom: sc7180: Add Last level cache controller node
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 13 +++++++++++++
>  arch/arm64/boot/dts/qcom/sm8150.dtsi |  6 ++++++
>  2 files changed, 19 insertions(+)
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
