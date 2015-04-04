From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sun5i: Enable touchscreen on
 Utoo P66
Date: Sat, 4 Apr 2015 14:44:58 +0200
Message-ID: <20150404124458.GI14618@lukather>
References: <1427902177-26526-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lqaZmxkhekPBfBzr"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBT5Z76UAKGQE5OZY7EY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1427902177-26526-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

--lqaZmxkhekPBfBzr
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi Hans,

On Wed, Apr 01, 2015 at 05:29:37PM +0200, Hans de Goede wrote:
> Add a node for the chipone-icn8318 touchscreen found on the Utoo P66 tablet.
> 
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> -Fix touchscreen node name
> ---
>  arch/arm/boot/dts/sun5i-a13-utoo-p66.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> index 9108ecd..00bdf28 100644
> --- a/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> +++ b/arch/arm/boot/dts/sun5i-a13-utoo-p66.dts
> @@ -50,6 +50,7 @@
>  #include "sunxi-common-regulators.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
>  
>  / {
> @@ -93,6 +94,20 @@
>  	pinctrl-0 = <&i2c1_pins_a>;
>  	status = "okay";
>  
> +	icn8318: touchscreen@40 {
> +		compatible = "chipone,icn8318";
> +		reg = <0x40>;
> +		interrupt-parent = <&pio>;
> +		interrupts = <9 IRQ_TYPE_EDGE_FALLING>; /* EINT9 (PG9) */

I don't think you sent a reply to this comment, but this should really
be in a pinctrl node so that no one else can request the pin and
change its muxing and it shows up in debugfs.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--lqaZmxkhekPBfBzr--
