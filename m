Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C32C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 02:39:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C00F2245F
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 02:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot6cwcHm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbfKTCjO (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 21:39:14 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45321 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKTCjO (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 21:39:14 -0500
Received: by mail-pg1-f193.google.com with SMTP id k1so11239085pgg.12
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 18:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rmGQj7/ER384qMpN2QkIRdax3FhW52fXgXuITnbFJUM=;
        b=Ot6cwcHmPmdUnicAcrV8Q/blliaN/pObgVadHq4j2DW/ptCo8TOiHzfiwbBnzrehsZ
         KbglRwE3/u5XBpxTaBBKV4947lHmmyJnnDQCxnSsJC2H5WHC+QFseaRh90Ja047iQ+KW
         XDW6CA+Nx+LPjIEBUJjk+oq7Kwur15vHlUZXwQkH1aqIIp9GvrNSkPuE7ICPER0IUTBg
         Ubc/Z/WbmniFszz/Vyl/OvmfgyOdZyx+xmVaAhvKu3s3CPtuQN3XDt6m8Yuf3B28TQ9p
         2fF/RmRR07HjOUFQu5/lM/YNxLngyoKYnp/YXGVEBFLYywZlnTbKE/QQV0a6wxcyhwXH
         pcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rmGQj7/ER384qMpN2QkIRdax3FhW52fXgXuITnbFJUM=;
        b=peqy/QoQEeStfP6LdG/eWIrfVNWbuT0QoqyX6AOdM9PDQdSE7PxbB3+HuuT/ac3fN/
         DrfyTa2PMVwYJBCfgZ7pJmaye7gFhnkr2+1RkKqpseH8p90pd8lfh2SiQLzh+oRlMlHl
         nrJ3LVlhjd8DeDHpkNrv6UaXQMnPtb6Cot0Pymt8UJGE35erXDszDyTAiZuD9YxRFP78
         Eaph9KwPIRYQrJQyWY4AQtDZWPohEwgrB/b3NNRpJirswJ1GCdr3v/o/EA3qYu1BfAz6
         0YzArH4iwlSDbxi9An7V3RdZk2Rk6xPmSQpcvnmdOjYkn6JXS6VyEnYQUR1GI4WcaaRE
         PzYw==
X-Gm-Message-State: APjAAAUXkG5pOlGh630YbXaRSOiETzb2SLuTMJWf/20ZDLHes11QCXI3
        eUpLIia3eSsyOtgbmZmaAWFRHQ==
X-Google-Smtp-Source: APXvYqxfYwc/XGbVrhZLuJG/tKj/6zmKdZQ2C34IbqxNk5A0bePNt2jVUiuUF/4l2wqesERiCPb7iw==
X-Received: by 2002:a62:7dce:: with SMTP id y197mr1034777pfc.164.1574217551668;
        Tue, 19 Nov 2019 18:39:11 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h3sm4724627pji.16.2019.11.19.18.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:39:11 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:39:08 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 1/6] soc: qcom: rpmhpd: Set 'active_only' for active only
 power domains
Message-ID: <20191120023908.GP18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f9998d8-877e9166-8b6a-4530-ab66-3c88002e1db4-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> From: Douglas Anderson <dianders@chromium.org>
> 
> The 'active_only' attribute was accidentally never set to true for any
> power domains meaning that all the code handling this attribute was
> dead.
> 
> NOTE that the RPM power domain code (as opposed to the RPMh one) gets
> this right.
> 
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Acked-by: Rajendra Nayak <rnayak@codeaurora.org>

You should have added your S-o-b here to certify its origin.
But I picked up this patch earlier today.

Thanks,
Bjorn

> ---
>  drivers/soc/qcom/rpmhpd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 5741ec3fa814c..51850cc68b701 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -93,6 +93,7 @@ static struct rpmhpd sdm845_mx = {
>  
>  static struct rpmhpd sdm845_mx_ao = {
>  	.pd = { .name = "mx_ao", },
> +	.active_only = true,
>  	.peer = &sdm845_mx,
>  	.res_name = "mx.lvl",
>  };
> @@ -107,6 +108,7 @@ static struct rpmhpd sdm845_cx = {
>  
>  static struct rpmhpd sdm845_cx_ao = {
>  	.pd = { .name = "cx_ao", },
> +	.active_only = true,
>  	.peer = &sdm845_cx,
>  	.parent = &sdm845_mx_ao.pd,
>  	.res_name = "cx.lvl",
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
