Return-Path: <SRS0=4Y7L=45=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1C1C10DCE
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 05:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B83E520735
	for <linux-devicetree@archiver.kernel.org>; Thu, 12 Mar 2020 05:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IboB44Xv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387810AbgCLFqx (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 12 Mar 2020 01:46:53 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38586 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387767AbgCLFqx (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 12 Mar 2020 01:46:53 -0400
Received: by mail-pj1-f65.google.com with SMTP id m15so1471317pje.3
        for <devicetree@vger.kernel.org>; Wed, 11 Mar 2020 22:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HdLQClxtUdSKaPYPUuDw8hsXm01ozTjM22vd2TlllWY=;
        b=IboB44Xv4A4qjCH+4o4oeBZWNlCYG/ByHae4lTJdqvMyNBfaB60Yong+zCaWJGc5pD
         u5BJpY7WgaiMw7Ktx+zZDDybj85pjdn0/kXGiTEUaE8n3bD92Dqt5FdHk5vhvbgWPuN2
         AvsWdo9mT1BFwuH3FFGtyvj+iufWkZ+3MmHFccjCzC8FGN3fu4353OEipnJwkHtDYRB0
         QKGNyFqIlYiqYGKBcGfbQZUQVDaTJFs+D/E4QY6EIsuhO2Dd1srPIufHIOWVDUyy+/bl
         O97lE45PwOXOTzOz9HIyN6eiodf2dGy5Ipk3XWm16CSwCplm8891M4r65yWbG0uEnql8
         DXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HdLQClxtUdSKaPYPUuDw8hsXm01ozTjM22vd2TlllWY=;
        b=YcCAn12vTjxw2UB4prblK3hV/R/1bF5hp6uEe7gN8m6i120r9bENPK+5rofjF0ffAO
         jJSgkaVRrid34B2zkmiZDHvqm7UnaDYg/M4hBZVcHUPwzmRtJjCX4KVAOpDQSxmM83KQ
         +jnLd5R9HeipC38Z209q9cGjrds5z8KXkWbo5ibNGDGmI/nmnRBUSyUF/P0PrxkRZSt+
         BPp8KnpkbpBGryOTrIMU91+2ZObjpmQRTsTTv2CSU4lRJFBN3zVAs3cMyGbRrhZntBL+
         8q/7EOV6Xzg6c7UzQtPtFrSrpUc0tH2JMu0/NV84is4tINYrX7pcjqK7I+bQq+jk3jWY
         Q6Qw==
X-Gm-Message-State: ANhLgQ2eGp/ZH6L70VmJkm4bBTJWv7He4tZD1hy1uuwJ07aVNrF0SYSb
        CYvr36LHUCSGCmuSE7N+N2BCWQ==
X-Google-Smtp-Source: ADFU+vvBWNdJZkvEkCv0nI8YzvJVVKiWy4ls6Cvv+ZJy9fEmA1IbQaWDjbdzG87HHLDEiZZTB4J7JA==
X-Received: by 2002:a17:902:b090:: with SMTP id p16mr6000674plr.274.1583992011924;
        Wed, 11 Mar 2020 22:46:51 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z20sm23161331pge.62.2020.03.11.22.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 22:46:51 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:46:49 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     agross@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] firmware: qcom_scm: add ipq806x with no clock
Message-ID: <20200312054649.GG1098305@builder>
References: <20200311130918.753-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311130918.753-1-ansuelsmth@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Wed 11 Mar 06:09 PDT 2020, Ansuel Smith wrote:

> ipq806x rpm definition was missing for a long time.
> Add this to make this soc support rpm.
> 

I merged the dt-binding patch, but please update dts to use:
	compatible = "qcom,scm-ipq806x", "qcom,scm";

instead of adding the platform specific compatible in the driver.

Regards,
Bjorn

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/firmware/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 059bb0fbae9e..d13ef3cd8cf5 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -1144,6 +1144,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
>  							     SCM_HAS_BUS_CLK)
>  	},
>  	{ .compatible = "qcom,scm-ipq4019" },
> +	{ .compatible = "qcom,scm-ipq806x" },
>  	{ .compatible = "qcom,scm-msm8660", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8960", .data = (void *) SCM_HAS_CORE_CLK },
>  	{ .compatible = "qcom,scm-msm8916", .data = (void *)(SCM_HAS_CORE_CLK |
> -- 
> 2.25.0
> 
