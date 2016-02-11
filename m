From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V7 1/8] mfd: add device-tree binding doc for PMIC max77620/max20024
Date: Thu, 11 Feb 2016 15:49:52 +0530
Message-ID: <56BC6048.7080500@nvidia.com>
References: <1454171931-27752-1-git-send-email-ldewangan@nvidia.com> <1454171931-27752-2-git-send-email-ldewangan@nvidia.com> <20160209154215.GF24522@x1> <56BA2859.2040605@nvidia.com> <20160210132333.GG24522@x1> <56BB3FB9.7050102@nvidia.com> <20160211092604.GG3782@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160211092604.GG3782@x1>
Sender: linux-gpio-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linus.walleij@linaro.org, gnurou@gmail.com, broonie@kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, rtc-linux@googlegroups.com, swarren@nvidia.com, treding@nvidia.com, k.kozlowski@samsung.com, vreddytalla@nvidia.com
List-Id: devicetree@vger.kernel.org


On Thursday 11 February 2016 02:56 PM, Lee Jones wrote:
> On Wed, 10 Feb 2016, Laxman Dewangan wrote:
>
>>
>> sleep: <0/1>
>>              0: sleep mode disable,
>>              1: sleep mode enable.
> Ideally yes.  This is obviously going to be used again.
>
> However;
>   - My fear is that it will get confused with the 'sleep' property in
>     Documentation/devicetree/booting-without-of.txt.
>   - Secondly, you would need to get Rob to Ack it.
>

Another thought, becasue this is just for enable/disable, why not we add 
property as "enable-sleep" of boolean type instead of u32 value type?

It is easy to describe the behavior with enable-sleep and 
enable-low-power-mode.

-enable-sleep:                  Boolean, when FPS event cleared
                                         (set to LOW), resources get 
disabled
                                         at the sequencing event 
corresponding
                                         to its FPS configuration register.

-enable-low-power-mode: Boolean, when FPS event cleared
                                         (set to LOW), resources sets into
                                         low power mode at the 
sequencing event
                                         corresponding to its FPS 
configuration
                                         register.

Both property can not be together.


Other approach is to club together
maxim,device-state-on-disabled-event : u32, describe the PMIC state
                                                             when FPS 
event cleared (set to LOW)
                                                             whether it 
should go to sleep state or
low-power state.
                                                                 1 = 
Device state is set to sleep
                                                                 2 = 
Device state is set to low power mode.
Absence of this property or other value will not change device state 
when FPS event
         cleared.


