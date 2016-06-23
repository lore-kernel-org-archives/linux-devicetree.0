From: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v4 2/2] reset: add TI SYSCON based reset driver
Date: Thu, 23 Jun 2016 09:28:29 -0500
Message-ID: <576BF20D.8040504@ti.com>
References: <20160620184607.4380-1-afd@ti.com>
 <20160620184607.4380-3-afd@ti.com> <1466590772.4123.38.camel@pengutronix.de>
 <576AEB17.7070302@ti.com> <1466672754.2278.34.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466672754.2278.34.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 06/23/2016 04:05 AM, Philipp Zabel wrote:
> Am Mittwoch, den 22.06.2016, 14:46 -0500 schrieb Andrew F. Davis:
> [...]
>>>> +	depends on HAS_IOMEM
>>>> +	select MFD_SYSCON
>>>> +	help
>>>> +	  This enables the reset driver support for TI devices with
>>>> +	  memory-mapped reset registers as part of a syscon device node. If
>>>> +	  you wish to use the reset framework for such memory-mapped devices,
>>>> +	  say Y here. Otherwise, say N.
>>>
>>> Actually, do you need the user configurable option at all?
>>
>> I'm not sure, right now it is selected by other things, but that is true
>> for much of Kconfig, it is not platform dependent so it doesn't need to
>> only be enabled by arch, it probably isn't hurting anything to leave it?
> 
> No, that's okay. So the intention is to make it possible to enable it
> for COMPILE_TESTs on architectures other than TI?
> 

I was thinking more that it should be usable on non-TI architectures and
so can be user enabled if needed.

> [...]
>>>> +	if (control->toggle)
>>>> +		return -ENOSYS; /* status not supported for this reset */
>>>
>>> That should be -ENOTSUPP.
>>>
>>
>> Will fix.
>>
>>> Are you sure that reading status is not supported for your trigger
>>> resets?
>>> On i.MX6 the triggered reset bits are self-clearing, for example, but
>>> only after the reset sequence is finished. So it is possible to read the
>>> reset status there.
>>
>> All the resets we have should have separate status bits, this trigger
>> flag was added for systems that don't have and readable status bits
>> (like some trigger resets), maybe the name should be changed?
> 
> I misunderstood. With "trigger" I mean a reset line that can't be
> controlled directly, so the driver should implement .reset() to trigger
> a reset sequence instead of .assert()/.deassert() to control the level.
> Whether or not the status can be read is something different.
> 
> If you don't need it yet, you could just drop it for now, But if we want
> to make this as universally useful as possible, we should be sure that
> we cover most existing cases before defining the binding options.
> 
> The hisilicon driver for example has just been changed to syscon. There
> the assert and deassert bits are in different registers and the status
> can't be read at all. To support that, too, we'd have to add a third
> register/bit pair to the binding...
> 
> So far, I have seen the following variants. Depending on the hardware, a
> reset could be:
> - asserted by setting a bit
> - asserted by clearing a bit
> - deasserted by clearing/setting the same bit
> - deasserted by setting/clearing the same bit in another register
> - triggered to be asserted/deasserted automatically with some specific
>   timing that the hardware knows about (in that case the manual
>   assert/deassert is not available)
> The status of the reset line could be read via
> - the same bit that is used to assert/deassert
> - the same bit in another register
> - not at all
> 
> What I've not yet seen but surely exists somewhere is the case where
> assert/deassert/status bits are at different bit positions either in the
> same register or in different registers.
> 

Exactly why I was thinking having a node for the resets would be more
future proof, we could add more properties later:

pscrst-dsp: dsp {
	reset-control = <0xa3c 8 RESET_ASSERT_CLEAR>;
	reset-status = <0x83c 8 RESET_ASSERT_CLEAR>;
+	reset-deassert = <0x840 3 RESET_ASSERT_SET>;
+	reset-toggle-time-ms = <20>;
};

While a fixed length array does make for a more condensed binding we
don't get much flexibility.

What we could also do is have a longer array then use macros to trim it
down for simple cases:

reset-bits = <
	SINGLE_BIT_RESET(0xa3c, 8)
	SINGLE_BIT_RESET(0xa40, 7)
	SINGLE_BIT_RESET(0xa44, 6)
>;

Each real entry could have 9 fields that the macro would expand into:
	(assert reg) (assert bit) (assert flag)
	(deassert reg) (deassert bit) (deassert flag)
	(status reg) (status bit) (status flag)

This would be able to handle all of the above cases except the timing
one, that case can always be handled by a dedicated driver for that system.



My goal here, I would like to believe, aligns with the goals of DT in
general, I would like to see one kernel work on many platforms without
having to compile-in a bunch of SoC specific info. Some SoCs will need
their own reset driver for when they do something unique (like this
reset driver I will post next cycle which sends a message to a power
management chip for its resets:
http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=blob;f=drivers/reset/reset-ti-sci.c;h=3636dc176c8b5c4449eefc1fe13df7b912cec73e;hb=refs/heads/ti-lsk-linux-4.4.y
)
but I see no reason a bunch of different drivers for simple register bit
resets with the only difference being a #define offset. I hope that this
effort will get ahead of these drivers and reduce the maintenance burden
for you.

So how much is handled by this driver is up to you, (hopefully without
trying to handle every possible case :)).

Thanks,
Andrew
