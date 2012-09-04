From: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3 2/2] video: drm: exynos: Add device tree support
Date: Tue, 4 Sep 2012 22:14:58 +0530
Message-ID: <CAL1wa8dCuiY-uaesD8evhxMGr84qx9KOC0o8dYmWCW-Kp7_YuA@mail.gmail.com>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
 <1345111689-14601-3-git-send-email-l.krishna@samsung.com>
 <CAAQKjZPq2o6s_bxmFePA89Xw67gupAhE=bDp22Lfa6bd5dAYWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAAQKjZPq2o6s_bxmFePA89Xw67gupAhE=bDp22Lfa6bd5dAYWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Inki Dae,

On Tue, Sep 4, 2012 at 7:42 PM, InKi Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>
> 2012/8/16 Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>:
> > Add device tree based discovery support for DRM-FIMD driver.
> >
> > Signed-off-by: Leela Krishna Amudala <l.krishna-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  Documentation/devicetree/bindings/fb/drm-fimd.txt |   80
> > +++++++++++++++++
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c          |   95
> > ++++++++++++++++++++-
> >  2 files changed, 173 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
> >
> > diff --git a/Documentation/devicetree/bindings/fb/drm-fimd.txt
> > b/Documentation/devicetree/bindings/fb/drm-fimd.txt
> > new file mode 100644
> > index 0000000..8ad8814
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/fb/drm-fimd.txt
> > @@ -0,0 +1,80 @@
> > +* Samsung Display Controller using DRM frame work
> > +
> > +The display controller is used to transfer image data from memory to an
> > +external LCD driver interface. It supports various color formats such
> > as
> > +rgb and yuv.
> > +
> > +Required properties:
> > + - compatible: Should be "samsung,exynos5-drm" for fimd using DRM frame
> > work.
> > + - reg: physical base address of the controller and length of memory
> > +   mapped region.
> > + - interrupts: Three interrupts should be specified. The interrupts
> > should be
> > +   specified in the following order.
> > +   - VSYNC interrupt
> > +   - FIFO level interrupt
> > +   - FIMD System Interrupt
> > +
> > + - samsung,fimd-display: This property should specify the phandle of
> > the
> > +   display device node which holds the video interface timing with the
> > +   below mentioned properties.
> > +
> > +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
> > +     horizontal timing includes four parameters in the following order.
> > +
> > +     - horizontal back porch (in number of lcd clocks)
> > +     - horizontal front porch (in number of lcd clocks)
> > +     - hsync pulse width (in number of lcd clocks)
> > +     - Display panels X resolution.
> > +
> > +   - lcd-vtiming: Specifies the vertical timing for the overlay. The
> > +     vertical timing includes four parameters in the following order.
> > +
> > +     - vertical back porch (in number of lcd lines)
> > +     - vertical front porch (in number of lcd lines)
> > +     - vsync pulse width (in number of lcd clocks)
> > +     - Display panels Y resolution.
> > +
> > +
> > + - samsung,default-window: Specifies the default window number of the
> > fimd controller.
> > +
> > + - samsung,fimd-win-bpp: Specifies the bits per pixel.
> > +
> > +Optional properties:
> > + - supports-mipi-panel: Specifies the lcd is mipi panel type
> > + - samsung,fimd-vidout-rgb: Video output format is RGB.
> > + - samsung,fimd-inv-vclk: invert video clock polarity.
> > + - samsung,fimd-frame-rate: Number of video frames per second.
> > +
> > +Example:
> > +
> > +       The following is an example for the fimd controller is split
> > into
> > +       two portions. The SoC specific portion can be specified in the
> > SoC
> > +       specific dts file. The board specific portion can be specified
> > in the
> > +       board specific dts file.
> > +
> > +       - SoC Specific portion
> > +
> > +       fimd {
> > +               compatible = "samsung,exynos5-drm";
> > +               interrupt-parent = <&combiner>;
> > +               reg = <0x14400000 0x40000>;
> > +               interrupts = <18 5>, <18 4>, <18 6>;
> > +       };
> > +
> > +       - Board Specific portion
> > +
> > +       lcd_fimd0: lcd_panel0 {
> > +                       lcd-htiming = <4 4 4 480>;
> > +                       lcd-vtiming = <4 4 4 320>;
> > +                       supports-mipi-panel;
> > +       };
> > +
> > +       fimd {
> > +               samsung,fimd-display = <&lcd_fimd0>;
> > +               samsung,fimd-vidout-rgb;
> > +               samsung,fimd-inv-vclk;
> > +               samsung,fimd-frame-rate = <60>;
> > +               samsung,default-window = <0>;
> > +               samsung,fimd-win-bpp = <32>;
> > +       };
> > +
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > index 8379c59..1753846 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/clk.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/of.h>
> >
> >  #include <video/samsung_fimd.h>
> >  #include <drm/exynos_drm.h>
> > @@ -103,9 +104,18 @@ struct fimd_context {
> >         struct exynos_drm_panel_info *panel;
> >  };
> >
> > +static const struct of_device_id drm_fimd_dt_match[];
> > +
> >  static inline struct drm_fimd_driver_data *drm_fimd_get_driver_data(
> >         struct platform_device *pdev)
> >  {
> > +#ifdef CONFIG_OF
> > +       if (pdev->dev.of_node) {
> > +               const struct of_device_id *match;
> > +               match = of_match_node(drm_fimd_dt_match,
> > pdev->dev.of_node);
> > +               return (struct drm_fimd_driver_data *)match->data;
> > +       }
> > +#endif
> >         return (struct drm_fimd_driver_data *)
> >                 platform_get_device_id(pdev)->driver_data;
> >  }
> > @@ -821,12 +831,79 @@ static int fimd_power_on(struct fimd_context *ctx,
> > bool enable)
> >         return 0;
> >  }
> >
> > +#ifdef CONFIG_OF
> > +static struct exynos_drm_fimd_pdata *drm_fimd_dt_parse_pdata(struct
> > device *dev)
> > +{
> > +       struct device_node *np = dev->of_node;
> > +       struct device_node *disp_np;
> > +       struct exynos_drm_fimd_pdata *pd;
> > +       u32 data[4];
> > +
> > +       pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> > +       if (!pd) {
> > +               dev_err(dev, "memory allocation for pdata failed\n");
> > +               return ERR_PTR(-ENOMEM);
> > +       }
> > +
> > +       if (of_get_property(np, "samsung,fimd-vidout-rgb", NULL))
> > +               pd->vidcon0 |= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB;
> > +       if (of_get_property(np, "samsung,fimd-vidout-tv", NULL))
> > +               pd->vidcon0 |= VIDCON0_VIDOUT_TV;
> > +       if (of_get_property(np, "samsung,fimd-inv-hsync", NULL))
> > +               pd->vidcon1 |= VIDCON1_INV_HSYNC;
> > +       if (of_get_property(np, "samsung,fimd-inv-vsync", NULL))
> > +               pd->vidcon1 |= VIDCON1_INV_VSYNC;
> > +       if (of_get_property(np, "samsung,fimd-inv-vclk", NULL))
> > +               pd->vidcon1 |= VIDCON1_INV_VCLK;
> > +       if (of_get_property(np, "samsung,fimd-inv-vden", NULL))
> > +               pd->vidcon1 |= VIDCON1_INV_VDEN;
> > +
> > +       disp_np = of_parse_phandle(np, "samsung,fimd-display", 0);
> > +       if (!disp_np) {
> > +               dev_err(dev, "unable to find display panel info\n");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +
> > +       if (of_property_read_u32_array(disp_np, "lcd-htiming", data, 4))
> > {
> > +               dev_err(dev, "invalid horizontal timing\n");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +       pd->panel.timing.left_margin = data[0];
> > +       pd->panel.timing.right_margin = data[1];
> > +       pd->panel.timing.hsync_len = data[2];
> > +       pd->panel.timing.xres = data[3];
> > +
> > +       if (of_property_read_u32_array(disp_np, "lcd-vtiming", data, 4))
> > {
> > +               dev_err(dev, "invalid vertical timing\n");
> > +               return ERR_PTR(-EINVAL);
> > +       }
> > +       pd->panel.timing.upper_margin = data[0];
> > +       pd->panel.timing.lower_margin = data[1];
> > +       pd->panel.timing.vsync_len = data[2];
> > +       pd->panel.timing.yres = data[3];
> > +
> > +       of_property_read_u32(np, "samsung,fimd-frame-rate",
> > +                               &pd->panel.timing.refresh);
> > +
> > +       of_property_read_u32(np, "samsung,default-window",
> > &pd->default_win);
> > +
> > +       of_property_read_u32(np, "samsung,fimd-win-bpp", &pd->bpp);
> > +
> > +       return pd;
> > +}
> > +#else
> > +static int exynos_drm_fimd_pdata *drm_fimd_dt_parse_pdata(struct device
> > *dev)
>
> use 'struct' instead of 'int'. maybe it's your mistake.
>

Yes, This is my mistake, will change in next version.
Thanks for reviewing the patch.

> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
