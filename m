From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v11 2/7] drm/sun4i: dsi: Update start value
 in video start delay
Date: Thu, 03 Oct 2019 14:52:23 +0800
Message-ID: <75B6346D-714D-4235-B4B8-CAE4384919DB@aosc.io>
References: <20191003064527.15128-1-jagan@amarulasolutions.com> <20191003064527.15128-3-jagan@amarulasolutions.com>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBLNV23WAKGQEG4YXA7Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20191003064527.15128-3-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org



=E4=BA=8E 2019=E5=B9=B410=E6=9C=883=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=882:=
45:22, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org> =E5=86=99=E5=88=B0:
>start value in video start delay was changed in
>commit da676c6aa641 ("drm/sun4i: dsi: Change the start delay
>calculation")
>to match the legacy BSP driver [1].
>
>So, using this existing start delay computation gives the wrong
>start delay value for the "bananapi,s070wv20-ct16" panel. Due to
>this the panel trigger below flip_done timed out as during kernel
>bootup:
>
>WARNING: CPU: 0 PID: 31 at drivers/gpu/drm/drm_atomic_helper.c:1429
>drm_atomic_helper_wait_for_vblanks.part.1+0x298/0x2a0
> [CRTC:46:crtc-0] vblank wait timed out
> Modules linked in:
>CPU: 0 PID: 31 Comm: kworker/0:1 Tainted: G        W       =20
>5.1.0-next-20190514-00025-gf928bc7cc146 #15
> Hardware name: Allwinner sun8i Family
> Workqueue: events deferred_probe_work_func
>[<c010ed54>] (unwind_backtrace) from [<c010b76c>]
>(show_stack+0x10/0x14)
> [<c010b76c>] (show_stack) from [<c0688c90>] (dump_stack+0x84/0x98)
> [<c0688c90>] (dump_stack) from [<c011d9e4>] (__warn+0xfc/0x114)
> [<c011d9e4>] (__warn) from [<c011da40>] (warn_slowpath_fmt+0x44/0x68)
>[<c011da40>] (warn_slowpath_fmt) from [<c040cd50>]
>(drm_atomic_helper_wait_for_vblanks.part.1+0x298/0x2a0)
>[<c040cd50>] (drm_atomic_helper_wait_for_vblanks.part.1) from
>[<c040e694>] (drm_atomic_helper_commit_tail_rpm+0x5c/0x6c)
>[<c040e694>] (drm_atomic_helper_commit_tail_rpm) from [<c040e4dc>]
>(commit_tail+0x40/0x6c)
>[<c040e4dc>] (commit_tail) from [<c040e5cc>]
>(drm_atomic_helper_commit+0xbc/0x128)
>[<c040e5cc>] (drm_atomic_helper_commit) from [<c0411b64>]
>(restore_fbdev_mode_atomic+0x1cc/0x1dc)
>[<c0411b64>] (restore_fbdev_mode_atomic) from [<c0411cb0>]
>(drm_fb_helper_pan_display+0xac/0x1d0)
>[<c0411cb0>] (drm_fb_helper_pan_display) from [<c03a4e84>]
>(fb_pan_display+0xcc/0x134)
>[<c03a4e84>] (fb_pan_display) from [<c03b1214>]
>(bit_update_start+0x14/0x30)
>[<c03b1214>] (bit_update_start) from [<c03afe94>]
>(fbcon_switch+0x3d8/0x4e0)
>[<c03afe94>] (fbcon_switch) from [<c03ec930>]
>(redraw_screen+0x174/0x238)
>[<c03ec930>] (redraw_screen) from [<c03aceb4>]
>(fbcon_prepare_logo+0x3c4/0x400)
>[<c03aceb4>] (fbcon_prepare_logo) from [<c03ad2b8>]
>(fbcon_init+0x3c8/0x5ac)
> [<c03ad2b8>] (fbcon_init) from [<c03eb8a0>] (visual_init+0xbc/0x104)
>[<c03eb8a0>] (visual_init) from [<c03ed1b8>]
>(do_bind_con_driver+0x1b0/0x390)
>[<c03ed1b8>] (do_bind_con_driver) from [<c03ed780>]
>(do_take_over_console+0x13c/0x1c4)
>[<c03ed780>] (do_take_over_console) from [<c03ad800>]
>(do_fbcon_takeover+0x74/0xcc)
>[<c03ad800>] (do_fbcon_takeover) from [<c013c9c8>]
>(notifier_call_chain+0x44/0x84)
>[<c013c9c8>] (notifier_call_chain) from [<c013cd20>]
>(__blocking_notifier_call_chain+0x48/0x60)
>[<c013cd20>] (__blocking_notifier_call_chain) from [<c013cd50>]
>(blocking_notifier_call_chain+0x18/0x20)
>[<c013cd50>] (blocking_notifier_call_chain) from [<c03a6e44>]
>(register_framebuffer+0x1e0/0x2f8)
>[<c03a6e44>] (register_framebuffer) from [<c04153c0>]
>(__drm_fb_helper_initial_config_and_unlock+0x2fc/0x50c)
>[<c04153c0>] (__drm_fb_helper_initial_config_and_unlock) from
>[<c04158c8>] (drm_fbdev_client_hotplug+0xe8/0x1b8)
>[<c04158c8>] (drm_fbdev_client_hotplug) from [<c0415a20>]
>(drm_fbdev_generic_setup+0x88/0x118)
>[<c0415a20>] (drm_fbdev_generic_setup) from [<c043f060>]
>(sun4i_drv_bind+0x128/0x160)
>[<c043f060>] (sun4i_drv_bind) from [<c044b5b0>]
>(try_to_bring_up_master+0x164/0x1a0)
>[<c044b5b0>] (try_to_bring_up_master) from [<c044b680>]
>(__component_add+0x94/0x140)
>[<c044b680>] (__component_add) from [<c0445e1c>]
>(sun6i_dsi_probe+0x144/0x234)
>[<c0445e1c>] (sun6i_dsi_probe) from [<c0452f0c>]
>(platform_drv_probe+0x48/0x9c)
>[<c0452f0c>] (platform_drv_probe) from [<c04512e4>]
>(really_probe+0x1dc/0x2c8)
>[<c04512e4>] (really_probe) from [<c0451530>]
>(driver_probe_device+0x60/0x160)
>[<c0451530>] (driver_probe_device) from [<c044f7bc>]
>(bus_for_each_drv+0x74/0xb8)
>[<c044f7bc>] (bus_for_each_drv) from [<c0451094>]
>(__device_attach+0xd0/0x13c)
>[<c0451094>] (__device_attach) from [<c045048c>]
>(bus_probe_device+0x84/0x8c)
>[<c045048c>] (bus_probe_device) from [<c0450918>]
>(deferred_probe_work_func+0x64/0x90)
>[<c0450918>] (deferred_probe_work_func) from [<c0135970>]
>(process_one_work+0x204/0x420)
>[<c0135970>] (process_one_work) from [<c013690c>]
>(worker_thread+0x274/0x5a0)
> [<c013690c>] (worker_thread) from [<c013b3d8>] (kthread+0x11c/0x14c)
> [<c013b3d8>] (kthread) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xde539fb0 to 0xde539ff8)
>9fa0:                                     00000000 00000000 00000000
>00000000
>9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>00000000
> 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> ---[ end trace 755e10f62b83f396 ]---
> Console: switching to colour frame buffer device 100x30
>[drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:46:crtc-0]
>flip_done timed out
>[drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
>[CONNECTOR:48:DSI-1] flip_done timed out
>[drm:drm_atomic_helper_wait_for_dependencies] *ERROR*
>[PLANE:30:plane-0] flip_done timed out
>
>To fix this, adjust the start delay computation according to the
>new BSP code [2].
>
>Unfortunately we don't have any evidence or documentation for this
>reassignment to 1 in new bsp, but it is working with below mainline
>supported panels in A33, A64.
>- bananapi,s070wv20-ct16
>- feiyang,fy07024di26a30d
>- techstar,ts8550b
>
>So, use the start as per new bsp code since it is working in all
>the supported panels.
>
>[1]
>https://github.com/BPI-SINOVOIP/BPI-M2M-bsp/blob/master/linux-sunxi/driver=
s/video/sunxi/legacy/disp/de_bsp/de/ebios/de_dsi.c#L682
>[2]
>https://github.com/BPI-SINOVOIP/BPI-M2M-bsp/blob/master/linux-sunxi/driver=
s/video/sunxi/disp/de/lowlevel_sun8iw5/de_dsi.c#L807
>
>Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>---
> drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>index f83522717488..c9c99c52bf1e 100644
>--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>@@ -365,7 +365,17 @@ static void sun6i_dsi_inst_init(struct sun6i_dsi
>*dsi,
> static u16 sun6i_dsi_get_video_start_delay(struct sun6i_dsi *dsi,
> 					   struct drm_display_mode *mode)
> {
>-	u16 start =3D clamp(mode->vtotal - mode->vdisplay - 10, 8, 100);
>+	/**
>+	 * Allwinner legacy (drivers/video/sunxi/legacy),
>+	 * new (drivers/video/sunxi/disp/de/lowlevel_sun8iw5) bsp drivers
>+	 * are evaluating start as:
>+	 *
>+	 *	vtotal - vdisplay - 10
>+	 *
>+	 * but the new drivers are reassigning start to 1, which seems to be
>+	 * working in DSI panels available in mainline.

Please see my patchset for the reason that set 1 here.

>+	 */
>+	u8 start =3D 1;
>	u16 delay =3D mode->vtotal - (mode->vsync_end - mode->vdisplay) + start;
>=20
> 	if (delay > mode->vtotal)

--=20
=E4=BD=BF=E7=94=A8 K-9 Mail =E5=8F=91=E9=80=81=E8=87=AA=E6=88=91=E7=9A=84An=
droid=E8=AE=BE=E5=A4=87=E3=80=82

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
To view this discussion on the web, visit https://groups.google.com/d/msgid=
/linux-sunxi/75B6346D-714D-4235-B4B8-CAE4384919DB%40aosc.io.
