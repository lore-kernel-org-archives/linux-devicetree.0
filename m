From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: add disable-wakeup property for
 gpio-charger
Date: Tue, 10 Feb 2015 12:00:30 +0000
Message-ID: <20150210120030.GD6659@leverpostej>
References: <1423555945-24289-1-git-send-email-zyw@rock-chips.com>
 <1423555945-24289-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1423555945-24289-2-git-send-email-zyw@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Zhong <zyw@rock-chips.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>, "dianders@chromium.org" <dianders@chromium.org>, "dtor@chromium.org" <dtor@chromium.org>, "djkurtz@chromium.org" <djkurtz@chromium.org>, "sonnyrao@chromium.org" <sonnyrao@chromium.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Heiko Stuebner <heiko.stuebner@bq.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 10, 2015 at 08:12:24AM +0000, Chris Zhong wrote:
> add disable-wakeup for gpio-charger, if you set this property, system
> will not wakeup by gpio-charger.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> ---
> 
>  Documentation/devicetree/bindings/power_supply/gpio-charger.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> index adbb5dc..a46e9bc 100644
> --- a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> +++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
> @@ -4,6 +4,7 @@ Required properties :
>   - compatible : "gpio-charger"
>   - gpios : GPIO indicating the charger presence.
>     See GPIO binding in bindings/gpio/gpio.txt .
> + - gpio-charger,disable-wakeup : Boolean, charger does not wake-up the system.

When would the system wake up otherwise?

Also, "gpio-charger" is not a vendor prefix.

Mark.

>   - charger-type : power supply type, one of
>       unknown
>       battery
> @@ -20,6 +21,7 @@ Example:
>  		compatible = "gpio-charger";
>  		charger-type = "usb-sdp";
>  		gpios = <&gpf0 2 0 0 0>;
> +		gpio-charger,disable-wakeup;
>  	}
>  
>  	battery {
> -- 
> 1.9.1
> 
> 
