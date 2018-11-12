From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] ARM: dts: stm32: add dmas to stm32mp157c timers
Date: Mon, 12 Nov 2018 10:10:30 +0100
Message-ID: <f490c7c8-7920-2c28-8e1f-80021516db24@st.com>
References: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1538579465-7854-1-git-send-email-fabrice.gasnier@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Fabrice

On 10/3/18 5:11 PM, Fabrice Gasnier wrote:
> This series adds dmas description to stm32mp157c device tree file.
> But dmas are kept disabled by default on all boards. They are only
> necessary for PWM capture. So, spare them for other usage by default.
> 
> Fabrice Gasnier (3):
>    ARM: dts: stm32: Add dmas to timer on stm32mp157c
>    ARM: dts: stm32: don't use timers dmas on stm32mp157c-ed1
>    ARM: dts: stm32: don't use timers dmas on stm32mp157c-ev1
> 
>   arch/arm/boot/dts/stm32mp157c-ed1.dts |  3 ++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts |  7 +++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 58 +++++++++++++++++++++++++++++++++++
>   3 files changed, 68 insertions(+)
> 

Series applied on stm32-next.

Thanks!

Alex
