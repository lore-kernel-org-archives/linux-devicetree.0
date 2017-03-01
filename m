From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [RESEND PATCH 1/2] Documentation: bindings: add DT documentation
 for u2phy and u2phy grf
Date: Wed, 01 Mar 2017 18:47:33 +0100
Message-ID: <39191823.rohElfQe1Q@phil>
References: <1488364463-27075-1-git-send-email-daniel.meng@rock-chips.com>
 <1488364463-27075-2-git-send-email-daniel.meng@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488364463-27075-2-git-send-email-daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org, yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frank.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org, william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

Am Mittwoch, 1. M=E4rz 2017, 18:34:22 CET schrieb Meng Dongyang:
> Due to the u2phy registers are separated from general grf, we need to
> add u2phy grf node and place u2phy node in it. And on some platform,
> the 480m clock may need to assign clock parent in dts in stead of
> clock driver. So this patch add u2phy grf node and property of
> assigned-clocks and assigned-clock-parents to assign parent for 480m
> clock.
> =

> Signed-off-by: Meng Dongyang <daniel.meng-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../bindings/phy/phy-rockchip-inno-usb2.txt        | 47
> ++++++++++++++++++++++ 1 file changed, 47 insertions(+)
> =

> diff --git
> a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt index
> 3c29c77..dda9f22 100644
> --- a/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
> @@ -2,6 +2,7 @@ ROCKCHIP USB2.0 PHY WITH INNO IP BLOCK
> =

>  Required properties (phy (parent) node):
>   - compatible : should be one of the listed compatibles:
> +	* "rockchip,rk3328-usb2phy"
>  	* "rockchip,rk3366-usb2phy"
>  	* "rockchip,rk3399-usb2phy"
>   - reg : the address offset of grf for usb-phy configuration.
> @@ -11,6 +12,11 @@ Required properties (phy (parent) node):
>  Optional properties:
>   - clocks : phandle + phy specifier pair, for the input clock of phy.
>   - clock-names : input clock name of phy, must be "phyclk".
> + - assigned-clocks : phandle of usb 480m clock.
> + - assigned-clock-parents : parent of usb 480m clock, select between
> +		 usb-phy output 480m and xin24m.
> +		 Refer to clk/clock-bindings.txt for generic clock
> +		 consumer properties.
> =

>  Required nodes : a sub-node is required for each port the phy provides.
>  		 The sub-node name is used to identify host or otg port,

this block looks good


> @@ -62,3 +68,44 @@ grf: syscon@ff770000 {
>  		};
>  	};
>  };


> +
> +Required properties (usb2phy grf node):
> + - compatible : should be one of the listed compatibles:
> +		"rockchip,rk3328-usb2phy-grf", "syscon", "simple-mfd";
> + - reg : the address offset of grf for usb-phy configuration.
> + - #address-cells : should be 1.
> + - #size-cells : should be 1.
> +
> +Required nodes : a sub-node is required for the phy provides.
> +		 The sub-node name is used to identify each phy,
> +		 and shall be the following entries:
> +
> +Example:
> +
> +usb2phy_grf: syscon@ff450000 {
> +	compatible =3D "rockchip,rk3328-usb2phy-grf", "syscon",
> +		     "simple-mfd";
> +	reg =3D <0x0 0xff450000 0x0 0x10000>;
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	u2phy: usb2-phy@100 {
> +		compatible =3D "rockchip,rk3328-usb2phy";
> +		reg =3D <0x100 0x10>;
> +		clocks =3D <&xin24m>;
> +		clock-names =3D "phyclk";
> +		#clock-cells =3D <0>;
> +		assigned-clocks =3D <&cru USB480M>;
> +		assigned-clock-parents =3D <&u2phy>;
> +		clock-output-names =3D "usb480m_phy";
> +		status =3D "disabled";
> +
> +		u2phy_host: host-port {
> +			#phy-cells =3D <0>;
> +			interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "linestate";
> +			status =3D "disabled";
> +		};
> +	};
> +};
> +

please don't add this here.

I've looked it up in the TRM and usb2phy-grf are still just "General Regist=
er =

Files", which also include some other registers besides this phy - so =

structure-wise this is good.
But please document the new grf-compatible in the regular
Documentation/devicetree/bindings/soc/rockchip/grf.txt .

And there is no need for a duplicate example, as it is the same structure a=
s =

before, so maybe just add the assigned-clocks parts to the existing example.


Thanks
Heiko
