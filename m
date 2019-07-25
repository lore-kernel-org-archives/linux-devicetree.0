From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/4] ARM: dts: stm32: enable FMC2 NAND controller on
 stm32mp157c-ev1
Date: Thu, 25 Jul 2019 12:20:34 +0200
Message-ID: <cc4c56ca-c3cb-fc8c-e223-4b98754d3592@st.com>
References: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561128590-14621-1-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christophe Kerello <christophe.kerello@st.com>, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, olof@lixom.net, arnd@arndb.de
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Christophe

On 6/21/19 4:49 PM, Christophe Kerello wrote:
> This patchset adds and enables FMC2 NAND controller used on
> stm32mp157c-ev1.
> 
> Christophe Kerello (4):
>    ARM: dts: stm32: add FMC2 NAND controller support on stm32mp157c
>    ARM: dts: stm32: add FMC2 NAND controller pins muxing on
>      stm32mp157c-ev1
>    ARM: dts: stm32: enable FMC2 NAND controller on stm32mp157c-ev1
>    ARM: multi_v7_defconfig: add FMC2 NAND  controller support
> 
>   arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 44 +++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts     | 16 +++++++++++
>   arch/arm/boot/dts/stm32mp157c.dtsi        | 19 +++++++++++++
>   arch/arm/configs/multi_v7_defconfig       |  1 +
>   4 files changed, 80 insertions(+)
> 

Series applied on stm32-next.
Note, I changed capital letter in patch1 directly (As I responded late).

Regards
Alex
