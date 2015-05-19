From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v7 08/13] ARM: unify MMU/!MMU addruart calls
Date: Tue, 19 May 2015 23:37:33 +0200
Message-ID: <CAGhQ9VwSNX0tgzyozm99zLFpKq2c1Wz=4xwjqT3dwNkzTs2bYw@mail.gmail.com>
References: <1431769465-26867-1-git-send-email-stefan@agner.ch>
	<2419398.cbLWQC7K5f@wuerfel>
	<b41ebeb9d62b9c49faec6500f73460b9@agner.ch>
	<5548280.7uBnLuun8k@wuerfel>
	<0103afd0e9dd50c1bf85153a38a3490f@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0103afd0e9dd50c1bf85153a38a3490f@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, mark.rutland@arm.com, mcoquelin.stm32@gmail.com, Russell King - ARM Linux <linux@arm.linux.org.uk>, jason@lakedaemon.net, Pawel Moll <pawel.moll@arm.com>, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Olof Johansson <olof@lixom.net>, Kumar Gala <galak@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>, shawn.guo@linaro.org, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stefan,

On 19 May 2015 at 23:26, Stefan Agner <stefan@agner.ch> wrote:
> On 2015-05-19 20:24, Arnd Bergmann wrote:
>> On Tuesday 19 May 2015 18:06:53 Stefan Agner wrote:
>>> On 2015-05-19 13:50, Arnd Bergmann wrote:
>>> > Do you have a dependency on patch 10 (the one for EFM32) in your later
>>> > patches?
>>>
>>> Unfortunately, there is a dependency on that patch: I change the default
>>> of UNCOMPRESS_INCLUDE to debug/uncompress.h for all ARM_SINGLE_ARMV7M
>>> platforms. Without that patch, it would default to mach/uncompress.h,
>>> which does not exist for MACH_MXC/SOC_VF610.
>>
>> An easy approach would be to list both ARM_SINGLE_ARMV7M and
>> EFM32 in the UNCOMPRESS_INCLUDE option initially, and then
>> follow-up with a patch that converts the three other platforms
>> (efm32, stm32 and lpc18xx) to ARM_SINGLE_ARMV7M and also
>> change the UNCOMPRESS_INCLUDE statement.
>>
>> Note that I've already added both stm32 and lpc18xx to the
>> UNCOMPRESS_INCLUDE list in the next/soc branch.
>
> Afaiks, only ARCH_LPC18XX is in UNCOMPRESS_INCLUDE, probably STM32
> doesn't support compressed image/earlyprintk?

See: http://marc.info/?l=linux-arm-kernel&m=143196230014437&w=2

Seems like Arnd hasn't pushed it to the repo yet, though.

>>> > If not, you can send the other ones to Shawn, so I pull them as
>>> > a branch, and then I apply that on top of the merges. I have also
>>> > merged two other ARMv7M platforms for 4.2 now (both in next/soc),
>>> > so we should do the same change for those as well, and I'd rather
>>> > apply a patch for that, than merge a branch that is based on
>>> > next/soc.
>>>
>>> I guess, in that case, you need to take the others too? (08/09?)
>>
>> I'm fine with that, too. If Shawn thinks the patches are ok, you can
>> just send all patches you want me to apply in arm-soc based on
>> the appropriate branches (next/soc, next/dt and next/defconfig, I
>> presume), and I'll apply them this time. In the future, you should
>> send all patches to Shawn though.
>
> Ok, I will rebase this patchset (06-13) then, send the clocksource patch
> (07) as a single patch and send the EFM32 convertion patch (10) together
> with a conversion patch of the other two platforms as a follow-up.

Thanks for fixing up LPC18xx as well.

regards,
Joachim Eastwood
