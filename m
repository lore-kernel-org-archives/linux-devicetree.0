From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: sun8i: v40:
 bananapi-m2-berry: Add Bluetooth device node
Date: Thu, 2 May 2019 09:41:03 +0200
Message-ID: <20190502074103.vtuxmsl55u3ygyvl@flea>
References: <1556040365-10913-1-git-send-email-pgreco@centosproject.org>
 <1556040365-10913-8-git-send-email-pgreco@centosproject.org>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="djstwku7pbrd4t2z"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBEV6VLTAKGQEXAS5Y4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <1556040365-10913-8-git-send-email-pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--djstwku7pbrd4t2z
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, Apr 23, 2019 at 02:26:04PM -0300, Pablo Greco wrote:
> The AP6212 is based on the Broadcom BCM43430 or BCM43438. The WiFi side
> identifies as BCM43430, while the Bluetooth side identifies as BCM43438.
>
> The Bluetooth side is connected to UART3 in a 4 wire configuration. Same
> as the WiFi side, due to being the same chip and package, DLDO1 and
> DLDO2 regulator outputs from the PMIC provide overall power via VBAT and
> I/O power via VDDIO. The CLK_OUT_A clock output from the SoC provides
> the LPO low power clock at 32.768 kHz.
>
> This patch enables Bluetooth on this board, and also adds the missing
> LPO clock on the WiFi side. There is also a PCM connection for
> Bluetooth, but this is not covered here.
>
> The LPO clock is fed from CLK_OUT_A, which needs to be muxed on pin
> PI12. This can be represented in multiple ways. This patch puts the
> pinctrl property in the pin controller node. This is due to limitations
> in Linux, where pinmux settings, even the same one, can not be shared
> by multiple devices. Thus we cannot put it in both the WiFi and
> Bluetooth device nodes. Putting it the CCU node is another option, but
> Linux's CCU driver does not handle pinctrl. Also the pin controller is
> guaranteed to be initialized after the CCU, when clocks are available.
> And any other devices that use muxed pins are guaranteed to be
> initialized after the pin controller. Thus having the CLK_OUT_A pinmux
> reference be in the pin controller node is a good choice without having
> to deal with implementation issues.
>
> Signed-off-by: Pablo Greco <pgreco-/kQrlZ55X3WoClj4AeEUq9i2O/JbrIOy@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> index c87f2c0..15c22b0 100644
> --- a/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> +++ b/arch/arm/boot/dts/sun8i-v40-bananapi-m2-berry.dts
> @@ -96,6 +96,8 @@
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
> +		clocks = <&ccu CLK_OUTA>;
> +		clock-names = "ext_clock";

So if you don't have that patch (that enables bluetooth) the wifi
doesn't work (even though the previous patch is supposed to enable it)
?

>  	};
>  };
>
> @@ -173,6 +175,7 @@
>
>  &pio {
>  	pinctrl-names = "default";
> +	pinctrl-0 = <&clk_out_a_pin>;

This one should bein the previous one as well

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--djstwku7pbrd4t2z--
