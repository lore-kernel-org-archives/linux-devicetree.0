From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: Add SEI Robotics SEI510 Board
Date: Fri, 15 Feb 2019 15:04:55 -0800
Message-ID: <7hy36girfs.fsf@baylibre.com>
References: <20190212140259.9537-1-narmstrong@baylibre.com> <20190212140259.9537-3-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212140259.9537-3-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> The SEI Robotics SEI510 Board is based on the Amlogic G12A S905X2
> and has the following features :
> - Amlogic G12A S905X2 SoC
> - 10/100 Ethernet
> - USB2 + USB3 ports
> - Micro SDCard Port
> - Audio + CVBS AV Jack port
> - HDMI 2.1 + CEC Port
> - ADC Touch Button
> - Far-Field Microphone Array + Mono HP
> - IR Sensor
> - IR Emmiter LED Array
> - RGB Led
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

[...]

> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 0821fed4c074..2709f7ede908 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb

nit: not sorted alphabetically.  I'll move it bofore u200 when applying.

Thanks for the new board support!

Kevin
