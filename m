From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/5] drm: convert drivers to use drm_of_find_panel_or_bridge
Date: Sun, 5 Feb 2017 16:25:39 -0600
Message-ID: <CAL_JsqKnPryTDhXKQtRZ05KZ1KDgNi40JP5W8HFgcEZJUTSBFg@mail.gmail.com>
References: <20170204033635.10250-1-robh@kernel.org> <20170204033635.10250-5-robh@kernel.org>
 <CAOMZO5Cb5Ye4uWtnV=rtaYAJGAS3C0bZAkVAab37PkSdyK=2fw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5Cb5Ye4uWtnV=rtaYAJGAS3C0bZAkVAab37PkSdyK=2fw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefa>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 4, 2017 at 2:26 PM, Fabio Estevam <festevam@gmail.com> wrote:
> Hi Rob,
>
> On Sat, Feb 4, 2017 at 1:36 AM, Rob Herring <robh@kernel.org> wrote:
>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_out.c b/drivers/gpu/drm/mxsfb/mxsfb_out.c
>> index fa8d17399407..f7d729aa09bd 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_out.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_out.c
>> @@ -19,6 +19,7 @@
>>  #include <drm/drm_crtc_helper.h>
>>  #include <drm/drm_fb_cma_helper.h>
>>  #include <drm/drm_gem_cma_helper.h>
>> +#include <drm/drm_of.h>
>>  #include <drm/drm_panel.h>
>>  #include <drm/drm_plane_helper.h>
>>  #include <drm/drm_simple_kms_helper.h>
>> @@ -82,20 +83,15 @@ static const struct drm_connector_funcs mxsfb_panel_connector_funcs = {
>>         .atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
>>  };
>>
>> -static int mxsfb_attach_endpoint(struct drm_device *drm,
>> -                                const struct of_endpoint *ep)
>> +int mxsfb_create_output(struct drm_device *drm)
>>  {
>>         struct mxsfb_drm_private *mxsfb = drm->dev_private;
>> -       struct device_node *np;
>>         struct drm_panel *panel;
>> -       int ret = -EPROBE_DEFER;
>> -
>> -       np = of_graph_get_remote_port_parent(ep->local_node);
>> -       panel = of_drm_find_panel(np);
>> -       of_node_put(np);
>> +       int ret;
>>
>> -       if (!panel)
>> -               return -EPROBE_DEFER;
>> +       ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel, NULL);
>> +       if (ret)
>> +               return ret;
>
> I fixed some build issues of this series and I am trying to use it
> with the mxsfb drm driver.
>
> I would like to add bridge support for this driver, so that I can use
> the TDA19988 HDMI bridge on a imx6sx-udoo-neo-full board.
>
> My dts looks like this:
>
> --- a/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
> +++ b/arch/arm/boot/dts/imx6sx-udoo-neo.dtsi
> @@ -185,6 +185,41 @@
>         };
>  };
>
> +&i2c3 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_i2c3>;
> +       clock-frequency = <100000>;
> +       status = "okay";
> +
> +       hdmi-transmitter@70 {
> +               compatible = "nxp,tda998x";
> +               reg = <0x70>;
> +               pinctrl-0 = <&pinctrl_hdmi>;
> +               pinctrl-names = "default";
> +               interrupt-parent = <&gpio3>;
> +               interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
> +               clocks = <&clks IMX6SX_CLK_CKO2>;
> +
> +               port {
> +                       tda998x_input: endpoint {
> +                               remote-endpoint = <&lcdif1_output>;
> +                       };
> +               };
> +       };
> +};
> +
> +&lcdif1 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_lcd>;
> +       status = "okay";
> +
> +       port {
> +               lcdif1_output: endpoint {
> +                       remote-endpoint = <&tda998x_input>;
> +               };
> +       };
> +};
>
> and I changed it to:
>
> ret = drm_of_find_panel_or_bridge(drm->dev->of_node, 0, 0, &panel, &bridge);
>
> ,but drm_of_find_panel_or_bridge() always returns -EPROBE_DEFER.
>
> Shouldn't it be able to find the bridge chip in this case? Any ideas
> of what it is missing?

Did the bridge driver probe? This function just checks lists of
registered panels and bridges.

Rob
