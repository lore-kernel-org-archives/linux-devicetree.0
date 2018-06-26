From: Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH] arm64: dts: hikey: Define wl1835 power capabilities
Date: Tue, 26 Jun 2018 09:25:44 +0100
Message-ID: <5B31F888.7010403@hisilicon.com>
References: <20180613151305.17240-1-ryan@edited.us>
 <CANcMJZASEDRxaXwdG96nNeEDPrDm_ap5MjhXonEcg=yHZ8F=qg@mail.gmail.com>
 <CALAqxLWjJKsU+XJmANzx-aO2ruszwbBnPV2yV5WoyVStO+5K0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CALAqxLWjJKsU+XJmANzx-aO2ruszwbBnPV2yV5WoyVStO+5K0A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>, Ryan Grachek <ryan@edited.us>
Cc: Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eyal Reizer <eyalr@ti.com>, Rob Herring <robh+dt@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Valentin Schneider <Valentin.Schneider@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-wireless@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi John,

On 2018/6/25 22:56, John Stultz wrote:
> On Wed, Jun 13, 2018 at 11:30 AM, John Stultz <john.stultz@linaro.org> wrote:
>> On Wed, Jun 13, 2018 at 8:13 AM, Ryan Grachek <ryan@edited.us> wrote:
>>> These properties are required for compatibility with runtime PM.
>>> Without these properties, MMC host controller will not be aware
>>> of power capabilities. When the wlcore driver attempts to power
>>> on the device, it will erroneously fail with -EACCES.
>>>
>>> Signed-off-by: Ryan Grachek <ryan@edited.us>
>>
>> Fixes: 60f36637bbbd ("wlcore: sdio: allow pm to handle sdio power")
>> Tested-by: John Stultz <john.stultz@linaro.org>
>> Acked-by: John Stultz <john.stultz@linaro.org>
>>
>> Wei Xu: This fixes a functional regression with wifi on the HiKey
>> board that was introduced in 4.18-rc with commit 60f36637bbbd
>> ("wlcore: sdio: allow pm to handle sdio power").
> 
> Wei Xu: Just wanted to follow up to make sure this wasn't missed for
> 4.18-rc, as I haven't seen it upstream or in -next, and it fixes a
> recently introduced regression.

Thanks!
I will send out the fix pull request in these two days if no problem.

Best Regards,
Wei

> 
> thanks
> -john
> 
> .
> 
