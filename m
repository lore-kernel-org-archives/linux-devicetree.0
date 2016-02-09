From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun7i: Enable USB DRC on Itead Ibox
Date: Tue, 9 Feb 2016 19:34:20 +0100
Message-ID: <20160209183420.GW31506@lukather>
References: <1455010156-27754-1-git-send-email-codekipper@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Tm6VLls/w6NsRApE"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBN7C5C2QKGQES3K2RUA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1455010156-27754-1-git-send-email-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--Tm6VLls/w6NsRApE
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Tue, Feb 09, 2016 at 10:29:16AM +0100, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Enable the otg/drc usb controller on the Itead Ibox device.
> 
> Note this board has the otg-vbus connected directly to the 5v-dcc of
> the board, so there is no vbus0 regulator, nor vbus0-det.
> 
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes since v1:
> - Added comment concerning vbus0 regulator and detection to commit message
> 
> ---
>  arch/arm/boot/dts/sun7i-a20-itead-ibox.dts     | 14 ++++++++++++++
>  arch/arm/boot/dts/sunxi-itead-core-common.dtsi |  9 +++++++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> index 661c21d..a512581 100644
> --- a/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> +++ b/arch/arm/boot/dts/sun7i-a20-itead-ibox.dts
> @@ -118,8 +118,22 @@
>  		allwinner,drive = <SUN4I_PINCTRL_20_MA>;
>  		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>  	};
> +
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PH4";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +	};
>  };
>  
>  &reg_ahci_5v {
>  	status = "okay";
>  };
> +
> +&usbphy {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&usb0_id_detect_pin>;
> +	usb0_id_det-gpio = <&pio 7 4 GPIO_ACTIVE_HIGH>; /* PH4 */
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> index 2565d51..d22eea3 100644
> --- a/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> +++ b/arch/arm/boot/dts/sunxi-itead-core-common.dtsi
> @@ -88,6 +88,10 @@
>  	status = "okay";
>  };
>  
> +&otg_sram {
> +	status = "okay";
> +};
> +
>  #include "axp209.dtsi"
>  
>  &reg_dcdc2 {
> @@ -129,6 +133,11 @@
>  	status = "okay";
>  };
>  
> +&usb_otg {
> +	dr_mode = "otg";

If VBUS is tied to 5V, without anyway to disable it, then it cannot do
OTG.

The mode it can do is host.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Tm6VLls/w6NsRApE--
