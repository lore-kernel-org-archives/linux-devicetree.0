From: Ganapatrao Kulkarni <gpkulkarni-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 1/4] arm64: defconfig: increase NR_CPUS range to 2-128
Date: Mon, 6 Oct 2014 09:59:00 +0530
Message-ID: <CAFpQJXWDriyO4tCPGXihPUa=hC9K_-byuLEEtSfw0cU39ipdqA@mail.gmail.com>
References: <1411635840-24038-1-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<1411635840-24038-2-git-send-email-ganapatrao.kulkarni@caviumnetworks.com>
	<20141003105839.GD26643@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141003105839.GD26643@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 3, 2014 at 4:28 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Sep 25, 2014 at 10:03:56AM +0100, Ganapatrao Kulkarni wrote:
>> Raising the maximum limit to 128. This is needed for Cavium's
>> Thunder systems that will have 96 cores on Multi-node system.
>
> Has this been tested on any such systems?
This is tested on Cavium's Thunder 2 Node Simulator with kernel 3.17-rc5.
please let us know, if any specific configurations needs to be tested
with the change.
>
> Mark.
>
>>
>> Signed-off-by: Ganapatrao Kulkarni <ganapatrao.kulkarni-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
>> ---
>>  arch/arm64/Kconfig | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 4d42453..a409105 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -296,8 +296,8 @@ config SCHED_SMT
>>         places. If unsure say N here.
>>
>>  config NR_CPUS
>> -     int "Maximum number of CPUs (2-64)"
>> -     range 2 64
>> +     int "Maximum number of CPUs (2-128)"
>> +     range 2 128
>>       depends on SMP
>>       # These have to remain sorted largest to smallest
>>       default "64"
>> --
>> 1.8.1.4
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
thanks
ganapat
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
