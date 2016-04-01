From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [RFC][PATCH 2/2] drm/arm: Add support for Mali Display Processors
Date: Fri,  1 Apr 2016 17:21:52 +0100
Message-ID: <1459527712-9488-3-git-send-email-Liviu.Dudau@arm.com>
References: <1459527712-9488-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459527712-9488-1-git-send-email-Liviu.Dudau@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@gmail.com>, Daniel Stone <daniel@fooishbar.org>, David Brown <David.Brown@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
Cc: DRI devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Add support for the new family of Display Processors from ARM Ltd.
This commit adds basic support for Mali DP500, DP550 and DP650
parts, with only the display engine being supported at the moment.

Cc: David Brown <David.Brown@arm.com>
Cc: Brian Starkey <Brian.Starkey@arm.com>

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 drivers/gpu/drm/arm/Kconfig         |  15 +
 drivers/gpu/drm/arm/Makefile        |   2 +
 drivers/gpu/drm/arm/malidp_crtc.c   | 276 +++++++++++++
 drivers/gpu/drm/arm/malidp_drv.c    | 486 ++++++++++++++++++++++
 drivers/gpu/drm/arm/malidp_drv.h    |  49 +++
 drivers/gpu/drm/arm/malidp_hw.c     | 777 ++++++++++++++++++++++++++++=
++++++++
 drivers/gpu/drm/arm/malidp_hw.h     | 192 +++++++++
 drivers/gpu/drm/arm/malidp_planes.c | 342 ++++++++++++++++
 drivers/gpu/drm/arm/malidp_regs.h   | 172 ++++++++
 9 files changed, 2311 insertions(+)
 create mode 100644 drivers/gpu/drm/arm/malidp_crtc.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.c
 create mode 100644 drivers/gpu/drm/arm/malidp_drv.h
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.c
 create mode 100644 drivers/gpu/drm/arm/malidp_hw.h
 create mode 100644 drivers/gpu/drm/arm/malidp_planes.c
 create mode 100644 drivers/gpu/drm/arm/malidp_regs.h

diff --git a/drivers/gpu/drm/arm/Kconfig b/drivers/gpu/drm/arm/Kconfig
index eaed454..e5b5b6b 100644
--- a/drivers/gpu/drm/arm/Kconfig
+++ b/drivers/gpu/drm/arm/Kconfig
@@ -25,3 +25,18 @@ config DRM_HDLCD_SHOW_UNDERRUN
 	  Enable this option to show in red colour the pixels that the
 	  HDLCD device did not fetch from framebuffer due to underrun
 	  conditions.
+
+config DRM_MALI_DISPLAY
+	tristate "ARM Mali Display Processor"
+	depends on DRM && OF && (ARM || ARM64)
+	depends on COMMON_CLK
+	select DRM_ARM
+	select DRM_KMS_HELPER
+	select DRM_KMS_CMA_HELPER
+	select DRM_GEM_CMA_HELPER
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you want to compile the ARM Mali Display
+	  Processor driver. It supports all the variants of the hardware.
+
+	  If compiled as a module it will be called malidp.
diff --git a/drivers/gpu/drm/arm/Makefile b/drivers/gpu/drm/arm/Makefil=
e
index 89dcb7b..3e76e6c 100644
--- a/drivers/gpu/drm/arm/Makefile
+++ b/drivers/gpu/drm/arm/Makefile
@@ -1,2 +1,4 @@
 hdlcd-y :=3D hdlcd_drv.o hdlcd_crtc.o
 obj-$(CONFIG_DRM_HDLCD)	+=3D hdlcd.o
+malidp-y :=3D malidp_drv.o malidp_hw.o malidp_planes.o malidp_crtc.o
+obj-$(CONFIG_DRM_MALI_DISPLAY)	+=3D malidp.o
diff --git a/drivers/gpu/drm/arm/malidp_crtc.c b/drivers/gpu/drm/arm/ma=
lidp_crtc.c
new file mode 100644
index 0000000..aa49fd4
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_crtc.c
@@ -0,0 +1,276 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP500/DP550/DP650 driver (crtc operations)
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <linux/clk.h>
+#include <video/videomode.h>
+
+#include "malidp_drv.h"
+#include "malidp_hw.h"
+
+static bool malidp_crtc_mode_fixup(struct drm_crtc *crtc,
+				   const struct drm_display_mode *mode,
+				   struct drm_display_mode *adjusted_mode)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	/*
+	 * check that the hardware can drive the required clock rate,
+	 * but skip the check if the clock is meant to be disabled (req_rate =
=3D 0)
+	 */
+	long rate, req_rate =3D mode->crtc_clock * 1000;
+
+	if (req_rate) {
+		rate =3D clk_round_rate(hwdev->mclk, req_rate);
+		if (rate < req_rate) {
+			DRM_DEBUG_DRIVER("mclk clock unable to reach %d kHz\n",
+					 mode->crtc_clock);
+			return false;
+		}
+
+		rate =3D clk_round_rate(hwdev->pxlclk, req_rate);
+		if (rate !=3D req_rate) {
+			DRM_DEBUG_DRIVER("pxlclk doesn't support %ld Hz\n",
+					 req_rate);
+			return false;
+		}
+
+		adjusted_mode->crtc_clock =3D rate / 1000;
+	}
+
+	return true;
+}
+
+static void malidp_crtc_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	struct videomode vm;
+
+	drm_display_mode_to_videomode(&crtc->state->adjusted_mode, &vm);
+
+	/* mclk needs to be set to the same or higher rate than pxlclk */
+	clk_set_rate(hwdev->mclk, crtc->state->adjusted_mode.crtc_clock * 100=
0);
+	clk_set_rate(hwdev->pxlclk, crtc->state->adjusted_mode.crtc_clock * 1=
000);
+
+	hwdev->modeset(hwdev, &vm);
+}
+
+static void malidp_crtc_enable(struct drm_crtc *crtc)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	clk_prepare_enable(hwdev->pxlclk);
+	hwdev->leave_config_mode(hwdev);
+}
+
+static void malidp_crtc_disable(struct drm_crtc *crtc)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	if (crtc->enabled) {
+		hwdev->enter_config_mode(hwdev);
+		clk_disable_unprepare(hwdev->pxlclk);
+	}
+}
+
+static int malidp_crtc_atomic_check(struct drm_crtc *crtc,
+				    struct drm_crtc_state *state)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	struct drm_plane *plane;
+	struct drm_plane_state *pstate;
+	u32 rot_mem_free, rot_mem_usable;
+	int rotated_planes =3D 0;
+
+	/*
+	 * check if there is enough rotation memory available for planes
+	 * that need 90=C2=B0 and 270=C2=B0 rotation. Each plane has set its =
required
+	 * memory size in the ->plane_check() callback, here we only make
+	 * sure that the sums are less that the total usable memory.
+	 *
+	 * The rotation memory allocation algorithm (for each plane):
+	 *  a. If no more rotated planes exist, all remaining rotate
+	 *     memory in the bank is available for use by the plane.
+	 *  b. If other rotated planes exist, and plane's layer ID is
+	 *     DE_VIDEO1, it can use all the memory from first bank if
+	 *     secondary rotation memory bank is available, otherwise it can
+	 *     use up to half the bank's memory.
+	 *  c. If other rotated planes exist, and plane's layer ID is not
+	 *     DE_VIDEO1, it can use half of the available memory
+	 *
+	 * Note: this algorithm assumes that the order in which the planes ar=
e
+	 * checked always has DE_VIDEO1 plane first in the list if it is
+	 * rotated. Because that is how we create the planes in the first
+	 * place, under current DRM version things work, but if ever the orde=
r
+	 * in which drm_atomic_crtc_state_for_each_plane() iterates over plan=
es
+	 * changes, we need to pre-sort the planes before validation.
+	 */
+
+	/* first count the number of rotated planes */
+	drm_atomic_crtc_state_for_each_plane(plane, state) {
+		pstate =3D drm_atomic_get_plane_state(state->state, plane);
+		if (pstate->rotation & MALIDP_ROTATED_MASK)
+			rotated_planes++;
+	}
+
+	rot_mem_free =3D hwdev->rotation_memory[0];
+	/*
+	 * if we have more than 1 plane using rotation memory, use the second
+	 * block of rotation memory as well
+	 */
+	if (rotated_planes > 1)
+		rot_mem_free +=3D hwdev->rotation_memory[1];
+
+	/* now validate the rotation memory requirements */
+	drm_atomic_crtc_state_for_each_plane(plane, state) {
+		struct malidp_plane *mp =3D to_malidp_plane(plane);
+
+		pstate =3D drm_atomic_get_plane_state(state->state, plane);
+		if (pstate->rotation & MALIDP_ROTATED_MASK) {
+			/* process current plane */
+			rotated_planes--;
+
+			if (!rotated_planes) {
+				/* no more rotated planes, we can use what's left */
+				rot_mem_usable =3D rot_mem_free;
+			} else {
+				if ((mp->layer->id !=3D DE_VIDEO1) ||
+				    (hwdev->rotation_memory[1] =3D=3D 0))
+					rot_mem_usable =3D rot_mem_free / 2;
+				else
+					rot_mem_usable =3D hwdev->rotation_memory[0];
+			}
+
+			rot_mem_free -=3D rot_mem_usable;
+
+			if (mp->rotmem_size > rot_mem_usable)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void malidp_crtc_atomic_begin(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_state)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+
+	if (crtc->state->event) {
+		struct drm_pending_vblank_event *event =3D crtc->state->event;
+		unsigned long flags;
+
+		crtc->state->event =3D NULL;
+		event->pipe =3D drm_crtc_index(crtc);
+
+		WARN_ON(drm_crtc_vblank_get(crtc) !=3D 0);
+
+		spin_lock_irqsave(&crtc->dev->event_lock, flags);
+		list_add_tail(&event->base.link, &malidp->event_list);
+		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
+	}
+}
+
+static void malidp_crtc_atomic_flush(struct drm_crtc *crtc,
+				     struct drm_crtc_state *old_state)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct drm_device *drm =3D crtc->dev;
+	int ret =3D malidp_wait_config_valid(drm);
+
+	if (!ret) {
+		unsigned long flags;
+		struct drm_pending_vblank_event *e;
+
+		spin_lock_irqsave(&drm->event_lock, flags);
+		e =3D list_first_entry_or_null(&malidp->event_list, typeof(*e),
+					     base.link);
+		if (e) {
+			list_del(&e->base.link);
+			drm_crtc_send_vblank_event(&malidp->crtc, e);
+			drm_crtc_vblank_put(&malidp->crtc);
+		}
+		spin_unlock_irqrestore(&drm->event_lock, flags);
+	} else {
+		DRM_DEBUG_DRIVER("timed out waiting for updated configuration\n");
+	}
+}
+
+static const struct drm_crtc_helper_funcs malidp_crtc_helper_funcs =3D=
 {
+	.mode_fixup =3D malidp_crtc_mode_fixup,
+	.mode_set =3D drm_helper_crtc_mode_set,
+	.mode_set_base =3D drm_helper_crtc_mode_set_base,
+	.mode_set_nofb =3D malidp_crtc_mode_set_nofb,
+	.enable =3D malidp_crtc_enable,
+	.disable =3D malidp_crtc_disable,
+	.atomic_check =3D malidp_crtc_atomic_check,
+	.atomic_begin =3D malidp_crtc_atomic_begin,
+	.atomic_flush =3D malidp_crtc_atomic_flush,
+};
+
+static void malidp_crtc_destroy(struct drm_crtc *crtc)
+{
+	struct malidp_drm *malidp =3D crtc_to_malidp_device(crtc);
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	clk_disable_unprepare(hwdev->pxlclk);
+	clk_disable_unprepare(hwdev->mclk);
+	drm_crtc_cleanup(crtc);
+}
+
+static const struct drm_crtc_funcs malidp_crtc_funcs =3D {
+	.destroy =3D malidp_crtc_destroy,
+	.set_config =3D drm_atomic_helper_set_config,
+	.page_flip =3D drm_atomic_helper_page_flip,
+	.reset =3D drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
+};
+
+int malidp_crtc_init(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct drm_plane *primary =3D NULL, *plane;
+	int ret;
+
+	drm_for_each_plane(plane, drm) {
+		if (plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
+			primary =3D plane;
+			break;
+		}
+	}
+
+	if (!primary) {
+		DRM_ERROR("no primary plane found\n");
+		return -EINVAL;
+	}
+
+	ret =3D drm_crtc_init_with_planes(drm, &malidp->crtc, primary, NULL,
+					&malidp_crtc_funcs, NULL);
+
+	if (ret) {
+		malidp_de_planes_destroy(drm);
+		return ret;
+	}
+
+	drm_crtc_helper_add(&malidp->crtc, &malidp_crtc_helper_funcs);
+	return 0;
+}
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/mal=
idp_drv.c
new file mode 100644
index 0000000..de45984
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -0,0 +1,486 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP500/DP550/DP650 KMS/DRM driver
+ */
+
+#include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_graph.h>
+#include <linux/of_reserved_mem.h>
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_of.h>
+
+#include "malidp_drv.h"
+#include "malidp_regs.h"
+#include "malidp_hw.h"
+
+#define MALIDP_CONF_VALID_TIMEOUT	250
+
+/*
+ * set the "config valid" bit and wait until the hardware
+ * acts on it
+ */
+int malidp_wait_config_valid(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	int ret;
+
+	hwdev->set_config_valid(hwdev);
+	/* don't wait for config_valid flag if we are in config mode */
+	if (hwdev->in_config_mode(hwdev))
+		return 0;
+
+	ret =3D wait_event_interruptible_timeout(malidp->wq,
+			atomic_read(&malidp->config_valid) =3D=3D 1,
+			msecs_to_jiffies(MALIDP_CONF_VALID_TIMEOUT));
+
+	return (ret > 0) ? 0 : -ETIMEDOUT;
+}
+
+static void malidp_output_poll_changed(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+
+	if (malidp->fbdev)
+		drm_fbdev_cma_hotplug_event(malidp->fbdev);
+}
+
+static int malidp_atomic_commit(struct drm_device *dev,
+				struct drm_atomic_state *state,
+				bool async)
+{
+	/*
+	 * ToDo: investigate the async path to make sure that
+	 * operations are submitted correctly to the hardware,
+	 * rather than ignoring the async param
+	 */
+	return drm_atomic_helper_commit(dev, state, false);
+}
+
+static const struct drm_mode_config_funcs malidp_mode_config_funcs =3D=
 {
+	.fb_create =3D drm_fb_cma_create,
+	.output_poll_changed =3D malidp_output_poll_changed,
+	.atomic_check =3D drm_atomic_helper_check,
+	.atomic_commit =3D malidp_atomic_commit,
+};
+
+static int malidp_enable_vblank(struct drm_device *drm, unsigned int c=
rtc)
+{
+	return 0;
+}
+
+static void malidp_disable_vblank(struct drm_device *drm, unsigned int=
 pipe)
+{
+}
+
+static int malidp_init(struct drm_device *drm)
+{
+	int ret;
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	drm_mode_config_init(drm);
+
+	drm->mode_config.min_width =3D hwdev->min_line_size;
+	drm->mode_config.min_height =3D hwdev->min_line_size;
+	drm->mode_config.max_width =3D hwdev->max_line_size;
+	drm->mode_config.max_height =3D hwdev->max_line_size;
+	drm->mode_config.funcs =3D &malidp_mode_config_funcs;
+
+	ret =3D malidp_de_planes_init(drm);
+	if (ret < 0) {
+		DRM_ERROR("Failed to initialise planes\n");
+		goto plane_init_fail;
+	}
+
+	ret =3D malidp_crtc_init(drm);
+	if (ret) {
+		DRM_ERROR("Failed to initialise CRTC\n");
+		goto crtc_init_fail;
+	}
+
+	return 0;
+
+crtc_init_fail:
+	malidp_de_planes_destroy(drm);
+plane_init_fail:
+	drm_mode_config_cleanup(drm);
+
+	return ret;
+}
+
+static int malidp_irq_init(struct platform_device *pdev)
+{
+	int irq_de, irq_se, ret =3D 0;
+	struct drm_device *drm =3D dev_get_drvdata(&pdev->dev);
+
+	/* fetch the interrupts from DT */
+	irq_de =3D platform_get_irq_byname(pdev, "DE");
+	if (irq_de < 0) {
+		DRM_ERROR("no 'DE' IRQ specified!\n");
+		return irq_de;
+	}
+	irq_se =3D platform_get_irq_byname(pdev, "SE");
+	if (irq_se < 0) {
+		DRM_ERROR("no 'SE' IRQ specified!\n");
+		return irq_se;
+	}
+
+	ret =3D malidp_de_irq_init(drm, irq_de);
+	if (ret)
+		return ret;
+
+	ret =3D malidp_se_irq_init(drm, irq_se);
+	if (ret) {
+		malidp_de_irq_cleanup(drm);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void malidp_lastclose(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+
+	drm_fbdev_cma_restore_mode(malidp->fbdev);
+}
+
+static const struct file_operations fops =3D {
+	.owner =3D THIS_MODULE,
+	.open =3D drm_open,
+	.release =3D drm_release,
+	.unlocked_ioctl =3D drm_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl =3D drm_compat_ioctl,
+#endif
+	.poll =3D drm_poll,
+	.read =3D drm_read,
+	.llseek =3D noop_llseek,
+	.mmap =3D drm_gem_cma_mmap,
+};
+
+static struct drm_driver malidp_driver =3D {
+	.driver_features =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC |
+			   DRIVER_PRIME,
+	.lastclose =3D malidp_lastclose,
+	.get_vblank_counter =3D drm_vblank_no_hw_counter,
+	.enable_vblank =3D malidp_enable_vblank,
+	.disable_vblank =3D malidp_disable_vblank,
+	.gem_free_object =3D drm_gem_cma_free_object,
+	.gem_vm_ops =3D &drm_gem_cma_vm_ops,
+	.dumb_create =3D drm_gem_cma_dumb_create,
+	.dumb_map_offset =3D drm_gem_cma_dumb_map_offset,
+	.dumb_destroy =3D drm_gem_dumb_destroy,
+	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
+	.gem_prime_export =3D drm_gem_prime_export,
+	.gem_prime_import =3D drm_gem_prime_import,
+	.gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
+	.gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
+	.gem_prime_vmap =3D drm_gem_cma_prime_vmap,
+	.gem_prime_vunmap =3D drm_gem_cma_prime_vunmap,
+	.gem_prime_mmap =3D drm_gem_cma_prime_mmap,
+	.fops =3D &fops,
+	.name =3D "mali-dp",
+	.desc =3D "ARM Mali Display Processor driver",
+	.date =3D "20160106",
+	.major =3D 1,
+	.minor =3D 0,
+};
+
+static const struct of_device_id  malidp_drm_of_match[] =3D {
+	{
+		.compatible =3D "arm,mali-dp500",
+		.data =3D &malidp_device[MALIDP_500]
+	},
+	{
+		.compatible =3D "arm,mali-dp550",
+		.data =3D &malidp_device[MALIDP_550]
+	},
+	{
+		.compatible =3D "arm,mali-dp650",
+		.data =3D &malidp_device[MALIDP_650]
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, malidp_drm_of_match);
+
+#define MAX_OUTPUT_CHANNELS	3
+
+static int malidp_bind(struct device *dev)
+{
+	struct resource *res;
+	struct drm_device *drm;
+	struct malidp_drm *malidp;
+	struct malidp_hw_device *hwdev;
+	struct platform_device *pdev =3D to_platform_device(dev);
+	/* number of lines for the R, G and B output */
+	u8 output_width[MAX_OUTPUT_CHANNELS];
+	int ret =3D 0, i;
+	u32 version, out_depth =3D 0;
+
+	malidp =3D devm_kzalloc(dev, sizeof(*malidp), GFP_KERNEL);
+	if (!malidp)
+		return -ENOMEM;
+
+	hwdev =3D devm_kzalloc(dev, sizeof(*hwdev), GFP_KERNEL);
+	if (!hwdev)
+		return -ENOMEM;
+
+	/*
+	 * copy the associated data from malidp_drm_of_match to avoid
+	 * having to keep a reference to the OF node after binding
+	 */
+	memcpy(hwdev, of_device_get_match_data(dev), sizeof(*hwdev));
+	malidp->dev =3D hwdev;
+
+	INIT_LIST_HEAD(&malidp->event_list);
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hwdev->regs =3D devm_ioremap_resource(dev, res);
+	if (IS_ERR(hwdev->regs)) {
+		DRM_ERROR("Failed to map control registers area\n");
+		return PTR_ERR(hwdev->regs);
+	}
+
+	hwdev->pclk =3D devm_clk_get(dev, "pclk");
+	if (IS_ERR(hwdev->pclk))
+		return PTR_ERR(hwdev->pclk);
+
+	hwdev->aclk =3D devm_clk_get(dev, "aclk");
+	if (IS_ERR(hwdev->aclk))
+		return PTR_ERR(hwdev->aclk);
+
+	hwdev->mclk =3D devm_clk_get(dev, "mclk");
+	if (IS_ERR(hwdev->mclk))
+		return PTR_ERR(hwdev->mclk);
+
+	hwdev->pxlclk =3D devm_clk_get(dev, "pxlclk");
+	if (IS_ERR(hwdev->pxlclk))
+		return PTR_ERR(hwdev->pxlclk);
+
+	/* Get the optional framebuffer memory resource */
+	ret =3D of_reserved_mem_device_init(dev);
+	if (ret && ret !=3D -ENODEV)
+		return ret;
+
+	drm =3D drm_dev_alloc(&malidp_driver, dev);
+	if (!drm) {
+		ret =3D -ENOMEM;
+		goto alloc_fail;
+	}
+
+	/* Enable APB clock in order to get access to the registers */
+	clk_prepare_enable(hwdev->pclk);
+	/*
+	 * Enable AXI clock and main clock so that prefetch can start once
+	 * the registers are set
+	 */
+	clk_prepare_enable(hwdev->aclk);
+	clk_prepare_enable(hwdev->mclk);
+
+	ret =3D hwdev->query_hw(hwdev);
+	if (ret) {
+		DRM_ERROR("Invalid HW configuration\n");
+		goto query_hw_fail;
+	}
+
+	version =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_DE_CORE=
_ID);
+	DRM_INFO("found ARM Mali-DP%3x version r%dp%d\n", version >> 16,
+		 (version >> 12) & 0xf, (version >> 8) & 0xf);
+
+	/* set the number of lines used for output of RGB data */
+	ret =3D of_property_read_u8_array(dev->of_node,
+					"arm,malidp-output-port-lines",
+					output_width, MAX_OUTPUT_CHANNELS);
+	if (ret)
+		goto query_hw_fail;
+
+	for (i =3D 0; i < MAX_OUTPUT_CHANNELS; i++)
+		out_depth =3D (out_depth << 8) | (output_width[i] & 0xf);
+	malidp_hw_write(hwdev, out_depth, hwdev->map.out_depth_base);
+
+	drm->dev_private =3D malidp;
+	dev_set_drvdata(dev, drm);
+	atomic_set(&malidp->config_valid, 0);
+	init_waitqueue_head(&malidp->wq);
+
+	ret =3D malidp_init(drm);
+	if (ret < 0)
+		goto init_fail;
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		goto register_fail;
+
+	/* Set the CRTC's port so that the encoder component can find it */
+	malidp->crtc.port =3D of_graph_get_next_endpoint(dev->of_node, NULL);
+
+	ret =3D component_bind_all(dev, drm);
+	of_node_put(malidp->crtc.port);
+
+	if (ret) {
+		DRM_ERROR("Failed to bind all components\n");
+		goto bind_fail;
+	}
+
+	ret =3D drm_vblank_init(drm, drm->mode_config.num_crtc);
+	if (ret < 0) {
+		DRM_ERROR("failed to initialise vblank\n");
+		goto vblank_fail;
+	}
+	drm->vblank_disable_allowed =3D true;
+
+	ret =3D malidp_irq_init(pdev);
+	if (ret < 0)
+		goto irq_init_fail;
+
+	drm_mode_config_reset(drm);
+
+	drm_helper_disable_unused_functions(drm);
+	malidp->fbdev =3D drm_fbdev_cma_init(drm, 32, drm->mode_config.num_cr=
tc,
+					   drm->mode_config.num_connector);
+
+	if (IS_ERR(malidp->fbdev)) {
+		ret =3D PTR_ERR(malidp->fbdev);
+		malidp->fbdev =3D NULL;
+		goto fbdev_fail;
+	}
+
+	drm_kms_helper_poll_init(drm);
+	return 0;
+
+fbdev_fail:
+	malidp_se_irq_cleanup(drm);
+	malidp_de_irq_cleanup(drm);
+irq_init_fail:
+	drm_vblank_cleanup(drm);
+vblank_fail:
+	component_unbind_all(dev, drm);
+bind_fail:
+	drm_dev_unregister(drm);
+register_fail:
+	malidp_de_planes_destroy(drm);
+	drm_mode_config_cleanup(drm);
+init_fail:
+	drm->dev_private =3D NULL;
+	dev_set_drvdata(dev, NULL);
+query_hw_fail:
+	clk_disable_unprepare(hwdev->mclk);
+	clk_disable_unprepare(hwdev->aclk);
+	clk_disable_unprepare(hwdev->pclk);
+	drm_dev_unref(drm);
+alloc_fail:
+	of_reserved_mem_device_release(dev);
+
+	return ret;
+}
+
+static void malidp_unbind(struct device *dev)
+{
+	struct drm_device *drm =3D dev_get_drvdata(dev);
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	if (malidp->fbdev) {
+		drm_fbdev_cma_fini(malidp->fbdev);
+		malidp->fbdev =3D NULL;
+	}
+	drm_kms_helper_poll_fini(drm);
+	malidp_se_irq_cleanup(drm);
+	malidp_de_irq_cleanup(drm);
+	drm_vblank_cleanup(drm);
+	component_unbind_all(dev, drm);
+	drm_dev_unregister(drm);
+	malidp_de_planes_destroy(drm);
+	drm_mode_config_cleanup(drm);
+	drm->dev_private =3D NULL;
+	dev_set_drvdata(dev, NULL);
+	clk_disable_unprepare(hwdev->mclk);
+	clk_disable_unprepare(hwdev->aclk);
+	clk_disable_unprepare(hwdev->pclk);
+	drm_dev_unref(drm);
+	of_reserved_mem_device_release(dev);
+}
+
+static const struct component_master_ops malidp_master_ops =3D {
+	.bind =3D malidp_bind,
+	.unbind =3D malidp_unbind,
+};
+
+static int malidp_compare_dev(struct device *dev, void *data)
+{
+	struct device_node *np =3D data;
+
+	return dev->of_node =3D=3D np;
+}
+
+static int malidp_platform_probe(struct platform_device *pdev)
+{
+	struct device_node *port, *ep;
+	struct component_match *match =3D NULL;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	/* there is only one output port inside each device, find it */
+	ep =3D of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
+	if (!ep)
+		return -ENODEV;
+
+	if (!of_device_is_available(ep)) {
+		of_node_put(ep);
+		return -ENODEV;
+	}
+
+	/* add the remote encoder port as component */
+	port =3D of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+	if (!port || !of_device_is_available(port)) {
+		of_node_put(port);
+		return -EAGAIN;
+	}
+
+	component_match_add(&pdev->dev, &match, malidp_compare_dev, port);
+	return component_master_add_with_match(&pdev->dev, &malidp_master_ops=
,
+					       match);
+}
+
+static int malidp_platform_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &malidp_master_ops);
+	return 0;
+}
+
+static struct platform_driver malidp_platform_driver =3D {
+	.probe		=3D malidp_platform_probe,
+	.remove		=3D malidp_platform_remove,
+	.driver	=3D {
+		.name =3D "mali-dp",
+		.of_match_table	=3D malidp_drm_of_match,
+	},
+};
+
+module_platform_driver(malidp_platform_driver);
+
+MODULE_AUTHOR("Liviu Dudau <Liviu.Dudau@arm.com>");
+MODULE_DESCRIPTION("ARM Mali DP DRM driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/arm/malidp_drv.h b/drivers/gpu/drm/arm/mal=
idp_drv.h
new file mode 100644
index 0000000..7de0da6
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_drv.h
@@ -0,0 +1,49 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP500/DP550/DP650 KMS/DRM driver structures
+ */
+
+#ifndef __MALIDP_DRV_H__
+#define __MALIDP_DRV_H__
+
+#include <linux/mutex.h>
+#include <linux/wait.h>
+#include "malidp_hw.h"
+
+struct malidp_drm {
+	struct malidp_hw_device *dev;
+	struct drm_fbdev_cma *fbdev;
+	struct list_head event_list;
+	struct drm_crtc crtc;
+	wait_queue_head_t wq;
+	atomic_t config_valid;
+};
+
+#define crtc_to_malidp_device(x) container_of(x, struct malidp_drm, cr=
tc)
+
+struct malidp_plane {
+	struct drm_plane base;
+	struct malidp_hw_device *hwdev;
+	const struct malidp_layer *layer;
+	/* size of the required rotation memory when plane is rotated */
+	u32 rotmem_size;
+};
+
+#define to_malidp_plane(x) container_of(x, struct malidp_plane, base)
+
+int malidp_wait_config_valid(struct drm_device *drm);
+int malidp_de_planes_init(struct drm_device *drm);
+void malidp_de_planes_destroy(struct drm_device *drm);
+int malidp_crtc_init(struct drm_device *drm);
+
+/* often used combination of rotational bits */
+#define MALIDP_ROTATED_MASK	(BIT(DRM_ROTATE_90) | BIT(DRM_ROTATE_270))
+
+#endif  /* __MALIDP_DRV_H__ */
diff --git a/drivers/gpu/drm/arm/malidp_hw.c b/drivers/gpu/drm/arm/mali=
dp_hw.c
new file mode 100644
index 0000000..e840d69
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_hw.c
@@ -0,0 +1,777 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP500/DP550/DP650 hardware manipulation routines. This is =
where
+ * the difference between various versions of the hardware is being de=
alt with
+ * in an attempt to provide to the rest of the driver code a unified v=
iew
+ */
+
+#include <linux/types.h>
+#include <linux/io.h>
+#include <drm/drmP.h>
+#include <video/videomode.h>
+#include <video/display_timing.h>
+
+#include "malidp_drv.h"
+#include "malidp_hw.h"
+#include "malidp_regs.h"
+
+static const struct malidp_input_format malidp500_de_formats[] =3D {
+	/*    layers supporting the format,     internal id,      fourcc */
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  0, DRM_FORMAT_ARGB2101010=
 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  1, DRM_FORMAT_ABGR2101010=
 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  2, DRM_FORMAT_ARGB8888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  3, DRM_FORMAT_ABGR8888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  4, DRM_FORMAT_XRGB8888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  5, DRM_FORMAT_XBGR8888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  6, DRM_FORMAT_RGB888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  7, DRM_FORMAT_BGR888 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  8, DRM_FORMAT_RGBA5551 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2,  9, DRM_FORMAT_ABGR1555 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, 10, DRM_FORMAT_RGB565 },
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_GRAPHICS2, 11, DRM_FORMAT_BGR565 },
+	{ DE_VIDEO1, 12, DRM_FORMAT_UYVY },
+	{ DE_VIDEO1, 13, DRM_FORMAT_YUYV },
+	{ DE_VIDEO1, 14, DRM_FORMAT_NV12 },
+	{ DE_VIDEO1, 15, DRM_FORMAT_YUV420 },
+};
+
+#define MALIDP_ID(__group, __format) \
+	((((__group) & 0x7) << 3) | ((__format) & 0x7))
+
+#define MALIDP_COMMON_FORMATS \
+	/*    layers supporting the format,      internal id,      fourcc */ =
\
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 0), DRM_FORMAT_A=
RGB2101010 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 1), DRM_FORMAT_A=
BGR2101010 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 2), DRM_FORMAT_R=
GBA1010102 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(0, 3), DRM_FORMAT_B=
GRA1010102 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(1, 0), D=
RM_FORMAT_ARGB8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(1, 1), D=
RM_FORMAT_ABGR8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(1, 2), D=
RM_FORMAT_RGBA8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(1, 3), D=
RM_FORMAT_BGRA8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(2, 0), D=
RM_FORMAT_XRGB8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(2, 1), D=
RM_FORMAT_XBGR8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(2, 2), D=
RM_FORMAT_RGBX8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2 | DE_SMART, MALIDP_ID(2, 3), D=
RM_FORMAT_BGRX8888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(3, 0), DRM_FORMAT_R=
GB888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(3, 1), DRM_FORMAT_B=
GR888 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 0), DRM_FORMAT_R=
GBA5551 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 1), DRM_FORMAT_A=
BGR1555 }, \
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 2), DRM_FORMAT_R=
GB565 },	\
+	{ DE_VIDEO1 | DE_GRAPHICS1 | DE_VIDEO2, MALIDP_ID(4, 3), DRM_FORMAT_B=
GR565 },	\
+	{ DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 2), DRM_FORMAT_YUYV }, \
+	{ DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 3), DRM_FORMAT_UYVY }, \
+	{ DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 6), DRM_FORMAT_NV12 }, \
+	{ DE_VIDEO1 | DE_VIDEO2, MALIDP_ID(5, 7), DRM_FORMAT_YUV420 }
+
+static const struct malidp_input_format malidp550_de_formats[] =3D {
+	MALIDP_COMMON_FORMATS,
+};
+
+static const struct malidp_input_format malidp650_de_formats[] =3D {
+	MALIDP_COMMON_FORMATS,
+};
+
+static const struct malidp_layer malidp500_layers[] =3D {
+	{ DE_VIDEO1, MALIDP500_DE_LV_BASE, MALIDP500_DE_LV_PTR_BASE },
+	{ DE_GRAPHICS1, MALIDP500_DE_LG1_BASE, MALIDP500_DE_LG1_PTR_BASE },
+	{ DE_GRAPHICS2, MALIDP500_DE_LG2_BASE, MALIDP500_DE_LG2_PTR_BASE },
+};
+
+static const struct malidp_layer malidp550_layers[] =3D {
+	{ DE_VIDEO1, MALIDP550_DE_LV1_BASE, MALIDP550_DE_LV1_PTR_BASE },
+	{ DE_GRAPHICS1, MALIDP550_DE_LG_BASE, MALIDP550_DE_LG_PTR_BASE },
+	{ DE_VIDEO2, MALIDP550_DE_LV2_BASE, MALIDP550_DE_LV2_PTR_BASE },
+	{ DE_SMART, MALIDP550_DE_LS_BASE, MALIDP550_DE_LS_PTR_BASE },
+};
+
+#define MALIDP_DE_DEFAULT_PREFETCH_START	5
+
+int malidp500_query_hw(struct malidp_hw_device *hwdev)
+{
+	u32 conf =3D malidp_hw_read(hwdev, MALIDP500_CONFIG_ID);
+	u8 ln_size_mult =3D (1 << ((conf >> 4) & 0x1));
+
+	if (conf & MALIDP_HW_FEATURE_DS)
+		hwdev->features |=3D MALIDP_HW_FEATURE_DS;
+	hwdev->min_line_size =3D 2;
+	hwdev->max_line_size =3D SZ_2K * ln_size_mult;
+	hwdev->rotation_memory[0] =3D SZ_1K * 64 * ln_size_mult;
+	hwdev->rotation_memory[1] =3D 0; /* no second rotation memory bank */
+
+	return 0;
+}
+
+void malidp500_enter_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status, count =3D 30;
+
+	malidp_hw_setbits(hwdev, MALIDP500_DC_CONFIG_REQ, MALIDP500_DC_CONTRO=
L);
+	while (count) {
+		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STA=
TUS);
+		if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D MALIDP500_DC_CONFIG_RE=
Q)
+			break;
+		/*
+		 * entering config mode can take as long as the rendering
+		 * of a full frame, hence the long sleep here
+		 */
+		usleep_range(1000, 10000);
+		count--;
+	}
+	WARN(count =3D=3D 0, "timeout while entering config mode");
+}
+
+void malidp500_leave_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status, count =3D 30;
+
+	malidp_hw_clearbits(hwdev, MALIDP500_DC_CONFIG_REQ, MALIDP500_DC_CONT=
ROL);
+	while (count) {
+		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STA=
TUS);
+		if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D 0)
+			break;
+		usleep_range(100, 1000);
+		count--;
+	}
+	WARN(count =3D=3D 0, "timeout while leaving config mode");
+}
+
+bool malidp500_in_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status;
+
+	status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STAT=
US);
+	if ((status & MALIDP500_DC_CONFIG_REQ) =3D=3D MALIDP500_DC_CONFIG_REQ=
)
+		return true;
+
+	return false;
+}
+
+void malidp500_set_config_valid(struct malidp_hw_device *hwdev)
+{
+	malidp_hw_setbits(hwdev, MALIDP_CFG_VALID, MALIDP500_CONFIG_VALID);
+}
+
+void malidp500_modeset(struct malidp_hw_device *hwdev, struct videomod=
e *mode)
+{
+	u32 val =3D 0;
+
+	malidp_hw_clearbits(hwdev, MALIDP500_DC_CLEAR_MASK, MALIDP500_DC_CONT=
ROL);
+	if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
+		val |=3D MALIDP500_HSYNCPOL;
+	if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
+		val |=3D MALIDP500_VSYNCPOL;
+	val |=3D MALIDP_DE_DEFAULT_PREFETCH_START;
+	malidp_hw_setbits(hwdev, val, MALIDP500_DC_CONTROL);
+
+	/*
+	 * Mali-DP500 encodes the background color like this:
+	 *    - red   @ MALIDP500_BGND_COLOR[12:0]
+	 *    - green @ MALIDP500_BGND_COLOR[27:16]
+	 *    - blue  @ (MALIDP500_BGND_COLOR + 4)[12:0]
+	 */
+	val =3D ((MALIDP_BGND_COLOR_G & 0xfff) << 16) |
+	      (MALIDP_BGND_COLOR_R & 0xfff);
+	malidp_hw_write(hwdev, val, MALIDP500_BGND_COLOR);
+	malidp_hw_write(hwdev, MALIDP_BGND_COLOR_B, MALIDP500_BGND_COLOR + 4)=
;
+
+	val =3D MALIDP_DE_H_FRONTPORCH(mode->hfront_porch) |
+		MALIDP_DE_H_BACKPORCH(mode->hback_porch);
+	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_H_TIMI=
NGS);
+
+	val =3D MALIDP500_DE_V_FRONTPORCH(mode->vfront_porch) |
+		MALIDP_DE_V_BACKPORCH(mode->vback_porch);
+	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_V_TIMI=
NGS);
+
+	val =3D MALIDP_DE_H_SYNCWIDTH(mode->hsync_len) |
+		MALIDP_DE_V_SYNCWIDTH(mode->vsync_len);
+	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_SYNC_W=
IDTH);
+
+	val =3D MALIDP_DE_H_ACTIVE(mode->hactive) | MALIDP_DE_V_ACTIVE(mode->=
vactive);
+	malidp_hw_write(hwdev, val, MALIDP500_TIMINGS_BASE + MALIDP_DE_HV_ACT=
IVE);
+
+	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+		malidp_hw_setbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLAY_=
=46UNC);
+	else
+		malidp_hw_clearbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLA=
Y_FUNC);
+}
+
+int malidp500_rotmem_required(struct malidp_hw_device *hwdev, u16 w, u=
16 h, u32 fmt)
+{
+	unsigned int depth;
+	int bpp;
+
+	/* RGB888 or BGR888 can't be rotated */
+	if ((fmt =3D=3D DRM_FORMAT_RGB888) || (fmt =3D=3D DRM_FORMAT_BGR888))
+		return -EINVAL;
+
+	/*
+	 * Each layer needs enough rotation memory to fit 8 lines
+	 * worth of pixel data. Required size is then:
+	 *    size =3D (rotated_width * bpp * 8 ) / 8;
+	 */
+	drm_fb_get_bpp_depth(fmt, &depth, &bpp);
+
+	return w * bpp;
+}
+
+static int malidp550_query_hw(struct malidp_hw_device *hwdev)
+{
+	u32 conf =3D malidp_hw_read(hwdev, MALIDP550_CONFIG_ID);
+	u8 ln_size =3D (conf >> 4) & 0x3, rsize;
+
+	if (conf & MALIDP_HW_FEATURE_DS)
+		hwdev->features |=3D MALIDP_HW_FEATURE_DS;
+
+	hwdev->min_line_size =3D 2;
+
+	switch (ln_size) {
+	case 0:
+		hwdev->max_line_size =3D SZ_2K;
+		/* two banks of 64KB for rotation memory */
+		rsize =3D 64;
+		break;
+	case 1:
+		hwdev->max_line_size =3D SZ_4K;
+		/* two banks of 128KB for rotation memory */
+		rsize =3D 128;
+		break;
+	case 2:
+		hwdev->max_line_size =3D 1280;
+		/* two banks of 40KB for rotation memory */
+		rsize =3D 40;
+		break;
+	case 3:
+		/* reserved value */
+		hwdev->max_line_size =3D 0;
+		return -EINVAL;
+	}
+
+	hwdev->rotation_memory[0] =3D hwdev->rotation_memory[1] =3D rsize * S=
Z_1K;
+	return 0;
+}
+
+void malidp550_enter_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status, count =3D 30;
+
+	malidp_hw_setbits(hwdev, MALIDP550_DC_CONFIG_REQ, MALIDP550_DC_CONTRO=
L);
+	while (count) {
+		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STA=
TUS);
+		if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D MALIDP550_DC_CONFIG_RE=
Q)
+			break;
+		usleep_range(100, 1000);
+		count--;
+	}
+	WARN(count =3D=3D 0, "timeout while entering config mode");
+}
+
+void malidp550_leave_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status, count =3D 30;
+
+	malidp_hw_clearbits(hwdev, MALIDP550_DC_CONFIG_REQ, MALIDP550_DC_CONT=
ROL);
+	while (count) {
+		status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STA=
TUS);
+		if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D 0)
+			break;
+		usleep_range(100, 1000);
+		count--;
+	}
+	WARN(count =3D=3D 0, "timeout while leaving config mode");
+}
+
+bool malidp550_in_config_mode(struct malidp_hw_device *hwdev)
+{
+	u32 status;
+
+	status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_STAT=
US);
+	if ((status & MALIDP550_DC_CONFIG_REQ) =3D=3D MALIDP550_DC_CONFIG_REQ=
)
+		return true;
+
+	return false;
+}
+
+void malidp550_set_config_valid(struct malidp_hw_device *hwdev)
+{
+	malidp_hw_setbits(hwdev, MALIDP_CFG_VALID, MALIDP550_CONFIG_VALID);
+}
+
+void malidp550_modeset(struct malidp_hw_device *hwdev, struct videomod=
e *mode)
+{
+	u32 val =3D MALIDP_DE_DEFAULT_PREFETCH_START;
+
+	malidp_hw_write(hwdev, val, MALIDP550_DE_CONTROL);
+	/*
+	 * Mali-DP550 and Mali-DP650 encode the background color like this:
+	 *   - red   @ MALIDP550_DE_BGND_COLOR[23:16]
+	 *   - green @ MALIDP550_DE_BGND_COLOR[15:8]
+	 *   - blue  @ MALIDP550_DE_BGND_COLOR[7:0]
+	 *
+	 * We need to truncate the least significant 4 bits from the default
+	 * MALIDP_BGND_COLOR_x values
+	 */
+	val =3D (((MALIDP_BGND_COLOR_R >> 4) & 0xff) << 16) |
+	      (((MALIDP_BGND_COLOR_G >> 4) & 0xff) << 8) |
+	      ((MALIDP_BGND_COLOR_B >> 4) & 0xff);
+	malidp_hw_write(hwdev, val, MALIDP550_DE_BGND_COLOR);
+
+	val =3D MALIDP_DE_H_FRONTPORCH(mode->hfront_porch) |
+		MALIDP_DE_H_BACKPORCH(mode->hback_porch);
+	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_H_TIMI=
NGS);
+
+	val =3D MALIDP550_DE_V_FRONTPORCH(mode->vfront_porch) |
+		MALIDP_DE_V_BACKPORCH(mode->vback_porch);
+	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_V_TIMI=
NGS);
+
+	val =3D MALIDP_DE_H_SYNCWIDTH(mode->hsync_len) |
+		MALIDP_DE_V_SYNCWIDTH(mode->vsync_len);
+	if (mode->flags & DISPLAY_FLAGS_HSYNC_HIGH)
+		val |=3D MALIDP550_HSYNCPOL;
+	if (mode->flags & DISPLAY_FLAGS_VSYNC_HIGH)
+		val |=3D MALIDP550_VSYNCPOL;
+	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_SYNC_W=
IDTH);
+
+	val =3D MALIDP_DE_H_ACTIVE(mode->hactive) | MALIDP_DE_V_ACTIVE(mode->=
vactive);
+	malidp_hw_write(hwdev, val, MALIDP550_TIMINGS_BASE + MALIDP_DE_HV_ACT=
IVE);
+
+	if (mode->flags & DISPLAY_FLAGS_INTERLACED)
+		malidp_hw_setbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLAY_=
=46UNC);
+	else
+		malidp_hw_clearbits(hwdev, MALIDP_DISP_FUNC_ILACED, MALIDP_DE_DISPLA=
Y_FUNC);
+}
+
+int malidp550_rotmem_required(struct malidp_hw_device *hwdev, u16 w, u=
16 h, u32 fmt)
+{
+	u32 bytes_per_col;
+
+	/* raw RGB888 or BGR888 can't be rotated */
+	if ((fmt =3D=3D DRM_FORMAT_RGB888) || (fmt =3D=3D DRM_FORMAT_BGR888))
+		return -EINVAL;
+
+	switch (fmt) {
+	/* 8 lines at 4 bytes per pixel */
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_BGRA1010102:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_RGB888:
+	case DRM_FORMAT_BGR888:
+	/* 16 lines at 2 bytes per pixel */
+	case DRM_FORMAT_RGBA5551:
+	case DRM_FORMAT_ABGR1555:
+	case DRM_FORMAT_RGB565:
+	case DRM_FORMAT_BGR565:
+	case DRM_FORMAT_UYVY:
+	case DRM_FORMAT_YUYV:
+		bytes_per_col =3D 32;
+		break;
+	/* 16 lines at 1.5 bytes per pixel */
+	case DRM_FORMAT_NV12:
+	case DRM_FORMAT_YUV420:
+		bytes_per_col =3D 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return w * bytes_per_col;
+}
+
+static int malidp650_query_hw(struct malidp_hw_device *hwdev)
+{
+	u32 conf =3D malidp_hw_read(hwdev, MALIDP550_CONFIG_ID);
+	u8 ln_size =3D (conf >> 4) & 0x3, rsize;
+
+	if (conf & MALIDP_HW_FEATURE_DS)
+		hwdev->features |=3D MALIDP_HW_FEATURE_DS;
+
+	hwdev->min_line_size =3D 4;
+
+	switch (ln_size) {
+	case 0:
+	case 2:
+		/* reserved values */
+		hwdev->max_line_size =3D 0;
+		return -EINVAL;
+	case 1:
+		hwdev->max_line_size =3D SZ_4K;
+		/* two banks of 128KB for rotation memory */
+		rsize =3D 128;
+		break;
+	case 3:
+		hwdev->max_line_size =3D 2560;
+		/* two banks of 80KB for rotation memory */
+		rsize =3D 80;
+	}
+
+	hwdev->rotation_memory[0] =3D hwdev->rotation_memory[1] =3D rsize * S=
Z_1K;
+	return 0;
+}
+
+const struct malidp_hw_device malidp_device[MALIDP_MAX_DEVICES] =3D {
+	[MALIDP_500] =3D {
+		.map =3D {
+			.se_base =3D MALIDP500_SE_BASE,
+			.dc_base =3D MALIDP500_DC_BASE,
+			.de_irq_map =3D {
+				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
+					    MALIDP500_DE_IRQ_AXI_ERR |
+					    MALIDP500_DE_IRQ_VSYNC |
+					    MALIDP500_DE_IRQ_GLOBAL,
+				.vsync_irq =3D MALIDP500_DE_IRQ_VSYNC,
+			},
+			.se_irq_map =3D {
+				.irq_mask =3D MALIDP500_SE_IRQ_CONF_MODE,
+				.vsync_irq =3D 0,
+			},
+			.dc_irq_map =3D {
+				.irq_mask =3D MALIDP500_DE_IRQ_CONF_VALID,
+				.vsync_irq =3D MALIDP500_DE_IRQ_CONF_VALID,
+			},
+			.layers =3D malidp500_layers,
+			.n_layers =3D ARRAY_SIZE(malidp500_layers),
+			.input_formats =3D malidp500_de_formats,
+			.n_input_formats =3D ARRAY_SIZE(malidp500_de_formats),
+			.out_depth_base =3D MALIDP500_OUTPUT_DEPTH,
+			.features =3D 0,	/* no CLEARIRQ register */
+		},
+		.query_hw =3D malidp500_query_hw,
+		.enter_config_mode =3D malidp500_enter_config_mode,
+		.leave_config_mode =3D malidp500_leave_config_mode,
+		.in_config_mode =3D malidp500_in_config_mode,
+		.set_config_valid =3D malidp500_set_config_valid,
+		.modeset =3D malidp500_modeset,
+		.rotmem_required =3D malidp500_rotmem_required,
+	},
+	[MALIDP_550] =3D {
+		.map =3D {
+			.se_base =3D MALIDP550_SE_BASE,
+			.dc_base =3D MALIDP550_DC_BASE,
+			.de_irq_map =3D {
+				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
+					    MALIDP550_DE_IRQ_VSYNC,
+				.vsync_irq =3D MALIDP550_DE_IRQ_VSYNC,
+			},
+			.se_irq_map =3D {
+				.irq_mask =3D MALIDP550_SE_IRQ_EOW |
+					    MALIDP550_SE_IRQ_AXI_ERR,
+			},
+			.dc_irq_map =3D {
+				.irq_mask =3D MALIDP550_DC_IRQ_CONF_VALID,
+				.vsync_irq =3D MALIDP550_DC_IRQ_CONF_VALID,
+			},
+			.layers =3D malidp550_layers,
+			.n_layers =3D ARRAY_SIZE(malidp550_layers),
+			.input_formats =3D malidp550_de_formats,
+			.n_input_formats =3D ARRAY_SIZE(malidp550_de_formats),
+			.out_depth_base =3D MALIDP550_DE_OUTPUT_DEPTH,
+			.features =3D MALIDP_REGMAP_HAS_CLEARIRQ,
+		},
+		.query_hw =3D malidp550_query_hw,
+		.enter_config_mode =3D malidp550_enter_config_mode,
+		.leave_config_mode =3D malidp550_leave_config_mode,
+		.in_config_mode =3D malidp550_in_config_mode,
+		.set_config_valid =3D malidp550_set_config_valid,
+		.modeset =3D malidp550_modeset,
+		.rotmem_required =3D malidp550_rotmem_required,
+	},
+	[MALIDP_650] =3D {
+		.map =3D {
+			.se_base =3D MALIDP550_SE_BASE,
+			.dc_base =3D MALIDP550_DC_BASE,
+			.de_irq_map =3D {
+				.irq_mask =3D MALIDP_DE_IRQ_UNDERRUN |
+					    MALIDP650_DE_IRQ_DRIFT |
+					    MALIDP550_DE_IRQ_VSYNC,
+				.vsync_irq =3D MALIDP550_DE_IRQ_VSYNC,
+			},
+			.se_irq_map =3D {
+				.irq_mask =3D MALIDP550_SE_IRQ_EOW |
+					    MALIDP550_SE_IRQ_AXI_ERR,
+			},
+			.dc_irq_map =3D {
+				.irq_mask =3D MALIDP550_DC_IRQ_CONF_VALID,
+				.vsync_irq =3D MALIDP550_DC_IRQ_CONF_VALID,
+			},
+			.layers =3D malidp550_layers,
+			.n_layers =3D ARRAY_SIZE(malidp550_layers),
+			.input_formats =3D malidp650_de_formats,
+			.n_input_formats =3D ARRAY_SIZE(malidp650_de_formats),
+			.out_depth_base =3D MALIDP550_DE_OUTPUT_DEPTH,
+			.features =3D MALIDP_REGMAP_HAS_CLEARIRQ,
+		},
+		.query_hw =3D malidp650_query_hw,
+		.enter_config_mode =3D malidp550_enter_config_mode,
+		.leave_config_mode =3D malidp550_leave_config_mode,
+		.in_config_mode =3D malidp550_in_config_mode,
+		.set_config_valid =3D malidp550_set_config_valid,
+		.modeset =3D malidp550_modeset,
+		.rotmem_required =3D malidp550_rotmem_required,
+	},
+};
+
+u8 malidp_hw_get_format_id(const struct malidp_hw_regmap *map,
+			   u8 layer_id, u32 format)
+{
+	u8 i;
+
+	for (i =3D 0; i < map->n_input_formats; i++) {
+		if (((map->input_formats[i].layer & layer_id) =3D=3D layer_id) &&
+		    (map->input_formats[i].format =3D=3D format))
+			return map->input_formats[i].id;
+	}
+
+	return (u8)-1;
+}
+
+
+u32 malidp_hw_read(struct malidp_hw_device *hwdev, u32 reg)
+{
+	u32 value =3D readl(hwdev->regs + reg);
+	return value;
+}
+
+void malidp_hw_write(struct malidp_hw_device *hwdev, u32 value, u32 re=
g)
+{
+	writel(value, hwdev->regs + reg);
+}
+
+void malidp_hw_setbits(struct malidp_hw_device *hwdev, u32 mask, u32 r=
eg)
+{
+	u32 data =3D malidp_hw_read(hwdev, reg);
+
+	data |=3D mask;
+	malidp_hw_write(hwdev, data, reg);
+}
+
+void malidp_hw_clearbits(struct malidp_hw_device *hwdev, u32 mask, u32=
 reg)
+{
+	u32 data =3D malidp_hw_read(hwdev, reg);
+
+	data &=3D ~mask;
+	malidp_hw_write(hwdev, data, reg);
+}
+
+void malidp_hw_clear_irq(struct malidp_hw_device *hwdev, u8 block, u32=
 irq)
+{
+	u32 base =3D 0;
+
+	switch (block) {
+	case MALIDP_DE_BLOCK:
+		base =3D 0;
+		break;
+	case MALIDP_SE_BLOCK:
+		base =3D hwdev->map.se_base;
+		break;
+	case MALIDP_DC_BLOCK:
+		base =3D hwdev->map.dc_base;
+		break;
+	}
+
+	if (hwdev->map.features & MALIDP_REGMAP_HAS_CLEARIRQ)
+		malidp_hw_write(hwdev, irq, base + MALIDP_REG_CLEARIRQ);
+	else
+		malidp_hw_write(hwdev, irq, base + MALIDP_REG_STATUS);
+}
+
+void malidp_hw_disable_irq(struct malidp_hw_device *hwdev, u8 block, u=
32 irq)
+{
+	u32 base =3D 0;
+
+	switch (block) {
+	case MALIDP_DE_BLOCK:
+		base =3D 0;
+		break;
+	case MALIDP_SE_BLOCK:
+		base =3D hwdev->map.se_base;
+		break;
+	case MALIDP_DC_BLOCK:
+		base =3D hwdev->map.dc_base;
+		break;
+	}
+
+	malidp_hw_clearbits(hwdev, irq, base + MALIDP_REG_MASKIRQ);
+}
+
+void malidp_hw_enable_irq(struct malidp_hw_device *hwdev, u8 block, u3=
2 irq)
+{
+	u32 base =3D 0;
+
+	switch (block) {
+	case MALIDP_DE_BLOCK:
+		base =3D 0;
+		break;
+	case MALIDP_SE_BLOCK:
+		base =3D hwdev->map.se_base;
+		break;
+	case MALIDP_DC_BLOCK:
+		base =3D hwdev->map.dc_base;
+		break;
+	}
+
+	malidp_hw_setbits(hwdev, irq, base + MALIDP_REG_MASKIRQ);
+}
+
+static irqreturn_t malidp_de_irq(int irq, void *arg)
+{
+	struct drm_device *drm =3D arg;
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev;
+	const struct malidp_irq_map *de;
+	u32 status, mask, dc_status;
+	irqreturn_t ret =3D IRQ_NONE;
+
+	if (!drm->dev_private)
+		return IRQ_HANDLED;
+
+	hwdev =3D malidp->dev;
+	de =3D &hwdev->map.de_irq_map;
+
+	/* first handle the config valid IRQ */
+	dc_status =3D malidp_hw_read(hwdev, hwdev->map.dc_base + MALIDP_REG_S=
TATUS);
+	if (dc_status & hwdev->map.dc_irq_map.vsync_irq) {
+		/* we have a page flip event */
+		atomic_set(&malidp->config_valid, 1);
+		malidp_hw_clear_irq(hwdev, MALIDP_DC_BLOCK, dc_status);
+		ret =3D IRQ_WAKE_THREAD;
+	}
+
+	status =3D malidp_hw_read(hwdev, MALIDP_REG_STATUS);
+	if (!(status & de->irq_mask))
+		return ret;
+
+	mask =3D malidp_hw_read(hwdev, MALIDP_REG_MASKIRQ);
+	status &=3D mask;
+	if (status & de->vsync_irq)
+		drm_crtc_handle_vblank(&malidp->crtc);
+
+	malidp_hw_clear_irq(hwdev, MALIDP_DE_BLOCK, status);
+
+	return (ret =3D=3D IRQ_NONE) ? IRQ_HANDLED : ret;
+}
+
+static irqreturn_t malidp_de_irq_thread_handler(int irq, void *arg)
+{
+	struct drm_device *drm =3D arg;
+	struct malidp_drm *malidp =3D drm->dev_private;
+
+	wake_up(&malidp->wq);
+
+	return IRQ_HANDLED;
+}
+
+int malidp_de_irq_init(struct drm_device *drm, int irq)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	int ret;
+
+	/* ensure interrupts are disabled */
+	malidp_hw_disable_irq(hwdev, MALIDP_DC_BLOCK, ~0);
+	malidp_hw_clear_irq(hwdev, MALIDP_DC_BLOCK, ~0);
+	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK, ~0);
+	malidp_hw_clear_irq(hwdev, MALIDP_DE_BLOCK, ~0);
+
+	ret =3D devm_request_threaded_irq(drm->dev, irq, malidp_de_irq,
+					malidp_de_irq_thread_handler,
+					IRQF_SHARED, "malidp-de", drm);
+	if (ret < 0) {
+		DRM_ERROR("failed to install DE IRQ handler\n");
+		return ret;
+	}
+
+	/* first enable the DC block IRQs */
+	malidp_hw_enable_irq(hwdev, MALIDP_DC_BLOCK,
+			     hwdev->map.dc_irq_map.irq_mask);
+
+	/* now enable the DE block IRQs */
+	malidp_hw_enable_irq(hwdev, MALIDP_DE_BLOCK,
+			     hwdev->map.de_irq_map.irq_mask);
+
+	return 0;
+}
+
+void malidp_de_irq_cleanup(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	malidp_hw_disable_irq(hwdev, MALIDP_DE_BLOCK,
+			      hwdev->map.de_irq_map.irq_mask);
+	malidp_hw_disable_irq(hwdev, MALIDP_DC_BLOCK,
+			      hwdev->map.dc_irq_map.irq_mask);
+}
+
+static irqreturn_t malidp_se_irq(int irq, void *arg)
+{
+	struct drm_device *drm =3D arg;
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	u32 status, mask;
+
+	status =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_STAT=
US);
+	if (!(status & hwdev->map.se_irq_map.irq_mask))
+		return IRQ_NONE;
+
+	mask =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_MASKIR=
Q);
+	status =3D malidp_hw_read(hwdev, hwdev->map.se_base + MALIDP_REG_STAT=
US);
+	status &=3D mask;
+	/* ToDo: status decoding and firing up of VSYNC and page flip events =
*/
+
+	malidp_hw_clear_irq(hwdev, MALIDP_SE_BLOCK, status);
+	/* return IRQ_WAKE_THREAD; */
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t malidp_se_irq_thread_handler(int irq, void *arg)
+{
+	return IRQ_HANDLED;
+}
+
+int malidp_se_irq_init(struct drm_device *drm, int irq)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+	int ret;
+
+	/* ensure interrupts are disabled */
+	malidp_hw_disable_irq(hwdev, MALIDP_SE_BLOCK, ~0);
+	malidp_hw_clear_irq(hwdev, MALIDP_SE_BLOCK, ~0);
+
+	ret =3D devm_request_threaded_irq(drm->dev, irq, malidp_se_irq,
+					malidp_se_irq_thread_handler,
+					IRQF_SHARED, "malidp-se", drm);
+	if (ret < 0) {
+		DRM_ERROR("failed to install SE IRQ handler\n");
+		return ret;
+	}
+
+	malidp_hw_enable_irq(hwdev, MALIDP_SE_BLOCK,
+			     hwdev->map.se_irq_map.irq_mask);
+
+	return 0;
+}
+
+void malidp_se_irq_cleanup(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_hw_device *hwdev =3D malidp->dev;
+
+	malidp_hw_disable_irq(hwdev, MALIDP_SE_BLOCK,
+			      hwdev->map.se_irq_map.irq_mask);
+}
diff --git a/drivers/gpu/drm/arm/malidp_hw.h b/drivers/gpu/drm/arm/mali=
dp_hw.h
new file mode 100644
index 0000000..120a079
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_hw.h
@@ -0,0 +1,192 @@
+/*
+ *
+ * (C) COPYRIGHT 2013-2016 ARM Limited. All rights reserved.
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP hardware manipulation routines.
+ */
+
+#ifndef __MALIDP_HW_H__
+#define __MALIDP_HW_H__
+
+#include <drm/drm_fourcc.h>
+#include <linux/bitops.h>
+
+struct videomode;
+struct clk;
+
+/* Mali DP IP blocks */
+enum {
+	MALIDP_DE_BLOCK =3D 0,
+	MALIDP_SE_BLOCK,
+	MALIDP_DC_BLOCK
+};
+
+/* Mali DP layer IDs */
+enum {
+	DE_VIDEO1 =3D BIT(0),
+	DE_GRAPHICS1 =3D BIT(1),
+	DE_GRAPHICS2 =3D BIT(2), /* used only in DP500 */
+	DE_VIDEO2 =3D BIT(3),
+	DE_SMART =3D BIT(4),
+};
+
+struct malidp_input_format {
+	u8 layer;		/* bitmask of layers supporting it */
+	u8 id;			/* used internally */
+	u32 format;		/* DRM fourcc */
+};
+
+/*
+ * hide the differences between register maps
+ * by using a common structure to hold the
+ * base register offsets
+ */
+
+struct malidp_irq_map {
+	u32 irq_mask;		/* mask of IRQs that can be enabled in the block */
+	u32 vsync_irq;		/* IRQ bit used for signaling during VSYNC */
+};
+
+struct malidp_layer {
+	u8 id;			/* layer ID */
+	u16 base;		/* address offset for the register bank */
+	u16 ptr;		/* address offset for the pointer register */
+};
+
+/* regmap features */
+#define MALIDP_REGMAP_HAS_CLEARIRQ	(1 << 0)
+
+struct malidp_hw_regmap {
+	/* address offset of the DE register bank */
+	/* is always 0x0000 */
+	/* address offset of the SE registers bank */
+	const u16 se_base;
+	/* address offset of the DC registers bank */
+	const u16 dc_base;
+
+	const struct malidp_irq_map de_irq_map;
+	const struct malidp_irq_map se_irq_map;
+	const struct malidp_irq_map dc_irq_map;
+
+	/* list of supported layers */
+	const struct malidp_layer *layers;
+	const u8 n_layers;
+
+	/* list of supported input formats for each layer */
+	const struct malidp_input_format *input_formats;
+	const u8 n_input_formats;
+
+	/* address offset for the output depth register */
+	const u16 out_depth_base;
+
+	/* bitmap with register map features */
+	const u8 features;
+};
+
+/* hardware features */
+#define MALIDP_HW_FEATURE_DS		(1 << 0)	/* split screen */
+
+struct malidp_hw_device {
+	const struct malidp_hw_regmap map;
+	void __iomem *regs;
+
+	/* APB clock */
+	struct clk *pclk;
+	/* AXI clock */
+	struct clk *aclk;
+	/* main clock for display core */
+	struct clk *mclk;
+	/* pixel clock for display core */
+	struct clk *pxlclk;
+
+	/*
+	 * Validate the driver instance against the hardware bits
+	 */
+	int (*query_hw)(struct malidp_hw_device *hwdev);
+
+	/*
+	 * Set the hardware into config mode, ready to accept mode changes
+	 */
+	void (*enter_config_mode)(struct malidp_hw_device *hwdev);
+
+	/*
+	 * Tell hardware to exit configuration mode
+	 */
+	void (*leave_config_mode)(struct malidp_hw_device *hwdev);
+
+	/*
+	 * Query if hardware is in configuration mode
+	 */
+	bool (*in_config_mode)(struct malidp_hw_device *hwdev);
+
+	/*
+	 * Set configuration valid flag for hardware parameters that can
+	 * be changed outside the configuration mode. Hardware will use
+	 * the new settings when config valid is set after the end of the
+	 * current buffer scanout
+	 */
+	void (*set_config_valid)(struct malidp_hw_device *hwdev);
+
+	/*
+	 * Set a new mode in hardware. Requires the hardware to be in
+	 * configuration mode before this function is called.
+	 */
+	void (*modeset)(struct malidp_hw_device *hwdev, struct videomode *m);
+
+	/*
+	 * Calculate the required rotation memory given the active area
+	 * and the buffer format.
+	 */
+	int (*rotmem_required)(struct malidp_hw_device *hwdev, u16 w, u16 h, =
u32 fmt);
+
+	u8 features;
+
+	u8 min_line_size;
+	u16 max_line_size;
+
+	/* size of memory used for rotating layers, up to two banks available=
 */
+	u32 rotation_memory[2];
+};
+
+/* Supported variants of the hardware */
+enum {
+	MALIDP_500 =3D 0,
+	MALIDP_550,
+	MALIDP_650,
+	/* keep the next entry last */
+	MALIDP_MAX_DEVICES
+};
+
+extern const struct malidp_hw_device malidp_device[MALIDP_MAX_DEVICES]=
;
+
+u32 malidp_hw_read(struct malidp_hw_device *hwdev, u32 reg);
+void malidp_hw_write(struct malidp_hw_device *hwdev, u32 value, u32 re=
g);
+void malidp_hw_setbits(struct malidp_hw_device *hwdev, u32 mask, u32 r=
eg);
+void malidp_hw_clearbits(struct malidp_hw_device *hwdev, u32 mask, u32=
 reg);
+void malidp_hw_clear_irq(struct malidp_hw_device *hwdev, u8 block, u32=
 irq);
+void malidp_hw_disable_irq(struct malidp_hw_device *hwdev, u8 block, u=
32 irq);
+void malidp_hw_enable_irq(struct malidp_hw_device *hwdev, u8 block, u3=
2 irq);
+
+int malidp_de_irq_init(struct drm_device *drm, int irq);
+int malidp_se_irq_init(struct drm_device *drm, int irq);
+void malidp_de_irq_cleanup(struct drm_device *drm);
+void malidp_se_irq_cleanup(struct drm_device *drm);
+
+u8 malidp_hw_get_format_id(const struct malidp_hw_regmap *map,
+			   u8 layer_id, u32 format);
+
+/*
+ * background color components are defined as 12bits values,
+ * they will be shifted right when stored on hardware that
+ * supports only 8bits per channel
+ */
+#define MALIDP_BGND_COLOR_R		0x000
+#define MALIDP_BGND_COLOR_G		0x000
+#define MALIDP_BGND_COLOR_B		0x000
+
+#endif  /* __MALIDP_HW_H__ */
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/=
malidp_planes.c
new file mode 100644
index 0000000..6f20109
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -0,0 +1,342 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP plane manipulation routines.
+ */
+
+#include <drm/drmP.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "malidp_hw.h"
+#include "malidp_drv.h"
+
+/* Layer specific register offsets */
+#define MALIDP_LAYER_FORMAT		0x000
+#define MALIDP_LAYER_CONTROL		0x004
+#define   LAYER_ENABLE			(1 << 0)
+#define   LAYER_ROT_OFFSET		8
+#define   LAYER_H_FLIP			(1 << 10)
+#define   LAYER_V_FLIP			(1 << 11)
+#define   LAYER_ROT_MASK		(0xf << 8)
+#define MALIDP_LAYER_SIZE		0x00c
+#define   LAYER_H_VAL(x)		(((x) & 0x1fff) << 0)
+#define   LAYER_V_VAL(x)		(((x) & 0x1fff) << 16)
+#define MALIDP_LAYER_COMP_SIZE		0x010
+#define MALIDP_LAYER_OFFSET		0x014
+#define MALIDP_LAYER_STRIDE		0x018
+
+static void malidp_de_plane_destroy(struct drm_plane *plane)
+{
+	struct malidp_plane *mp =3D to_malidp_plane(plane);
+
+	if (mp->base.fb)
+		drm_framebuffer_unreference(mp->base.fb);
+
+	drm_plane_helper_disable(plane);
+	drm_plane_cleanup(plane);
+	devm_kfree(plane->dev->dev, mp);
+}
+
+static int malidp_de_atomic_update_plane(struct drm_plane *plane,
+					 struct drm_crtc *crtc,
+					 struct drm_framebuffer *fb,
+					 int crtc_x, int crtc_y,
+					 unsigned int crtc_w,
+					 unsigned int crtc_h,
+					 uint32_t src_x, uint32_t src_y,
+					 uint32_t src_w, uint32_t src_h)
+{
+	return drm_atomic_helper_update_plane(plane, crtc, fb, crtc_x, crtc_y=
,
+					      crtc_w, crtc_h, src_x, src_y,
+					      src_w, src_h);
+}
+
+static int malidp_de_plane_atomic_set_property(struct drm_plane *plane=
,
+					       struct drm_plane_state *state,
+					       struct drm_property *property,
+					       uint64_t val)
+{
+	return drm_atomic_helper_plane_set_property(plane, property, val);
+}
+
+static const struct drm_plane_funcs malidp_de_plane_funcs =3D {
+	.update_plane =3D malidp_de_atomic_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.destroy =3D malidp_de_plane_destroy,
+	.reset =3D drm_atomic_helper_plane_reset,
+	.set_property =3D drm_atomic_helper_plane_set_property,
+	.atomic_set_property =3D malidp_de_plane_atomic_set_property,
+	.atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_plane_destroy_state,
+};
+
+static int malidp_de_plane_check(struct drm_plane *plane,
+				 struct drm_plane_state *state)
+{
+	struct malidp_plane *mp =3D to_malidp_plane(plane);
+	u32 src_w, src_h;
+
+	if (!state->crtc || !state->fb)
+		return 0;
+
+	src_w =3D state->src_w >> 16;
+	src_h =3D state->src_h >> 16;
+
+	if ((state->crtc_w > mp->hwdev->max_line_size) ||
+	    (state->crtc_h > mp->hwdev->max_line_size) ||
+	    (state->crtc_w < mp->hwdev->min_line_size) ||
+	    (state->crtc_h < mp->hwdev->min_line_size) ||
+	    (state->crtc_w !=3D src_w) || (state->crtc_h !=3D src_h))
+		return -EINVAL;
+
+	mp->rotmem_size =3D 0;
+	if (state->rotation & MALIDP_ROTATED_MASK) {
+		int val;
+
+		/* SMART layer can't be rotated */
+		if (mp->layer->id =3D=3D DE_SMART)
+			return -EINVAL;
+
+		val =3D mp->hwdev->rotmem_required(mp->hwdev, state->crtc_h,
+						 state->crtc_w,
+						 state->fb->pixel_format);
+		if (val < 0)
+			return val;
+
+		mp->rotmem_size =3D val;
+	}
+
+	return 0;
+}
+
+static void malidp_de_plane_update(struct drm_plane *plane,
+				   struct drm_plane_state *old_state)
+{
+	struct drm_gem_cma_object *obj;
+	struct malidp_plane *mp;
+	const struct malidp_hw_regmap *map;
+	u8 format_id;
+	u16 ptr;
+	u32 format, src_w, src_h, dest_w, dest_h, val =3D 0;
+	int num_planes, i;
+
+	if (!plane->state->crtc || !plane->state->fb)
+		return;
+
+	mp =3D to_malidp_plane(plane);
+
+#ifdef MALIDP_ENABLE_BGND_COLOR_AS_PRIMARY_PLANE
+	/* skip the primary plane, it is using the background color */
+	if (!mp->layer || !mp->layer->id)
+		return;
+#endif
+
+	map =3D &mp->hwdev->map;
+	format =3D plane->state->fb->pixel_format;
+	format_id =3D malidp_hw_get_format_id(map, mp->layer->id, format);
+	if (format_id =3D=3D (u8)-1)
+		return;
+
+	num_planes =3D drm_format_num_planes(format);
+
+	/* convert src values from Q16 fixed point to integer */
+	src_w =3D plane->state->src_w >> 16;
+	src_h =3D plane->state->src_h >> 16;
+	if (plane->state->rotation & MALIDP_ROTATED_MASK) {
+		dest_w =3D plane->state->crtc_h;
+		dest_h =3D plane->state->crtc_w;
+	} else {
+		dest_w =3D plane->state->crtc_w;
+		dest_h =3D plane->state->crtc_h;
+	}
+	DRM_DEBUG_DRIVER("src_w =3D %d, src_h =3D %d, dest_w =3D %d, dest_h =3D=
 %d\n",
+			 src_w, src_h, dest_w, dest_h);
+
+	malidp_hw_write(mp->hwdev, format_id, mp->layer->base);
+
+	for (i =3D 0; i < num_planes; i++) {
+		/* calculate the offset for the layer's plane registers */
+		ptr =3D mp->layer->ptr + (i << 4);
+
+		obj =3D drm_fb_cma_get_gem_obj(plane->state->fb, i);
+		malidp_hw_write(mp->hwdev, lower_32_bits(obj->paddr), ptr);
+		malidp_hw_write(mp->hwdev, upper_32_bits(obj->paddr), ptr + 4);
+		malidp_hw_write(mp->hwdev, plane->state->fb->pitches[i],
+				mp->layer->base + MALIDP_LAYER_STRIDE);
+	}
+
+	malidp_hw_write(mp->hwdev, LAYER_H_VAL(src_w) | LAYER_V_VAL(src_h),
+			mp->layer->base + MALIDP_LAYER_SIZE);
+
+	malidp_hw_write(mp->hwdev, LAYER_H_VAL(dest_w) | LAYER_V_VAL(dest_h),
+			mp->layer->base + MALIDP_LAYER_COMP_SIZE);
+
+	malidp_hw_write(mp->hwdev, LAYER_H_VAL(plane->state->crtc_x) |
+			LAYER_V_VAL(plane->state->crtc_y),
+			mp->layer->base + MALIDP_LAYER_OFFSET);
+
+	/* first clear the rotation bits in the register */
+	malidp_hw_clearbits(mp->hwdev, LAYER_ROT_MASK,
+			    mp->layer->base + MALIDP_LAYER_CONTROL);
+
+	/* setup the rotation and axis flip bits */
+	if (plane->state->rotation & DRM_ROTATE_MASK)
+		val =3D ilog2(plane->state->rotation & DRM_ROTATE_MASK) << LAYER_ROT=
_OFFSET;
+	if (plane->state->rotation & BIT(DRM_REFLECT_X))
+		val |=3D LAYER_V_FLIP;
+	if (plane->state->rotation & BIT(DRM_REFLECT_Y))
+		val |=3D LAYER_H_FLIP;
+
+	/* set the 'enable layer' bit */
+	val |=3D LAYER_ENABLE;
+
+	malidp_hw_setbits(mp->hwdev, val,
+			  mp->layer->base + MALIDP_LAYER_CONTROL);
+}
+
+static void malidp_de_plane_disable(struct drm_plane *plane,
+				    struct drm_plane_state *state)
+{
+	struct malidp_plane *mp =3D to_malidp_plane(plane);
+
+	/* ToDo: figure out the attached framebuffer lifecycle */
+	malidp_hw_clearbits(mp->hwdev, LAYER_ENABLE,
+			    mp->layer->base + MALIDP_LAYER_CONTROL);
+}
+
+static const struct drm_plane_helper_funcs malidp_de_plane_helper_func=
s =3D {
+	.prepare_fb =3D NULL,
+	.cleanup_fb =3D NULL,
+	.atomic_check =3D malidp_de_plane_check,
+	.atomic_update =3D malidp_de_plane_update,
+	.atomic_disable =3D malidp_de_plane_disable,
+};
+
+#ifdef MALIDP_ENABLE_BGND_COLOR_AS_PRIMARY_PLANE
+static const uint32_t safe_modeset_formats[] =3D {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+};
+
+static int malidp_de_create_primary_plane(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	struct malidp_plane *plane;
+	int ret;
+
+	plane =3D devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
+	if (!plane)
+		return -ENOMEM;
+
+	ret =3D drm_universal_plane_init(drm, &plane->base, 0,
+				       &malidp_de_plane_funcs,
+				       safe_modeset_formats,
+				       ARRAY_SIZE(safe_modeset_formats),
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+
+	drm_plane_helper_add(&plane->base, &malidp_de_plane_helper_funcs);
+	plane->hwdev =3D malidp->dev;
+
+	return 0;
+}
+#endif
+
+int malidp_de_planes_init(struct drm_device *drm)
+{
+	struct malidp_drm *malidp =3D drm->dev_private;
+	const struct malidp_hw_regmap *map =3D &malidp->dev->map;
+	struct malidp_plane *plane =3D NULL;
+	enum drm_plane_type plane_type;
+	unsigned long crtcs =3D 1 << drm->mode_config.num_crtc;
+	u32 *formats;
+	int ret, i, j, n;
+
+#ifdef MALIDP_ENABLE_BGND_COLOR_AS_PRIMARY_PLANE
+	ret =3D malidp_de_create_primary_plane(drm);
+	if (ret)
+		return ret;
+	plane_type =3D DRM_PLANE_TYPE_OVERLAY;
+#endif
+
+	formats =3D kcalloc(map->n_input_formats, sizeof(*formats), GFP_KERNE=
L);
+	if (!formats) {
+		ret =3D -ENOMEM;
+		goto cleanup;
+	}
+
+	for (i =3D 0; i < map->n_layers; i++) {
+		u8 id =3D map->layers[i].id;
+
+		plane =3D devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
+		if (!plane) {
+			ret =3D -ENOMEM;
+			goto cleanup;
+		}
+
+		/* build the list of DRM supported formats based on the map */
+		for (n =3D 0, j =3D 0;  j < map->n_input_formats; j++) {
+			if ((map->input_formats[j].layer & id) =3D=3D id)
+				formats[n++] =3D map->input_formats[j].format;
+		}
+
+#ifndef MALIDP_ENABLE_BGND_COLOR_AS_PRIMARY_PLANE
+		plane_type =3D (i =3D=3D 0) ? DRM_PLANE_TYPE_PRIMARY :
+					DRM_PLANE_TYPE_OVERLAY;
+#endif
+		ret =3D drm_universal_plane_init(drm, &plane->base, crtcs,
+					       &malidp_de_plane_funcs, formats,
+					       n, plane_type, NULL);
+		if (ret < 0)
+			goto cleanup;
+
+		if (!drm->mode_config.rotation_property) {
+			unsigned long flags =3D BIT(DRM_ROTATE_0) |
+					      BIT(DRM_ROTATE_90) |
+					      BIT(DRM_ROTATE_180) |
+					      BIT(DRM_ROTATE_270) |
+					      BIT(DRM_REFLECT_X) |
+					      BIT(DRM_REFLECT_Y);
+			drm->mode_config.rotation_property =3D
+				drm_mode_create_rotation_property(drm, flags);
+		}
+		if (drm->mode_config.rotation_property)
+			drm_object_attach_property(&plane->base.base,
+						   drm->mode_config.rotation_property,
+						   BIT(DRM_ROTATE_0));
+
+		drm_plane_helper_add(&plane->base,
+				     &malidp_de_plane_helper_funcs);
+		plane->hwdev =3D malidp->dev;
+		plane->layer =3D &map->layers[i];
+	}
+
+	kfree(formats);
+
+	return 0;
+
+cleanup:
+	malidp_de_planes_destroy(drm);
+	kfree(formats);
+
+	return ret;
+}
+
+void malidp_de_planes_destroy(struct drm_device *drm)
+{
+	struct drm_plane *p, *pt;
+
+	list_for_each_entry_safe(p, pt, &drm->mode_config.plane_list, head) {
+		drm_plane_cleanup(p);
+	}
+}
diff --git a/drivers/gpu/drm/arm/malidp_regs.h b/drivers/gpu/drm/arm/ma=
lidp_regs.h
new file mode 100644
index 0000000..73fecb3
--- /dev/null
+++ b/drivers/gpu/drm/arm/malidp_regs.h
@@ -0,0 +1,172 @@
+/*
+ * (C) COPYRIGHT 2016 ARM Limited. All rights reserved.
+ * Author: Liviu Dudau <Liviu.Dudau@arm.com>
+ *
+ * This program is free software and is provided to you under the term=
s of the
+ * GNU General Public License version 2 as published by the Free Softw=
are
+ * Foundation, and any use by you of this program is subject to the te=
rms
+ * of such GNU licence.
+ *
+ * ARM Mali DP500/DP550/DP650 registers definition.
+ */
+
+#ifndef __MALIDP_REGS_H__
+#define __MALIDP_REGS_H__
+
+/*
+ * abbreviations used:
+ *    - DC - display core (general settings)
+ *    - DE - display engine
+ *    - SE - scaling engine
+ */
+
+/* interrupt bit masks */
+#define MALIDP_DE_IRQ_UNDERRUN			(1 << 0)
+
+#define MALIDP500_DE_IRQ_AXI_ERR		(1 << 4)
+#define MALIDP500_DE_IRQ_VSYNC			(1 << 5)
+#define MALIDP500_DE_IRQ_PROG_LINE		(1 << 6)
+#define MALIDP500_DE_IRQ_SATURATION		(1 << 7)
+#define MALIDP500_DE_IRQ_CONF_VALID		(1 << 8)
+#define MALIDP500_DE_IRQ_CONF_MODE		(1 << 11)
+#define MALIDP500_DE_IRQ_CONF_ACTIVE		(1 << 17)
+#define MALIDP500_DE_IRQ_PM_ACTIVE		(1 << 18)
+#define MALIDP500_DE_IRQ_TESTMODE_ACTIVE	(1 << 19)
+#define MALIDP500_DE_IRQ_FORCE_BLNK_ACTIVE	(1 << 24)
+#define MALIDP500_DE_IRQ_AXI_BUSY		(1 << 28)
+#define MALIDP500_DE_IRQ_GLOBAL			(1 << 31)
+#define MALIDP500_SE_IRQ_CONF_MODE		(1 << 0)
+#define MALIDP500_SE_IRQ_CONF_VALID		(1 << 4)
+#define MALIDP500_SE_IRQ_INIT_BUSY		(1 << 5)
+#define MALIDP500_SE_IRQ_AXI_ERROR		(1 << 8)
+#define MALIDP500_SE_IRQ_OVERRUN		(1 << 9)
+#define MALIDP500_SE_IRQ_PROG_LINE1		(1 << 12)
+#define MALIDP500_SE_IRQ_PROG_LINE2		(1 << 13)
+#define MALIDP500_SE_IRQ_CONF_ACTIVE		(1 << 17)
+#define MALIDP500_SE_IRQ_PM_ACTIVE		(1 << 18)
+#define MALIDP500_SE_IRQ_AXI_BUSY		(1 << 28)
+#define MALIDP500_SE_IRQ_GLOBAL			(1 << 31)
+
+#define MALIDP550_DE_IRQ_SATURATION		(1 << 8)
+#define MALIDP550_DE_IRQ_VSYNC			(1 << 12)
+#define MALIDP550_DE_IRQ_PROG_LINE		(1 << 13)
+#define MALIDP550_DE_IRQ_AXI_ERR		(1 << 16)
+#define MALIDP550_SE_IRQ_EOW			(1 << 0)
+#define MALIDP550_SE_IRQ_AXI_ERR		(1 << 16)
+#define MALIDP550_DC_IRQ_CONF_VALID		(1 << 0)
+#define MALIDP550_DC_IRQ_CONF_MODE		(1 << 4)
+#define MALIDP550_DC_IRQ_CONF_ACTIVE		(1 << 16)
+#define MALIDP550_DC_IRQ_DE			(1 << 20)
+#define MALIDP550_DC_IRQ_SE			(1 << 24)
+
+#define MALIDP650_DE_IRQ_DRIFT			(1 << 4)
+
+/* bit masks that are common between products */
+#define   MALIDP_CFG_VALID		(1 << 0)
+#define   MALIDP_DISP_FUNC_ILACED	(1 << 8)
+
+/* register offsets for IRQ management */
+#define MALIDP_REG_STATUS		0x00000
+#define MALIDP_REG_SETIRQ		0x00004
+#define MALIDP_REG_MASKIRQ		0x00008
+#define MALIDP_REG_CLEARIRQ		0x0000c
+
+/* register offsets */
+#define MALIDP_DE_CORE_ID		0x00018
+#define MALIDP_DE_DISPLAY_FUNC		0x00020
+
+/* these offsets are relative to MALIDP5x0_TIMINGS_BASE */
+#define MALIDP_DE_H_TIMINGS		0x0
+#define MALIDP_DE_V_TIMINGS		0x4
+#define MALIDP_DE_SYNC_WIDTH		0x8
+#define MALIDP_DE_HV_ACTIVE		0xc
+
+/* macros to set values into registers */
+#define MALIDP_DE_H_FRONTPORCH(x)	(((x) & 0xfff) << 0)
+#define MALIDP_DE_H_BACKPORCH(x)	(((x) & 0x3ff) << 16)
+#define MALIDP500_DE_V_FRONTPORCH(x)	(((x) & 0xff) << 0)
+#define MALIDP550_DE_V_FRONTPORCH(x)	(((x) & 0xfff) << 0)
+#define MALIDP_DE_V_BACKPORCH(x)	(((x) & 0xff) << 16)
+#define MALIDP_DE_H_SYNCWIDTH(x)	(((x) & 0x3ff) << 0)
+#define MALIDP_DE_V_SYNCWIDTH(x)	(((x) & 0xff) << 16)
+#define MALIDP_DE_H_ACTIVE(x)		(((x) & 0x1fff) << 0)
+#define MALIDP_DE_V_ACTIVE(x)		(((x) & 0x1fff) << 16)
+
+/* register offsets and bits specific to DP500 */
+#define MALIDP500_DC_BASE		0x00000
+#define MALIDP500_DC_CONTROL		0x0000c
+#define   MALIDP500_DC_CONFIG_REQ	(1 << 17)
+#define   MALIDP500_HSYNCPOL		(1 << 20)
+#define   MALIDP500_VSYNCPOL		(1 << 21)
+#define   MALIDP500_DC_CLEAR_MASK	0x300fff
+#define MALIDP500_DE_LINE_COUNTER	0x00010
+#define MALIDP500_DE_AXI_CONTROL	0x00014
+#define MALIDP500_DE_SECURE_CTRL	0x0001c
+#define MALIDP500_DE_CHROMA_KEY		0x00024
+#define MALIDP500_TIMINGS_BASE		0x00028
+
+#define MALIDP500_CONFIG_3D		0x00038
+#define MALIDP500_BGND_COLOR		0x0003c
+#define MALIDP500_OUTPUT_DEPTH		0x00044
+#define MALIDP500_YUV_RGB_COEF		0x00048
+#define MALIDP500_COLOR_ADJ_COEF	0x00078
+#define MALIDP500_COEF_TABLE_ADDR	0x000a8
+#define MALIDP500_COEF_TABLE_DATA	0x000ac
+#define MALIDP500_DE_LV_BASE		0x00100
+#define MALIDP500_DE_LV_PTR_BASE	0x00124
+#define MALIDP500_DE_LG1_BASE		0x00200
+#define MALIDP500_DE_LG1_PTR_BASE	0x0021c
+#define MALIDP500_DE_LG2_BASE		0x00300
+#define MALIDP500_DE_LG2_PTR_BASE	0x0031c
+#define MALIDP500_SE_BASE		0x00c00
+#define MALIDP500_SE_PTR_BASE		0x00e0c
+#define MALIDP500_DC_IRQ_BASE		0x00f00
+#define MALIDP500_CONFIG_VALID		0x00f00
+#define MALIDP500_CONFIG_ID		0x00fd4
+
+/* register offsets and bits specific to DP550/DP650 */
+#define MALIDP550_DE_CONTROL		0x00010
+#define MALIDP550_DE_LINE_COUNTER	0x00014
+#define MALIDP550_DE_AXI_CONTROL	0x00018
+#define MALIDP550_DE_QOS		0x0001c
+#define MALIDP550_TIMINGS_BASE		0x00030
+#define MALIDP550_HSYNCPOL		(1 << 12)
+#define MALIDP550_VSYNCPOL		(1 << 28)
+
+#define MALIDP550_DE_DISP_SIDEBAND	0x00040
+#define MALIDP550_DE_BGND_COLOR		0x00044
+#define MALIDP550_DE_OUTPUT_DEPTH	0x0004c
+#define MALIDP550_DE_COLOR_COEF		0x00050
+#define MALIDP550_DE_COEF_TABLE_ADDR	0x00080
+#define MALIDP550_DE_COEF_TABLE_DATA	0x00084
+#define MALIDP550_DE_LV1_BASE		0x00100
+#define MALIDP550_DE_LV1_PTR_BASE	0x00124
+#define MALIDP550_DE_LV2_BASE		0x00200
+#define MALIDP550_DE_LV2_PTR_BASE	0x00224
+#define MALIDP550_DE_LG_BASE		0x00300
+#define MALIDP550_DE_LG_PTR_BASE	0x0031c
+#define MALIDP550_DE_LS_BASE		0x00400
+#define MALIDP550_DE_LS_PTR_BASE	0x0042c
+#define MALIDP550_DE_PERF_BASE		0x00500
+#define MALIDP550_SE_BASE		0x08000
+#define MALIDP550_DC_BASE		0x0c000
+#define MALIDP550_DC_CONTROL		0x0c010
+#define   MALIDP550_DC_CONFIG_REQ	(1 << 16)
+#define MALIDP550_CONFIG_VALID		0x0c014
+#define MALIDP550_CONFIG_ID		0x0ffd4
+
+/*
+ * Starting with DP550 the register map blocks has been standardised t=
o the
+ * following layout:
+ *
+ *   Offset            Block registers
+ *  0x00000            Display Engine
+ *  0x08000            Scaling Engine
+ *  0x0c000            Display Core
+ *  0x10000            Secure control
+ *
+ * The old DP500 IP mixes some DC with the DE registers, hence the nee=
d
+ * for a mapping structure.
+ */
+
+#endif /* __MALIDP_REGS_H__ */
--=20
2.7.1
