From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/2] Add I2C support for STM32H743
Date: Thu, 3 May 2018 17:38:58 +0200
Message-ID: <73ba5cf4-3ea5-497f-b5c1-808aadff1515@st.com>
References: <1524215122-14046-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215122-14046-1-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04/20/2018 11:05 AM, Pierre-Yves MORDRET wrote:
> Add I2C support on STM32H743 SoC.
> Activate I2C1 on STM32H743I Evaluation Board.
> ---
>    Version history:
>       v1:
>          * Initial
> ---
> 
> Pierre-Yves MORDRET (2):
>    ARM: dts: stm32: Add I2C support for STM32H743 SoC
>    ARM: dts: stm32: Add I2C1 support for STM32H743I-EVAL Board
> 
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 10 +++++++
>   arch/arm/boot/dts/stm32h743.dtsi         | 48 ++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32h743i-eval.dts    |  8 ++++++
>   3 files changed, 66 insertions(+)
> 

Series applied on stm32-next.

Regards
Alex
