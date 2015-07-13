From: Mark yao <mark.yao@rock-chips.com>
Subject: Re: [PATCH v8 1/4] drm/layerscape: Add Freescale DCU DRM driver
Date: Mon, 13 Jul 2015 15:56:41 +0800
Message-ID: <55A36F39.1060109@rock-chips.com>
References: <1436767211-38571-1-git-send-email-jianwei.wang@freescale.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0906966328=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1436767211-38571-1-git-send-email-jianwei.wang@freescale.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jianwei Wang <jianwei.wang@freescale.com>, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, Xiubo Li <lixiubo@cmss.chinamobile.com>, daniel.vetter@ffwll.ch, Alison Wang <b18965@freescale.com>, linux-kernel@vger.kernel.org, scottwood@freescale.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is a multi-part message in MIME format.
--===============0906966328==
Content-Type: multipart/alternative;
 boundary="------------050903070108010904030809"

This is a multi-part message in MIME format.
--------------050903070108010904030809
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2015=E5=B9=B407=E6=9C=8813=E6=97=A5 14:00, Jianwei Wang wrote:
> This patch add support for Two Dimensional Animation and Compositing
> Engine (2D-ACE) on the Freescale SoCs.
>
> 2D-ACE is a Freescale display controller. 2D-ACE describes
> the functionality of the module extremely well its name is a value
> that cannot be used as a token in programming languages.
> Instead the valid token "DCU" is used to tag the register names and
> function names.
>
> The Display Controller Unit (DCU) module is a system master that
> fetches graphics stored in internal or external memory and displays
> them on a TFT LCD panel. A wide range of panel sizes is supported
> and the timing of the interface signals is highly configurable.
> Graphics are read directly from memory and then blended in real-time,
> which allows for dynamic content creation with minimal CPU
> intervention.
>
> The features:
> (1) Full RGB888 output to TFT LCD panel.
> (2) For the current LCD panel, WQVGA "480x272" is supported.
> (3) Blending of each pixel using up to 4 source layers
> dependent on size of panel.
> (4) Each graphic layer can be placed with one pixel resolution
> in either axis.
> (5) Each graphic layer support RGB565 and RGB888 direct colors
> without alpha
> channel and BGRA8888 BGRA4444 ARGB1555 direct colors with an
> alpha channel and YUV422 format.
> (6) Each graphic layer support alpha blending with 8-bit
> resolution.
>
> This is a simplified version, only one primary plane, one
> framebuffer, one crtc, one connector and one encoder for TFT LCD panel.
>
> Signed-off-by: Alison Wang <b18965@freescale.com>
> Signed-off-by: Xiubo Li <lixiubo@cmss.chinamobile.com>
> Signed-off-by: Jianwei Wang <jianwei.wang@freescale.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Alison Wang <alison.wang@freescale.com>
> ---
>
>
> hanged in V8
> - Remove useless code
>    #define DRIVER_NAME     "fsl-dcu-drm"
>    MODULE_ALIAS("platform:fsl-dcu-drm");
> Adviced by Paul Bolle
>
> Changed in V7
>
> - Remove redundant functions and replace deprecated hooker
> Adviced by Daniel Vetter
> - Replace drm_platform_init with drm_dev_alloc/register
> Adviced by Daniel Vetter
>
> Changed in V6
>
> - Add NEC nl4827hc19_05b panel to panel-simple.c
> Adviced by Mark Yao
> - Add DRIVER_ATOMIC for driver_features
> Adviced by Mark Yao
> - check fsl_dev if it's NULL at PM suspend/resume
> Adviced by Mark Yao
>
> Changed in V5
>
> - Update commit message
> - Add layer registers initialization
> - Remove unused functions
> - Rename driver folder
> Adviced by Stefan Agner
> - Move pixel clock control functions to fsl_dcu_drm_drv.c
> - remove redundant enable the clock implicitly using regmap
> Adviced by Stefan Agner
> - Add maintainer message
>
> Changed in V4:
>
> -This version doesn't have functionality changed
>   Just a minor adjustment.
>
> Changed in V3:
>
> - Test driver on Vybrid board and add compatible string
> - Remove unused functions
> - set default crtc for encoder
> - replace legacy functions with atomic help functions
> Adviced by Daniel Vetter
> - Set the unique name of the DRM device
> - Implement irq handle function for vblank interrupt
>
> Changed in v2:
> - Add atomic support
> Adviced by Daniel Vetter
> - Modify bindings file
> - Rename node for compatibility
> - Move platform related code out for compatibility
> Adviced by Stefan Agner
>
[snip]
>
> +int fsl_dcu_drm_connector_create(struct fsl_dcu_drm_device *fsl_dev,
> +				 struct drm_encoder *encoder)
> +{
> +	struct drm_connector *connector =3D &fsl_dev->connector.connector;
> +	struct device_node *panel_node;
> +	int ret;
> +
> +	fsl_dev->connector.encoder =3D encoder;
> +
> +	connector->display_info.width_mm =3D 0;
> +	connector->display_info.height_mm =3D 0;
> +
> +	ret =3D drm_connector_init(fsl_dev->ddev, connector,
> +				 &fsl_dcu_drm_connector_funcs,
> +				 DRM_MODE_CONNECTOR_LVDS);
> +	if (ret < 0)
> +		return ret;
> +
> +	connector->dpms =3D DRM_MODE_DPMS_OFF;
> +	drm_connector_helper_add(connector, &connector_helper_funcs);
> +	ret =3D drm_connector_register(connector);
> +	if (ret < 0)
> +		goto err_cleanup;
> +
> +	ret =3D drm_mode_connector_attach_encoder(connector, encoder);
> +	if (ret < 0)
> +		goto err_sysfs;
> +
> +	connector->encoder =3D encoder;
> +
> +	drm_object_property_set_value
> +		(&connector->base, fsl_dev->ddev->mode_config.dpms_property,
> +		DRM_MODE_DPMS_OFF);
> +
> +	panel_node =3D of_parse_phandle(fsl_dev->np, "panel", 0);
> +	if (panel_node) {
> +		fsl_dev->connector.panel =3D of_drm_find_panel(panel_node);
> +		if (!fsl_dev->connector.panel)
> +			return -EPROBE_DEFER;
> +	}
> +

I think cleanup is needed before return -EPROBE_DEFER, and put node=20
after use.

     panel_node =3D of_parse_phandle(fsl_dev->np, "panel", 0);
     if (panel_node) {
         fsl_dev->connector.panel =3D of_drm_find_panel(panel_node);
         if (!fsl_dev->connector.panel) {
             of_node_put(panel_node);
             ret =3D -EPROBE_DEFER;
             goto err_sysfs;
         }
     }

     of_node_put(panel_node);


> +	ret =3D drm_panel_attach(fsl_dev->connector.panel, connector);
> +	if (ret) {
> +		dev_err(fsl_dev->dev, "failed to attach panel\n");
> +		goto err_sysfs;
> +	}
> +
> +	return 0;
> +
> +err_sysfs:
> +	drm_connector_unregister(connector);
> +err_cleanup:
> +	drm_connector_cleanup(connector);
> +	return ret;
> +}

[snip]

> +
> +static int fsl_dcu_bypass_tcon(struct fsl_dcu_drm_device *fsl_dev,
> +			       struct device_node *np)
> +{
> +	struct device_node *tcon_np;
> +	struct platform_device *pdev;
> +	struct clk *tcon_clk;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	tcon_np =3D of_parse_phandle(np, "tcon-controller", 0);
> +	if (!tcon_np)
> +		return -EINVAL;
> +
> +	pdev =3D of_find_device_by_node(tcon_np);
> +	if (!pdev)
> +		return -EINVAL;
> +
> +	tcon_clk =3D devm_clk_get(&pdev->dev, "tcon");
> +	if (IS_ERR(tcon_clk))
> +		return PTR_ERR(tcon_clk);
> +	clk_prepare_enable(tcon_clk);
> +

clk_prepare_enable may fail, so please check the return value.


R ecommend that split clk_prepare_enable() to clk_prepare() and=20
clk_enable(),
use clk_prepare() only at clk first init, enable/disable by=20
clk_enable()/clk_disable().


> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENODEV;
> +
> +	base =3D devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	fsl_dev->tcon_regmap =3D devm_regmap_init_mmio(&pdev->dev,
> +			base, &fsl_dcu_regmap_config);
> +	if (IS_ERR(fsl_dev->tcon_regmap)) {
> +		dev_err(&pdev->dev, "regmap init failed\n");
> +		return PTR_ERR(fsl_dev->tcon_regmap);
> +	}
> +
> +	regmap_write(fsl_dev->tcon_regmap, TCON_CTRL1, TCON_BYPASS_ENABLE);

Hmm, regmap_write can fail, Is that OK not check the return value?

> +	return 0;
> +}
> +

[snip]


> +static int fsl_dcu_drm_remove(struct platform_device *pdev)
> +{
> +	struct fsl_dcu_drm_device *fsl_dev =3D platform_get_drvdata(pdev);
> +
> +	drm_put_dev(fsl_dev->ddev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id fsl_dcu_of_match[] =3D {
> +		{ .compatible =3D "fsl,ls1021a-dcu", },
> +		{ .compatible =3D "fsl,vf610-dcu", },
> +		{ },
> +};
> +MODULE_DEVICE_TABLE(of, fsl_dcu_of_match);
> +
> +static struct platform_driver fsl_dcu_drm_platform_driver =3D {
> +	.probe		=3D fsl_dcu_drm_probe,
> +	.remove		=3D fsl_dcu_drm_remove,
> +	.driver		=3D {
> +		.owner	=3D THIS_MODULE,

remove ".owner    =3D THIS_MODULE,"

platform_driver does not need to set an owner because
platform_driver_register() will set it.


--=20
=EF=BC=ADark


--------------050903070108010904030809
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-cite-prefix">On 2015=E5=B9=B407=E6=9C=8813=E6=97=A5=
 14:00, Jianwei Wang
      wrote:<br>
    </div>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">This patch add support for Two Dimensional Animation=
 and Compositing
Engine (2D-ACE) on the Freescale SoCs.

2D-ACE is a Freescale display controller. 2D-ACE describes
the functionality of the module extremely well its name is a value
that cannot be used as a token in programming languages.
Instead the valid token "DCU" is used to tag the register names and
function names.

The Display Controller Unit (DCU) module is a system master that
fetches graphics stored in internal or external memory and displays
them on a TFT LCD panel. A wide range of panel sizes is supported
and the timing of the interface signals is highly configurable.
Graphics are read directly from memory and then blended in real-time,
which allows for dynamic content creation with minimal CPU
intervention.

The features:
(1) Full RGB888 output to TFT LCD panel.
(2) For the current LCD panel, WQVGA "480x272" is supported.
(3) Blending of each pixel using up to 4 source layers
dependent on size of panel.
(4) Each graphic layer can be placed with one pixel resolution
in either axis.
(5) Each graphic layer support RGB565 and RGB888 direct colors
without alpha
channel and BGRA8888 BGRA4444 ARGB1555 direct colors with an
alpha channel and YUV422 format.
(6) Each graphic layer support alpha blending with 8-bit
resolution.

This is a simplified version, only one primary plane, one
framebuffer, one crtc, one connector and one encoder for TFT LCD panel.

Signed-off-by: Alison Wang <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:b18965@freescale.com">&lt;b18965@freescale.com&gt;</a>
Signed-off-by: Xiubo Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:lixiubo@cmss.chinamobile.com">&lt;lixiubo@cmss.chinamobile.com&gt;</a>
Signed-off-by: Jianwei Wang <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:jianwei.wang@freescale.com">&lt;jianwei.wang@freescale.com&gt;</a>
Acked-by: Daniel Vetter <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:daniel.vetter@ffwll.ch">&lt;daniel.vetter@ffwll.ch&gt;</a>
Reviewed-by: Alison Wang <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:alison.wang@freescale.com">&lt;alison.wang@freescale.com&gt;</a>
---


hanged in V8
- Remove useless code
  #define DRIVER_NAME     "fsl-dcu-drm"
  MODULE_ALIAS("platform:fsl-dcu-drm");
Adviced by Paul Bolle

Changed in V7

- Remove redundant functions and replace deprecated hooker
Adviced by Daniel Vetter
- Replace drm_platform_init with drm_dev_alloc/register
Adviced by Daniel Vetter

Changed in V6

- Add NEC nl4827hc19_05b panel to panel-simple.c
Adviced by Mark Yao
- Add DRIVER_ATOMIC for driver_features
Adviced by Mark Yao
- check fsl_dev if it's NULL at PM suspend/resume
Adviced by Mark Yao

Changed in V5

- Update commit message
- Add layer registers initialization
- Remove unused functions
- Rename driver folder
Adviced by Stefan Agner
- Move pixel clock control functions to fsl_dcu_drm_drv.c
- remove redundant enable the clock implicitly using regmap
Adviced by Stefan Agner
- Add maintainer message

Changed in V4:

-This version doesn't have functionality changed
 Just a minor adjustment.

Changed in V3:

- Test driver on Vybrid board and add compatible string
- Remove unused functions
- set default crtc for encoder
- replace legacy functions with atomic help functions
Adviced by Daniel Vetter
- Set the unique name of the DRM device
- Implement irq handle function for vblank interrupt

Changed in v2:=20
- Add atomic support
Adviced by Daniel Vetter
- Modify bindings file
- Rename node for compatibility
- Move platform related code out for compatibility
Adviced by Stefan Agner

</pre>
    </blockquote>
    [snip]<br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">

+int fsl_dcu_drm_connector_create(struct fsl_dcu_drm_device *fsl_dev,
+				 struct drm_encoder *encoder)
+{
+	struct drm_connector *connector =3D &amp;fsl_dev-&gt;connector.connecto=
r;
+	struct device_node *panel_node;
+	int ret;
+
+	fsl_dev-&gt;connector.encoder =3D encoder;
+
+	connector-&gt;display_info.width_mm =3D 0;
+	connector-&gt;display_info.height_mm =3D 0;
+
+	ret =3D drm_connector_init(fsl_dev-&gt;ddev, connector,
+				 &amp;fsl_dcu_drm_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret &lt; 0)
+		return ret;
+
+	connector-&gt;dpms =3D DRM_MODE_DPMS_OFF;
+	drm_connector_helper_add(connector, &amp;connector_helper_funcs);
+	ret =3D drm_connector_register(connector);
+	if (ret &lt; 0)
+		goto err_cleanup;
+
+	ret =3D drm_mode_connector_attach_encoder(connector, encoder);
+	if (ret &lt; 0)
+		goto err_sysfs;
+
+	connector-&gt;encoder =3D encoder;
+
+	drm_object_property_set_value
+		(&amp;connector-&gt;base, fsl_dev-&gt;ddev-&gt;mode_config.dpms_proper=
ty,
+		DRM_MODE_DPMS_OFF);
+
+	panel_node =3D of_parse_phandle(fsl_dev-&gt;np, "panel", 0);
+	if (panel_node) {
+		fsl_dev-&gt;connector.panel =3D of_drm_find_panel(panel_node);
+		if (!fsl_dev-&gt;connector.panel)
+			return -EPROBE_DEFER;
+	}
+</pre>
    </blockquote>
    <br>
    I think cleanup is needed before return -EPROBE_DEFER, and put node
    after use.<br>
    <br>
    =C2=A0=C2=A0=C2=A0 panel_node =3D of_parse_phandle(fsl_dev-&gt;np, "p=
anel", 0);<br>
    =C2=A0=C2=A0=C2=A0 if (panel_node) {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 fsl_dev-&gt;connector.panel =3D=
 of_drm_find_panel(panel_node);<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if (!fsl_dev-&gt;connector.pane=
l) {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 of_node_put(=
panel_node);<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 ret =3D -EPR=
OBE_DEFER;<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto err_sys=
fs;<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 }<br>
    =C2=A0=C2=A0=C2=A0 }<br>
    <br>
    =C2=A0=C2=A0=C2=A0 of_node_put(panel_node);<br>
    <br>
    <br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">
+	ret =3D drm_panel_attach(fsl_dev-&gt;connector.panel, connector);
+	if (ret) {
+		dev_err(fsl_dev-&gt;dev, "failed to attach panel\n");
+		goto err_sysfs;
+	}
+
+	return 0;
+
+err_sysfs:
+	drm_connector_unregister(connector);
+err_cleanup:
+	drm_connector_cleanup(connector);
+	return ret;
+}
</pre>
    </blockquote>
    <br>
    [snip]<br>
    <br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">
+
+static int fsl_dcu_bypass_tcon(struct fsl_dcu_drm_device *fsl_dev,
+			       struct device_node *np)
+{
+	struct device_node *tcon_np;
+	struct platform_device *pdev;
+	struct clk *tcon_clk;
+	struct resource *res;
+	void __iomem *base;
+
+	tcon_np =3D of_parse_phandle(np, "tcon-controller", 0);
+	if (!tcon_np)
+		return -EINVAL;
+
+	pdev =3D of_find_device_by_node(tcon_np);
+	if (!pdev)
+		return -EINVAL;
+
+	tcon_clk =3D devm_clk_get(&amp;pdev-&gt;dev, "tcon");
+	if (IS_ERR(tcon_clk))
+		return PTR_ERR(tcon_clk);
+	clk_prepare_enable(tcon_clk);
+</pre>
    </blockquote>
    <br>
    clk_prepare_enable may fail, so please check the return value.<br>
    <br>
    <br>
    R
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
    ecommend that split clk_prepare_enable() to clk_prepare() and
    clk_enable(),<br>
    use clk_prepare() only at clk first init, enable/disable by
    clk_enable()/clk_disable().<br>
    <br>
    <br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	base =3D devm_ioremap_resource(&amp;pdev-&gt;dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	fsl_dev-&gt;tcon_regmap =3D devm_regmap_init_mmio(&amp;pdev-&gt;dev,
+			base, &amp;fsl_dcu_regmap_config);
+	if (IS_ERR(fsl_dev-&gt;tcon_regmap)) {
+		dev_err(&amp;pdev-&gt;dev, "regmap init failed\n");
+		return PTR_ERR(fsl_dev-&gt;tcon_regmap);
+	}
+
+	regmap_write(fsl_dev-&gt;tcon_regmap, TCON_CTRL1, TCON_BYPASS_ENABLE);<=
/pre>
    </blockquote>
    <br>
    Hmm, regmap_write can fail, Is that OK not check the return value?<br=
>
    <br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">
+	return 0;
+}
+
</pre>
    </blockquote>
    <br>
    [snip]<br>
    <br>
    <br>
    <blockquote
      cite=3D"mid:1436767211-38571-1-git-send-email-jianwei.wang@freescal=
e.com"
      type=3D"cite">
      <pre wrap=3D"">
+static int fsl_dcu_drm_remove(struct platform_device *pdev)
+{
+	struct fsl_dcu_drm_device *fsl_dev =3D platform_get_drvdata(pdev);
+
+	drm_put_dev(fsl_dev-&gt;ddev);
+
+	return 0;
+}
+
+static const struct of_device_id fsl_dcu_of_match[] =3D {
+		{ .compatible =3D "fsl,ls1021a-dcu", },
+		{ .compatible =3D "fsl,vf610-dcu", },
+		{ },
+};
+MODULE_DEVICE_TABLE(of, fsl_dcu_of_match);
+
+static struct platform_driver fsl_dcu_drm_platform_driver =3D {
+	.probe		=3D fsl_dcu_drm_probe,
+	.remove		=3D fsl_dcu_drm_remove,
+	.driver		=3D {
+		.owner	=3D THIS_MODULE,</pre>
    </blockquote>
    <br>
    remove ".owner=C2=A0=C2=A0=C2=A0 =3D THIS_MODULE,"<br>
    <pre wrap=3D"">platform_driver does not need to set an owner because
platform_driver_register() will set it.
</pre>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
=EF=BC=ADark</pre>
  </body>
</html>

--------------050903070108010904030809--


--===============0906966328==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHA6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

--===============0906966328==--
