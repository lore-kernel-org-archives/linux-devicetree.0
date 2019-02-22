From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Add support for the Orange Pi
 RK3399 board.
Date: Fri, 22 Feb 2019 13:19:53 -0600
Message-ID: <CAL_JsqLubJ2BwpgyzDFPUzyqjZZNO9spdXTuHHyTRsx_kxMfgg@mail.gmail.com>
References: <20190222184419.14469-1-aballier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190222184419.14469-1-aballier@gentoo.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexis Ballier <aballier@gentoo.org>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 22, 2019 at 12:46 PM Alexis Ballier <aballier@gentoo.org> wrote:
>
> This adds basic support for the Orange Pi RK3399 board.
> What works:
> - SD card / emmc.
> - Debug UART
> - Ethernet
> - USB: Type C, internal USB3 for SATA, 4 USB 2.0 ports
> - Sensors: All of them but the Hall sensor.
> - Buttons
> - Wifi, Bluetooth
> - HDMI out
>
> Signed-off-by: Alexis Ballier <aballier@gentoo.org>
> Cc: devicetree@vger.kernel.org
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
>
> The board is heavily based on the Sapphire one, hence this patch is also
> based on this DT. This is why I kept the copyrights of the sapphire DT.
> ---
>  .../devicetree/bindings/arm/rockchip.yaml     |   5 +
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3399-orangepi.dts     | 778 ++++++++++++++++++
>  3 files changed, 784 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts

Reviewed-by: Rob Herring <robh@kernel.org>
