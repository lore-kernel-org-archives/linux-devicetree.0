From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/2] ARM: dts: stm32: qspi update for stm32mp157c-ev1
Date: Tue, 21 May 2019 10:41:46 +0200
Message-ID: <4932a2fd-eca1-d802-812a-7246b3dd12ec@st.com>
References: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552057823-10876-1-git-send-email-ludovic.Barre@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Ludovic Barre <ludovic.Barre@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
List-Id: devicetree@vger.kernel.org

Hi Ludovic

On 3/8/19 4:10 PM, Ludovic Barre wrote:
> From: Ludovic Barre <ludovic.barre@st.com>
> 
> This patch series add sleep pins configuration needed to suspend support
> and add jedec compatible for 2 nor flash of stm32mp157c-ev1.
> 
> Ludovic Barre (2):
>    ARM: dts: stm32: add pinctrl sleep config for qspi on stm32mp157c-ev1
>    ARM: dts: stm32: add jedec compatible for nor flash on stm32mp157c-ev1
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 26 ++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     |  5 ++++-
>   2 files changed, 30 insertions(+), 1 deletion(-)
> 

Series applied on stm32-next.

Regards
Alex
