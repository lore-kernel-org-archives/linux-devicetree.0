From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] DT/arm,gic-v3: Update the ITS size in the examples
Date: Tue, 3 Oct 2017 16:03:56 +0100
Message-ID: <f0281d22-38b7-91db-17e8-115f22456d3c@arm.com>
References: <20171003142027.23243-1-julien.grall@linaro.org>
 <20171003145333.GE4931@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171003145333.GE4931@leverpostej>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 03/10/17 15:53, Mark Rutland wrote:
> On Tue, Oct 03, 2017 at 03:20:27PM +0100, Julien Grall wrote:
>> Currently, the examples are using 2MB for the ITS size. Per the
>> specification (section 8.18 in ARM IHI 0069D), the ITS address map is
>> 128KB.
>>
>> Update the examples to match the specification.
>>
>> Signed-off-by: Julien Grall <julien.grall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This looks sane to me, per my reading of that section of the spec.
> 
> Marc, was there some reason we used such a large size? Or was the extra
> zero unintentional?

It is just that counting zeroes is hard. I usually just type a bunch of
them and let careful people sort it out. ;-)

I'll apply that as a fix.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
