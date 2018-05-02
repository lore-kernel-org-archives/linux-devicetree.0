From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/4] ARM: dts: Add cryptographic support for stm32mp157c
Date: Wed, 2 May 2018 17:50:07 +0200
Message-ID: <27c3293a-bfbf-6410-68da-6750371e79e6@st.com>
References: <20180423151947.2526-1-lionel.debieve@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180423151947.2526-1-lionel.debieve@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lionel Debieve <lionel.debieve@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Lionel,

On 04/23/2018 05:19 PM, Lionel Debieve wrote:
> Patches serie add support or RNG, CRYP and CRC IPs for stm32mp157c SoC
> and add RNG default support for ev1 board.
> 
> Lionel Debieve (4):
>    ARM: dts: stm32: Add RNG support on stm32mp157c
>    ARM: dts: stm32: Enable RNG for stm32mp157c-ed1
>    ARM: dts: stm32: Add CRYP support on stm32mp157c
>    ARM: dts: stm32: Add CRC support on stm32mp157c
> 
>   arch/arm/boot/dts/stm32mp157c-ed1.dts |  4 ++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 25 +++++++++++++++++++++++++
>   2 files changed, 29 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
