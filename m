From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add g12a x96 max board
Date: Sat, 22 Dec 2018 17:57:42 +0100
Message-ID: <CAFBinCCbPbSQZeF1mzfBfLt+cJ0P=ajHznZM2prn600NO7G3sA@mail.gmail.com>
References: <20181219002620.12138-1-khilman@baylibre.com>
 <20181219002620.12138-2-khilman@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181219002620.12138-2-khilman@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Kevin,

On Wed, Dec 19, 2018 at 1:26 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Add the G12a (S905X2) based X96 Max board[1].
>
> There is no branding for the manufacturer anywhere on the product, so it
> took some digging to find the manufacturer.  But since there's nothing
> about the maker on the product I've left it out of the DT name because
> 1) nobody will no that name and 2) keeps the DT filename shorter.
based on the cnx-soft article and my own board I would add the
following section:
-----
There are three variants of this device:
- 2GB LPDDR4, 16GB flash, 2.4G WiFi, 100M Ethernet
- 4GB LPDDR4, 32GB flash, dual band AC WiFi, Bluetooth 4.x, Gigabit Ethernet
- 4GB LPDDR4, 64GB flash, dual band  AC WiFi, Bluetooth 4.x, Gigabit Ethernet

Presumably the 4GB variants are identical except for the eMMC chip.

This patch is tested on the 4GB LPDDR4 32GB eMMC variant.
The WiFi / Bluetooth chip is an AP6356S. The Ethernet PHY is a Realtek RTL8211F.
-----

While writing this a question came up:
should we rename the board if there's a variant using the internal 100M PHY?
for example: "meson-g12a-x96-max-gbit"
this will allow us to add a "meson-g12a-x96-max-100m" (or any better
name) later on

> [1] https://www.cnx-software.com/2018/09/25/x96-max-amlogic-s905x2-tv-box/
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(with the Makefile adjustments, see below)

> ---
> Special thanks to Martin Blumenstingl for extra digging for the manufacturer
>
>  .../boot/dts/amlogic/meson-g12a-x96-max.dts   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
it doesn't build the .dtb for me without adding the board to
arch/arm64/boot/dts/amlogic/Makefile

>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> new file mode 100644
> index 000000000000..fe94765b671e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12a.dtsi"
> +
> +/ {
> +       compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
did you leave the u200 compatible in there on purpose?

> +       model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
> +
> +       aliases {
> +               serial0 = &uart_AO;
> +       };
> +       chosen {
> +               stdout-path = "serial0:115200n8";
> +       };
> +       memory@0 {
> +               device_type = "memory";
> +               reg = <0x0 0x0 0x0 0x40000000>;
according to that cnx-soft report the smalles RAM size is 2GiB
however the bootloader will update it anyways so I believe this is fine


Regards
Martin
