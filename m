From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/5] misc: eeprom_93xx46: Implement eeprom_93xx46 DT
 bindings.
Date: Thu, 19 Nov 2015 18:14:46 +0200
Message-ID: <564DF576.9010807@mleia.com>
References: <1447903781-3910-1-git-send-email-cory.tusar@pid1solutions.com> <1447903781-3910-4-git-send-email-cory.tusar@pid1solutions.com> <564D632D.8020107@mleia.com> <564DD5E7.6080700@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <564DD5E7.6080700-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>, Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agust-ynQEQJNshbs@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Chris.Healy-c8ZVq/bFV1I@public.gmane.org, Keith.Vennel-c8ZVq/bFV1I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Andrew,

On 19.11.2015 16:00, Andrew F. Davis wrote:
> On 11/18/2015 11:50 PM, Vladimir Zapolskiy wrote:
>> Hi Cory,
>>
>> On 19.11.2015 05:29, Cory Tusar wrote:
>>> This commit implements bindings in the eeprom_93xx46 driver allowing
>>> device word size and read-only attributes to be specified via
>>> devicetree.
>>>
>>> Signed-off-by: Cory Tusar <cory.tusar-J6Z/VSE8EyIAspv4Qr0y0gC/G2K4zDHf@public.gmane.org>
>>> ---

[snip]

>>> +
>>> +#else
>>> +static inline int eeprom_93xx46_probe_dt(struct spi_device *spi)
>>> +{
>>> +	return 0;
>>> +}
>>> +#endif
>>> +
>>
>> I actually don't see a point to have #ifdef CONFIG_OF here.
>>
> 
> Usually to avoid a lot of dead code and data when OF is not enabled.
> 

This is a premature optimization.


Also please see Documentation/CodingStyle, Chapter 20: Conditional
Compilation:

	Wherever possible, don't use preprocessor conditionals
	(#if, #ifdef) in .c files; doing so makes code harder to read
	and logic harder to follow.  Instead, use such conditionals in
	a header file defining functions for use in those .c files,
	providing no-op stub versions in the #else case, and then call
	those functions unconditionally from .c files.  The compiler
	will avoid generating any code for the stub calls, producing
	identical results, but the logic will remain easy to follow.

etc.

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
