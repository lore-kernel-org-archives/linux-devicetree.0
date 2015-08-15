From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: bcm2835: Add the DDC I2C controller to the device
 tree.
Date: Fri, 14 Aug 2015 22:51:51 -0600
Message-ID: <55CEC567.109@wwwdotorg.org>
References: <1439427380-2436-1-git-send-email-eric@anholt.net> <1439427380-2436-7-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439427380-2436-7-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/12/2015 06:56 PM, Eric Anholt wrote:
> We need to use it for getting video modes over HDMI.

> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi

> +		i2c2: i2c@7e805000 {
> +			compatible = "brcm,bcm2835-i2c";
> +			reg = <0x7e805000 0x1000>;
> +			interrupts = <2 21>;
> +			clocks = <&clk_i2c>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};

In an SoC .dtsi file, you'd typically write:

	status = "disabled";

... in all nodes that represent IO controllers that interface to
external HW, so that board DT files can/must explicitly choose to enable
the device if it's actually in use on the board. Some systems might not
have HDMI and hence might not hook up the HDMI_SCL/SDA pads.

BCM2835-ARM-Peripherals.pdf states "Note that the BSC2 master is used
dedicated with the HDMI interface and should not be accessed by user
programs.". Does this imply the Linux kernel shouldn't be touching this
I2C controller; that the VC4 firmware might also be attempting to use
it? I wonder how any such sharing of the HW would work.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
