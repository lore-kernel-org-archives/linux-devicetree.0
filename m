Return-Path: <SRS0=uFL0=6E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58D0C54FCC
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 05:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0BF820BED
	for <linux-devicetree@archiver.kernel.org>; Mon, 20 Apr 2020 05:38:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="smlPb7p2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbgDTFik (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 20 Apr 2020 01:38:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgDTFij (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 20 Apr 2020 01:38:39 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB65C061A41
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o10so1277593pgb.6
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8DAiM3FZELhORq/Bkh+uGmRYVoaeDncRDNKlRNgM+4Y=;
        b=smlPb7p2KjV8mhZbGKmTb4FX3kZIhWgjjinJsbrd9ObCjFQk4dwr/dBChq1xnFdwQJ
         mO3M4fRuYB/26Gk/5Z2TaacEs7BOqzeHo1G1LtMSoEn/Ex4Darq/MNVOWTmsK/EcIc8+
         84Re3GZDzlIFY81FVHvn8p39jLDuerjdsdvtBbikdCBKCTl6TRl7A6aS9xp7/5FpbROb
         tBt/0mGhvCQn4gqrzZR75FvBziVFzEFb8B8vQYLF3r+xbMxmUfwq/kWLUNSEt1ZLyjIG
         ZrJa67PV1D8ORryty0/ydOYC0IQHGaC1mTkRq53u60Q4n4AnAAYz0QJkNyjd7ZYMyCph
         3LuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8DAiM3FZELhORq/Bkh+uGmRYVoaeDncRDNKlRNgM+4Y=;
        b=if21FojrOio1spAhn+Tq9AGBg36t5ARDbO0Y8nKh5evfebW7wScIkarmLFuv6XH6YT
         pas7MkhD/tzQ4HHWv2V7cR9NQjyD0fRMMlLo8tKNezeGQTg6Bp3Qo8g6Ygi+csymraJV
         gLV399nghZAxh9wfUaRAn3xNYKVf3gO7p+cG+TkhqhZeVnY05bOje55/PakmMo5R2Wrd
         /w0Dvhn7mBYp5Xf/BNqUq9IdQGeILIEQf+BghIcJYbh0ZaBfzvQxDY6gDfGL5Ndx9bz9
         QSL6v9xUqeqnsgY3YLqYBXGo72coKB0PQAiVSx4CoPk/orx2sVSSxWusea7cIW8BgMvo
         zM1Q==
X-Gm-Message-State: AGi0PuZyelMbIQAjKX0l1M4372B/1IEFCxULu3QOt0UB3c18g9Tb5z9z
        kcQOUS8lLv/V8jgo6BfQvoIMh0HdPyw=
X-Google-Smtp-Source: APiQypIcQ5RUUaAcPqXTbhFsBCZvKcSGvCrv59l6EnBYvnD8ONdi4RqBSAZ23H/8nSSkv0dtZ1OXhg==
X-Received: by 2002:a62:1801:: with SMTP id 1mr6338097pfy.230.1587361119235;
        Sun, 19 Apr 2020 22:38:39 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r13sm31317pgj.9.2020.04.19.22.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 22:38:38 -0700 (PDT)
Date:   Sun, 19 Apr 2020 22:39:01 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, evgreen@chromium.org,
        ohad@wizery.com, mka@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] remoteproc: qcom: pas: Add SC7180 Modem support
Message-ID: <20200420053901.GH1516868@builder.lan>
References: <20200417142605.28885-1-sibis@codeaurora.org>
 <20200417142605.28885-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417142605.28885-3-sibis@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 17 Apr 07:26 PDT 2020, Sibi Sankar wrote:

> Add support for booting the Modem DSP found on Qualcomm's SC7180 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 7a63efb854052..33b0bff770a7f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -637,6 +637,7 @@ static const struct of_device_id adsp_of_match[] = {
>  	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
>  	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
>  	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
> +	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
>  	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
>  	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
>  	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
