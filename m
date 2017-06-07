From: Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH 0/3] Add stm32h743i-disco board
Date: Wed, 7 Jun 2017 09:04:56 +0200
Message-ID: <f8d09cbf-8535-5906-28ee-6d9774a49c44@st.com>
References: <1496765613-697-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1496765613-697-1-git-send-email-patrice.chotard-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patrice.chotard-qxv4g6HH51o@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Patrice

On 06/06/2017 06:13 PM, patrice.chotard-qxv4g6HH51o@public.gmane.org wrote:
> From: Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>
>
> This series adds basic support for the stm32h743i discovery board
> based on stm32h7 MCU.
>
> Patrice Chotard (3):
>   ARM: dts: stm32h743: Add usart2_pins
>   ARM: dts: stm32h743: Add usart2 support
>   ARM: dts: stm32h743: Add stm32h743i-disco board
>
>  arch/arm/boot/dts/Makefile               |  3 +-
>  arch/arm/boot/dts/stm32h743-pinctrl.dtsi | 13 ++++++
>  arch/arm/boot/dts/stm32h743.dtsi         |  8 ++++
>  arch/arm/boot/dts/stm32h743i-disco.dts   | 74 ++++++++++++++++++++++++++++++++
>  4 files changed, 97 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/stm32h743i-disco.dts
>

Series looks fine for me, but can you change commit header please. For 
example: ARM: dts: stm32: Add usart2_pins on stm32h743.

Soon it will be done, I will apply it for next pull request.

Regards
Alex
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
