Return-Path: <SRS0=uzRV=5Q=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7125FC43331
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 23:41:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3178C20786
	for <linux-devicetree@archiver.kernel.org>; Tue, 31 Mar 2020 23:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRqmaUgo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbgCaXlj (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 31 Mar 2020 19:41:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35170 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731331AbgCaXlj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 31 Mar 2020 19:41:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id a13so1107250pfa.2
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2020 16:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kgLg1BYMpswLOvaY9ouREHThum7EqW/Wb2UtLfVPDwA=;
        b=mRqmaUgoOW9VnbKgx4EF0ko6I3gfQVayMY4tJ2KbUJwDw6KyIFwM3GYQ3zv6iwPfDA
         RBj7069dKZ7bUxg+TF5m3UxXR1+LM79xl51LOpF1ztxjrT9RN69vCvl8pcShYculTJRu
         XZLW0nI4bg5rC2m/ln/Y4GNh0P00XwtvlwYYoH+wnPGSz1fE9aNuheBrgFPitLVK4D8j
         0tc6pHbeZWS88bb9hFgA/XOD/P6dlxVFKLt07HeT1whYTLhZf1/1E3wWUdht2AxOhfYT
         8dt33gRdJl9DmRe/FIhGc3AylBB1+l1w/rTh3Ok1t0cZKTwismTjg89tvCSn1BoPMfMD
         yYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kgLg1BYMpswLOvaY9ouREHThum7EqW/Wb2UtLfVPDwA=;
        b=IQMQrVtNg05O3HKvN8xQF0baJta0cfSxlUxM5jVWoc6Z90+zXY5u5IEcTMHTyrtcUg
         afFkNd0hSIW+tci28+rz6LnEr1M/k+guK4MixJHgH1ENTgj5tY8jNV8FjuuXovhI5F8k
         bovE3sh0qbMLVXhidRT0hNGe8jqKYEdDFH4zrUYz+sjE3qT8QMrVkwoeuH1Ruvgrx3ja
         ACgpUcD5MeCwjMKqfUuU/wzlsArVoOajJcp16hQrfT3BuEUu7w1+0il23yAk6ks6rxRP
         01MlEY+9TgDh8aAM97jXfkwQ10V2O8opbjokjuF3//htTCF8a9ZnNjkuBHm0Qk1aTeI4
         aqew==
X-Gm-Message-State: AGi0PuYJOuNOolyyjYTLwV3JCgLt5odJcLpabOUjGC6UMzJI9GPIFrON
        GtHLa3qmjkfiAS5i8kI8X0j61g==
X-Google-Smtp-Source: APiQypJMF+3p+OYDbDQ4wyrkTdV5Dob4Zmqb1h73XbhqTI/p2mAJDLPwuix49HbnjKy/j58rekzVAA==
X-Received: by 2002:a63:fd43:: with SMTP id m3mr7937975pgj.129.1585698097837;
        Tue, 31 Mar 2020 16:41:37 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l5sm116369pgt.10.2020.03.31.16.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 16:41:37 -0700 (PDT)
Date:   Tue, 31 Mar 2020 16:41:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Add interconnect property
Message-ID: <20200331234135.GC267644@minitux>
References: <1585357496-6368-1-git-send-email-rishabhb@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585357496-6368-1-git-send-email-rishabhb@codeaurora.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Fri 27 Mar 18:04 PDT 2020, Rishabh Bhatnagar wrote:

> Allow proxy voting/unvoting of bus bandwidth for remote
> processors. This property will specify the bus-master and
> slave so that remoteproc platform driver can make the proxy
> vote for bus bandwidth.
> 
> Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> index 9938918..529b0a0 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt
> @@ -111,6 +111,17 @@ on the Qualcomm ADSP Hexagon core.
>  	qcom,sm8150-slpi-pas:
>  		    must be "lcx", "lmx", "load_state"
>  
> +- interconnect:

This should be plural; "interconnects".

> +	Usage: optional
> +	Value type: <prop-encoded-array>
> +	Definition: Specifies the interconnect bus-master and bus-slave for
> +		    bandwidth voting during proxy vote/unvote.
> +
> +- interconnect-names:
> +	Usage: optional
> +	Value type: <stringlist>
> +	Definition: The interconnect name depends on the compatible string

This should be elaborated upon, similar to e.g. power-domain-names.

Regards,
Bjorn

> +
>  - memory-region:
>  	Usage: required
>  	Value type: <phandle>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
