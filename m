From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/6] regulator: max77620: add regulator driver for max77620/max20024
Date: Mon, 11 Jan 2016 15:46:30 +0530
Message-ID: <569380FE.6020609@nvidia.com>
References: <1452177524-23192-1-git-send-email-ldewangan@nvidia.com> <1452177524-23192-7-git-send-email-ldewangan@nvidia.com> <20160110124014.GZ6588@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160110124014.GZ6588-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Thanks Mark for review.

I have query in one of comment.

On Sunday 10 January 2016 06:10 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Thu, Jan 07, 2016 at 08:08:44PM +0530, Laxman Dewangan wrote:
>
>
> +	np = of_get_child_by_name(pdev->dev.parent->of_node, "regulators");
> +	if (!np) {
> +		dev_err(&pdev->dev, "Device is not having regulators node\n");
> +		return -ENODEV;
> +	}
> +	pdev->dev.of_node = np;
> +
> +	ret = of_regulator_match(&pdev->dev, np, max77620_regulator_matches,
> +			ARRAY_SIZE(max77620_regulator_matches));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Parsing of regulator node failed: %d\n",
> +			ret);
> +		return ret;
> +	}
> Don't open code this, use the core support via regulators and of_match.
>

I did not get this point? Here I am using the of_regulator_match from 
core? Can you please help to explain this?

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
