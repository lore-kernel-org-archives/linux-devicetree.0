From: Sinan Kaya <okaya-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH V14 8/9] vfio, platform: add support for ACPI while
 detecting the reset driver
Date: Mon, 7 Mar 2016 10:30:06 -0500
Message-ID: <56DD9E7E.6000406@codeaurora.org>
References: <1454646882-24369-1-git-send-email-okaya@codeaurora.org>
 <1454646882-24369-9-git-send-email-okaya@codeaurora.org>
 <56D08843.5020306@linaro.org> <56D7323B.4040100@codeaurora.org>
 <56D8C539.9000203@linaro.org> <56D91B0E.1080203@codeaurora.org>
 <56DCFEE0.6080101@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DCFEE0.6080101-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Auger <eric.auger-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, timur-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, cov-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: shankerd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, vikrams-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 3/6/2016 11:09 PM, Eric Auger wrote:
>> #define module_vfio_reset_handler(compat, acpihid, reset)		\
>> > MODULE_ALIAS("vfio-reset:" acpihid? acpihid: compat);			\
>> > 
>> > This way, we'll create an alias with one of the provided strings.  
> What if you want to use vfio platform driver for HiDMA in dt mode? the
> HiDma reset module advertises both acpihid and dt compat support but an
> alias module will be created only for acpihid. Then I think we will not
> be able to load the reset module in dt mode with existing code.
> 

Right, it won't work. Now that we know what MODULE_ALIAS does, there is no
harm in doing this. I think we should do this.

#define module_vfio_reset_handler(compat, acpihid, reset)              \
MODULE_ALIAS("vfio-reset:" compat);                                    \
MODULE_ALIAS("vfio-reset:" acpihid);                                   \

If we prefer ACPI over DT, there is no guarantee that somebody can boot DT
kernel with ACPI kernel compilation option enabled.

If one of these are null, then the module alias will be "vfio-reset:"

Of course to make things prettier, we could use "NOT SUPPORTED" as a string
instead of NULL. then, the module alias will be vfio-reset: NOT SUPPORTED".

We could go one step further, and do.

#define module_vfio_reset_handler(compat, acpihid, reset) \
MODULE_ALIAS("vfio-reset: dt: " compat); \
MODULE_ALIAS("vfio-reset: acpi: " acpihid); \

and change the code below for this too.


> This could work however with some rework in vfio_platform_common.c. In
> vfio_platform_get_reset we should try to load the module using the
> acpihid if the module load using compat alias fails. In the look-up
> table we can find the acpihid corresponding to the dt compat.

I was planning to submit this for the next review. Still, I don't want to 
assume that acpihid is the only working option. Somebody can boot DT kernel.

diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
index 42d7545..ba585ad 100644
--- a/drivers/vfio/platform/vfio_platform_common.c
+++ b/drivers/vfio/platform/vfio_platform_common.c
@@ -58,16 +58,30 @@ static vfio_platform_reset_fn_t vfio_platform_lookup_reset(const char *compat,
 	return reset_fn;
 }
 
-static void vfio_platform_get_reset(struct vfio_platform_device *vdev)
+static int vfio_platform_get_reset(struct vfio_platform_device *vdev)
 {
+	int rc;
+
 	vdev->reset = vfio_platform_lookup_reset(vdev->compat, vdev->acpihid,
 						 &vdev->reset_module);
-	if (!vdev->reset) {
-		request_module("vfio-reset:%s", vdev->compat);
-		vdev->reset = vfio_platform_lookup_reset(vdev->compat,
-							 vdev->acpihid,
-							 &vdev->reset_module);
-	}
+	if (vdev->reset)
+		return 0;
+
+	if (vdev->acpihid)
+		rc = request_module("vfio-reset:%s", vdev->acpihid);
+
+	if (rc && vdev->compat)
+		rc = request_module("vfio-reset:%s", vdev->compat);
+
+	if (rc)
+		return rc;
+
+	vdev->reset = vfio_platform_lookup_reset(vdev->compat, vdev->acpihid,
+						 &vdev->reset_module);
+	if (vdev->reset)
+		return 0;
+
+	return -ENODEV;
 }
 
 static void vfio_platform_put_reset(struct vfio_platform_device *vdev)
@@ -620,7 +634,11 @@ int vfio_platform_probe_common(struct vfio_platform_device *vdev,
 		return ret;
 	}
 
-	vfio_platform_get_reset(vdev);
+	ret = vfio_platform_get_reset(vdev);
+	if (ret) {
+		iommu_group_put(group);
+		return ret;
+	}
 
 	mutex_init(&vdev->igate);
  

Let me know what you think.


-- 
Sinan Kaya
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
