From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V7 1/8] mfd: add device-tree binding doc for PMIC max77620/max20024
Date: Tue, 9 Feb 2016 23:26:41 +0530
Message-ID: <56BA2859.2040605@nvidia.com>
References: <1454171931-27752-1-git-send-email-ldewangan@nvidia.com> <1454171931-27752-2-git-send-email-ldewangan@nvidia.com> <20160209154215.GF24522@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160209154215.GF24522@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com
List-Id: devicetree@vger.kernel.org


On Tuesday 09 February 2016 09:12 PM, Lee Jones wrote:
> On Sat, 30 Jan 2016, Laxman Dewangan wrote:
>
> +	Normal mode also called as active mode on which all step-down
> +		regulators, all linear regulators, GPIOs, and the 32kHz
> +		oscillator are in normal active mode.
> +	sleep mode: Regulators/GPIOs/clock can go on OFF state based on
> "can go on OFF state"?

Regulator/GPIO has two states, enable and disable. If sleep mode is 
configured for these resource and external signal triggers to sleep then 
this get disabled.
>> +	Different modes of regulators/clock/GPIOs are controlled by the their
>> +FPS configurations. There is different configuration registers for each of
>> +these resources. Typical configurations per resource are:
>> +	FPS source: 	Attach the resource to required FPS source. When
>> +			resources are attached to one of FPS source then
>> +			resournce can be enable/disable when related FPS
> Have you used spell check?  I suggest you do.

My bad, I did but mixed with technical ignorance. Will try best.

>
>> +			source gets the control signal for ON and OFF.
>> +	Power on slot: 	Slot number on which resource is ON once FPS source
>> +			get ON signal.
> Can you find another way of explaining this please?

Hmm..
Does it look fine:
There is 8 slots for each FPS on which resource can get enabled. This 
property provides the slot number on which resource gets enabled after 
FPS sequence started.


>
>
> +
> +-maxim,enable-sleep: 		    Boolean, enable sleep state of PMIC
> We already have bindings for sleeping.  Please use a generic one.

Which property? Saw sleep property with vendor prefix.

