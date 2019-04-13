From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH 3/4] ARM: dts: rockchip: Hook resets up to USB PHYs on
 rk3288.
Date: Fri, 12 Apr 2019 17:00:00 -0700
Message-ID: <20190413000000.GA112750@google.com>
References: <20190412224149.106971-1-dianders@chromium.org>
 <20190412224149.106971-4-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190412224149.106971-4-dianders@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Douglas Anderson <dianders@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>, Heiko Stuebner <heiko@sntech.de>, Felipe Balbi <felipe.balbi@linux.intel.com>, amstan@chromium.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, Randy Li <ayaka@soulik.info>, ryandcase@chromium.org, jwerner@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 12, 2019 at 03:41:48PM -0700, Douglas Anderson wrote:
> Let's hook up the resets to the three USB PHYs on rk3288 as per the
> bindings.  This is in preparation for a future patch that will set the
> "snps,reset-phy-on-wake" on the host port.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  arch/arm/boot/dts/rk3288.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
> index 2e604f0afa98..92e0600595f8 100644
> --- a/arch/arm/boot/dts/rk3288.dtsi
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -905,6 +905,8 @@
>  				clocks = <&cru SCLK_OTGPHY0>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBOTG_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  
>  			usbphy1: usb-phy@334 {
> @@ -913,6 +915,8 @@
>  				clocks = <&cru SCLK_OTGPHY1>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBHOST0_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  
>  			usbphy2: usb-phy@348 {
> @@ -921,6 +925,8 @@
>  				clocks = <&cru SCLK_OTGPHY2>;
>  				clock-names = "phyclk";
>  				#clock-cells = <0>;
> +				resets = <&cru SRST_USBHOST1_PHY>;
> +				reset-names = "phy-reset";
>  			};
>  		};
>  	};

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
