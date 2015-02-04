From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 2/5] clk: iproc: add initial common clock support
Date: Wed, 04 Feb 2015 15:36:07 -0800
Message-ID: <54D2ACE7.2040305@codeaurora.org>
References: <Ray Jui <rjui@broadcom.com> <1422988390-24369-1-git-send-email-rjui@broadcom.com> <1422988390-24369-3-git-send-email-rjui@broadcom.com> <54D2A7B7.6020007@codeaurora.org> <54D2AC47.8080201@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D2AC47.8080201-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alex Elder <elder-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazau <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 02/04/15 15:33, Ray Jui wrote:
>
> On 2/4/2015 3:13 PM, Stephen Boyd wrote:
>> On 02/03/15 10:33, Ray Jui wrote:
>>> +/*
>>> + * Get the clock rate based on name
>>> + */
>>> +static unsigned long __get_rate(const char *clk_name)
>>> +{
>>> +	struct clk *clk;
>>> +
>>> +	clk = __clk_lookup(clk_name);
>>> +	if (!clk) {
>>> +		pr_err("%s: unable to find clock by name: %s\n", __func__,
>>> +				clk_name);
>>> +		return 0;
>>> +	}
>>> +
>>> +	return clk_get_rate(clk);
>>> +}
>>> +
>> This looks like something we should be providing in the core framework.
>> Care to make it into an of_clk_get_parent_rate() API?
>>
> I would love to! Note __get_rate here is really getting the clock rate
> with a name provided. Can you be more specific on what you want? If I'm
> not mistaken, what you really want is this?
>
> unsigned long of_clk_get_parent_rate(struct device_node *np, int index);

Yes that looks good.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
