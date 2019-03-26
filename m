From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/7] ARM: dts: stm32: add support of sdmmc1 on stm32
Date: Tue, 26 Mar 2019 11:22:42 +0100
Message-ID: <5178f61f-bb8d-f30c-68cd-0bd8d0889a34@st.com>
References: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551430068-9456-1-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Ludovic

On 3/1/19 9:47 AM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series adds support of sdmmc1 on:
> -stm32h743i (boards: eval, disco)
> -stm32mp1 (boards: ed1, dk1)
> 
> Ludovic Barre (7):
>    ARM: stm32: add AMBA support for stm32 family
>    ARM: dts: stm32: add sdmmc1 support on stm32h743
>    ARM: dts: stm32: add sdmmc1 support on stm32h743i eval board
>    ARM: dts: stm32: add sdmmc1 support on stm32h743i disco board
>    ARM: dts: stm32: add sdmmc1 support on stm32mp157c
>    ARM: dts: stm32: add sdmmc1 support on stm32mp157c ed1 board
>    ARM: dts: stm32: add sdmmc1 support on stm32mp157a dk1 board
> 
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi  | 68 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32h743.dtsi          | 14 +++++++
>   arch/arm/boot/dts/stm32h743i-disco.dts    | 20 +++++++++
>   arch/arm/boot/dts/stm32h743i-eval.dts     | 23 ++++++++++-
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 68 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157a-dk1.dts     | 20 +++++++++
>   arch/arm/boot/dts/stm32mp157c-ed1.dts     | 37 +++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 14 +++++++
>   arch/arm/mach-stm32/Kconfig               |  5 +--
>   9 files changed, 264 insertions(+), 5 deletions(-)
> 

Series applied on stm32-next.

Regards
Alex
