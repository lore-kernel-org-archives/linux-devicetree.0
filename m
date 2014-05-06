From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 08/20] ARM: mvebu: Add Device Tree description of xHCI
 hosts on Armada 38x
Date: Tue, 6 May 2014 15:42:51 +0200
Message-ID: <20140506134251.GF6503@lunn.ch>
References: <1399335255-589-1-git-send-email-gregory.clement@free-electrons.com>
 <1399335255-589-9-git-send-email-gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1399335255-589-9-git-send-email-gregory.clement@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@ti.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, May 06, 2014 at 02:14:03AM +0200, Gregory CLEMENT wrote:
> The Marvell Armada 38x SoCs contains two xHCI host. This commit adds
> the Device Tree description of those interfaces at the SoC level, and
> also enables the two USB3 ports on the Armada 385 DB platform and one
> USB3 port on the Armada 385 RD platform.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  arch/arm/boot/dts/armada-385-db.dts |  8 ++++++++
>  arch/arm/boot/dts/armada-385-rd.dts |  4 ++++
>  arch/arm/boot/dts/armada-38x.dtsi   | 17 +++++++++++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/armada-385-db.dts b/arch/arm/boot/dts/armada-385-db.dts
> index 6828d77696a6..d5db1466da82 100644
> --- a/arch/arm/boot/dts/armada-385-db.dts
> +++ b/arch/arm/boot/dts/armada-385-db.dts
> @@ -101,6 +101,14 @@
>  					reg = <0x1000000 0x3f000000>;
>  				};
>  			};
> +
> +			usb3@f0000 {
> +				status = "okay";
> +			};
> +
> +			usb3@f8000 {
> +				status = "okay";
> +			};
>  		};
>  
>  		pcie-controller {
> diff --git a/arch/arm/boot/dts/armada-385-rd.dts b/arch/arm/boot/dts/armada-385-rd.dts
> index 45250c88814b..a505fe94ff37 100644
> --- a/arch/arm/boot/dts/armada-385-rd.dts
> +++ b/arch/arm/boot/dts/armada-385-rd.dts
> @@ -77,6 +77,10 @@
>  					reg = <1>;
>  				};
>  			};
> +
> +			usb3@f0000 {
> +				status = "okay";
> +			};
>  		};
>  
>  		pcie-controller {
> diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada-38x.dtsi
> index a064f59da02d..5913ce1cc601 100644
> --- a/arch/arm/boot/dts/armada-38x.dtsi
> +++ b/arch/arm/boot/dts/armada-38x.dtsi
> @@ -355,6 +355,23 @@
>  				clocks = <&coredivclk 0>;
>  				status = "disabled";
>  			};
> +
> +			usb3@f0000 {
> +				compatible = "marvell,armada-380-xhci";
> +				reg = <0xf0000 0x3fff>,<0xf4000 0x3fff>;

0x3fff?

I would expect that to be 0x4000.

	Andrew
