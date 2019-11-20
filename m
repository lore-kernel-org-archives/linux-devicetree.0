Return-Path: <SRS0=8557=ZM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616B6C432C0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 02:31:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AF502240E
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 Nov 2019 02:31:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEeP9ev0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfKTCbG (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 19 Nov 2019 21:31:06 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41742 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbfKTCbG (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Nov 2019 21:31:06 -0500
Received: by mail-pl1-f193.google.com with SMTP id d29so13050110plj.8
        for <devicetree@vger.kernel.org>; Tue, 19 Nov 2019 18:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SlN3JHcAAyOx0sje3WAh1eglKaUDFqxxQJszfVhKmBE=;
        b=iEeP9ev0UFZrSPin+hJSCR7lQbtZv3KNvuwn7+5XY9KpwKUQk9Gb7qp5iRKnjN6jeu
         t0bhuybu0Q8Tq2mGEzOak0aphlyz7PpeFKIm9r8GiNCLh5xkTxyFNjY/sknc3YHIwTuw
         lR1bfxpphqay8eCHNMX/zi9egpk53TlsLqkqfspbyNvWxUyLezxrcyOFERzlYdfMMiFv
         p35NIDwW86KgndGkEV1hlFSOWE+UF5nxnv57d5ouTdqPoKZG2lL3S146/sNjPElDnltK
         RJ7xHDNpfcc9fox2ZuIDGVarImzgMadIVdrF3tUM255bXFRsOcQ6W1UYI5qQ5cBMXCqX
         EzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SlN3JHcAAyOx0sje3WAh1eglKaUDFqxxQJszfVhKmBE=;
        b=sA6CizJJgDfefJIdlG6Yy+m77o7+HaqxtqGEMIgGhX78XlbNz/dnBRAhSofXfF/BYb
         Vo6/y0JO1O1r5uLhbBHdSlhgxPEEETZitnpMu6WVF/3ouYHIEH+AnI5kdj834Xy9KK3Y
         fQ41IRSsFblSGBZeNWs6mvlwiY/B3twc8k3p3LvvgX0tLdtD4Y1e/YRGZi1rpTVN+5vB
         NB0Xeo9Mb+4cZCiKpdXmvDjnKJ9+CbPVc95SziVcL2UTcIU1XyIJNCNPtxP2ldA89z6m
         DE8cg4qv/2afVbkFY7mx9rkasH4Ct7/7T24ipMa2+Eyc6WpXnphAqWSYAnvKxcOpFQPO
         KWZw==
X-Gm-Message-State: APjAAAUwDZ/Oh9P+WyV+tAsADf599xhjs4rpgf+wVUKL5MkWJ1QNueZE
        dIhEfPeSpnY/CcbRExbDuRPiYA==
X-Google-Smtp-Source: APXvYqyXbCW923yEMBw7Rl9sdB7zP/c721VfAPUCYtkNIjCgR4IHGYcb2KqOmRRZInis80aMt42LRg==
X-Received: by 2002:a17:902:ff0f:: with SMTP id f15mr463498plj.52.1574217063689;
        Tue, 19 Nov 2019 18:31:03 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id s24sm27215232pfh.108.2019.11.19.18.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 18:31:03 -0800 (PST)
Date:   Tue, 19 Nov 2019 18:31:00 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, ulf.hansson@linaro.org, rnayak@codeaurora.org,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mark.rutland@arm.com, swboyd@chromium.org, dianders@chromium.org
Subject: Re: [PATCH 3/6] soc: qcom: rpmhpd: Add SM8150 RPMH power-domains
Message-ID: <20191120023100.GL18024@yoga>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016e7f99b99a-e1a501f1-823e-4ede-86ad-f517323c5014-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Mon 18 Nov 09:40 PST 2019, Sibi Sankar wrote:

> Add support for cx/mx/gfx/mss/ebi/mmcx power-domains found on
> SM8150 SoCs.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/soc/qcom/rpmhpd.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
> index 51850cc68b701..3b109ee67a4d2 100644
> --- a/drivers/soc/qcom/rpmhpd.c
> +++ b/drivers/soc/qcom/rpmhpd.c
> @@ -131,8 +131,44 @@ static const struct rpmhpd_desc sdm845_desc = {
>  	.num_pds = ARRAY_SIZE(sdm845_rpmhpds),
>  };
>  
> +/* SM8150 RPMH powerdomains */
> +
> +static struct rpmhpd sm8150_mmcx_ao;
> +static struct rpmhpd sm8150_mmcx = {
> +	.pd = { .name = "mmcx", },
> +	.peer = &sm8150_mmcx_ao,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd sm8150_mmcx_ao = {
> +	.pd = { .name = "mmcx_ao", },
> +	.active_only = true,
> +	.peer = &sm8150_mmcx,
> +	.res_name = "mmcx.lvl",
> +};
> +
> +static struct rpmhpd *sm8150_rpmhpds[] = {
> +	[SM8150_MSS] = &sdm845_mss,
> +	[SM8150_EBI] = &sdm845_ebi,
> +	[SM8150_LMX] = &sdm845_lmx,
> +	[SM8150_LCX] = &sdm845_lcx,
> +	[SM8150_GFX] = &sdm845_gfx,
> +	[SM8150_MX] = &sdm845_mx,
> +	[SM8150_MX_AO] = &sdm845_mx_ao,
> +	[SM8150_CX] = &sdm845_cx,
> +	[SM8150_CX_AO] = &sdm845_cx_ao,
> +	[SM8150_MMCX] = &sm8150_mmcx,
> +	[SM8150_MMCX_AO] = &sm8150_mmcx_ao,
> +};
> +
> +static const struct rpmhpd_desc sm8150_desc = {
> +	.rpmhpds = sm8150_rpmhpds,
> +	.num_pds = ARRAY_SIZE(sm8150_rpmhpds),
> +};
> +
>  static const struct of_device_id rpmhpd_match_table[] = {
>  	{ .compatible = "qcom,sdm845-rpmhpd", .data = &sdm845_desc },
> +	{ .compatible = "qcom,sm8150-rpmhpd", .data = &sm8150_desc },
>  	{ }
>  };
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
