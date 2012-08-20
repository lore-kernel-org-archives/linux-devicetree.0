From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH V3 2/2] video: drm: exynos: Add device tree support
Date: Mon, 20 Aug 2012 10:44:55 +0900
Message-ID: <50319697.6040206@samsung.com>
References: <1345111689-14601-1-git-send-email-l.krishna@samsung.com>
	<1345111689-14601-3-git-send-email-l.krishna@samsung.com>
	<CAPLVkLsoxUO6B3UyxYxYiWqmY=F9JUL2PSS3v-1JjT1rHgRODA@mail.gmail.com>
	<CAL1wa8fm9tdQHTZM0eGE5iiLWksMMDoUoKF-Sq4K2xf6Og4e9Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <CAL1wa8fm9tdQHTZM0eGE5iiLWksMMDoUoKF-Sq4K2xf6Og4e9Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On 08/17/2012 06:37 PM, Leela Krishna Amudala wrote:
> Hello,
>
> On Fri, Aug 17, 2012 at 6:55 AM, Joonyoung Shim <dofmind@gmail.com> wrote:
>> Hi,
>>
>> 2012/8/16 Leela Krishna Amudala <l.krishna@samsung.com>:
>>> Add device tree based discovery support for DRM-FIMD driver.
>>>
>>> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
>>> ---
>>>   Documentation/devicetree/bindings/fb/drm-fimd.txt |   80 +++++++++++++++++
>>>   drivers/gpu/drm/exynos/exynos_drm_fimd.c          |   95 ++++++++++++++++++++-
>>>   2 files changed, 173 insertions(+), 2 deletions(-)
>>>   create mode 100644 Documentation/devicetree/bindings/fb/drm-fimd.txt
>>>
>>> diff --git a/Documentation/devicetree/bindings/fb/drm-fimd.txt b/Documentation/devicetree/bindings/fb/drm-fimd.txt
>>> new file mode 100644
>>> index 0000000..8ad8814
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/fb/drm-fimd.txt
>>> @@ -0,0 +1,80 @@
>>> +* Samsung Display Controller using DRM frame work
>>> +
>>> +The display controller is used to transfer image data from memory to an
>>> +external LCD driver interface. It supports various color formats such as
>>> +rgb and yuv.
>>> +
>>> +Required properties:
>>> + - compatible: Should be "samsung,exynos5-drm" for fimd using DRM frame work.
>> Just use "samsung,exynos5-fb" and add to support exynos4-fb
>>
> In the first version of this patch set I used "samsung,exynos5-fb",
> but as per Kyungmin Park's suggestion changed it to exynos5-drm.

OK, but this doesn't mean drm device so it is right to use exynos5-fimd.
Add "exynos5-fimd" compatible and also use exynos5-fb, it is used in 
s3c-fb driver.

>>> + - reg: physical base address of the controller and length of memory
>>> +   mapped region.
>>> + - interrupts: Three interrupts should be specified. The interrupts should be
>>> +   specified in the following order.
>>> +   - VSYNC interrupt
>>> +   - FIFO level interrupt
>>> +   - FIMD System Interrupt
>>> +
>>> + - samsung,fimd-display: This property should specify the phandle of the
>>> +   display device node which holds the video interface timing with the
>>> +   below mentioned properties.
>>> +
>>> +   - lcd-htiming: Specifies the horizontal timing for the overlay. The
>>> +     horizontal timing includes four parameters in the following order.
>>> +
>>> +     - horizontal back porch (in number of lcd clocks)
>>> +     - horizontal front porch (in number of lcd clocks)
>>> +     - hsync pulse width (in number of lcd clocks)
>>> +     - Display panels X resolution.
>>> +
>>> +   - lcd-vtiming: Specifies the vertical timing for the overlay. The
>>> +     vertical timing includes four parameters in the following order.
>>> +
>>> +     - vertical back porch (in number of lcd lines)
>>> +     - vertical front porch (in number of lcd lines)
>>> +     - vsync pulse width (in number of lcd clocks)
>>> +     - Display panels Y resolution.
>>> +
>>> +
>>> + - samsung,default-window: Specifies the default window number of the fimd controller.
>>> +
>>> + - samsung,fimd-win-bpp: Specifies the bits per pixel.
>>> +
>>> +Optional properties:
>>> + - supports-mipi-panel: Specifies the lcd is mipi panel type
>> How is this property used?
>>
> As this driver can be interfaced through MIPI or eDP, Arch side code
> will check whether this property is available or not, if it is
> available then it assumes mipi panel is connected and certain clock
> rate will be set to fimd clock, otherwise assumes other panel is
> connected and other clock rate will be set at arch side.

But it is not used currently in the driver.

>
>>> + - samsung,fimd-vidout-rgb: Video output format is RGB.
>>> + - samsung,fimd-inv-vclk: invert video clock polarity.
>>> + - samsung,fimd-frame-rate: Number of video frames per second.
>>> +
>>> +Example:
>>> +
>>> +       The following is an example for the fimd controller is split into
>>> +       two portions. The SoC specific portion can be specified in the SoC
>>> +       specific dts file. The board specific portion can be specified in the
>>> +       board specific dts file.
>>> +
>>> +       - SoC Specific portion
>>> +
>>> +       fimd {
>>> +               compatible = "samsung,exynos5-drm";
>>> +               interrupt-parent = <&combiner>;
>>> +               reg = <0x14400000 0x40000>;
>>> +               interrupts = <18 5>, <18 4>, <18 6>;
>>> +       };
>>> +
>>> +       - Board Specific portion
>>> +
>>> +       lcd_fimd0: lcd_panel0 {
>>> +                       lcd-htiming = <4 4 4 480>;
>>> +                       lcd-vtiming = <4 4 4 320>;
>>> +                       supports-mipi-panel;
>>> +       };
>>> +
>>> +       fimd {
>>> +               samsung,fimd-display = <&lcd_fimd0>;
>>> +               samsung,fimd-vidout-rgb;
>>> +               samsung,fimd-inv-vclk;
>>> +               samsung,fimd-frame-rate = <60>;
>>> +               samsung,default-window = <0>;
>>> +               samsung,fimd-win-bpp = <32>;
>>> +       };
>>> +
>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> index 8379c59..1753846 100644
>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>>> @@ -18,6 +18,7 @@
>>>   #include <linux/platform_device.h>
>>>   #include <linux/clk.h>
>>>   #include <linux/pm_runtime.h>
>>> +#include <linux/of.h>
>>>
>>>   #include <video/samsung_fimd.h>
>>>   #include <drm/exynos_drm.h>
>>> @@ -103,9 +104,18 @@ struct fimd_context {
>>>          struct exynos_drm_panel_info *panel;
>>>   };
>>>
>>> +static const struct of_device_id drm_fimd_dt_match[];
>>> +
>> Please remove drm_ prefix over all.
>>
> Ok, will do that
>
>>>   static inline struct drm_fimd_driver_data *drm_fimd_get_driver_data(
>>>          struct platform_device *pdev)
>>>   {
>>> +#ifdef CONFIG_OF
>>> +       if (pdev->dev.of_node) {
>>> +               const struct of_device_id *match;
>>> +               match = of_match_node(drm_fimd_dt_match, pdev->dev.of_node);
>> Use of_match_ptr().
>>
> Ok, will change it
>
>>> +               return (struct drm_fimd_driver_data *)match->data;
>>> +       }
>>> +#endif
>>>          return (struct drm_fimd_driver_data *)
>>>                  platform_get_device_id(pdev)->driver_data;
>>>   }
>>> @@ -821,12 +831,79 @@ static int fimd_power_on(struct fimd_context *ctx, bool enable)
>>>          return 0;
>>>   }
>>>
>>> +#ifdef CONFIG_OF
>>> +static struct exynos_drm_fimd_pdata *drm_fimd_dt_parse_pdata(struct device *dev)
>>> +{
>>> +       struct device_node *np = dev->of_node;
>>> +       struct device_node *disp_np;
>>> +       struct exynos_drm_fimd_pdata *pd;
>>> +       u32 data[4];
>>> +
>>> +       pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
>>> +       if (!pd) {
>>> +               dev_err(dev, "memory allocation for pdata failed\n");
>>> +               return ERR_PTR(-ENOMEM);
>>> +       }
>>> +
>>> +       if (of_get_property(np, "samsung,fimd-vidout-rgb", NULL))
>>> +               pd->vidcon0 |= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB;
>>> +       if (of_get_property(np, "samsung,fimd-vidout-tv", NULL))
>>> +               pd->vidcon0 |= VIDCON0_VIDOUT_TV;
>> What is this?
>>
> I'll remove this property.
>
>>> +       if (of_get_property(np, "samsung,fimd-inv-hsync", NULL))
>>> +               pd->vidcon1 |= VIDCON1_INV_HSYNC;
>>> +       if (of_get_property(np, "samsung,fimd-inv-vsync", NULL))
>>> +               pd->vidcon1 |= VIDCON1_INV_VSYNC;
>>> +       if (of_get_property(np, "samsung,fimd-inv-vclk", NULL))
>>> +               pd->vidcon1 |= VIDCON1_INV_VCLK;
>>> +       if (of_get_property(np, "samsung,fimd-inv-vden", NULL))
>>> +               pd->vidcon1 |= VIDCON1_INV_VDEN;
>>> +
>>> +       disp_np = of_parse_phandle(np, "samsung,fimd-display", 0);
>>> +       if (!disp_np) {
>>> +               dev_err(dev, "unable to find display panel info\n");
>>> +               return ERR_PTR(-EINVAL);
>>> +       }
>>> +
>>> +       if (of_property_read_u32_array(disp_np, "lcd-htiming", data, 4)) {
>>> +               dev_err(dev, "invalid horizontal timing\n");
>>> +               return ERR_PTR(-EINVAL);
>>> +       }
>>> +       pd->panel.timing.left_margin = data[0];
>>> +       pd->panel.timing.right_margin = data[1];
>>> +       pd->panel.timing.hsync_len = data[2];
>>> +       pd->panel.timing.xres = data[3];
>>> +
>>> +       if (of_property_read_u32_array(disp_np, "lcd-vtiming", data, 4)) {
>>> +               dev_err(dev, "invalid vertical timing\n");
>>> +               return ERR_PTR(-EINVAL);
>>> +       }
>>> +       pd->panel.timing.upper_margin = data[0];
>>> +       pd->panel.timing.lower_margin = data[1];
>>> +       pd->panel.timing.vsync_len = data[2];
>>> +       pd->panel.timing.yres = data[3];
>>> +
>>> +       of_property_read_u32(np, "samsung,fimd-frame-rate",
>>> +                               &pd->panel.timing.refresh);
>>> +
>>> +       of_property_read_u32(np, "samsung,default-window", &pd->default_win);
>>> +
>>> +       of_property_read_u32(np, "samsung,fimd-win-bpp", &pd->bpp);
>>> +
>>> +       return pd;
>>> +}
>>> +#else
>>> +static int exynos_drm_fimd_pdata *drm_fimd_dt_parse_pdata(struct device *dev)
>>> +{
>>> +       return NULL;
>>> +}
>>> +#endif /* CONFIG_OF */
>>> +
>>>   static int __devinit fimd_probe(struct platform_device *pdev)
>>>   {
>>>          struct device *dev = &pdev->dev;
>>>          struct fimd_context *ctx;
>>>          struct exynos_drm_subdrv *subdrv;
>>> -       struct exynos_drm_fimd_pdata *pdata;
>>> +       struct exynos_drm_fimd_pdata *pdata = pdev->dev.platform_data;
>>>          struct exynos_drm_panel_info *panel;
>>>          struct resource *res;
>>>          int win;
>>> @@ -834,7 +911,11 @@ static int __devinit fimd_probe(struct platform_device *pdev)
>>>
>>>          DRM_DEBUG_KMS("%s\n", __FILE__);
>>>
>>> -       pdata = pdev->dev.platform_data;
>>> +       if (pdev->dev.of_node) {
>>> +               pdata = drm_fimd_dt_parse_pdata(&pdev->dev);
>>> +               if (IS_ERR(pdata))
>>> +                       return PTR_ERR(pdata);
>>> +       }
>>>          if (!pdata) {
>>>                  dev_err(dev, "no platform data specified\n");
>>>                  return -EINVAL;
>>> @@ -1027,6 +1108,15 @@ static struct platform_device_id exynos_drm_fimd_driver_ids[] = {
>>>   };
>>>   MODULE_DEVICE_TABLE(platform, exynos_drm_fimd_driver_ids);
>>>
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id drm_fimd_dt_match[] = {
>>> +       { .compatible = "samsung,exynos5-drm",
>>> +         .data = &exynos5_drm_fimd_driver_data },
>> Add also samsung,exynos4-fb.
>>
> Ok, will add it.
>
>>> +       {},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, drm_fimd_dt_match);
>>> +#endif
>>> +
>>>   static const struct dev_pm_ops fimd_pm_ops = {
>>>          SET_SYSTEM_SLEEP_PM_OPS(fimd_suspend, fimd_resume)
>>>          SET_RUNTIME_PM_OPS(fimd_runtime_suspend, fimd_runtime_resume, NULL)
>>> @@ -1040,5 +1130,6 @@ struct platform_driver fimd_driver = {
>>>                  .name   = "exynos-drm-fimd",
>>>                  .owner  = THIS_MODULE,
>>>                  .pm     = &fimd_pm_ops,
>>> +               .of_match_table = of_match_ptr(drm_fimd_dt_match),
>>>          },
>>>   };
>>> --
>>> 1.7.0.4
>>>
>>> _______________________________________________
>>> devicetree-discuss mailing list
>>> devicetree-discuss@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/devicetree-discuss
>> Thanks.
>>
>> --
>> - Joonyoung Shim
>> _______________________________________________
>> devicetree-discuss mailing list
>> devicetree-discuss@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/devicetree-discuss
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
