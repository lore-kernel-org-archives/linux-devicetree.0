From: Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH v2 4/5] clk: cygnus: add clock support for Broadcom Cygnus
Date: Wed, 7 Jan 2015 09:33:25 -0800
Message-ID: <54AD6DE5.20601@broadcom.com>
References: <1420500076-18302-5-git-send-email-rjui@broadcom.com> <2048376.BFrtW5tszK@wuerfel> <54AC99F3.8040703@broadcom.com> <2938966.fY2WjearG6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2938966.fY2WjearG6@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Matt Porter <mporter@linaro.org>, Alex Elder <elder@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org



On 1/7/2015 1:11 AM, Arnd Bergmann wrote:
> On Tuesday 06 January 2015 18:29:07 Ray Jui wrote:
>> On 1/6/2015 12:21 PM, Arnd Bergmann wrote:
>>> On Monday 05 January 2015 15:21:15 Ray Jui wrote:
>>>> +static const struct iproc_asiu_gate asiu_gate[BCM_CYGNUS_NUM_ASIU_CLKS] = {
>>>> +	[BCM_CYGNUS_ASIU_KEYPAD_CLK] =
>>>> +		asiu_gate_val(0x0, 7),
>>>> +	[BCM_CYGNUS_ASIU_ADC_CLK] =
>>>> +		asiu_gate_val(0x0, 9),
>>>> +	[BCM_CYGNUS_ASIU_PWM_CLK] =
>>>> +		asiu_gate_val(IPROC_CLK_INVALID_OFFSET, 0),
>>>> +};
>>>
>>> Here I think a better binding would be to pass the gate value in the
>>> clock specifier, rather than an artificial index. That would let
>>> you get rid of the BCM_CYGNUS_ASIU_KEYPAD_CLK/BCM_CYGNUS_ASIU_ADC_CLK
>>> macros.
>>>
>> You meant to pass in both the gate register offset and its bit shift
>> through the clock specifier? But isn't the current ASIU clock code much
>> more consistent with the rest of the iProc clock code?
> 
> For simple devices that don't need an index macro, I would always
> prefer not defining them, because they are a pain to maintain.
> For a simple gate clock controller, we could compute both the offset
> and bit number from a single integer.
> 
> However, I now saw upon taking a closer look that the asiu has both
> a gate and a divider, and the latter one is not as simple, so
> my comment doesn't apply here.
> 
> 	Arnd
> 
Okay. I'll leave this as it is and make other changes based on the
review. Thanks!
