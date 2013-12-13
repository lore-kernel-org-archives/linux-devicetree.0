From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] of: add support for reading s32 property value
Date: Fri, 13 Dec 2013 12:02:43 +0530
Message-ID: <52AAAA0B.7010307@nvidia.com>
References: <1386854693-10871-1-git-send-email-ldewangan@nvidia.com> <52A9FA00.7080506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52A9FA00.7080506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kerwin Wan <kerwinw-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org" <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 12 December 2013 11:31 PM, Stephen Warren wrote:
> On 12/12/2013 06:24 AM, Laxman Dewangan wrote:
>> Add of_property_read_s32() to read the signed 32bit number
>> from dt property value. This supports to pass the -ve numbers
>> from dt. Use 2's complement method for represnting negative number
>> and passed as u32 from dts. When reading back the value, again
>> converted to 2's complement if msb shows as 1.
>> diff --git a/include/linux/of.h b/include/linux/of.h
>> +static inline int of_property_read_s32(const struct device_node *np,
>> +				       const char *propname,
>> +				       s32 *out_value)
>> +{
>> +	u32 val;
>> +	int ret;
>> +
>> +	ret = of_property_read_u32(np, propname, &val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* 2's complement if MSB is 1 */
>> +	*out_value = (val & 0x80000000U) ? -((val ^ 0xFFFFFFFFU) + 1) : val;
> I may not be thinking straight today since I have a cold, but doesn't
> patch 2/2 encode negative values as 2's complement, and an s32 variable
> in the kernel is also encoded as 2's complement, so all you need here is
> a cast:
>
> 	*out_value = (s32)val;
>
> ... since the cast doesn't change the binary representation?

This is correct if all architecture follows the 2's complement for -Ve 
number representation.
If this is true then the patch will become more easy.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
