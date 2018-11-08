From: jbrunet@baylibre.com
Subject: Re: [PATCH 3/3] ARM64: dts: meson-gxl: Add support for the
 Smartlabs SML-5442TW
Date: Thu, 08 Nov 2018 16:56:40 +0100
Message-ID: <bafa32609200e57d8efe9843247429a46916bbef.camel@baylibre.com>
References: <1541691207-24768-1-git-send-email-christianshewitt@gmail.com>
         <1541691207-24768-3-git-send-email-christianshewitt@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541691207-24768-3-git-send-email-christianshewitt@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Thu, 2018-11-08 at 19:33 +0400, Christian Hewitt wrote:
> 
> +&audio {
> +	status = "okay";
> +};
> +
> +&aiu_i2s_dma {
> +	status = "okay";
> +};
> +
> +&i2s_dai {
> +	status = "okay";
> +};

The audio stuff has not made it's way upstream (yet) please drop this

> +
> +&cvbs_vdac_port {
> +	cvbs_vdac_out: endpoint {
> +		remote-endpoint = <&cvbs_connector_in>;
> +	};
> +};
> +
> 
[ ... ]

> +
> +/* This is connected to the Bluetooth module: */
> +&uart_A {
> +	status = "okay";
> +	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> +	pinctrl-names = "default";

Did you forget to put 'uart-has-rtscts;' here ?

> +};
> +
> +/* This UART is brought out to the debug header */
> +&uart_AO {
> +	status = "okay";
> +	pinctrl-0 = <&uart_ao_a_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb0 {
> +	status = "okay";
> +};

Also, you sent a multipatch series. Such patchset should start with a cover
letter describing the general intent ... even if it is obvious.
