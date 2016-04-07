From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: DTS: da850: add node for i2c1
Date: Thu, 7 Apr 2016 20:21:34 +0530
Message-ID: <570673F6.1090508@ti.com>
References: <1459525325-25470-1-git-send-email-petr@barix.com>
 <1459525325-25470-3-git-send-email-petr@barix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459525325-25470-3-git-send-email-petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 01 April 2016 09:12 PM, Petr Kulhavy wrote:
> da850 has two I2C controllers, but the node for i2c1 was missing.
> Add node for i2c1 controller and i2c1 pinmux pins.
> 
> Signed-off-by: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 42948496b8f7..136c422204d3 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -63,6 +63,12 @@
>  					0x10 0x00002200 0x0000ff00
>  				>;
>  			};
> +			i2c1_pins: pinmux_i2c1_pins {
> +				pinctrl-single,bits = <

> +				/* I2C1_SDA,I2C1_SCL */
> +				0x10 0x00440000 0x00ff0000

Indented these two lines one tab like its done elsewhere in the file and
applied.

Thanks,
Sekhar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
