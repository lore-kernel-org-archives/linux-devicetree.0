From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH v2 0/3] USB OTG on STM32H743
Date: Tue, 27 Feb 2018 17:04:09 +0100
Message-ID: <05b1ec7e-8db3-20df-fb1c-3a8853f99307@st.com>
References: <1519029988-9261-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519029988-9261-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Amélie,

On 02/19/2018 09:46 AM, Amelie Delaunay wrote:
> This patchset adds support for USB OTG HS and FS on stm32h743 SoC.
> It also enables USB OTG HS on stm32h743i-eval board in OTG (DRD) mode. It is
> possible to use OTG HS in Peripheral or Host mode depending on the USB
> connector.
> 
> ---
> 
> Changes in v2:
> - Fix compatible string (https://patchwork.kernel.org/patch/10222153/)
> 
> Amelie Delaunay (3):
>    ARM: dts: stm32: add USB OTG HS support for STM32H743 SoC
>    ARM: dts: stm32: add USB OTG FS support for STM32H743 SoC
>    ARM: dts: stm32: enable USB OTG HS on stm32h743i-eval
> 
>   arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 20 ++++++++++++++++++++
>   arch/arm/boot/dts/stm32h743.dtsi         | 21 +++++++++++++++++++++
>   arch/arm/boot/dts/stm32h743i-eval.dts    | 16 ++++++++++++++++
>   3 files changed, 57 insertions(+)
> 

I squashed patch 1&2 and applied series on stm32-next.

Regards.
Alex
