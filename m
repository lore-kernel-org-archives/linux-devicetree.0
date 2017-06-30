From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 4/4] arm64: dts: add RK3399-Q7 (Puma) SoM
Date: Sat, 01 Jul 2017 00:13:25 +0200
Message-ID: <1912092.hfJnF4sPpq@phil>
References: <20170626191854.58253-1-klaus.goger@theobroma-systems.com> <20170626191854.58253-5-klaus.goger@theobroma-systems.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626191854.58253-5-klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Cc: Philipp Tomsich <philipp.tomsich-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Klaus,

Am Montag, 26. Juni 2017, 21:18:54 CEST schrieb Klaus Goger:
> The RK3399-Q7 SoM is a Qseven-compatible (70mm x 70mm, MXM-230
> connector) system-on-module from Theobroma Systems, featuring the
> Rockchip RK3399.
> 
> It provides the following feature set:
>  * up to 4GB DDR3
>  * on-module SPI-NOR flash
>  * on-module eMMC (with 8-bit 1.8V interface)
>  * SD card (on a baseboad) via edge connector
>  * Gigabit Ethernet with on-module Micrel KSZ9031 GbE PHY
>  * HDMI/eDP/2x MIPI-DSI
>  * 2x MIPI-CSI
>  * USB
>    - 1x USB 3.0 dual-role (direct connection)
>    - 2x USB 3.0 host + 1x USB 2.0 (on-module USB 3.0 hub)
>  * on-module STM32 Cortex-M0 companion controller, implementing:
>    - low-power RTC functionality (ISL1208 emulation)
>    - fan controller (AMC6821 emulation)
>    - USB<->CAN bridge controller
> 
> Signed-off-by: Klaus Goger <klaus.goger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
> 
> ---
> 
>  arch/arm64/boot/dts/rockchip/Makefile        |   1 +
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dts | 650 +++++++++++++++++++++++++++

One thing I forgot to address was the SOM'nes of the puma board. People
might want to use that with different base-boards so you might want to
split this up into a rk3399-puma-som.dtsi and for example rk3399-puma-haikou.dts
for the Puma + Haikou Q7 combination.

Examples for such a split may be the rk3288-phycore, rk3288-rock2 and
rk3288-firefly-reload.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
