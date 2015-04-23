From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun5i: Utoo P66 add uart node and aliases
Date: Thu, 23 Apr 2015 19:11:33 +0200
Message-ID: <553927C5.7090809@redhat.com>
References: <1429807008-7041-1-git-send-email-hdegoede@redhat.com>
Reply-To: hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Return-path: <linux-sunxi+bncBDRZXY4CYYORBS6P4SUQKGQEORJHCUI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1429807008-7041-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 23-04-15 18:36, Hans de Goede wrote:
> Like on most non devel-boards it is still possible to get an uart on
> the Utoo P66 tablet by soldering some wires to the right pads on the PCB,
> add support for this to the dts, like we do with all sunxi boards.
>
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

This one is no good, the uart cannot be used as it shares a pin with the
lcd-panel, self-NACK.

Regards,

Hans

> ---
>   arch/arm/boot/dts/sun5i-a13-utoo-p66.dts | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> index 00bdf28..bb8d61a 100644
> --- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> +++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> @@ -57,6 +57,14 @@
>   	model = "Utoo P66";
>   	compatible = "utoo,p66", "allwinner,sun5i-a13";
>
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
>   	i2c_lcd: i2c@0 {
>   		/* The lcd panel i2c interface is hooked up via gpios */
>   		compatible = "i2c-gpio";
> @@ -238,6 +246,12 @@
>   	status = "okay";
>   };
>
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins_b>;
> +	status = "okay";
> +};
> +
>   &usb_otg {
>   	dr_mode = "otg";
>   	status = "okay";
>
