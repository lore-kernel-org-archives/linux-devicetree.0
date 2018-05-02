From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v1 0/2] Add MDMA Support on STM32MP157C
Date: Wed, 2 May 2018 16:25:06 +0200
Message-ID: <0bcb0bea-cdc1-483e-4396-517d33e9e69f@st.com>
References: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524215707-14642-1-git-send-email-pierre-yves.mordret@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 04/20/2018 11:15 AM, Pierre-Yves MORDRET wrote:
> This patch adds MDMA support on STM32MP157C with configs and device tree.
> ---
>    Version history:
>       v1:
>          * Initial
> ---
> 
> Pierre-Yves MORDRET (2):
>    ARM: configs: stm32: Add MDMA support on STM32MP157C
>    ARM: dts: stm32: Add MDMA support on STM32MP157C
> 
>   arch/arm/boot/dts/stm32mp157c.dtsi | 10 ++++++++++
>   arch/arm/mach-stm32/Kconfig        |  1 +
>   2 files changed, 11 insertions(+)
> 

Series applied on stm32-next.
As said before I modified commit header for mach-stm32/Kconfig patch.

Regards
Alex
