From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: add Qualcomm Technologies HIDMA management driver
Date: Fri, 30 Oct 2015 20:40:47 +0200
Message-ID: <CAHp75Vd-z22XJboxQ=CMxDQ9UaTatbCmpAPLO0jPM0FwJadBOg@mail.gmail.com>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
	<20151030150025.GF31073@leverpostej>
	<CAHp75VdHxGC841cFY3M+ujZKSX04nT4+7gc3iKsgwzLRC4AYWQ@mail.gmail.com>
	<5633B207.5030505@codeaurora.org>
	<CAHp75Ve_7NeyJD==EpgzKes9n9wb5oTwtNt7FvZHUSUxqZ4+=Q@mail.gmail.com>
	<20151030182537.GB30791@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151030182537.GB30791@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 8:25 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:

>> > CSRT is an Intel specific ACPI table for slave devices.
>>
>> Wrong.
>> It was designed by Microsoft to support multiple controllers, in
>> particular DMACs.
>> Have you read that document I posted link to?
>>
>> > It was decided by
>> > Linaro that CSRT will not be supported for ARM64.
>>
>> Interesting, ARM64 platforms are not going to have more than one DMAC
>> per system?
>
> I cannot imagine that being true, and I don't see why Linaro would
> decide such a thing.
>
> It does appear that it's not relevant to this device and driver, given
> the lack of clients, unless I've misunderstood?

Yeah, just a side note.

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
