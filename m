From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/4] soc: Amlogic: Add secure monitor driver
Date: Mon, 23 May 2016 13:43:58 +0200
Message-ID: <20160523114358.GC17269@mephisto>
References: <1463583382-15614-1-git-send-email-carlo@caione.org>
 <1463583382-15614-2-git-send-email-carlo@caione.org>
 <5742EBC4.3050704@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5742EBC4.3050704-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, jens.wiklander-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 23/05/16 13:38, Matthias Brugger wrote:
> 

[...]
> >+#include <stdarg.h>
> >+#include <asm/cacheflush.h>
> >+#include <asm/compiler.h>
> >+#include <linux/arm-smccc.h>
> >+#include <linux/io.h>
> >+#include <linux/ioport.h>
> >+#include <linux/module.h>
> >+#include <linux/platform_device.h>
> >+#include <linux/of.h>
> >+#include <linux/smp.h>
> >+
> >+#include <linux/soc/meson/meson_sm.h>
> >+
> >+#define SM_MEM_SIZE	0x1000
> >+
> >+/*
> >+ * To read from / write to the secure monitor we use two bounce buffers. The
> >+ * physical addresses of the two buffers are obtained by querying the secure
> >+ * monitor itself.
> >+ */
> >+
> >+static u32 sm_phy_in_base;
> >+static u32 sm_phy_out_base;
> 
> You can put this two variable in meson_sm_probe, right?

Yeah, actually no need to be there.

> >+
> >+static void __iomem *sm_sharemem_in_base;
> >+static void __iomem *sm_sharemem_out_base;
> >+
> >+struct meson_sm_data {
> >+	u32 cmd;
> >+	u32 arg0;
> >+	u32 arg1;
> >+	u32 arg2;
> >+	u32 arg3;
> >+	u32 arg4;
> >+	u32 ret;
> >+};
> >+
> >+static void __meson_sm_call(void *info)
> >+{
> >+	struct meson_sm_data *data = info;
> >+	struct arm_smccc_res res;
> >+
> >+	arm_smccc_smc(data->cmd,
> >+		      data->arg0, data->arg1, data->arg2,
> >+		      data->arg3, data->arg4, 0, 0, &res);
> >+	data->ret = res.a0;
> >+}
> >+
> >+u32 meson_sm_call(u32 cmd, u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> 
> Can the function be static or will it be called from another driver?

It _can_ be called from another driver. It depends on the SMC used, so
better making it available.

> 
> >+{
> >+	struct meson_sm_data data;
> >+
> >+	data.cmd = cmd;
> >+	data.arg0 = arg0;
> >+	data.arg1 = arg1;
> >+	data.arg2 = arg2;
> >+	data.arg3 = arg3;
> >+	data.arg4 = arg4;
> >+	data.ret = 0;
> >+
> >+	__meson_sm_call(&data);
> >+
> >+	return data.ret;
> >+}
> >+
> >+u32 meson_sm_call_read(void *buffer, u32 cmd, u32 arg0, u32 arg1,
> >+		       u32 arg2, u32 arg3, u32 arg4)
> >+{
> >+	u32 size;
> >+
> >+	size = meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);
> >+
> >+	if (!size || size > SM_MEM_SIZE)
> >+		return -EINVAL;
> >+
> >+	memcpy(buffer, sm_sharemem_out_base, size);
> >+	return size;
> >+}
> 
> This function will be needed to be exported to be callable from modules.

Fix in v3.

> >+
> >+u32 meson_sm_call_write(void *buffer, unsigned int b_size, u32 cmd, u32 arg0,
> >+			u32 arg1, u32 arg2, u32 arg3, u32 arg4)
> >+{
> >+	u32 size;
> >+
> >+	if (b_size > SM_MEM_SIZE)
> >+		return -EINVAL;
> >+
> >+	memcpy(sm_sharemem_in_base, buffer, b_size);
> >+
> >+	size = meson_sm_call(cmd, arg0, arg1, arg2, arg3, arg4);
> >+
> >+	if (!size)
> >+		return -EINVAL;
> >+
> >+	return size;
> >+}
> >+
> 
> Same here.

Thanks.

Cheers,

-- 
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
