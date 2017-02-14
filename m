From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] drm: convert drivers to use drm_of_find_panel_or_bridge
Date: Mon, 13 Feb 2017 19:16:21 -0600
Message-ID: <CAL_JsqL0u-M29f9Va0pWtuUB8S_Zf=cn5dKhKCmih+_oYsETqQ@mail.gmail.com>
References: <20170209190558.4784-1-robh@kernel.org> <20170209190558.4784-6-robh@kernel.org>
 <20170213084710.4eabcb15@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170213084710.4eabcb15@bbrezillon>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Archit Taneja <architt@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@freescale.com>, Xinliang
List-Id: devicetree@vger.kernel.org

On Mon, Feb 13, 2017 at 1:47 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Thu,  9 Feb 2017 13:05:57 -0600
> Rob Herring <robh@kernel.org> wrote:
>
>> Similar to the previous commit, convert drivers open coding OF graph
>> parsing to use drm_of_find_panel_or_bridge instead.
>>
>> This changes some error messages to debug messages (in the graph core).
>> Graph connections are often "no connects" depending on the particular
>> board, so we want to avoid spurious messages. Plus the kernel is not a
>> DT validator.
>>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> v2:
>> - fix wrong node ptr in imx-ldb
>> - build fixes in kirin and imx drivers
>>
>>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c | 64 ++++-------------
>>  drivers/gpu/drm/bridge/nxp-ptn3460.c             | 16 ++---
>>  drivers/gpu/drm/bridge/parade-ps8622.c           | 16 ++---
>>  drivers/gpu/drm/bridge/tc358767.c                | 27 +------
>>  drivers/gpu/drm/exynos/exynos_dp.c               | 35 ++++-----
>>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c        | 49 ++++---------
>>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c     | 27 ++-----
>>  drivers/gpu/drm/imx/imx-ldb.c                    | 27 ++-----
>>  drivers/gpu/drm/imx/parallel-display.c           | 36 ++--------
>>  drivers/gpu/drm/mediatek/mtk_dsi.c               | 23 ++----
>>  drivers/gpu/drm/mxsfb/mxsfb_out.c                | 36 ++--------
>>  drivers/gpu/drm/rockchip/analogix_dp-rockchip.c  | 26 ++-----
>>  drivers/gpu/drm/sun4i/sun4i_rgb.c                | 13 ++--
>>  drivers/gpu/drm/sun4i/sun4i_tcon.c               | 90 ++----------------------
>>  14 files changed, 88 insertions(+), 397 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> index 6119b5085501..4614048a4935 100644
>> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
>> @@ -22,7 +22,7 @@
>>  #include <linux/of_graph.h>
>>
>>  #include <drm/drmP.h>
>> -#include <drm/drm_panel.h>
>> +#include <drm/drm_of.h>
>>
>>  #include "atmel_hlcdc_dc.h"
>>
>> @@ -152,29 +152,11 @@ static const struct drm_connector_funcs atmel_hlcdc_panel_connector_funcs = {
>>       .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>  };
>>
>> -static int atmel_hlcdc_check_endpoint(struct drm_device *dev,
>> -                                   const struct of_endpoint *ep)
>> -{
>> -     struct device_node *np;
>> -     void *obj;
>> -
>> -     np = of_graph_get_remote_port_parent(ep->local_node);
>> -
>> -     obj = of_drm_find_panel(np);
>> -     if (!obj)
>> -             obj = of_drm_find_bridge(np);
>> -
>> -     of_node_put(np);
>> -
>> -     return obj ? 0 : -EPROBE_DEFER;
>> -}
>> -
>>  static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>> -                                    const struct of_endpoint *ep)
>> +                                    const struct device_node *np)
>>  {
>>       struct atmel_hlcdc_dc *dc = dev->dev_private;
>>       struct atmel_hlcdc_rgb_output *output;
>> -     struct device_node *np;
>>       struct drm_panel *panel;
>>       struct drm_bridge *bridge;
>>       int ret;
>> @@ -195,13 +177,11 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>>
>>       output->encoder.possible_crtcs = 0x1;
>>
>> -     np = of_graph_get_remote_port_parent(ep->local_node);
>> -
>> -     ret = -EPROBE_DEFER;
>> +     ret = drm_of_find_panel_or_bridge(np, 0, 0, &panel, &bridge);
>> +     if (ret)
>> +             return ret;
>>
>> -     panel = of_drm_find_panel(np);
>>       if (panel) {
>> -             of_node_put(np);
>>               output->connector.dpms = DRM_MODE_DPMS_OFF;
>>               output->connector.polled = DRM_CONNECTOR_POLL_CONNECT;
>>               drm_connector_helper_add(&output->connector,
>> @@ -226,9 +206,6 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>>               return 0;
>>       }
>>
>> -     bridge = of_drm_find_bridge(np);
>> -     of_node_put(np);
>> -
>>       if (bridge) {
>>               output->encoder.bridge = bridge;
>>               bridge->encoder = &output->encoder;
>> @@ -245,31 +222,14 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>>
>>  int atmel_hlcdc_create_outputs(struct drm_device *dev)
>>  {
>> -     struct device_node *ep_np = NULL;
>> -     struct of_endpoint ep;
>> +     struct device_node *remote;
>>       int ret;
>>
>> -     for_each_endpoint_of_node(dev->dev->of_node, ep_np) {
>> -             ret = of_graph_parse_endpoint(ep_np, &ep);
>> -             if (!ret)
>> -                     ret = atmel_hlcdc_check_endpoint(dev, &ep);
>> -
>> -             if (ret) {
>> -                     of_node_put(ep_np);
>> -                     return ret;
>> -             }
>> -     }
>> -
>> -     for_each_endpoint_of_node(dev->dev->of_node, ep_np) {
>> -             ret = of_graph_parse_endpoint(ep_np, &ep);
>> -             if (!ret)
>> -                     ret = atmel_hlcdc_attach_endpoint(dev, &ep);
>> -
>> -             if (ret) {
>> -                     of_node_put(ep_np);
>> -                     return ret;
>> -             }
>> -     }
>> +     remote = of_graph_get_remote_node(dev->dev->of_node, 0, 0);
>> +     if (!remote)
>> +             return -ENODEV;
>
> I know you said ports and endpoints should be statically assigned and
> documented in the DT bindings doc, while I agree with the ports part,
> having static endpoints numbering is not possible in some cases.

Okay, I guess it's more that ports are defined. For cases, where you
have a 1 to N connection like this, then yes it's okay.

> Here the port exposed by the Atmel display controller is a raw RGB (or
> parallel RGB) port, and you can connect as many devices as you want to
> this port. For example, on some atmel boards with have 1 bridge ans 1
> panel connected to the same port (but we could have X bridges and Y
> panels and it would work the same way), hence the
> for_each_endpoint_of_node() loop used to connect panels and bridges to
> the controller.
> With your change, my use case no longer works, I can either have the
> panel or the bridge, but not both.
>
> Something like the following would solve the problem:
>
>         endpoint = 0;
>         while (true) {
>                 remote = of_graph_get_remote_node(dev->dev->of_node, 0,
>                                                   endpoint++);
>                 if (!remote)
>                         break;
>
>                 ret = atmel_hlcdc_attach_endpoint(dev, remote);
>                 if (ret)
>                         return ret;
>         }
>
>         if (!endpoint)
>                 return -ENODEV;
>
>         return 0;
>
> If you're not happy with the 'random number of endpoints' thing, can
> you suggest another approach to handle the raw RGB port case (I'm
> pretty sure I'm not the only one to have this use case).

This seems fine to me. The question I have is whether to handle this
loop in the core and whether to have a loop iterator. There's a few
cases of iterating thru all the ports getting remote nodes that I was
thinking about how to handle too.

Rob
