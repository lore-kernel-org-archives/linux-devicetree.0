From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 6/7] ARM: dts: stm32: Add USB FS support for STM32F746 MCU
Date: Thu, 17 Aug 2017 13:47:12 +0300
Message-ID: <804e0eb3-88a0-2847-9330-0f92d36f9f99@cogentembedded.com>
References: <1502962386-6683-1-git-send-email-amelie.delaunay@st.com>
 <1502962386-6683-7-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502962386-6683-7-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, John Youn <johnyoun@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Benjamin Gaignard <benjamin.gaignard@st.com>
List-Id: devicetree@vger.kernel.org

On 8/17/2017 12:33 PM, Amelie Delaunay wrote:

> This patch adds the USB pins and nodes for USB FS core on STM32F746 SoC.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
> ---
>   arch/arm/boot/dts/stm32f746.dtsi | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
> index fcfe5a6..a9476ea 100644
> --- a/arch/arm/boot/dts/stm32f746.dtsi
> +++ b/arch/arm/boot/dts/stm32f746.dtsi
> @@ -419,6 +419,28 @@
>   					slew-rate = <2>;
>   				};
>   			};
> +
> +			usbotg_fs_pins_a: usbotg_fs@0 {

    Dashes are preferred to underlines in the node names.

[...]

MBR, Sergei
