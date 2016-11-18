From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
Subject: Re: [v3,2/3] drm/bridge: Add ti-tfp410 DVI transmitter driver
Date: Fri, 18 Nov 2016 06:00:14 +0100
Message-ID: <09499db556b444f9aa88aadf0cae4f2d@rwthex-s1-b.rwth-ad.de>
References: <6eaa1b5d467cd354f7d5dc5ff8da1b9bf732ff11.1479388871.git.jsarha@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6eaa1b5d467cd354f7d5dc5ff8da1b9bf732ff11.1479388871.git.jsarha-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, "Spinrath, Christopher" <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jyri,

On 11/17/2016 02:28 PM, Jyri Sarha wrote:
> Add very basic ti-ftp410 DVI transmitter driver. The only feature

s/ftp/tfp ?

> separating this from a completely dummy bridge is the EDID read
> support trough DDC I2C. Even that functionality should be in a
> separate generic connector driver. However, because of missing DRM
> infrastructure support the connector is implemented within the bridge
> driver. Some tfp410 HW specific features may be added later if needed,
> because there is a set of registers behind i2c if it is connected.
> 
> This implementation is tested against my new tilcdc bridge support
> and it works with BeagleBone DVI-D Cape Rev A3. A DT binding document
> is also added.
> 
> Signed-off-by: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>

Thanks for working on this. I have tested the driver on my Utilite Pro
which is based on the imx6q SoC and has a tfp410 chip hooked up to its
parallel rgb24 interface. So you can add my

Tested-By: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>

However, I have two more comments below.

> ---
>  .../bindings/display/bridge/ti,tfp410.txt          |  40 +++
>  drivers/gpu/drm/bridge/Kconfig                     |   7 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  drivers/gpu/drm/bridge/ti-tfp410.c                 | 287 +++++++++++++++++++++
>  4 files changed, 335 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
>  create mode 100644 drivers/gpu/drm/bridge/ti-tfp410.c
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
> new file mode 100644
> index 0000000..6174b18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt

There already is a binding documentation for the tfp410 in

  Documentation/devicetree/bindings/display/ti/ti,tfp410.txt .

It is used by the omap drm driver. IMHO you should extend, move or
deprecate that one. Note that it describes an optional powerdown-gpios
property.

> @@ -0,0 +1,40 @@
> +TFP410 DVI bridge bindings
> +
> +Required properties:
> +	- compatible: "ti,tfp410"
> +
> +Optional properties
> +	- reg: I2C address. If and only if present the device node
> +	  should be placed into the i2c controller node where the
> +	  tfp410 i2c is connected to.
> +
> +Required subnodes:
> +	- port@0: Video input port node to connect the bridge to a
> +	  display controller output [1].
> +	- port@1: Video output port node to connect the bridge to a
> +	  connector input [1].
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +	hdmi-bridge {
> +		compatible = "ti,tfp410";
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				bridge_in: endpoint {
> +					remote-endpoint = <&dc_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				bridge_out: endpoint {
> +					remote-endpoint = <&hdmi_in>;
> +				};
> +			};
> +		};
> +	};
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index bd6acc8..a424e03 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -81,6 +81,13 @@ config DRM_TOSHIBA_TC358767
>  	---help---
>  	  Toshiba TC358767 eDP bridge chip driver.
>  
> +config DRM_TI_TFP410
> +	tristate "TI TFP410 DVI/HDMI bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	---help---
> +	  Texas Instruments TFP410 DVI/HDMI Transmitter driver
> +
>  source "drivers/gpu/drm/bridge/analogix/Kconfig"
>  
>  source "drivers/gpu/drm/bridge/adv7511/Kconfig"
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 97ed1a5..8b065d9 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
>  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
> +obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> new file mode 100644
> index 0000000..64f54e4
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -0,0 +1,287 @@
> +/*
> + * Copyright (C) 2016 Texas Instruments
> + * Author: Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/i2c.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_crtc_helper.h>
> +
> +struct tfp410 {
> +	struct drm_bridge	bridge;
> +	struct drm_connector	connector;
> +
> +	struct i2c_adapter	*ddc;
> +
> +	struct device *dev;
> +};
> +
> +static inline struct tfp410 *
> +drm_bridge_to_tfp410(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct tfp410, bridge);
> +}
> +
> +static inline struct tfp410 *
> +drm_connector_to_tfp410(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct tfp410, connector);
> +}
> +
> +static int tfp410_get_modes(struct drm_connector *connector)
> +{
> +	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
> +	struct edid *edid;
> +	int ret;
> +
> +	if (!dvi->ddc)
> +		goto fallback;
> +
> +	edid = drm_get_edid(connector, dvi->ddc);
> +	if (!edid) {
> +		DRM_INFO("EDID read failed. Fallback to standard modes\n");
> +		goto fallback;
> +	}
> +
> +	drm_mode_connector_update_edid_property(connector, edid);
> +
> +	return drm_add_edid_modes(connector, edid);
> +fallback:
> +	/* No EDID, fallback on the XGA standard modes */
> +	ret = drm_add_modes_noedid(connector, 1920, 1200);
> +
> +	/* And prefer a mode pretty much anything can handle */
> +	drm_set_preferred_mode(connector, 1024, 768);
> +
> +	return ret;
> +}
> +
> +static const struct drm_connector_helper_funcs tfp410_con_helper_funcs = {
> +	.get_modes	= tfp410_get_modes,
> +};
> +
> +static enum drm_connector_status
> +tfp410_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
> +
> +	if (dvi->ddc) {
> +		if (drm_probe_ddc(dvi->ddc))
> +			return connector_status_connected;
> +		else
> +			return connector_status_disconnected;
> +	}

I wonder what happens if a display with none or defect ddc/edid is
attached? The dumb-vga-dac bridge driver reports
connector_status_unknown in the case drm_probe_ddc fails.

Cheers,
Christopher

> +
> +	return connector_status_unknown;
> +}
> +
> +static const struct drm_connector_funcs tfp410_con_funcs = {
> +	.dpms			= drm_atomic_helper_connector_dpms,
> +	.detect			= tfp410_connector_detect,
> +	.fill_modes		= drm_helper_probe_single_connector_modes,
> +	.destroy		= drm_connector_cleanup,
> +	.reset			= drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state	= drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int tfp410_attach(struct drm_bridge *bridge)
> +{
> +	struct tfp410 *dvi = drm_bridge_to_tfp410(bridge);
> +	int ret;
> +
> +	if (!bridge->encoder) {
> +		dev_err(dvi->dev, "Missing encoder\n");
> +		return -ENODEV;
> +	}
> +
> +	drm_connector_helper_add(&dvi->connector,
> +				 &tfp410_con_helper_funcs);
> +	ret = drm_connector_init(bridge->dev, &dvi->connector,
> +				 &tfp410_con_funcs, DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret) {
> +		dev_err(dvi->dev, "drm_connector_init() failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	drm_mode_connector_attach_encoder(&dvi->connector,
> +					  bridge->encoder);
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs tfp410_bridge_funcs = {
> +	.attach		= tfp410_attach,
> +};
> +
> +static int tfp410_get_connector_ddc(struct tfp410 *dvi)
> +{
> +	struct device_node *ep = NULL, *connector_node = NULL;
> +	struct device_node *ddc_phandle = NULL;
> +	int ret = 0;
> +
> +	/* port@1 is the connector node */
> +	ep = of_graph_get_endpoint_by_regs(dvi->dev->of_node, 1, -1);
> +	if (!ep)
> +		goto fail;
> +
> +	connector_node = of_graph_get_remote_port_parent(ep);
> +	if (!connector_node)
> +		goto fail;
> +
> +	ddc_phandle = of_parse_phandle(connector_node, "ddc-i2c-bus", 0);
> +	if (!ddc_phandle)
> +		goto fail;
> +
> +	dvi->ddc = of_get_i2c_adapter_by_node(ddc_phandle);
> +	if (dvi->ddc)
> +		dev_info(dvi->dev, "Connector's ddc i2c bus found\n");
> +	else
> +		ret = -EPROBE_DEFER;
> +
> +fail:
> +	of_node_put(ep);
> +	of_node_put(connector_node);
> +	of_node_put(ddc_phandle);
> +	return ret;
> +}
> +
> +static int tfp410_init(struct device *dev)
> +{
> +	struct tfp410 *dvi;
> +	int ret;
> +
> +	if (!dev->of_node) {
> +		dev_err(dev, "device-tree data is missing\n");
> +		return -ENXIO;
> +	}
> +
> +	dvi = devm_kzalloc(dev, sizeof(*dvi), GFP_KERNEL);
> +	if (!dvi)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, dvi);
> +
> +	dvi->bridge.funcs = &tfp410_bridge_funcs;
> +	dvi->bridge.of_node = dev->of_node;
> +	dvi->dev = dev;
> +
> +	ret = tfp410_get_connector_ddc(dvi);
> +	if (ret)
> +		goto fail;
> +
> +	ret = drm_bridge_add(&dvi->bridge);
> +	if (ret) {
> +		dev_err(dev, "drm_bridge_add() failed: %d\n", ret);
> +		goto fail;
> +	}
> +
> +	return 0;
> +fail:
> +	i2c_put_adapter(dvi->ddc);
> +	return ret;
> +}
> +
> +static int tfp410_fini(struct device *dev)
> +{
> +	struct tfp410 *dvi = dev_get_drvdata(dev);
> +
> +	drm_bridge_remove(&dvi->bridge);
> +
> +	if (dvi->ddc)
> +		i2c_put_adapter(dvi->ddc);
> +
> +	return 0;
> +}
> +
> +static int tfp410_probe(struct platform_device *pdev)
> +{
> +	return tfp410_init(&pdev->dev);
> +}
> +
> +static int tfp410_remove(struct platform_device *pdev)
> +{
> +	return tfp410_fini(&pdev->dev);
> +}
> +
> +/* There is currently no i2c functionality. */
> +static int tfp410_i2c_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	int reg;
> +
> +	if (!client->dev.of_node ||
> +	    of_property_read_u32(client->dev.of_node, "reg", &reg)) {
> +		dev_err(&client->dev,
> +			"Can't get i2c reg property from device-tree\n");
> +		return -ENXIO;
> +	}
> +
> +	return tfp410_init(&client->dev);
> +}
> +
> +static int tfp410_i2c_remove(struct i2c_client *client)
> +{
> +	return tfp410_fini(&client->dev);
> +}
> +
> +static const struct of_device_id tfp410_match[] = {
> +	{ .compatible = "ti,tfp410" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, tfp410_match);
> +
> +struct platform_driver tfp410_platform_driver = {
> +	.probe	= tfp410_probe,
> +	.remove	= tfp410_remove,
> +	.driver	= {
> +		.name		= "tfp410-bridge",
> +		.of_match_table	= tfp410_match,
> +	},
> +};
> +
> +static const struct i2c_device_id tfp410_i2c_ids[] = {
> +	{ "tfp410", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
> +
> +static struct i2c_driver tfp410_i2c_driver = {
> +	.driver = {
> +		.name	= "tfp410",
> +		.of_match_table = of_match_ptr(tfp410_match),
> +	},
> +	.id_table	= tfp410_i2c_ids,
> +	.probe		= tfp410_i2c_probe,
> +	.remove		= tfp410_i2c_remove,
> +};
> +
> +static int __init tfp410_module_init(void)
> +{
> +	i2c_add_driver(&tfp410_i2c_driver);
> +	platform_driver_register(&tfp410_platform_driver);
> +
> +	return 0;
> +}
> +module_init(tfp410_module_init);
> +
> +static void __exit tfp410_module_exit(void)
> +{
> +	i2c_del_driver(&tfp410_i2c_driver);
> +	platform_driver_unregister(&tfp410_platform_driver);
> +}
> +module_exit(tfp410_module_exit);
> +
> +MODULE_AUTHOR("Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>");
> +MODULE_DESCRIPTION("TI TFP410 DVI bridge driver");
> +MODULE_LICENSE("GPL");
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
