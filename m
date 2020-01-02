Return-Path: <SRS0=DK2V=2X=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A7BC2D0DC
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 20:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50CF9217F4
	for <linux-devicetree@archiver.kernel.org>; Thu,  2 Jan 2020 20:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsNErjk5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbgABU6B (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 2 Jan 2020 15:58:01 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34475 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbgABU6B (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 2 Jan 2020 15:58:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id x17so18265725pln.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jan 2020 12:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z7uC44Oc18ogP4OWB3WNFZwzRSBSoy1k7HBWtdwE8fA=;
        b=JsNErjk57TLzLekTAMi+u1tOjxdWFRum7WeAJHfQfCWI6HiRPLEhsyaBJRIkqcKhwI
         5N1i+XRLxrK414tYy5J4YcfhB4y+d8u8yKSI87iOCVIcmvVsdqzy1JAZ5Qh8j8LkEBA/
         K4fSCr8i6klwM4mLEYCf+Voh5Upglfzcm3aYBWQKPVcK2Qu7JjCm5myQDLR/WOlLNHfU
         DMRYFntzqhXZqRM1V0aXfa9l8Y9oQi+i+9lpSR9dAnkzkmg3Hb9sdrdaGWiuQU80H8gm
         DM3pYAk9NPBmaRYF0+zqpe+rjmpDZ5vIu6HWn3qtSuBRIqGghibp/TnPy8JRYD9xvZeH
         s2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z7uC44Oc18ogP4OWB3WNFZwzRSBSoy1k7HBWtdwE8fA=;
        b=SvK8WtmBFTmm8VihjiSiGQdXXwEiq9JkJtiQW739UQtRkFD2I1M99GBAc3XtpTAw35
         tRqGgUOaVqWDoZEFT9VZHyoUOJVnwlnV/rh3DTOEkXxYcUaRbhDsCC5ci2IA5cZPOAbx
         7yujAgKd17p+g+BkV21fcyIww5ehEvb7gh3YT9v9ydzDFNDBxkkp+w7RwI2BlBBfIviZ
         zbQaTunBZvAFmpqlkQQ0flD8GmaEvvYsx+ez5/k6YxS6NRGIY5rDMJwwOdsR4Ef5jN04
         hr2umi1YNIdwGw0t2PshYYCAKGRVGQuKjBRK1Un7FmPnd2HjA50uhsDw/nFkph0qvJk9
         XJyg==
X-Gm-Message-State: APjAAAX0yLqnAHOEhLTZz7AJq0xMW8hIdyIRmg3mcAPZvAQr5td4x7ZQ
        NjtsaiVAiPtipfR0eWW9sFI86A==
X-Google-Smtp-Source: APXvYqxh595qK4nZVB6EAkAq+RZs+ImBx7ezIU9NnHSyFGp1aQZBBUantfvrW7qXuXykQ+z4/i/9Mw==
X-Received: by 2002:a17:90a:3945:: with SMTP id n5mr21913490pjf.34.1577998680994;
        Thu, 02 Jan 2020 12:58:00 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a28sm64401061pfh.119.2020.01.02.12.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 12:58:00 -0800 (PST)
Date:   Thu, 2 Jan 2020 12:57:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, robh+dt@kernel.org,
        tsoni@codeaurora.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: apr: Add avs/audio tracking
 functionality
Message-ID: <20200102205757.GH988120@minitux>
References: <20191230050008.8143-1-sibis@codeaurora.org>
 <20191230050008.8143-4-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230050008.8143-4-sibis@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On Sun 29 Dec 21:00 PST 2019, Sibi Sankar wrote:
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
[..]
> -static void of_register_apr_devices(struct device *dev)
> +static void of_apr_add_pd_lookups(struct device *dev)
>  {
> +	const char *service_name, *service_path;
>  	struct apr *apr = dev_get_drvdata(dev);
>  	struct device_node *node;
> +	int ret;
> +
> +	for_each_child_of_node(dev->of_node, node) {
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    0, &service_name);
> +		if (ret < 0)
> +			continue;

While this implies that the qcom,protection-domain property is
missing...

> +
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (ret < 0)
> +			continue;

...this would imply that it's there but the format is wrong. I think you
should log this and propagate the error.

> +
> +		ret = pdr_add_lookup(&apr->pdr, service_name, service_path);
> +		if (ret && ret != -EALREADY)
> +			dev_err(dev, "pdr add lookup failed: %d\n", ret);

So we have a DT that denotes that PDR is required, but we failed to
register a lookup (for some reason). That would imply that apr is not
going to work. I think you should propagate this and make apr_probe()
fail to make this obvious.

> +	}
> +}
> +
> +static void of_register_apr_devices(struct device *dev, const char *svc_path)
> +{
> +	struct apr *apr = dev_get_drvdata(dev);
> +	struct device_node *node;
> +	const char *service_path;
> +	int ret;
>  
>  	for_each_child_of_node(dev->of_node, node) {
>  		struct apr_device_id id = { {0} };

I think you should add a comment here describing what's actually going
on. Something along the lines of:

/*
 * This function is called with svc_path NULL during apr_probe(), in
 * which case we register any apr devices without a
 * qcom,protection-domain specified.
 *
 * Then as the protection domains becomes available (if applicable) this
 * function is again called, but with svc_path representing the service
 * becoming available. In this case we register any apr devices with a
 * matching qcom,protection-domain.
 */

>  
> +		ret = of_property_read_string_index(node, "qcom,protection-domain",
> +						    1, &service_path);
> +		if (svc_path) {
> +			/* skip APR services that are PD independent */
> +			if (ret)
> +				continue;
> +
> +			/* skip APR services whose PD paths don't match */
> +			if (strcmp(service_path, svc_path))
> +				continue;
> +		} else {
> +			/* skip APR services whose PD lookups are registered */
> +			if (ret == 0)
> +				continue;
> +		}
> +

Regards,
Bjorn
