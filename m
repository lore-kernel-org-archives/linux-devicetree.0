From: Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC 2/3] ARM: kernel: add support for cpu cache information
Date: Thu, 09 Jan 2014 19:35:03 +0000
Message-ID: <52CEF9E7.4070706@arm.com>
References: <1389209168-17189-1-git-send-email-sudeep.holla@arm.com> <1389209168-17189-3-git-send-email-sudeep.holla@arm.com> <20140108205754.GN27432@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140108205754.GN27432-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Sudeep.Holla-5wv7dgnIgG8@public.gmane.org, "x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Ashok Raj <ashok.raj-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 08/01/14 20:57, Russell King - ARM Linux wrote:
> On Wed, Jan 08, 2014 at 07:26:07PM +0000, Sudeep Holla wrote:
>> +#if __LINUX_ARM_ARCH__ < 7 /* pre ARMv7 */
>> +
>> +#define MAX_CACHE_LEVEL		1	/* Only 1 level supported */
>> +#define CTR_CTYPE_SHIFT		24
>> +#define CTR_CTYPE_MASK		(1 << CTR_CTYPE_SHIFT)
>> +
>> +static inline unsigned int get_ctr(void)
>> +{
>> +	unsigned int ctr;
>> +	asm volatile ("mrc p15, 0, %0, c0, c0, 1" : "=r" (ctr));
>> +	return ctr;
>> +}
>> +
>> +static enum cache_type get_cache_type(int level)
>> +{
>> +	if (level > MAX_CACHE_LEVEL)
>> +		return CACHE_TYPE_NOCACHE;
>> +	return get_ctr() & CTR_CTYPE_MASK ?
>> +		CACHE_TYPE_SEPARATE : CACHE_TYPE_UNIFIED;
> 
> So, what do we do for CPUs that don't implement the CTR?  Just return
> random rubbish based on decoding the CPU Identity register as if it
> were the cache type register?
> 

I assume you referring to some particular CPUs which don't implement this.
I could not find it as optional or IMPLEMENTATION defined in ARM ARM.
I might be missing to find it or there may be exceptions.
Can you please provide more information on that ?

Regards,
Sudeep

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
