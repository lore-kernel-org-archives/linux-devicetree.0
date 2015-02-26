From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Thu, 26 Feb 2015 11:37:20 -0800
Message-ID: <54EF75F0.7000901@broadcom.com>
References: <1424888184-22180-3-git-send-email-sbranden@broadcom.com> <3062825.7b1oYP4yuL@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3062825.7b1oYP4yuL@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Response inline.

On 15-02-25 11:17 AM, Arnd Bergmann wrote:
> On Wednesday 25 February 2015 10:16:24 Scott Branden wrote:
>> This adds a driver for random number generator present on Broadcom
>> IPROC devices.
>>
>> Reviewed-by: Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> The driver looks reasonable overall, I have just one question about
> something that sticks out:
>
>> +	while ((num_remaining > 0) && time_before(jiffies, idle_endtime)) {
> ...
>> +
>> +		/* Are there any random numbers available? */
>> +		if ((ioread32(rng_base + RNG_FIFO_COUNT_OFFSET) &
>> +				RNG_FIFO_COUNT_RNG_FIFO_COUNT_MASK) > 0) {
> ...
>> +		} else {
>> +			if (!wait)
>> +				/* Cannot wait, return immediately */
>> +				return max - num_remaining;
>> +
>> +			/* Can wait, give others chance to run */
>> +			cpu_relax();
>> +		}
>> +	}
>> +
>
> It looks like you do a busy-loop around cpu_relax here if asked to wait.
> Is this intentional? I would normally expect either cond_resched() or
> some msleep() instead.

This code was following examples of other open source drivers - bcm2835 
and exynos both use cpu_relax.  I'll have to look into this more to 
understand.

>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
