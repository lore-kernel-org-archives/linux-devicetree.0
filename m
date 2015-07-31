From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/5] ARM: dts: sun5i: Enable USB DRC on A13 OLinuxIno
Date: Fri, 31 Jul 2015 12:11:57 +0200
Message-ID: <20150731101157.GD2564@lukather>
References: <1438333194-21181-1-git-send-email-hdegoede@redhat.com>
 <1438333194-21181-4-git-send-email-hdegoede@redhat.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er1ntMVhQcukqcwj"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB6ET5WWQKGQEOGUYZ4A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438333194-21181-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Mark Janssen <mark-5WUJjqWNSpBmR6Xm/wNWPw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--Er1ntMVhQcukqcwj
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

On Fri, Jul 31, 2015 at 10:59:52AM +0200, Hans de Goede wrote:
> From: Mark Janssen <mark-5WUJjqWNSpBmR6Xm/wNWPw@public.gmane.org>
> 
> Enable the otg/drc usb controller on the A13 OLinuxIno.
> 
> Signed-off-by: Mark Janssen <mark-5WUJjqWNSpBmR6Xm/wNWPw@public.gmane.org>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun5i-a13-olinuxino.dts | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
> index 4232400..e659482 100644
> --- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
> +++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
> @@ -159,6 +159,10 @@
>  	status = "okay";
>  };
>  
> +&otg_sram {
> +	status = "okay";
> +};
> +
>  &pio {
>  	mmc0_cd_pin_olinuxino: mmc0_cd_pin@0 {
>  		allwinner,pins = "PG0";
> @@ -174,6 +178,24 @@
>  		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>  	};
>  
> +	usb0_id_detect_pin: usb0_id_detect_pin@0 {
> +		allwinner,pins = "PG2";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +	};
> +
> +	usb0_vbus_detect_pin: usb0_vbus_detect_pin@0 {
> +		allwinner,pins = "PG1";
> +		allwinner,function = "gpio_in";
> +		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +		allwinner,pull = <SUN4I_PINCTRL_PULL_DOWN>;
> +	};
> +
> +	usb0_vbus_pin_a: usb0_vbus_pin@0 {
> +		allwinner,pins = "PG12";
> +	};

Same thing here than in patch 2.

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--Er1ntMVhQcukqcwj--
