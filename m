From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH v6 7/7] arm64: dts: berlin4ct: add default pinmux for
 uart0
Date: Fri, 16 Oct 2015 22:10:27 +0200
Message-ID: <562159B3.3010902@gmail.com>
References: <1444981032-4401-1-git-send-email-jszhang@marvell.com>
 <1444981032-4401-8-git-send-email-jszhang@marvell.com>
 <CACRpkdYUmkOB_9Rm_YXzqQDL8H7wXmptwwHeGbssQO_RK_G17w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYUmkOB_9Rm_YXzqQDL8H7wXmptwwHeGbssQO_RK_G17w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jisheng Zhang <jszhang@marvell.com>
Cc: =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, =?UTF-8?Q?Pawe=c5=82_Moll?= <pawel.moll@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 16.10.2015 16:18, Linus Walleij wrote:
> On Fri, Oct 16, 2015 at 9:37 AM, Jisheng Zhang <jszhang@marvell.com> wrote:
>
>> Add urt0 txd and rxd muxing setup in the dtsi because uart0 always uses
>> them to work, no other possibilities.
>>
>> Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
>> Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
>> Acked-by: Antoine Tenart <antoine.tenart@free-electrons.com>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Funnel this through ARM SoC.

Applied to berlin64/dt with Linus' Ack.

Thanks,
Sebastian

