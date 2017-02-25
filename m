From: Rask Ingemann Lambertsen <rask@formelder.dk>
Subject: Re: [PATCH] arm64: dts: allwinner: add support for Pinebook
Date: Sat, 25 Feb 2017 17:38:03 +0100
Message-ID: <20170225163802.guxwxzp734hlqoob@localhost>
References: <20170225070032.35834-1-icenowy@aosc.xyz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20170225070032.35834-1-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 25, 2017 at 03:00:32PM +0800, Icenowy Zheng wrote:
[...]
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
> new file mode 100644
> index 000000000000..2dceba3132b0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
[...]
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +
> +		lid_switch {

Node names should not contain underscores. You can use hyphens instead. See
https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1122967.html
https://www.mail-archive.com/linux-kernel%40vger.kernel.org/msg1145633.html

> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_vcc3v3>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
> +	cd-inverted;

You ought to be able to replace those last two lines with just
cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;

> +	disable-wp;
> +	bus-width = <4>;
> +	status = "okay";
> +};

-- 
Rask Ingemann Lambertsen
