From: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v8 02/10] drm/hisilicon: Add hisilicon kirin drm master driver
Date: Wed, 13 Apr 2016 13:15:00 +0100
Message-ID: <CACvgo50dggEbwzEZLUvtErzrxOr3B1gECyyehLQZkoE5oXfNmA@mail.gmail.com>
References: <1460364943-76135-1-git-send-email-xinliang.liu@linaro.org>
	<1460364943-76135-3-git-send-email-xinliang.liu@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1460364943-76135-3-git-send-email-xinliang.liu@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
To: Xinliang Liu <xinliang.liu@linaro.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, Daniel Stone <daniel@fooishbar.org>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org, LAKML <linux-arm-kernel@lists.infradead.org>, linuxarm@huawei.com, Andy Green <andy.green@linaro.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, liguozhu@hisilicon.com, xuwei5@hisilicon.com, w.f@huawei.com, puck.chen@hisilicon.com, bintian.wang@huawei.com, Benjamin Gaignard <benjamin.gaignard@linaro.org>, xuyiping@hisilicon.com, kong.kongxinwei@hisilicon.com, Rongrong Zou <zourongrong@huawei.com>, lijianhua@huawei.com
List-Id: devicetree@vger.kernel.org

Hi Xinliang,

On 11 April 2016 at 09:55, Xinliang Liu <xinliang.liu@linaro.org> wrote:

> +static int kirin_drm_connectors_register(struct drm_device *dev)
> +{
> +       struct drm_connector *connector;
> +       struct drm_connector *failed_connector;
> +       int ret;
> +
> +       mutex_lock(&dev->mode_config.mutex);
> +       drm_for_each_connector(connector, dev) {
> +               ret = drm_connector_register(connector);
> +               if (ret) {
> +                       failed_connector = connector;
> +                       goto err;
> +               }
> +       }
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return 0;
> +
> +err:
> +       drm_for_each_connector(connector, dev) {
> +               if (failed_connector == connector)
> +                       break;
> +               drm_connector_unregister(connector);
> +       }
> +       mutex_unlock(&dev->mode_config.mutex);
> +
> +       return ret;
> +}
> +
Iirc we have new drm_connector_{un,}register_all() helpers.You might
want to use it once they are in (i.e. not sure what your base is and
if they have landed yet).


> +static struct device_node *kirin_get_remote_node(struct device_node *np)
> +{
> +       struct device_node *endpoint, *remote;
> +
> +       /* get the first endpoint, in our case only one remote node
> +        * is connected to display controller.
> +        */
> +       endpoint = of_graph_get_next_endpoint(np, NULL);
> +       if (!endpoint) {
> +               DRM_ERROR("no valid endpoint node\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +       of_node_put(endpoint);
> +
> +       remote = of_graph_get_remote_port_parent(endpoint);
> +       if (!remote) {
> +               DRM_ERROR("no valid remote node\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +       of_node_put(remote);
> +
> +       if (!of_device_is_available(remote)) {
> +               DRM_ERROR("not available for remote node\n");
> +               return ERR_PTR(-ENODEV);
> +       }
> +
This seems like a common pattern in many platform DRM drivers. Yet
some tend to differ in subtle ways - I'm leaning that they might be
bugs, but one cannot be too sure.

A friendly request:
Can you please follow up by adding a helper and removing the
duplication thoughout ?

Thanks
Emil
