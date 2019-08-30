From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [RESEND PATCH 0/5] Add bluetooth support for Orange Pi 3
Date: Fri, 30 Aug 2019 09:53:16 +0200
Message-ID: <5524D5E9-FA82-4244-A91F-78CF1C3FB3FB@holtmann.org>
References: <20190823103139.17687-1-megous@megous.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823103139.17687-1-megous@megous.com>
Sender: linux-kernel-owner@vger.kernel.org
To: megous@megous.com
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Ondrej,

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
> 
> Please take a look.
> 
> thank you and regards,
>  Ondrej Jirman
> 
> Ondrej Jirman (5):
>  dt-bindings: net: Add compatible for BCM4345C5 bluetooth device
>  bluetooth: bcm: Add support for loading firmware for BCM4345C5
>  bluetooth: hci_bcm: Give more time to come out of reset
>  arm64: dts: allwinner: h6: Add pin configs for uart1
>  arm64: dts: allwinner: orange-pi-3: Enable UART1 / Bluetooth
> 
> .../bindings/net/broadcom-bluetooth.txt       |  1 +
> .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 19 +++++++++++++++++++
> arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 10 ++++++++++
> drivers/bluetooth/btbcm.c                     |  3 +++
> drivers/bluetooth/hci_bcm.c                   |  3 ++-
> 5 files changed, 35 insertions(+), 1 deletion(-)

all 5 patches have been applied to bluetooth-next tree.

Regards

Marcel
