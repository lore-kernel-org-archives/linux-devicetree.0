From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] arm64: allwinner: a64: Add Amarula
 A64-Relic initial support
Date: Tue, 22 May 2018 16:30:44 +0200
Message-ID: <20180522143044.pgwawojiwnk2lzxb@flea>
References: <20180522132228.6564-1-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ygqx2izorne4ivrt"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBFWTSDMAKGQE43QFZHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20180522132228.6564-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ygqx2izorne4ivrt
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Tue, May 22, 2018 at 06:52:28PM +0530, Jagan Teki wrote:
> Amarula A64-Relic is Allwinner A64 based IoT device, which support
> - Allwinner A64 Cortex-A53
> - Mali-400MP2 GPU
> - AXP803 PMIC
> - 1GB DDR3 RAM
> - 8GB eMMC
> - AP6330 Wifi/BLE
> - MIPI-DSI
> - CSI: OV5640 sensor
> - USB OTG

You claim that this is doing OTG...

[..]

> +&usb_otg {
> +	dr_mode = "peripheral";
> +	status = "okay";
> +};

... and yet you're setting it as peripheral...

> +&usbphy {
> +	usb0_id_det-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
> +	usb0_vbus-supply = <&reg_drivevbus>;

While you have an ID pin and a controllable VBUS. Which one is it?

Maxime
-- 
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--ygqx2izorne4ivrt--
