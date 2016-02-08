From: Martin Sperl <kernel@martin.sperl.org>
Subject: Re: [PATCH V4 1/7] clk: bcm2835: the minimum clock divider is 2
Date: Mon, 8 Feb 2016 11:39:49 +0100
Message-ID: <56B87075.8000304@martin.sperl.org>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org>
 <1452867667-2447-2-git-send-email-kernel@martin.sperl.org>
 <87oac03tuz.fsf@eliezer.anholt.net> <87egcv5153.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <87egcv5153.fsf@eliezer.anholt.net>
Sender: linux-clk-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 02.02.2016 02:52, Eric Anholt wrote:
> Eric Anholt <eric@anholt.net> writes:
>
>> kernel@martin.sperl.org writes:
>>
>>> From: Martin Sperl <kernel@martin.sperl.org>
>>>
>>> Testing with different clock divider values has shown
>>> that (at least for the PCM clock) the clock divider
>>> has to be at least 2, otherwise the clock will not
>>> output a signal.
>>
>> For a MASH clock (PWM, PCM, SLIMBUS, but not the others), the minimum
>> integer component of the divider is:
>>
>> mash 0: 1
>> mash 1: 2
>> mash 2: 3
>> mash 3: 5
>
> More specific MASH list:
>
> GP0
> GP1
> (*not* gp2)
> PCM
> PWM
> SLIM
>
I got the list from the broadcom provided headers for the VC4.
and where CM_*_DIV range does not start at 12 we have a fractional
divider (also requires if CM_*_FRAC or CM_*_MASH is set)

And if CM_*_MASH is set we got a mash enabled clock:
CM_GNRICCTL_MASH
CM_GP0CTL_MASH
CM_GP1CTL_MASH
CM_PCMCTL_MASH
CM_PWMCTL_MASH
CM_SLIMCTL_MASH

And this is what can get implemented by configuring mash
in the DT - otherwise only frac (a.k.a. MASH = 1) is
used for any clock that has .frac_bits > 0.
