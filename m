From: Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v3 3/3] arm: dts: rk3288-tinker.dtsi: Add outline
 Bluetooth support
Date: Mon, 11 Mar 2019 17:41:12 +0100
Message-ID: <C67B8798-ACD1-470B-B69A-650A62AE7982@holtmann.org>
References: <20190217121513.22965-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-1-beagleboard@davidjohnsummers.uk>
 <20190309153923.22806-3-beagleboard@davidjohnsummers.uk>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190309153923.22806-3-beagleboard@davidjohnsummers.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Summers <beagleboard@davidjohnsummers.uk>
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, linux-bluetooth@vger.kernel.org, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, frowand.list@gmail.com, linux-arm-kernel@lists.infradead.org, Johan Hedberg <johan.hedberg@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi David,

> This patch is an outline for bluetooth on the ASUS Tinker Board (S).
> 
> Bluetooth is provided my RTL8723BS on these machine, and this is wired
> into UART0.
> 
> Here this is performed as a SerDev device.
> 
> Now as presented, this does not give functioning bluetooth. The
> updates needed to the device driver:
> 
> https://www.spinics.net/lists/linux-bluetooth/msg78661.html
> 
> Haven't yet been accepted. So this device tree hook doesn't yet have
> "realtek,rtl8723bs-bt" compatible flag.
> 
> It is however still submitted as a patch, as it sets the UART up
> correctly. And so basic communciation can be had with the device. This
> has been confirmed by Tony McKahan @ Armbian, in particular that the
> CTS/RTS is needed.
> 
> When Vasily patch is accepted, this will be added as a minor patch on
> top of this patch; as this patch gives the pins needed.
> 
> The one oddity, is the RESET pin, it is labeled this way on the
> schematic. However the hci_h5.c driver calls this ENABLE. Here we have
> stuck with the schematic name.
> 
> Signed-off-by: David Summers <beagleboard@davidjohnsummers.uk>
> ---
> arch/arm/boot/dts/rk3288-tinker.dtsi | 11 +++++++++++
> 1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-tinker.dtsi b/arch/arm/boot/dts/rk3288-tinker.dtsi
> index 0ffab1b7c940..d29f5b34d7e6 100644
> --- a/arch/arm/boot/dts/rk3288-tinker.dtsi
> +++ b/arch/arm/boot/dts/rk3288-tinker.dtsi
> @@ -486,6 +486,17 @@
> 
> &uart0 {
> 	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_xfer>, <&uart0_cts>, <&uart0_rts>;
> +
> +	bluetooth {
> +		clocks = <&rk808 RK808_CLKOUT1>;
> +		reset-gpios = <&gpio4 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		device-wake-gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
> +		host-wake-gpios = <&gpio4 RK_PD7 GPIO_ACTIVE_HIGH>;
> +		vcc-18-supply = <&vcc_18>;
> +		vcc-io-supply = <&vcc_io>;
> +	};
> };

I need an ACK from Rob for this and also you might want to send the whole series for me to review in full context.

Regards

Marcel
