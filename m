From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 0/3] USB OTG on STM32F7 boards
Date: Tue, 27 Feb 2018 16:57:12 +0100
Message-ID: <06730939-11f4-c8da-02a8-7bab37f194ce@st.com>
References: <1518710080-18164-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1518710080-18164-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie

On 02/15/2018 04:54 PM, Amelie Delaunay wrote:
> This patchset adds support for Peripheral mode on stm32f746 by adding
> dwc2 gadget fifo sizes and enables USB OTG HS in OTG (DRD) mode on
> stm32746g-eval and stm32f769-disco. It possible to use OTG HS in
> Peripheral or Host mode, depending on the USB connector.
> 
> Amelie Delaunay (3):
>    ARM: dts: stm32: add gadget fifo sizes to usbotg_hs on stm32f746
>    ARM: dts: stm32: select otg mode for usbotg_hs on stm32746g_eval
>    ARM: dts: stm32: enable USB HS on stm32f769-disco
> 
>   arch/arm/boot/dts/stm32746g-eval.dts  |  2 +-
>   arch/arm/boot/dts/stm32f746.dtsi      |  3 +++
>   arch/arm/boot/dts/stm32f769-disco.dts | 15 +++++++++++++++
>   3 files changed, 19 insertions(+), 1 deletion(-)
> 

Series applied on stm32-next.

Regards
Alex
