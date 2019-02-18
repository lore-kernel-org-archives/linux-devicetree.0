From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: net: bluetooth: Add rtl8723bs-bluetooth
Date: Mon, 18 Feb 2019 15:10:35 -0600
Message-ID: <20190218211035.GA28145@bogus>
References: <20190118170232.16142-1-anarsoul@gmail.com>
 <20190118170232.16142-4-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190118170232.16142-4-anarsoul@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jan 18, 2019 at 09:02:27AM -0800, Vasily Khoruzhick wrote:
> Add binding document for bluetooth part of RTL8723BS/RTL8723CS
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../bindings/net/rtl8723bs-bluetooth.txt      | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> new file mode 100644
> index 000000000000..8357f242ae4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/rtl8723bs-bluetooth.txt
> @@ -0,0 +1,35 @@
> +RTL8723BS/RTL8723CS Bluetooth
> +---------------------
> +
> +RTL8723CS/RTL8723CS is WiFi + BT chip. WiFi part is connected over SDIO, while
> +BT is connected over serial. It speaks H5 protocol with few extra commands
> +to upload firmware and change module speed.
> +
> +Required properties:
> +
> + - compatible: should be one of the following:
> +   * "realtek,rtl8723bs-bt"
> +   * "realtek,rtl8723cs-bt"
> +Optional properties:
> +
> + - device-wake-gpios: GPIO specifier, used to wakeup the BT module (active high)
> + - enable-gpios: GPIO specifier, used to enable the BT module (active high)
> + - host-wake-gpios: GPIO specifier, used to wakeup the host processor (active high)
> + - firmware-postfix: firmware postfix to be used for firmware config

How is this used?

Rob
