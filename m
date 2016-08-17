From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v12 PATCH 4/5] Documentation: bindings: add dt
 documentation for cdn DP controller
Date: Wed, 17 Aug 2016 10:28:59 -0700
Message-ID: <CABXOdTeYAQOBMX=v4cuCYe=f1d_5y7RFjW_zjOyrr85o91aUnA@mail.gmail.com>
References: <1471290938-22569-1-git-send-email-zyw@rock-chips.com> <1471290938-22569-5-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471290938-22569-5-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Aug 15, 2016 at 12:55 PM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
> This patch adds a binding that describes the cdn DP controller for
> rk3399.
>
> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Reviewed-by: Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

>
> ---
>
> Changes in v12: None
> Changes in v11:
> - refer dp phy
>
> Changes in v10:
> - add pclk_vio_grf clock
>
> Changes in v9:
> - modify the reference phy = <&tcphy0 0>, <&tcphy1 0>;
>
> Changes in v8: None
> Changes in v7: None
> Changes in v6:
> - add assigned-clocks and assigned-clock-rates
> - add power-domains
>
> Changes in v5: None
> Changes in v4:
> - add a reset node
> - support 2 phys
>
> Changes in v3:
> - add SoC specific compatible string
> - remove reg = <1>;
>
> Changes in v2: None
> Changes in v1:
> - add extcon node description
> - add #sound-dai-cells description
>
>  .../bindings/display/rockchip/cdn-dp-rockchip.txt  | 74 ++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>
> diff --git a/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
> new file mode 100644
> index 0000000..d34a56e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
> @@ -0,0 +1,74 @@
> +Rockchip RK3399 specific extensions to the cdn Display Port
> +================================
> +
> +Required properties:
> +- compatible: must be "rockchip,rk3399-cdn-dp"
> +
> +- reg: physical base address of the controller and length
> +
> +- clocks: from common clock binding: handle to dp clock.
> +
> +- clock-names: from common clock binding:
> +              Required elements: "core-clk" "pclk" "spdif" "grf"
> +
> +- resets : a list of phandle + reset specifier pairs
> +- reset-names : string reset name, must be:
> +               "spdif"
> +- power-domains : power-domain property defined with a phandle
> +                 to respective power domain.
> +- assigned-clocks: main clock, should be <&cru SCLK_DP_CORE>
> +- assigned-clock-rates : the DP core clk frequency, shall be: 100000000
> +
> +- rockchip,grf: this soc should set GRF regs, so need get grf here.
> +
> +- ports: contain a port nodes with endpoint definitions as defined in
> +        Documentation/devicetree/bindings/media/video-interfaces.txt.
> +        contained 2 endpoints, connecting to the output of vop.
> +
> +- phys: from general PHY binding: the phandle for the PHY device.
> +
> +- extcon: extcon specifier for the Power Delivery
> +
> +- #sound-dai-cells = it must be 1 if your system is using 2 DAIs: I2S, SPDIF
> +
> +-------------------------------------------------------------------------------
> +
> +Example:
> +       cdn_dp: dp@fec00000 {
> +               compatible = "rockchip,rk3399-cdn-dp";
> +               reg = <0x0 0xfec00000 0x0 0x100000>;
> +               interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
> +                        <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
> +               clock-names = "core-clk", "pclk", "spdif", "grf";
> +               assigned-clocks = <&cru SCLK_DP_CORE>;
> +               assigned-clock-rates = <100000000>;
> +               power-domains = <&power RK3399_PD_HDCP>;
> +               phys = <&tcphy0_dp>, <&tcphy1_dp>;
> +               resets = <&cru SRST_DPTX_SPDIF_REC>;
> +               reset-names = "spdif";
> +               extcon = <&fusb0>, <&fusb1>;
> +               rockchip,grf = <&grf>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               #sound-dai-cells = <1>;
> +
> +               ports {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       dp_in: port {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               dp_in_vopb: endpoint@0 {
> +                                       reg = <0>;
> +                                       remote-endpoint = <&vopb_out_dp>;
> +                               };
> +
> +                               dp_in_vopl: endpoint@1 {
> +                                       reg = <1>;
> +                                       remote-endpoint = <&vopl_out_dp>;
> +                               };
> +                       };
> +               };
> +       };
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
