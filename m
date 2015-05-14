From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/5] arm64: Juno: Split juno.dts into juno-base.dtsi and
 juno.dts.
Date: Thu, 14 May 2015 14:44:44 +0100
Message-ID: <5554A6CC.7050903@arm.com>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>	 <1431537092-19597-3-git-send-email-Liviu.Dudau@arm.com>	 <1431596142.2881.13.camel@linaro.org>	 <20150514103040.GN2345@e106497-lin.cambridge.arm.com> <1431601471.2881.36.camel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431601471.2881.36.camel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jon Medhurst (Tixy)" <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/05/15 12:04, Jon Medhurst (Tixy) wrote:
> On Thu, 2015-05-14 at 11:30 +0100, Liviu Dudau wrote:
>> On Thu, May 14, 2015 at 10:35:42AM +0100, Jon Medhurst (Tixy) wrote:
> [...]
>>>
>>> What criteria were used to select the contents of juno-base.dtsi?
>>>  From what I can see, the stuff left out of base is still the same for r0
>>> and r1 (cpu, pmu, memory, psci!).
> [...]
>>
>> There are potential differences. Cortex-A53 cluster in r1 has limited
>> CPUfreq functionality due to a chip errata and there were talks internally
>> to actually disable it, hence the reason for keeping CPUs outside the
>> juno-base.dtsi. r2 will have a different set of big CPUs as well, so this
>> is preparing for the future as well.
>>
>> PMU are linked to the CPUs, hence the reason they stayed. As for the
>> memory and psci nodes the thinking behind it was mostly to allow for
>> ACPI to make changes there, but it does look now like retrofitting an
>> explanation to something that I did not give too much thought at that
>> moment.
>
> I guess my concern was motivated by the selfish aspect of having to
> maintain a bunch of out-of-tree Juno patches (like cpuidle and cpufreq

Hopefully not too long :)

> related DT updates) and having to duplicate those in more than one DT,
> and also having backport DT reorgs like this patch. Of course, none of
> that should be a consideration in deciding what goes into mainline, I
> just wanted to make sure there was a reason for the patch.
>

But I agree with you to remove duplicates as much as possible. Since
it's not possible to speculate how things will be in future platform,
IMO we can have all the device nodes that are common to both r0 and r1
in juno-base.dtsi for now and move them out as and when required.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
