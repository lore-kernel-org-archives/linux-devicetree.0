From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: New driver for TI DA8XX/OMAP-L138/AM18XX
 pinconf
Date: Wed, 23 Nov 2016 10:21:41 -0600
Message-ID: <6936ebc0-bb27-d741-3504-e2fbb231b87c@lechnology.com>
References: <1479871767-20160-1-git-send-email-david@lechnology.com>
 <1479871767-20160-3-git-send-email-david@lechnology.com>
 <88b3d16b-6e5b-ea75-d770-35d9adc6c677@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <88b3d16b-6e5b-ea75-d770-35d9adc6c677-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, =?UTF-8?Q?Bartosz_Go=c5=82aszewski?= <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/23/2016 05:04 AM, Sekhar Nori wrote:
> On Wednesday 23 November 2016 08:59 AM, David Lechner wrote:
>> This adds a new driver for pinconf on TI DA8XX/OMAP-L138/AM18XX. These
>
> s/DA8XX/DA850/
>
>> SoCs have a separate controller for controlling pullup/pulldown groups.
>>
>> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
>
>> +static const char *da850_pupd_get_get_group_name(struct pinctrl_dev *pctldev,
>> +						 unsigned int selector)
>> +{
>> +	return da850_pupd_group_names[selector];
>> +}
>> +
>> +static int da850_pupd_get_get_group_pins(struct pinctrl_dev *pctldev,
>> +					 unsigned int selector,
>> +					 const unsigned int **pins,
>> +					 unsigned int *num_pins)
>> +{
>> +	*num_pins = 0;
>> +
>> +	return 0;
>> +}
>
> usage of get_get_ in the function names above is odd.

Will fix (copy/paste error)

>
> Thanks,
> Sekhar
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
