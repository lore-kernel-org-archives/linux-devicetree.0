From: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v3 0/3] clk: stm32: Add clock driver for STM32F4[23]xxx devices
Date: Tue, 23 Jun 2015 11:24:26 +0200
Message-ID: <CALszF6Dw7hWATpjVvpxmitKWSJ458JXWOZFXMjudcW_jaNiZdw@mail.gmail.com>
References: <1432327273-6810-1-git-send-email-daniel.thompson@linaro.org>
	<1433966978-24422-1-git-send-email-daniel.thompson@linaro.org>
	<20150622224832.GI22132@codeaurora.org>
	<55891729.7070809@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <55891729.7070809@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kamil Lulko <rev13@wp.pl>, Andreas Farber <afaerber@suse.de>, linux-clk@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

2015-06-23 10:22 GMT+02:00 Daniel Thompson <daniel.thompson@linaro.org>:
> On 22/06/15 23:48, Stephen Boyd wrote:
>>
>> On 06/10, Daniel Thompson wrote:
>>>
>>> This patchset implements a clock driver for STM32F42xxx and STM32F43xxx
>>> series devices. It supports decoding the state configured by the
>>> bootloader (PLL, clock select, bus dividers) and all the gates clocks.
>>> It does not currently support the I2S and SAI PLLs.
>>>
>>> Relies on "Add support to STMicroeletronics STM32 family" v9 by Maxime
>>> Coquelin: http://thread.gmane.org/gmane.linux.kernel/1961049 .
>>>
>>
>> I applied 1 and 2. Looks like #3 should go through arm-soc at
>> some later time?
>
>
> Agreed (that is also the patch that must be correctly ordered w.r.t.
> Maxime's patches).

Indeed, I will take care of patch 3.

Thanks,
Maxime
