From: jeffy <jeffy.chen@rock-chips.com>
Subject: Re: [RESENT PATCH v7 3/7] arm64: dts: rockchip: Update rt5514 devices'
 compatible for Gru
Date: Tue, 05 Sep 2017 12:26:22 +0800
Message-ID: <59AE276E.6090100@rock-chips.com>
References: <20170824045227.15504-1-jeffy.chen@rock-chips.com> <1649093.IvC24TsujL@diego> <59A6EF3C.5090308@rock-chips.com> <3717071.LIWpZa6hqd@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3717071.LIWpZa6hqd@diego>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, dgreid@chromium.org, briannorris@chromium.org, mka@chromium.org, dianders@chromium.org, devicetree@vger.kernel.org, Klaus Goger <klaus.goger@theobroma-systems.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Caesar Wang <wxt@rock-chips.com>, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 09/05/2017 06:33 AM, Heiko Stübner wrote:
> Am Donnerstag, 31. August 2017, 01:00:44 CEST schrieb jeffy:
>> On 08/30/2017 09:30 PM, Heiko Stübner wrote:
>>>>> -		compatible = "realtek,rt5514";
>>>>> +		compatible = "realtek,rt5514", "realtek,rt5514-i2c";
>>>
>>> the rt5514-i2c and -spi compatibles should be documented in the
>>> binding-txt
>>> of the chip, but I haven't found any mention of this.
>>>
>>>
>>> Heiko
>>
>> these compatibles are only used for our snd driver to detect rt5514 i2c
>> driver and rt5514 spi driver, suggested by Matthias at
>> https://patchwork.kernel.org/patch/9904731/
>>
>> should i add it in the rockchip,rk3399-gru-sound.txt or rt5514 binding
>> document?
>
> You're introducing new bindings for the codec, so they should of course
> part of the rt5514 binding.
ok, will do that.
and it looks like there's no binding for rt5514-spi, will add it too :)
>
>
> Heiko
>
>
>
>
