From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: stm32f7: add stm32f769I & stm32f746
 discovery board support
Date: Mon, 12 Jun 2017 13:56:50 +0200
Message-ID: <ca91f3d2-8758-b46b-dc2c-8081d32f40ab@st.com>
References: <1492043225-22424-1-git-send-email-vikas.manocha@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1492043225-22424-1-git-send-email-vikas.manocha-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>, patrice.chotard-qxv4g6HH51o@public.gmane.org
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vikas

On 04/13/2017 02:27 AM, Vikas Manocha wrote:
> Stm32f769I & stm32f746 are MCUs of stm32f7 family. Here are the major
> specs of the two boards:
> 
> stm32f769I discovery board:
> 	- Cortex-M7 core @216MHz
> 	- 2MB mcu internal flash
> 	- 512KB internal sram
> 	- 16MB sdram memory
> 	- 64MB qspi flash memory
> 	- 4 inch wvga LCD-TFT Display
> 
> stm32f746 discovery board:
> 	- Cortex-M7 core @216MHz
> 	- 1MB mcu internal flash
> 	- 320KB internal sram
> 	- 8MB sdram memory
> 	- 16MB qspi flash memory
> 	- 4.3 inch 480x272 LCD-TFT display
> 
> Signed-off-by: Vikas Manocha <vikas.manocha-qxv4g6HH51o@public.gmane.org>
> ---
> Changed in v3:
> - fixed usart pin muxing for stm32f746 board, correct one is usart1_pins_pa9_pb7.
> - Added patch version in the patch title, was missed in v2.
> 
> Changed in v2:
> - moved pin muxing from board dts file to soc dtsi
> 
>   arch/arm/boot/dts/Makefile            |  2 +
>   arch/arm/boot/dts/stm32f746-disco.dts | 74 +++++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/stm32f746.dtsi      | 12 ++++++
>   arch/arm/boot/dts/stm32f769-disco.dts | 74 +++++++++++++++++++++++++++++++++++
>   4 files changed, 162 insertions(+)
>   create mode 100644 arch/arm/boot/dts/stm32f746-disco.dts
>   create mode 100644 arch/arm/boot/dts/stm32f769-disco.dts
> 
...

Applied on stm32-dt-for-v4.13.

Regards
Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
