From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
Subject: Re: [RESEND PATCH 0/5] Add bluetooth support for Orange Pi 3
Date: Mon, 7 Oct 2019 16:11:53 +0200
Message-ID: <20191007141153.7b76t4ntdzdojj5m@core.my.home>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Fri, Aug 23, 2019 at 12:31:34PM +0200, megous hlavni wrote:
> From: Ondrej Jirman <megous@megous.com>
> 
> (Resend to add missing lists, sorry for the noise.)
> 
> This series implements bluetooth support for Xunlong Orange Pi 3 board.
> 
> The board uses AP6256 WiFi/BT 5.0 chip.
> 
> Summary of changes:
> 
> - add more delay to let initialize the chip
> - let the kernel detect firmware file path
> - add new compatible and update dt-bindings
> - update Orange Pi 3 / H6 DTS

Please consider the DTS patches for 5.5.

Thanks,
	Ondrej

> Please take a look.
> 
> thank you and regards,
>   Ondrej Jirman
> 
> Ondrej Jirman (5):
>   dt-bindings: net: Add compatible for BCM4345C5 bluetooth device
>   bluetooth: bcm: Add support for loading firmware for BCM4345C5
>   bluetooth: hci_bcm: Give more time to come out of reset
>   arm64: dts: allwinner: h6: Add pin configs for uart1
>   arm64: dts: allwinner: orange-pi-3: Enable UART1 / Bluetooth
> 
>  .../bindings/net/broadcom-bluetooth.txt       |  1 +
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 19 +++++++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 10 ++++++++++
>  drivers/bluetooth/btbcm.c                     |  3 +++
>  drivers/bluetooth/hci_bcm.c                   |  3 ++-
>  5 files changed, 35 insertions(+), 1 deletion(-)
> 
> -- 
> 2.23.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
