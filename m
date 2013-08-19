Return-Path: <devicetree-owner@vger.kernel.org>
Received: from mail-ea0-f172.google.com ([209.85.215.172]:39641 "EHLO
	mail-ea0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751022Ab3HSKoQ (ORCPT
	<rfc822;devicetree@vger.kernel.org>); Mon, 19 Aug 2013 06:44:16 -0400
Received: by mail-ea0-f172.google.com with SMTP id r16so290125ead.3
        for <devicetree@vger.kernel.org>; Mon, 19 Aug 2013 03:44:15 -0700 (PDT)
Date: Mon, 19 Aug 2013 11:44:09 +0100
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RESEND] max77693: added device tree support
Message-ID: <20130819104409.GA21520@lee--X1>
References: <1376907121-13815-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1376907121-13815-1-git-send-email-a.hajda@samsung.com>
Sender: devicetree-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Grant Likely <grant.likely@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> +static int max77693_get_platform_data(struct max77693_dev *max77693,
> +				      struct device *dev)
> +{
> +	struct device_node *node = dev->of_node;
> +	struct max77693_platform_data *pdata = dev->platform_data;
> +
> +	if (node) {
> +		max77693->wakeup = of_property_read_bool(node, "wakeup-source");
> +		return 0;
> +	}
> +
> +	if (pdata) {
> +		max77693->wakeup = pdata->wakeup;
> +		return 0;
> +	}

Hmm... Unless things have changed, pdata usually takes precedence over
DT i.e. if pdata is present it should be used. Can you reverse these
two if statements please? 

Sorry to mess you around.

> +	dev_err(dev, "No platform data found.\n");
> +	return -EINVAL;
> +}
> +

-- 
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
