From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC 1/3] USB: Add document for usb of Hikey960
Date: Thu, 26 Oct 2017 22:47:27 -0500
Message-ID: <20171027034727.ssjes3u5ylzkm2pd@rob-hp-laptop>
References: <20171024060610.10712-1-chenyu56@huawei.com>
 <20171024060610.10712-2-chenyu56@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171024060610.10712-2-chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yu Chen <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, suzhuangluan-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Oct 24, 2017 at 02:06:08PM +0800, Yu Chen wrote:
> DT bindings for usb of Hikey960.
> 
> Signed-off-by: Yu Chen <chenyu56-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Ning Fan <fanning4-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Di Yang <yangdi10-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> Signed-off-by: Rui Li <lirui39-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> 
> ---
>  .../devicetree/bindings/usb/hisilicon-usb.txt      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/hisilicon-usb.txt
> 
> diff --git a/Documentation/devicetree/bindings/usb/hisilicon-usb.txt b/Documentation/devicetree/bindings/usb/hisilicon-usb.txt
> new file mode 100644
> index 000000000000..dc4c460885d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/hisilicon-usb.txt

Should be 3660 specific?

> @@ -0,0 +1,38 @@
> +* HISILICON USB HUB

Looks like a controller, not a hub?

> +
> +Required properties:
> +- compatible: One of the specific types :"hisilicon,hi3660-dwc3",

> +			"hisilicon,gpio_hubv1","hisilicon,gpio_hubv2"

What are these?

> +
> +Optional properties of devices using ISP1301:
> +- transceiver: phandle of isp1301 - this helps the ISP1301 driver to find the
> +               ISP1301 instance associated with the respective USB driver

Really? A full-speed transceiver?

> +
> +Example:
> +
> +	hisi_usb@ff200000 {

usb@...

> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "hisilicon,hi3660-dwc3";
> +		reg = <0x0 0xff200000 0x0 0x1000
> +			 0x0 0xff100000 0x0 0x100000>;
> +		ranges;
> +		bc_again_flag = <0>;

Not documented. Don't use '_' in property names.

> +
> +		clocks = <&crg_ctrl HI3660_CLK_ABB_USB>,
> +			 <&crg_ctrl HI3660_ACLK_GATE_USB3OTG>;
> +		clock-names = "clk_usb3phy_ref", "aclk_usb3otg";
> +		eye_diagram_param = <0x1c466e3>;
> +		eye_diagram_host_param = <0x1c466e3>;
> +		usb3_phy_cr_param = <0xb80>;
> +		usb3_phy_host_cr_param = <0x980>;
> +		usb3_phy_tx_vboost_lvl = <0x5>;

All of these have to be documented.

> +
> +		dwc3@ff100000 {

Ah, it's a DWC3 controller. No references to the common binding?

> +			compatible = "snps,dwc3";
> +			reg = <0x0 0xff100000 0x0 0x100000>;
> +			interrupts = <0 159 4>, <0 161 4>;
> +			dr_mode = "otg";
> +			maximum-speed = "super-speed";
> +		};
> +	};
> \ No newline at end of file

Fix what it says here.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
