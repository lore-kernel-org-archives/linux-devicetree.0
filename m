From: jbrunet@baylibre.com
Subject: Re: [PATCH v3 3/3] ARM64: dts: meson-gxl: Add support for the
 Smartlabs SML-5442TW
Date: Fri, 09 Nov 2018 14:17:20 +0100
Message-ID: <d923e31b63a5d4c4d67a274b8ef9555cd25f8bff.camel@baylibre.com>
References: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
         <1541706240-30036-1-git-send-email-christianshewitt@gmail.com>
         <1541706240-30036-4-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541706240-30036-4-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-11-08 at 23:43 +0400, Christian Hewitt wrote:
> +/* This will enable the bluetooth module */
> +&gpio {
> +       bt-en {
> +               gpio-hog;
> +               gpios = <GPIOX_17 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "bt-en";
> +       };
> +};

Instead of this, is it possible to use the driver provided by
drivers/bluetooth/hci_qca.c ?
