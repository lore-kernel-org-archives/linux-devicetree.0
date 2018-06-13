From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: hikey: Define wl1835 power capabilities
Date: Wed, 13 Jun 2018 21:53:32 +0300
Message-ID: <87tvq6a577.fsf@kamboji.qca.qualcomm.com>
References: <20180613151305.17240-1-ryan@edited.us>
        <CANcMJZASEDRxaXwdG96nNeEDPrDm_ap5MjhXonEcg=yHZ8F=qg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANcMJZASEDRxaXwdG96nNeEDPrDm_ap5MjhXonEcg=yHZ8F=qg@mail.gmail.com>
        (John Stultz's message of "Wed, 13 Jun 2018 11:30:00 -0700")
Sender: linux-kernel-owner@vger.kernel.org
To: John Stultz <john.stultz@linaro.org>
Cc: Ryan Grachek <ryan@edited.us>, Wei Xu <xuwei5@hisilicon.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eyal Reizer <eyalr@ti.com>, Tony Lindgren <tony@atomide.com>, Valentin Schneider <Valentin.Schneider@arm.com>, linux-wireless@vger.kernel.org
List-Id: devicetree@vger.kernel.org

John Stultz <john.stultz@linaro.org> writes:

> On Wed, Jun 13, 2018 at 8:13 AM, Ryan Grachek <ryan@edited.us> wrote:
>> These properties are required for compatibility with runtime PM.
>> Without these properties, MMC host controller will not be aware
>> of power capabilities. When the wlcore driver attempts to power
>> on the device, it will erroneously fail with -EACCES.
>>
>> Signed-off-by: Ryan Grachek <ryan@edited.us>
>
> Fixes: 60f36637bbbd ("wlcore: sdio: allow pm to handle sdio power")
> Tested-by: John Stultz <john.stultz@linaro.org>
> Acked-by: John Stultz <john.stultz@linaro.org>
>
> Wei Xu: This fixes a functional regression with wifi on the HiKey
> board that was introduced in 4.18-rc with commit 60f36637bbbd
> ("wlcore: sdio: allow pm to handle sdio power").
>
> Could you please be sure to queue this for the 4.18-rc ?

Adding linux-wireless so that wireless folks are aware of this wlcore
regression fix as well.

-- 
Kalle Valo
