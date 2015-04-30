From: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] coresight: replicator: Add Qualcomm CoreSight
 Replicator driver
Date: Thu, 30 Apr 2015 07:07:42 -0600
Message-ID: <CANLsYkwhegfrnCbWk_o=3W26LNoAampFa+_TV4OLFFnm3SOszA@mail.gmail.com>
References: <1430310000-10867-1-git-send-email-ivan.ivanov@linaro.org>
	<1430310000-10867-2-git-send-email-ivan.ivanov@linaro.org>
	<CANLsYkwfDYjTqBUvXp2da6E=SA8F2EbH7_Mi20Sba9NpJm9Y7g@mail.gmail.com>
	<1430378466.2400.8.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430378466.2400.8.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Ivan T. Ivanov" <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30 April 2015 at 01:21, Ivan T. Ivanov <ivan.ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> On Wed, 2015-04-29 at 10:28 -0600, Mathieu Poirier wrote:
>> On 29 April 2015 at 06:19, Ivan T. Ivanov ivanov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
> <snip>
>
>> >                 - "arm,coresight-etm4x", "arm,primecell";
>> > +               - "qcom,coresight-replicator", "arm,primecell";
>>
>> Is there some sort of versioning information we can add like it was
>> done for the "coresight-etmXY" bindings?  It makes things a lot
>> cleaner when a new (and possibly not backward compatible) version gets
>> released.
>>
>
> From what I can see, it is version 1. I could add it to compatible
> string, but suldn't we use amba_id for this reason.

amba_id work well for devices within the same family and compatible up
to a certain point.  When revisions change backward compatibility is
usually not kept and it becomes a nightmare to maintain.

>
>> >         * reg: physical base address and length of the register
>> >           set(s) of the component.
>> > diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> > index 6b331d4..165b681 100644
>> > --- a/drivers/hwtracing/coresight/Kconfig
>> > +++ b/drivers/hwtracing/coresight/Kconfig
>> > @@ -68,4 +68,13 @@ config CORESIGHT_SOURCE_ETM4X
>> >           instructions that a processor is executing. This is primarily useful
>> >           for instruction level tracing. Depending on the implemented version
>> >           data tracing may also be available.
>> > +
>> > +config CORESIGHT_QCOM_REPLICATOR
>> > +       bool "Qualcomm CoreSight Replicator driver"
>> > +       help
>> > +         This enables support for CoreSight link and sink driver that are
>> > +         responsible for transporting and collecting the trace data
>> > +         respectively. Link and sinks are dynamically aggregated with a trace
>> > +         entity at run time to form a complete trace path.
>>
>> The replicator is only a link entity.  It is only transporting trace
>> data information rather than collecting it.  Please review the
>> comment.
>
> True, sorry. copy and paste from CORESIGHT_LINKS_AND_SINKS.
>
>> Also, can this specific version run on both V7 and V8
>> architecture.  If not the proper "depends" should be added.
>>
>
> Same driver/device on both architectures.
>
> Will fix rest of the comments and will resend.
>
> Thank you,
> Ivan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
