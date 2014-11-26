From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] arm64: Add Juno board device tree.
Date: Wed, 26 Nov 2014 11:36:16 +0000
Message-ID: <5475BB30.9080802@arm.com>
References: <1415727131-4572-1-git-send-email-Liviu.Dudau@arm.com> <1415727131-4572-3-git-send-email-Liviu.Dudau@arm.com> <5475ABC0.3090007@arm.com> <20141126105918.GB828@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141126105918.GB828-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, device tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 26/11/14 10:59, Liviu Dudau wrote:
> On Wed, Nov 26, 2014 at 10:30:24AM +0000, Marc Zyngier wrote:
>> Hi Liviu,
>>
>> On 11/11/14 17:32, Liviu Dudau wrote:
>>> This adds support for ARM's Juno development board (rev 0).
>>> It enables most of the board peripherals: UART, I2C, USB, MMC and
>>> 100Mb ethernet. There is no support at the moment for clock setting
>>> and HDLCD driver which depends on it.
>>>
>>> Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  arch/arm64/boot/dts/arm/Makefile              |   1 +
>>>  arch/arm64/boot/dts/arm/juno-clocks.dtsi      |  45 ++++++
>>>  arch/arm64/boot/dts/arm/juno-motherboard.dtsi | 129 +++++++++++++++
>>>  arch/arm64/boot/dts/arm/juno.dts              | 218 ++++++++++++++++++++++++++
>>>  4 files changed, 393 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/arm/juno-clocks.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/arm/juno-motherboard.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/arm/juno.dts
>>>
>>
>> [...]
>>
>>> diff --git a/arch/arm64/boot/dts/arm/juno.dts b/arch/arm64/boot/dts/arm/juno.dts
>>> new file mode 100644
>>> index 0000000..097ecc4
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/arm/juno.dts
>>
>> [...]
>>
>>> +       timer {
>>> +               compatible = "arm,armv8-timer";
>>> +               interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>,
>>> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_EDGE_RISING)>;
>>> +       };
>>
>> Sorry, I should have spotted this earlier: all these interrupts are
>> *level*, not edge. This happens to work because the GIC's config
>> register is RO for PPIs on Juno, but still...
> 
> Yes, I've seen your other email to Suravee regarding interrupt triggering and I was trying to
> find the relevant bits in Juno to tell me why I've put the info in DT this way. Maybe I *did*
> copy-paste this part from FVP DT though.
> 
> I will send a patch to Olof to update.

Yeah, looks like most (if not all) DTs in the tree are broken. Any
chance you could write a sweeping patch to fix them all (at least for
the ARM implementations)?

The APM and Cavium implementations also carry the same values, and I
suppose this is a bug too, but someone with access to documentation
should figure this out.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
