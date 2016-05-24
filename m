From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 2/3] drm/arm: Add support for Mali Display Processors
Date: Tue, 24 May 2016 12:52:48 +0200
Message-ID: <20160524105248.GT27098@phenom.ffwll.local>
References: <CACvgo52T5b7k80VYd_F+6AQRi_NoM8NqA4BX2ad5wf+-MbW=6g@mail.gmail.com>
 <20160524094328.GO23566@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160524094328.GO23566-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, DRI devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Brian Starkey <Brian.Starkey-5wv7dgnIgG8@public.gmane.org>, David Brown <David.Brown-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 24, 2016 at 10:43:28AM +0100, Liviu Dudau wrote:
> On Tue, May 24, 2016 at 01:01:33AM +0100, Emil Velikov wrote:
> > Hi Liviu,
>=20
> Hi Emil,
>=20
> Thank you very much for taking your time to review this.
>=20
> >=20
> > Humble request: For the future please split things into manageable
> > hunks. I doubt you wrote the whole thing in one go, right ?
>=20
> Actually, I did, because there is an existing Mali DP driver (GPL eve=
n) [1]
> that targets ADF. This is the KMS version and a rewrite of that drive=
r.
>=20
> [1] http://malideveloper.arm.com/resources/drivers/open-source-mali-d=
p-adf-kernel-device-drivers/

Random bikeshed of my own: For display drivers I'm totally ok with
core+crtc (like here), with encoders and stuff as separate blocks (mali
just used bridges, yay for great design). So at least for me this patch
here is still ok, as an initial submission. And it helps a bit if you
don't have to jump around between patches too much to read the code.

Once a driver is merged ofc patches should be small and focused.
-Daniel

>=20
> >=20
> > At the very minimum you could have introduced DP500 support initial=
ly
> > and then DP550 and DP650 as follow up commits.
>=20
> I've tried to minimise the amount of code needed to support different=
 versions
> of the hardware, but I cannot hide the fact that each version behaves=
 differently.
> If I had introduced only DP500 support with all the scaffolding in pl=
ace you
> (or others) would've rightly questioned the need for all the structur=
es when only
> one hardware version was supported. At least this way it becomes clea=
r why some
> structures are needed. It doesn't make reviewing the code easier thou=
gh, and I
> do appologise for that, but I hope it is going to be a one off occure=
nce.
>=20
> >=20
> > On 25 April 2016 at 15:19, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> >=20
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/arm/malidp_crtc.c
> > > @@ -0,0 +1,259 @@
> >=20
> > > +static void malidp_crtc_enable(struct drm_crtc *crtc)
> > > +{
> > > +       struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc)=
;
> > > +       struct malidp_hw_device *hwdev =3D malidp->dev;
> > > +       struct videomode vm;
> > > +
> > > +       drm_display_mode_to_videomode(&crtc->state->adjusted_mode=
, &vm);
> > > +
> > > +       clk_prepare_enable(hwdev->pxlclk);
> > > +
> > > +       /* mclk needs to be set to the same or higher rate than p=
xlclk */
> > > +       clk_set_rate(hwdev->mclk, crtc->state->adjusted_mode.crtc=
_clock * 1000);
> > > +       clk_set_rate(hwdev->pxlclk, crtc->state->adjusted_mode.cr=
tc_clock * 1000);
> > > +
> > > +       hwdev->modeset(hwdev, &vm);
> > > +       hwdev->leave_config_mode(hwdev);
> > > +}
> > > +
> > > +static void malidp_crtc_disable(struct drm_crtc *crtc)
> > > +{
> > > +       struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc)=
;
> > > +       struct malidp_hw_device *hwdev =3D malidp->dev;
> > > +
> > > +       /*
> > > +        * avoid disabling already disabled clocks and hardware
> > > +        * (as is the case at device probe time)
> > > +        */
> > Ideally one should lower the pxlclk, correct ?
>=20
> Actually the pxlclk in the missing "else" branch is already disabled.=
 You might have
> an explanation for the behaviour, but when DRM initialises a driver i=
t will call the
> crtc's ->disable() hook during the modeset. In Mali DP's case, we sta=
rt with the pxlclk
> disabled and calling clk_disable_unprepare() unconditionally here giv=
es a huge WARN dump
> in the dmesg.
>=20
> >=20
> > > +       if (crtc->state->active) {
> > > +               hwdev->enter_config_mode(hwdev);
> > > +               clk_disable_unprepare(hwdev->pxlclk);
> > > +       }
> > > +}
> > > +
> >=20
> >=20
> > > +int malidp_crtc_init(struct drm_device *drm)
> > > +{
> > > +       struct malidp_drm *malidp =3D drm->dev_private;
> > > +       struct drm_plane *primary =3D NULL, *plane;
> > > +       int ret;
> > > +
> > You want malidp_de_planes_init() in here.
> >=20
> > > +       drm_for_each_plane(plane, drm) {
> > > +               if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> > > +                       primary =3D plane;
> > > +                       break;
> > > +               }
> > > +       }
> > > +
> > > +       if (!primary) {
> > > +               DRM_ERROR("no primary plane found\n");
> > ... and _destroy() here.
>=20
> I see your point. I will re-organise the calls.
>=20
> >=20
> >=20
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> >=20
> > > +static int malidp_init(struct drm_device *drm)
> > > +{
> > > +       int ret;
> > > +       struct malidp_drm *malidp =3D drm->dev_private;
> > > +       struct malidp_hw_device *hwdev =3D malidp->dev;
> > > +
> > > +       drm_mode_config_init(drm);
> > > +
> > > +       drm->mode_config.min_width =3D hwdev->min_line_size;
> > > +       drm->mode_config.min_height =3D hwdev->min_line_size;
> > > +       drm->mode_config.max_width =3D hwdev->max_line_size;
> > > +       drm->mode_config.max_height =3D hwdev->max_line_size;
> > > +       drm->mode_config.funcs =3D &malidp_mode_config_funcs;
> > > +
> > > +       ret =3D malidp_de_planes_init(drm);
> > Move this in malidp_crtc_init() ...
> >=20
> > > +       if (ret < 0) {
> > > +               DRM_ERROR("Failed to initialise planes\n");
> > > +               goto plane_init_fail;
> > > +       }
> > > +
> > > +       ret =3D malidp_crtc_init(drm);
> > > +       if (ret) {
> > > +               DRM_ERROR("Failed to initialise CRTC\n");
> > > +               goto crtc_init_fail;
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +crtc_init_fail:
> > > +       malidp_de_planes_destroy(drm);
> > ... and drop this ?
>=20
> Will do.
>=20
> >=20
> > > +plane_init_fail:
> > Nitpick: there is/was the idea that labels should be called after w=
hat
> > they do, rather than what fails. Personally I'm in favour of it as =
it
> > makes things clearer... sadly I might be one of the few.
>=20
> Would calling the label(s) xxxx_init_cleanup be a better option in yo=
ur view?
>=20
> >=20
> > > +       drm_mode_config_cleanup(drm);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > Add a malidp_fini() helper to complement the above ?
> >=20
> > > +static int malidp_irq_init(struct platform_device *pdev)
> >=20
> > Ditto - add malidp_irq_fini() to complement the _init() function ?
> >=20
>=20
> I will look into this.
>=20
> >=20
> > > +static int malidp_bind(struct device *dev)
> > > +{
> >=20
> > > +       /*
> > > +        * copy the associated data from malidp_drm_of_match to a=
void
> > > +        * having to keep a reference to the OF node after bindin=
g
> > > +        */
> > This feels a bit strange. Is keeping a reference that bad ?
> >=20
>=20
> There seems to be some odd behaviour related to of_device_id .data an=
d removable modules.
> If one rmmod's the module and then modprobe's it back the kernel thin=
ks the of_device_id data
> is still around when in fact it is full of garbage. I did not investi=
gate too closely,
> I assumed that the MODULE_DEVICE_TABLE entries end up somehow in the =
=2Einit section and get
> discarded but not cleaned up properly and on further insmods the kern=
el thinks data is still around?=20
>=20
> >=20
> >=20
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/arm/malidp_hw.c
> >=20
> > > +#define MALIDP_COMMON_FORMATS \
> > > +       /*    layers supporting the format,      internal id,    =
  fourcc */ \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 0), =
DRM_FORMAT_ARGB2101010 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 1), =
DRM_FORMAT_ABGR2101010 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 2), =
DRM_FORMAT_RGBA1010102 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 3), =
DRM_FORMAT_BGRA1010102 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(1, 0), DRM_FORMAT_ARGB8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(1, 1), DRM_FORMAT_ABGR8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(1, 2), DRM_FORMAT_RGBA8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(1, 3), DRM_FORMAT_BGRA8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(2, 0), DRM_FORMAT_XRGB8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(2, 1), DRM_FORMAT_XBGR8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(2, 2), DRM_FORMAT_RGBX8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP=
_ID(2, 3), DRM_FORMAT_BGRX8888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(3, 0), =
DRM_FORMAT_RGB888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(3, 1), =
DRM_FORMAT_BGR888 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 0), =
DRM_FORMAT_RGBA5551 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 1), =
DRM_FORMAT_ABGR1555 }, \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 2), =
DRM_FORMAT_RGB565 },   \
> > > +       { DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 3), =
DRM_FORMAT_BGR565 },   \
> > > +       { DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 2), DRM_FORMAT_YUYV=
 }, \
> > > +       { DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 3), DRM_FORMAT_UYVY=
 }, \
> > > +       { DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 6), DRM_FORMAT_NV12=
 }, \
> > > +       { DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 7), DRM_FORMAT_YUV4=
20 }
> > > +
> > > +static const struct malidp_input_format malidp550_de_formats[] =3D=
 {
> > > +       MALIDP_COMMON_FORMATS,
> > > +};
> > > +
> > > +static const struct malidp_input_format malidp650_de_formats[] =3D=
 {
> > > +       MALIDP_COMMON_FORMATS,
> > > +};
> > > +
> > Pretty sure that using the define here will lead to the exact same
> > code existing twice in the driver. Just kill off malidp650_de_forma=
ts
> > and use malidp550_de_formats instead ?
>=20
> malidp650_de_formats[] has some additional supported formats (mostly =
compressed buffers) but I removed the
> AFBC compression support from the initial submission. If I add a comm=
ent at the end of malidp650_de_formats[]
> would that be OK or you would prefer if I re-introduce the structure =
when I add back compression?
>=20
> >=20
> >=20
> > > +void malidp500_enter_config_mode(struct malidp_hw_device *hwdev)
> > Many/most of the functions in this file should be static.
>=20
> You are right, will update them.
>=20
> >=20
> > > +{
> > > +       u32 status, count =3D 100;
> > > +
> > Any particular reason behind the asymmetric (vs the leave_config_mo=
de)
> > 'count' ? Worth adding a comment ?
>=20
> Maybe I need to move the comment from inside the while() loop out her=
e. Basically entering config
> mode can be delayed for a full frame render or more if the bit is set=
 close to a vsync event, while
> exiting the config mode is pretty much synced to the next vsync. I co=
uld probably make the
> leave_config_mode count 100 as well, knowing that it would never reac=
h a high value.
>=20
> >=20
> > > +       malidp_hw_setbits(hwdev, MALIDP500_DC_CONFIG_REQ, MALIDP5=
00_DC_CONTROL);
> > > +       while (count) {
> > > +               status =3D malidp_hw_read(hwdev, hwdev->map.dc_ba=
se + MALIDP_REG_STATUS);
> > > +               if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D MAL=
IDP500_DC_CONFIG_REQ)
> > > +                       break;
> > > +               /*
> > > +                * entering config mode can take as long as the r=
endering
> > > +                * of a full frame, hence the long sleep here
> > > +                */
> > > +               usleep_range(1000, 10000);
> > > +               count--;
> > > +       }
> > > +       WARN(count =3D=3D 0, "timeout while entering config mode"=
);
> > > +}
> > > +
> > > +void malidp500_leave_config_mode(struct malidp_hw_device *hwdev)
> > > +{
> > > +       u32 status, count =3D 30;
> > > +
> > ...
> >=20
> >=20
> > > +u8 malidp_hw_get_format_id(const struct malidp_hw_regmap *map,
> > > +                          u8 layer_id, u32 format)
> > > +{
> > > +       unsigned int i;
> > > +
> > > +       for (i =3D 0; i < map->n_input_formats; i++) {
> > > +               if (((map->input_formats[i].layer & layer_id) =3D=
=3D layer_id) &&
> > > +                   (map->input_formats[i].format =3D=3D format))
> > > +                       return map->input_formats[i].id;
> > > +       }
> > > +
> > > +       return (u8)-1;
> > This feels very strange to read. Use 0xff (here and below) instead =
?
>=20
> Will do.
>=20
> >=20
> > > +}
> > > +
> > > +
> > > +u32 malidp_hw_read(struct malidp_hw_device *hwdev, u32 reg)
> > > +{
> > > +       u32 value =3D readl(hwdev->regs + reg);
> > > +       return value;
> > > +}
> > > +
> > > +void malidp_hw_write(struct malidp_hw_device *hwdev, u32 value, =
u32 reg)
> > > +{
> > > +       writel(value, hwdev->regs + reg);
> > > +}
> > > +
> > > +void malidp_hw_setbits(struct malidp_hw_device *hwdev, u32 mask,=
 u32 reg)
> > > +{
> > > +       u32 data =3D malidp_hw_read(hwdev, reg);
> > > +
> > > +       data |=3D mask;
> > > +       malidp_hw_write(hwdev, data, reg);
> > > +}
> > > +
> > > +void malidp_hw_clearbits(struct malidp_hw_device *hwdev, u32 mas=
k, u32 reg)
> > > +{
> > > +       u32 data =3D malidp_hw_read(hwdev, reg);
> > > +
> > > +       data &=3D ~mask;
> > > +       malidp_hw_write(hwdev, data, reg);
> > > +}
> > > +
> > Just declare the above 4 as static inline ? Or the read/write ones =
at least.
>=20
> I will, thanks for pointing it out.
>=20
> >=20
> >=20
> > > +void malidp_hw_clear_irq(struct malidp_hw_device *hwdev, u8 bloc=
k, u32 irq)
> > > +{
> > > +       u32 base =3D 0;
> > > +
> > > +       switch (block) {
> > > +       case MALIDP_DE_BLOCK:
> > > +               base =3D 0;
> > > +               break;
> > > +       case MALIDP_SE_BLOCK:
> > > +               base =3D hwdev->map.se_base;
> > > +               break;
> > > +       case MALIDP_DC_BLOCK:
> > > +               base =3D hwdev->map.dc_base;
> > > +               break;
> > > +       }
> > > +
> > Move the above switch into a helper function, instead of having thr=
ee
> > copies of it ?
>=20
> OK
>=20
> >=20
> >=20
> > > +int malidp_de_irq_init(struct drm_device *drm, int irq)
> > > +{
> > > +       struct malidp_drm *malidp =3D drm->dev_private;
> > > +       struct malidp_hw_device *hwdev =3D malidp->dev;
> > > +       int ret;
> > > +
> > > +       /* ensure interrupts are disabled */
> > > +       malidp_hw_disable_irq(hwdev, MALIDP_DC_BLOCK, 0xffffffff)=
;
> > > +       malidp_hw_clear_irq(hwdev, MALIDP_DC_BLOCK, 0xffffffff);
> > > +       malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK, 0xffffffff)=
;
> > > +       malidp_hw_clear_irq(hwdev, MALIDP_DE_BLOCK, 0xffffffff);
> > > +
> > Shouldn't we disable/clear DE before DC ? This way It aligns with
> > _cleanup and is the inverse of enable a couple of lines below.
>=20
> I will update the order.
>=20
> >=20
> > > +       ret =3D devm_request_threaded_irq(drm->dev, irq, malidp_d=
e_irq,
> > > +                                       malidp_de_irq_thread_hand=
ler,
> > > +                                       IRQF_SHARED, "malidp-de",=
 drm);
> > > +       if (ret < 0) {
> > > +               DRM_ERROR("failed to install DE IRQ handler\n");
> > > +               return ret;
> > > +       }
> > > +
> > > +       /* first enable the DC block IRQs */
> > > +       malidp_hw_enable_irq(hwdev, MALIDP_DC_BLOCK,
> > > +                            hwdev->map.dc_irq_map.irq_mask);
> > > +
> > > +       /* now enable the DE block IRQs */
> > > +       malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
> > > +                            hwdev->map.de_irq_map.irq_mask);
> > > +
> > > +       return 0;
> > > +}
> >=20
> >=20
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/arm/malidp_hw.h
> > > @@ -0,0 +1,189 @@
> >=20
> > > +#include <drm/drm_fourcc.h>
> > Afaict the header is not used here. Please include it only where ne=
eded.
>=20
> Sorry, forgot to remove it when I removed AFBC support. Will update.
>=20
> >=20
> >=20
> > > +struct malidp_hw_device {
> > > +       const struct malidp_hw_regmap map;
> > > +       void __iomem *regs;
> > > +
> > > +       /* APB clock */
> > > +       struct clk *pclk;
> > > +       /* AXI clock */
> > > +       struct clk *aclk;
> > > +       /* main clock for display core */
> > > +       struct clk *mclk;
> > > +       /* pixel clock for display core */
> > > +       struct clk *pxlclk;
> > > +
> > > +       /*
> > > +        * Validate the driver instance against the hardware bits
> > > +        */
> > > +       int (*query_hw)(struct malidp_hw_device *hwdev);
> > > +
> > > +       /*
> > > +        * Set the hardware into config mode, ready to accept mod=
e changes
> > > +        */
> > > +       void (*enter_config_mode)(struct malidp_hw_device *hwdev)=
;
> > > +
> > > +       /*
> > > +        * Tell hardware to exit configuration mode
> > > +        */
> > > +       void (*leave_config_mode)(struct malidp_hw_device *hwdev)=
;
> > > +
> > > +       /*
> > > +        * Query if hardware is in configuration mode
> > > +        */
> > > +       bool (*in_config_mode)(struct malidp_hw_device *hwdev);
> > > +
> > > +       /*
> > > +        * Set configuration valid flag for hardware parameters t=
hat can
> > > +        * be changed outside the configuration mode. Hardware wi=
ll use
> > > +        * the new settings when config valid is set after the en=
d of the
> > > +        * current buffer scanout
> > > +        */
> > > +       void (*set_config_valid)(struct malidp_hw_device *hwdev);
> > > +
> > > +       /*
> > > +        * Set a new mode in hardware. Requires the hardware to b=
e in
> > > +        * configuration mode before this function is called.
> > > +        */
> > > +       void (*modeset)(struct malidp_hw_device *hwdev, struct vi=
deomode *m);
> > > +
> > > +       /*
> > > +        * Calculate the required rotation memory given the activ=
e area
> > > +        * and the buffer format.
> > > +        */
> > > +       int (*rotmem_required)(struct malidp_hw_device *hwdev, u1=
6 w, u16 h, u32 fmt);
> > > +
> > Nitpick: We normally create use "const struct foo *funcs" for vfunc=
s.
>=20
> and so should I. Will update.
>=20
> >=20
> > Many of the structs in this file have holes in them. Worth checking
> > with pahole and reordering ?
>=20
> I was not aware of pahole, thanks for the hint. Will update.
>=20
> >=20
> > > +/*
> > > + * background color components are defined as 12bits values,
> > > + * they will be shifted right when stored on hardware that
> > > + * supports only 8bits per channel
> > > + */
> > > +#define MALIDP_BGND_COLOR_R            0x000
> > > +#define MALIDP_BGND_COLOR_G            0x000
> > > +#define MALIDP_BGND_COLOR_B            0x000
> > > +
> > Something feels very wrong here. Are you sure what all three are ze=
ro ?
>=20
> Default background color. Black is #000000000.
>=20
> >=20
> >=20
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/arm/malidp_planes.c
> >=20
> > > +static int malidp_de_atomic_update_plane(struct drm_plane *plane=
,
> > > +                                        struct drm_crtc *crtc,
> > > +                                        struct drm_framebuffer *=
fb,
> > > +                                        int crtc_x, int crtc_y,
> > > +                                        unsigned int crtc_w,
> > > +                                        unsigned int crtc_h,
> > > +                                        uint32_t src_x, uint32_t=
 src_y,
> > > +                                        uint32_t src_w, uint32_t=
 src_h)
> > > +{
> > > +       return drm_atomic_helper_update_plane(plane, crtc, fb, cr=
tc_x, crtc_y,
> > > +                                             crtc_w, crtc_h, src=
_x, src_y,
> > > +                                             src_w, src_h);
> > Just drop the wrapper and reference the helper directly into
> > drm_plane_funcs below ?
>=20
> Sorry, debugging artifact. Will do.
>=20
> >=20
> >=20
> > > +static void malidp_de_plane_update(struct drm_plane *plane,
> > > +                                  struct drm_plane_state *old_st=
ate)
> > > +{
> > > +       struct drm_gem_cma_object *obj;
> > > +       struct malidp_plane *mp;
> > > +       const struct malidp_hw_regmap *map;
> > > +       u8 format_id;
> > > +       u16 ptr;
> > > +       u32 format, src_w, src_h, dest_w, dest_h, val =3D 0;
> > > +       int num_planes, i;
> > > +
> > > +       mp =3D to_malidp_plane(plane);
> > > +
> > > +#ifdef MALIDP_ENABLE_BGND_COLOR_AS_PRIMARY_PLANE
> > > +       /* skip the primary plane, it is using the background col=
or */
> > > +       if (!mp->layer || !mp->layer->id)
> > > +               return;
> > > +#endif
> > > +
> > Afaict the above define is not set anywhere - neither explicitly
> > (#define foo, -DFOO) nor implicitly (via kconfig toggle). As such i=
t
> > should go. Same goes for the other instances of it.
>=20
> On principle, I agree with you. This was added for 2 reasons: one is =
internal testing,
> where the old ADF driver had test cases for using the background colo=
r as primary plane
> and we wanted to check for feature parity (irrelevant here, though); =
second is the fact
> that I read through some archived emails from Daniel about exposing t=
he background color
> as the primary plane and free another plane for the compositor to use=
=2E I wanted to check
> if we can do that and it looks possible, but it breaks a lot of exist=
ing code that assumes
> that the primary plane is more than just color (mostly legacy fbdev a=
pps). If this is
> considered an useful case, then I can create the Kconfig entry for th=
e #define (and rename
> it). It was left here as a sort of conversation breaker.
>=20
> >=20
> >=20
> > > +       format_id =3D malidp_hw_get_format_id(map, mp->layer->id,=
 format);
> > > +       if (format_id =3D=3D (u8)-1)
> > > +               return;
> > > +
> > We should move this to from _update to _check.
>=20
> You're absolutely right, will do.
>=20
> >=20
> >=20
> > > +int malidp_de_planes_init(struct drm_device *drm)
> > > +{
> > ...
> > > +       for (i =3D 0; i < map->n_layers; i++) {
> > > +               u8 id =3D map->layers[i].id;
> > > +
> > > +               plane =3D devm_kzalloc(drm->dev, sizeof(*plane), =
GFP_KERNEL);
> > Either use the non-devm function here and in _destroy or drop the o=
ne
> > in _destroy ? Afaict we could get a double-free with the latter in
> > place. Personally, I'd drop the devm_.
>=20
> OK, I will have a look into dropping the devm_.
>=20
> >=20
> >=20
> > The best thing is that I did not spot even one use of deprecated
> > functions. Nicely done gents :-)
>=20
> Thanks! It is not easy to figure out which function is deprecated goi=
ng forward, so I would
> put that down to luck ;)
>=20
> Best regards,
> Liviu
>=20
> >=20
> > Regards,
> > Emil
> >=20
>=20
> --=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF

--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
