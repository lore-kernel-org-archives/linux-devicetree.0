From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/4] Add STM32 USBPHYC to stm32mp157c
Date: Thu, 3 May 2018 09:49:24 +0200
Message-ID: <e6d141c3-7ee1-cb12-5708-18bf9d0986ae@st.com>
References: <1524562905-19361-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1524562905-19361-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie,

On 04/24/2018 11:41 AM, Amelie Delaunay wrote:
> This series adds support for STM32 USB PHY Controller (USBPHYC) to
> stm32mp157c SoC and enables it on stm32mp157c-ev1 board.
> 
> ---
> Changes in v2:
> * Add reset dt-bindings include
> * Add fixed regulators
> * Enable CONFIG_PHY_STM32_USBPHYC in multi_v7_defconfig
> 
> Amelie Delaunay (4):
>    ARM: dts: stm32: add USBPHYC support to stm32mp157c
>    ARM: dts: stm32: add supplies to usbphyc ports on stm32mp157c-ed1
>    ARM: dts: stm32: enable USBPHYC on stm32mp157c-ev1
>    ARM: multi_v7_defconfig: enable STM32 USB PHY Controller (USBPHYC)
> 
>   arch/arm/boot/dts/stm32mp157c-ed1.dts | 36 +++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32mp157c-ev1.dts |  5 +++++
>   arch/arm/boot/dts/stm32mp157c.dtsi    | 21 ++++++++++++++++++++
>   arch/arm/configs/multi_v7_defconfig   |  1 +
>   4 files changed, 63 insertions(+)
> 

Series applied on stm32-next. To avoid DTC warnings using W=12, I just 
renamed "vdd_usb" node by "vdd-usb".

Regards
Alex
