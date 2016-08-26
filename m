From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC] drm: implement generic firmware eviction
Date: Fri, 26 Aug 2016 07:59:28 +0200
Message-ID: <CAKMK7uF4s1ZTs8QXRX+YTznksisuN9AOmPm98_qwMorrrugiDQ@mail.gmail.com>
References: <20160826000056.12806-1-dh.herrmann@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160826000056.12806-1-dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 26, 2016 at 2:00 AM, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Provide a generic DRM helper that evicts all conflicting firmware
> framebuffers, devices, and drivers. The new helper is called
> drm_evict_firmware(), and takes a flagset controlling which firmware to
> kick out.
>
> This is meant to be used by drivers in their ->probe() callbacks of their
> parent bus, before calling into drm_dev_register().
>
> Signed-off-by: David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Hey
>
> This is just compile-tested for now. I just want to get some comments on the
> design. I decided to drop the sysfb infrastructure and rather just use this
> generic helper. It keeps things simple and should work just fine for all
> reasonable use-cases.
>
> This will work with SimpleDRM out-of-the-box on x86.
>
> Architectures with dynamic simple-framebuffer devices are not supported yet. I
> actually have no idea what the strategy there is? Can the DeviceTree people come
> up with something? Am I supposed to call of_platform_depopulate()? Or
> of_detach_node()? Or what?
> Looking at drivers/of/{platform,dynamic}.c, I cannot see how this is supposed to
> work at all. Who protects platform_device_del() from being called in parallel?
> Also: Does any platform make use the of 'display:' entry in 'simple-framebuffer'
> DT nodes? If yes, how do I get access to it? And why don't vc4/sun4i make use of
> it, rather than falling back to remove_conflicting_framebuffers()?

If we revamp this I'd like to make it a lot more automatic. Atm all
drivers need to explicitly figure out what they need to kick (and as
you noticed, many seem to get it wrong). But in most cases it's the
platform code that would know this best. What about

drm_evict_firmware_pci(struct pci_device *pci);

which then:
- does the remove_conflicting_framebuffer dance with all the pci bars
- if the device class is VGA, also nuke vgacon (not just when it's the
currently decoding VGA device, since that might change later on)

Similar for other types of devices (i.e. drm_evict_firmware_platform
for arm/of). Or maybe we can just take a struct device *dev and cast
suitably within the helper to hide it all?

This is already what correct drivers are doing, and we can still
expose the internals if there's ever a case where things work
differently.

A few more comments below.

> Thanks
> David
>
>  drivers/gpu/drm/drm_drv.c | 257 ++++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drmP.h        |  13 +++
>  2 files changed, 270 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 0773547..581c342 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -26,12 +26,16 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +#include <linux/console.h>
>  #include <linux/debugfs.h>
> +#include <linux/fb.h>
>  #include <linux/fs.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/mount.h>
> +#include <linux/of.h>
>  #include <linux/slab.h>
> +#include <linux/vt.h>
>  #include <drm/drmP.h>
>  #include "drm_crtc_internal.h"
>  #include "drm_legacy.h"
> @@ -881,6 +885,259 @@ void drm_dev_unregister(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unregister);
>
> +struct drm_evict_ctx {
> +       struct apertures_struct *ap;
> +       unsigned int flags;
> +};
> +
> +static bool drm_evict_match_resource(struct drm_evict_ctx *ctx,
> +                                    struct resource *mem)
> +{
> +       struct aperture *g;
> +       unsigned int i;
> +
> +       for (i = 0; i < ctx->ap->count; ++i) {
> +               g = &ctx->ap->ranges[i];
> +
> +               if (mem->start == g->base)
> +                       return true;
> +               if (mem->start >= g->base && mem->end < g->base + g->size)
> +                       return true;
> +               if ((ctx->flags & DRM_EVICT_VBE) && mem->start == 0xA0000)
> +                       return true;
> +       }
> +
> +       return false;
> +}
> +
> +static int drm_evict_platform_device(struct device *dev, void *userdata)
> +{
> +       struct drm_evict_ctx *ctx = userdata;
> +       struct platform_device *pdev = to_platform_device(dev);
> +       struct resource *mem;
> +
> +       /*
> +        * We are only interested in static devices here (i.e., they carry
> +        * information via a statically allocated platform data field). Any
> +        * dynamically allocated devices have separate ownership models and
> +        * must be handled via their respective management calls.
> +        */
> +       if (!dev_get_platdata(&pdev->dev))
> +               return 0;
> +       if (!pdev->name)
> +               return 0;
> +
> +       if (!strcmp(pdev->name, "simple-framebuffer")) {
> +               mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +               if (!mem)
> +                       return 0;
> +               if (!drm_evict_match_resource(ctx, mem))
> +                       return 0;
> +
> +               platform_device_del(pdev);
> +       }
> +
> +       return 0;
> +}

Shouldn't the device framework and iores allocator make sure that such
conflicts are handled? Assuming of course that we use all the
iores_mem resources/pci bars to kick out other framebuffers. Or when
exactly can we end up with overlapping iores_mem which don't result in
a device conflict that the core takes care of already?

> +
> +static int drm_evict_platform(struct drm_evict_ctx *ctx)
> +{
> +       /*
> +        * Early-boot architecture setup and boot-loarders sometimes create
> +        * preliminary platform devices with a generic framebuffer setup. This
> +        * allows graphics access during boot-up, without a real graphics
> +        * driver loaded. However, once a real graphics driver takes over, we
> +        * have to destroy those platform devices. In the legacy fbdev case, we
> +        * just used to unload the fbdev driver. However, to make sure any kind
> +        * of driver is unloaded, the platform-eviction code here simply
> +        * removes any conflicting platform device directly. This causes any
> +        * bound driver to be detached, and then removes the device entirely so
> +        * it cannot be bound to later on.
> +        *
> +        * Please note that any such platform device must be registered by
> +        * early architecture setup code. If they are registered after regular
> +        * DRM drivers, this will fail horribly.
> +        */
> +
> +       static DEFINE_MUTEX(lock);
> +       int ret;
> +
> +       /*
> +        * In case of static platform-devices, we must iterate the bus and
> +        * remove them manually. We know that we're the only code that might
> +        * remove them, so a simple static lock serializes all calls here. We
> +        * must make sure our eviction callback leaves any non-static platform
> +        * devices untouched, though.
> +        *
> +        * XXX: ARM and other OF users should really make sure to add their own
> +        *      eviction code here, possibly using the 'display' DT-handle as
> +        *      defined by the 'simple-framebuffer' OF-node.
> +        */
> +       mutex_lock(&lock);
> +       ret = bus_for_each_dev(&platform_bus_type, NULL, ctx,
> +                              drm_evict_platform_device);
> +       mutex_unlock(&lock);
> +       return ret;
> +}
> +
> +static int drm_evict_fbdev(struct drm_evict_ctx *ctx)
> +{
> +       /*
> +        * We have 2 different cases where fbdev drivers can operate on the
> +        * same devices as DRM drivers:
> +        *
> +        *   o Two drivers exist for the same device, one DRM driver and one
> +        *     fbdev driver (e.g., nvidiafb and nouveau). In those cases, both
> +        *     drivers bind to the same real hw-device and driver core takes
> +        *     care of any conflicts.
> +        *
> +        *   o A generic fbdev driver uses some pseudo-device to provide
> +        *     early-boot graphics access or some other kind of generic display
> +        *     driver. At the same time, a DRM driver exists that can run the
> +        *     real hardware (e.g., vesafb/efifb and i915).
> +        *
> +        * If possible, driver core takes care of any conflicts and prevents
> +        * two drivers from being bound to the same device. However, in some
> +        * cases this is not possible. We then use
> +        * remove_conflicting_framebuffers() to match the apertures of the DRM
> +        * device against all existing fbdev devices, evicting any conflicting
> +        * fbdev drivers. Additionally, if requested, any VBE driver is evicted
> +        * as well.
> +        *
> +        * Note that this breaks horribly if an fbdev driver is probed after a
> +        * DRM driver. So make sure whenever such conflicts are possible, the
> +        * fbdev drivers must be probed in early boot. If you cannot guarantee
> +        * that, you better make sure that the driver core prevents both
> +        * drivers from being probed in parallel.
> +        */
> +
> +#if !defined(CONFIG_FB)
> +       return 0;
> +#else
> +       return remove_conflicting_framebuffers(ctx->ap, "drm",
> +                                              !!(ctx->flags & DRM_EVICT_VBE));
> +#endif
> +}
> +
> +static int drm_evict_vgacon(void)
> +{
> +       /*
> +        * The VGACON console driver pokes at VGA registers randomly. If a DRM
> +        * driver cannot keep the VGA support alive, it better makes sure to
> +        * unload VGACON before probing.
> +        *
> +        * Unloading VGACON requires us to first force dummycon to take over
> +        * from vgacon (but only if vgacon is really in use), followed by a
> +        * deregistration of vgacon. Note that this prevents vgacon from being
> +        * used again after the DRM driver is unloaded. But that is usually
> +        * fine, since VGA state is rarely restored on driver-unload, anyway.
> +        *
> +        * Note that we rely on VGACON to be probed in early boot (actually
> +        * done by ARCH setup code). If it is probed after DRM drivers, this
> +        * will fail horribly. You better make sure VGACON is probed early and
> +        * DRM drivers are probed as normal modules.
> +        */
> +
> +#if !defined(CONFIG_VGA_CONSOLE)
> +       return 0;
> +#elif !defined(CONFIG_DUMMY_CONSOLE)
> +#      warning "Dummy console is disabled, but required to kick out VGACON"
> +       return -ENODEV;

We should add a select DUMMY_CONSOLE if VT or similar to our Kconfig
to avoid this ever happening.

> +#else
> +       int ret = 0;
> +
> +       DRM_INFO("Replacing VGA console driver\n");
> +
> +       console_lock();
> +       if (con_is_bound(&vga_con))
> +               ret = do_take_over_console(&dummy_con, 0,
> +                                          MAX_NR_CONSOLES - 1, 1);
> +       if (ret == 0) {
> +               ret = do_unregister_con_driver(&vga_con);
> +               if (ret == -ENODEV) /* ignore "already unregistered" */
> +                       ret = 0;
> +       }
> +       console_unlock();
> +
> +       return ret;
> +#endif
> +}
> +
> +/**
> + * drm_evict_firmware - remove any conflicting firmware-framebuffers
> + * @ap:                        apertures claimed by driver, or NULL
> + * @flags:             eviction flags
> + *
> + * This function evicts any conflicting firmware-framebuffers and their bound
> + * drivers, according to the data given as @ap and @flags.
> + *
> + * Depending on @flags, the following operations are performed:
> + *
> + *   DRM_EVICT_FBDEV: Any fbdev drivers that overlap @ap are unloaded.
> + *                    Furthermore, if DRM_EVICT_VBE is given as well, any fbdev
> + *                    driver that maps the VGA region is unloaded.
> + *
> + *   DRM_EVICT_PLATFORM: Firmware framebuffer platform devices (eg.,
> + *                       'simple-framebuffer') that overlap @ap are removed
> + *                       from the system, causing drivers to be unbound.
> + *                       If DRM_EVICT_VBE is given, this also affects devices
> + *                       that map the VGA region.
> + *
> + *   DRM_EVICT_VGACON: The vgacon console driver is unbound and unregistered.
> + *
> + * The caller must provide their apertures as @ap. If it is NULL, an empty set
> + * is assumed, except if DRM_EVICT_ANYWHERE is given, in which case a fake
> + * aperture across the entire address range is used.
> + *
> + * RETURNS:
> + * 0 on success, negative error code on failure.
> + */
> +int drm_evict_firmware(struct apertures_struct *ap, unsigned int flags)
> +{
> +       struct drm_evict_ctx ctx;
> +       struct apertures_struct *allocated_ap = NULL;
> +       int ret;
> +
> +       WARN_ON(ap && (flags & DRM_EVICT_ANYWHERE));
> +
> +       if (!ap) {
> +               allocated_ap = alloc_apertures(!!(flags & DRM_EVICT_ANYWHERE));
> +               if (!allocated_ap)
> +                       return -ENOMEM;
> +
> +               ap = allocated_ap;
> +
> +               if (flags & DRM_EVICT_ANYWHERE) {
> +                       ap->ranges[0].base = 0;
> +                       ap->ranges[0].size = ~0;
> +               }
> +       }
> +
> +       ctx.ap = ap;
> +       ctx.flags = flags;
> +
> +       if (flags & DRM_EVICT_PLATFORM) {
> +               ret = drm_evict_platform(&ctx);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       if (flags & DRM_EVICT_FBDEV) {
> +               ret = drm_evict_fbdev(&ctx);
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       if (flags & DRM_EVICT_VGACON) {
> +               ret = drm_evict_vgacon();
> +               if (ret < 0)
> +                       return ret;
> +       }
> +
> +       kfree(allocated_ap);
> +       return 0;
> +}
> +
>  /*
>   * DRM Core
>   * The DRM core module initializes all global DRM objects and makes them
> diff --git a/include/drm/drmP.h b/include/drm/drmP.h
> index 2197ab1..6c8bcf5 100644
> --- a/include/drm/drmP.h
> +++ b/include/drm/drmP.h
> @@ -88,6 +88,7 @@ struct drm_gem_object;
>  struct drm_master;
>  struct drm_vblank_crtc;
>
> +struct apertures_struct;
>  struct device_node;
>  struct videomode;
>  struct reservation_object;
> @@ -971,6 +972,18 @@ void drm_dev_unref(struct drm_device *dev);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>  void drm_dev_unregister(struct drm_device *dev);
>
> +enum {
> +       DRM_EVICT_FBDEV                         = (1U <<  0),
> +       DRM_EVICT_PLATFORM                      = (1U <<  1),
> +       DRM_EVICT_VGACON                        = (1U <<  2),
> +       DRM_EVICT_VBE                           = (1U <<  3),
> +       DRM_EVICT_ANYWHERE                      = (1U <<  4),
> +
> +       DRM_EVICT_DEFAULT = DRM_EVICT_FBDEV,
> +};
> +
> +int drm_evict_firmware(struct apertures_struct *ap, unsigned int flags);
> +
>  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>  void drm_minor_release(struct drm_minor *minor);
>
> --
> 2.9.3
>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
