From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 2/2] Input: bcm-keypad: Add Broadcom keypad controller
Date: Mon, 2 Mar 2015 11:38:58 -0800
Message-ID: <54F4BC52.6030909@broadcom.com>
References: <sbranden@broadcom.com> <1425141357-7807-1-git-send-email-sbranden@broadcom.com> <1425141357-7807-3-git-send-email-sbranden@broadcom.com> <20150228221022.GA36282@dtor-ws> <20150228221518.GB36282@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150228221518.GB36282@dtor-ws>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Dmitry,

Yes, please improve the driver and make the local change.

Regards,
  Scott

On 15-02-28 02:15 PM, Dmitry Torokhov wrote:
> On Sat, Feb 28, 2015 at 02:10:22PM -0800, Dmitry Torokhov wrote:
>> Hi Scott,
>>
>> On Sat, Feb 28, 2015 at 08:35:57AM -0800, Scott Branden wrote:
>>> +	/* Enable clock */
>>> +
>>> +	kp->clk = devm_clk_get(&pdev->dev, "peri_clk");
>>> +	if (IS_ERR(kp->clk)) {
>>> +		dev_info(&pdev->dev,
>>> +			"No clock specified. Assuming it's enabled\n");
>>
>> I was doing the final pass before applying and I think that this is not
>> quite correct, as it does not handle -EPROBE_DEFER properly which is
>> quite common. I think we should do something like this:
>>
>> 		error = PTR_ERR(kp->clk);
>> 		if (error != -ENOENT) {
>> 			if (error != -EPROBE_DEFER)
>> 				dev_err(.. "Failed to get clock" ...);
>> 			return error;
>> 		}
>> 		dev_dbg(... "No clock specified" ...);
>>
>> No need to resubmit if you are OK with this, I can make the change
>> locally.
>
> Hmm, also bcm_kp_start() and bcm_kp_stop() should check if kp->clk is
> valid before trying to enable/disable it.
>
I am ok with these changes if you want to change locally.

>>
>>> +	}
>>> +	else {
>>
>> Checkpach should have warned you that it should have been "} else {";
>> I'll fix it up locally along with few other cosmetic changes and
>> dropping a few extra headers.
>>
>> Thanks.
>>
>> --
>> Dmitry
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
