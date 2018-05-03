From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] ARM: dts: stm32: add qspi support for stm32mp157c
Date: Thu, 3 May 2018 15:06:28 +0200
Message-ID: <e6ab9571-c227-9246-3b34-f28420f0dbd5@st.com>
References: <1525072281-17472-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525072281-17472-1-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ludovic,

On 04/30/2018 09:11 AM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series adds qspi support for stm32mp157c SoC
> and its eval board.
> 
> Ludovic Barre (2):
>    ARM: dts: stm32: add qspi support for stm32mp157c
>    ARM: dts: stm32: add flash nor support on stm32mp157c eval board
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 45 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 25 +++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 11 ++++++++
>   3 files changed, 81 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
