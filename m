From: Kever Yang <ellisys-9Onoh4P/yGk@public.gmane.org>
Subject: Re: [v2 PATCH 1/4] Documentation: bindings: add dt doc for Rockchip
 USB Type-C PHY
Date: Thu, 16 Jun 2016 20:43:33 +0800
Message-ID: <57629EF5.2050508@163.com>
References: <1465810789-22303-1-git-send-email-zyw@rock-chips.com>
 <1465810789-22303-2-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1465810789-22303-2-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org, groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Chris,

On 06/13/2016 05:39 PM, Chris Zhong wrote:
> This patch adds a binding that describes the Rockchip USB Type-C PHY
> for rk3399
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>
> ---
>
> Changes in v2:
> - add some registers description
>
> Changes in v1:
> - add extcon node description
> - move the registers in phy driver
> - remove the suffix of reset
>
>   .../devicetree/bindings/phy/phy-rockchip-typec.txt | 77 ++++++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>
> diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> new file mode 100644
> index 0000000..430920c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
> @@ -0,0 +1,77 @@
> +* ROCKCHIP type-c PHY
> +---------------------
> +
> +Required properties:
> + - compatible : should be "rockchip,rk3399-typec-phy0" or
> +			 "rockchip,rk3399-typec-phy1"
should be "rockchip,rk3399-typec-phy"
> + - reg: Address and length of the usb phy control register set
> + - rockchip,grf : phandle to the syscon managing the "general
> +   register files"
> + - clocks : phandle + clock specifier for the phy clocks
> + - clock-names : string, clock name, must be "tcpdcore", "tcpdphy_ref";
> + - resets : a list of phandle + reset specifier pairs
> + - reset-names : string reset name, must be:
> +		 "tcphy", "tcphy_pipe", "uphy_tcphy"
> + - #phy-cells : Must be 0.  See ./phy-bindings.txt for details.
> + - extcon : extcon specifier for the Power Delivery
> +
> +Note, there are 2 type-c phys for RK3399, and they are almost identical, except
> +these registers(description below), every register node contains 3 sections:
> +offset, enable bit, write mask bit.
> + - rockchip,typec_conn_dir : the register of type-c connector direction,
> +   for type-c phy0, it must be <0xe580 0 16>;
> +   for type-c phy1, it must be <0xe58c 0 16>;
> + - rockchip,usb3tousb2_en : the register of type-c force usb3 to usb2 enable
> +   control.
> +   for type-c phy0, it must be <0xe580 3 19>;
> +   for type-c phy1, it must be <0xe58c 3 19>;
> + - rockchip,external_psm : the register of type-c phy external psm clock
> +   selection.
> +   for type-c phy0, it must be <0xe588 14 30>;
> +   for type-c phy1, it must be <0xe594 14 30>;
> + - rockchip,pipe_status : the register of type-c phy pipe status.
> +   for type-c phy0, it must be <0xe5c0 0 0>;
> +   for type-c phy1, it must be <0xe5c0 16 16>;
> + - rockchip,uphy_dp_sel : the register of type-c phy selection for DP
> +   for type-c phy0, it must be <0x6268 19 19>;
> +   for type-c phy1, it must be <0x6268 3 19>;
> +
> +Example:
> +	tcphy0: phy@ff7c0000 {
> +		compatible = "rockchip,rk3399-typec-phy0";
should be "rockchip,rk3399-typec-phy"
> +		reg = <0x0 0xff7c0000 0x0 0x40000>;
> +		#phy-cells = <0>;
> +		extcon = <&fusb1>;
> +		rockchip,grf = <&grf>;
> +		clocks = <&cru SCLK_UPHY0_TCPDCORE>,
> +			 <&cru SCLK_UPHY0_TCPDPHY_REF>;
> +		clock-names = "tcpdcore", "tcpdphy_ref";
> +		resets = <&cru SRST_UPHY0>,
> +			 <&cru SRST_UPHY0_PIPE_L00>,
> +			 <&cru SRST_P_UPHY0_TCPHY>;
> +		reset-names = "tcphy", "tcphy_pipe", "uphy_tcphy";
> +		rockchip,typec_conn_dir = <0xe580 0 16>;
> +		rockchip,usb3tousb2_en = <0xe580 3 19>;
> +		rockchip,external_psm = <0xe588 14 30>;
> +		rockchip,pipe_status = <0xe5c0 0 0>;
> +		rockchip,uphy_dp_sel = <0x6268 19 19>;
> +	};
> +
> +	tcphy1: phy@ff800000 {
> +		compatible = "rockchip,rk3399-typec-phy1";
should be "rockchip,rk3399-typec-phy"

Feel free to ad my Reviewed-by after these update.

Thanks,
- Kever
> +		reg = <0x0 0xff800000 0x0 0x40000>;
> +		#phy-cells = <0>;
> +		rockchip,grf = <&grf>;
> +		clocks = <&cru SCLK_UPHY1_TCPDCORE>,
> +			 <&cru SCLK_UPHY1_TCPDPHY_REF>;
> +		clock-names = "tcpdcore", "tcpdphy_ref";
> +		resets = <&cru SRST_UPHY1>,
> +		         <&cru SRST_UPHY1_PIPE_L00>,
> +			 <&cru SRST_P_UPHY1_TCPHY>;
> +		reset-names = "tcphy", "tcphy_pipe", "uphy_tcphy";
> +		rockchip,typec_conn_dir = <0xe58c 0 16>;
> +		rockchip,usb3tousb2_en = <0xe58c 3 19>;
> +		rockchip,external_psm = <0xe594 14 30>;
> +		rockchip,pipe_status = <0xe5c0 16 16>;
> +		rockchip,uphy_dp_sel = <0x6268 3 19>;
> +	};
