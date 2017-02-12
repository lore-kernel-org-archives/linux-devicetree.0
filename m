From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v4 1/7] drm: Add DRM support for tiny LCD displays
Date: Sun, 12 Feb 2017 13:05:03 +0200
Message-ID: <CAHp75VeZke=JCosvc3xQ_AiOn64hth=PMJp4X0vLHMS14bkp4w@mail.gmail.com>
References: <20170211184858.26421-1-noralf@tronnes.org> <20170211184858.26421-2-noralf@tronnes.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170211184858.26421-2-noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 11, 2017 at 8:48 PM, Noralf Tr=C3=B8nnes <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org> w=
rote:
> tinydrm provides helpers for very simple displays that can use
> CMA backed framebuffers and need flushing on changes.

> +/**

> + * tinydrm_gem_cma_free_object - Free resources associated with a CMA GE=
M
> + *                               object

Keep on one line?

> +const struct file_operations tinydrm_fops =3D {

> +       .owner          =3D THIS_MODULE,

Do we still need this?

> +static int tinydrm_init(struct device *parent, struct tinydrm_device *td=
ev,
> +                       const struct drm_framebuffer_funcs *fb_funcs,
> +                       struct drm_driver *driver)
> +{
> +       struct drm_device *drm;
> +
> +       mutex_init(&tdev->dirty_lock);
> +       tdev->fb_funcs =3D fb_funcs;
> +
> +       /*
> +        * We don't embed drm_device, because that prevent us from using
> +        * devm_kzalloc() to allocate tinydrm_device in the driver since

> +        * drm_dev_unref() frees the structure. The devm_ functions provi=
de

"devm_ functions" -> "devm_kzalloc()" ?

Otherwise what else do you refer to and why here?

> +        * for easy error handling.
> +        */

> +static int tinydrm_register(struct tinydrm_device *tdev)
> +{
> +       struct drm_device *drm =3D tdev->drm;
> +       int bpp =3D drm->mode_config.preferred_depth;
> +       struct drm_fbdev_cma *fbdev;
> +       int ret;
> +
> +       ret =3D drm_dev_register(tdev->drm, 0);
> +       if (ret)
> +               return ret;
> +
> +       fbdev =3D drm_fbdev_cma_init_with_funcs(drm, bpp ? bpp : 32,
> +                                             drm->mode_config.num_connec=
tor,
> +                                             tdev->fb_funcs);

> +       if (IS_ERR(fbdev))
> +               DRM_ERROR("Failed to initialize fbdev: %ld\n", PTR_ERR(fb=
dev));
> +       else
> +               tdev->fbdev_cma =3D fbdev;

Apparently I missed previous round of reviews, can you just put in
short words why error is not propagated here to the caller?

> +
> +       return 0;
> +}

> +/**
> + * tinydrm_display_pipe_init - Initialize display pipe
> + * @tdev: tinydrm device
> + * @funcs: Display pipe functions
> + * @connector_type: Connector type

> + * @formats: Array of supported formats (DRM_FORMAT\_\*)

DRM_FORMAT_* ?

> + * @format_count: Number of elements in @formats
> + * @mode: Supported mode
> + * @rotation: Initial @mode rotation in degrees Counter Clock Wise
> + *
> + * This function sets up a &drm_simple_display_pipe with a &drm_connecto=
r that
> + * has one fixed &drm_display_mode which is rotated according to @rotati=
on.
> + *
> + * Returns:
> + * Zero on success, negative error code on failure.
> + */

> +{
> +       struct drm_device *drm =3D tdev->drm;
> +       struct drm_display_mode *mode_copy;
> +       struct drm_connector *connector;
> +       int ret;

> +       connector =3D tinydrm_connector_create(drm, mode_copy, connector_=
type);
> +       if (IS_ERR(connector))
> +               return PTR_ERR(connector);
> +

> +       ret =3D drm_simple_display_pipe_init(drm, &tdev->pipe, funcs, for=
mats,
> +                                          format_count, connector);
> +       if (ret)
> +               return ret;
> +
> +       return 0;

return drm_... ?

> +}
> +EXPORT_SYMBOL(tinydrm_display_pipe_init);

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
