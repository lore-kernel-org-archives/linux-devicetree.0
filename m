From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] drivers: of/base: move of_init to driver_init
Date: Thu, 14 May 2015 14:54:11 +0100
Message-ID: <5554A903.8040605@arm.com>
References: <1431595695-17103-1-git-send-email-sudeep.holla@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431595695-17103-1-git-send-email-sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 14/05/15 10:28, Sudeep Holla wrote:
> Commit 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> devices with an OF node") adds the symlink `of_node` for each device
> pointing to it's device tree node while creating/initialising it.
>
> However the devicetree sysfs is created and setup in of_init which is
> executed at core_initcall level. For all the devices created before
> of_init, the following error is thrown:
> 	"Error -2(-ENOENT) creating of_node link"
>
> Like many other components in driver model, initialize the sysfs support
> for OF/devicetree from driver_init so that it's ready before any devices
> are created.
>
> Fixes: 5590f3196b29 ("drivers/core/of: Add symlink to device-tree from
> 	devices with an OF node")
> Suggested-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> ---
>   drivers/base/init.c | 2 ++
>   drivers/of/base.c   | 8 +++-----
>   include/linux/of.h  | 6 ++++++
>   3 files changed, 11 insertions(+), 5 deletions(-)
>

Looks like we still have conflict even though the one I pointed was in
bootwrapper. Kbuilder reported the following build error:

drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c:45:1: error: 
conflicting types for 'of_init'
  of_init(struct nvkm_bios *bios, const char *name)
  ^
In file included from arch/powerpc/include/asm/prom.h:23:0,
       from arch/powerpc/include/asm/pci.h:20,
       from include/linux/pci.h:1460,
       from drivers/gpu/drm/nouveau/include/nvif/os.h:7,
       from drivers/gpu/drm/nouveau/include/nvkm/core/os.h:3,
       from drivers/gpu/drm/nouveau/include/nvkm/core/object.h:3,
       from drivers/gpu/drm/nouveau/include/nvkm/core/subdev.h:3,
       from drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h:3,
       from drivers/gpu/drm/nouveau/nvkm/subdev/bios/priv.h:3,
       from drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c:23:
include/linux/of.h:124:6: note: previous declaration of 'of_init' was here
  void of_init(void);
       ^
Sorry I couldn't catch this with any ppc defconfigs. Please ignore this
version, will repost updated one soon renaming to of_core_init
as initially discussed.

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
