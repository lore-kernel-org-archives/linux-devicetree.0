From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH v7] usb: chipidea: permit driver bindings pass phy pointer
Date: Mon, 25 Jun 2012 11:07:02 +0800
Message-ID: <20120625030701.GB4384@b20223-02.ap.freescale.net>
References: <4FE2CABE.7050708@pengutronix.de>
 <1340268682-14654-1-git-send-email-richard.zhao@freescale.com>
 <4FE3874C.2040504@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE3874C.2040504-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 21, 2012 at 10:42:52PM +0200, Marc Kleine-Budde wrote:
> On 06/21/2012 10:51 AM, Richard Zhao wrote:
> > Sometimes, the driver bindings may know what phy they use.
> > For example, when using device tree, the usb controller may have a
> > phandler pointing to usb phy.
> 
> Remove the module doesn't remove the platform device. A subsequent modprobe fails with:
> 
> ------------[ cut here ]------------
> WARNING: at fs/sysfs/dir.c:529 sysfs_add_one+0x8c/0xbc()
> sysfs: cannot create duplicate filename '/devices/80080000.ahb/80080000.usb/ci_hdrc.0'
> Modules linked in: ci13xxx_imx(+) ci_hdrc udc_core [last unloaded: ci13xxx_imx]
> [<c000e6c8>] (unwind_backtrace+0x0/0xf0) from [<c0015c70>] (warn_slowpath_common+0x4c/0x64)
> [<c0015c70>] (warn_slowpath_common+0x4c/0x64) from [<c0015d1c>] (warn_slowpath_fmt+0x30/0x40)
> [<c0015d1c>] (warn_slowpath_fmt+0x30/0x40) from [<c00dbbbc>] (sysfs_add_one+0x8c/0xbc)
> [<c00dbbbc>] (sysfs_add_one+0x8c/0xbc) from [<c00dbd2c>] (create_dir+0x60/0xc0)
> [<c00dbd2c>] (create_dir+0x60/0xc0) from [<c00dc08c>] (sysfs_create_dir+0x64/0xa8)
> [<c00dc08c>] (sysfs_create_dir+0x64/0xa8) from [<c0151f28>] (kobject_add_internal+0xa4/0x1e8)
> [<c0151f28>] (kobject_add_internal+0xa4/0x1e8) from [<c0152434>] (kobject_add+0x50/0x98)
> [<c0152434>] (kobject_add+0x50/0x98) from [<c0187fe4>] (device_add+0xb8/0x358)
> [<c0187fe4>] (device_add+0xb8/0x358) from [<c018b76c>] (platform_device_add+0xf8/0x1a0)
> [<c018b76c>] (platform_device_add+0xf8/0x1a0) from [<bf006250>] (ci13xxx_add_device+0xd4/0x114 [ci_hdrc])
> [<bf006250>] (ci13xxx_add_device+0xd4/0x114 [ci_hdrc]) from [<bf022264>] (ci13xxx_imx_probe+0x1e0/0x288 [ci13xxx_imx])
> [<bf022264>] (ci13xxx_imx_probe+0x1e0/0x288 [ci13xxx_imx]) from [<c018b378>] (platform_drv_probe+0x14/0x18)
> [<c018b378>] (platform_drv_probe+0x14/0x18) from [<c018a230>] (really_probe+0x68/0x1e0)
> [<c018a230>] (really_probe+0x68/0x1e0) from [<c018a530>] (__driver_attach+0x8c/0x90)
> [<c018a530>] (__driver_attach+0x8c/0x90) from [<c0188c0c>] (bus_for_each_dev+0x54/0x7c)
> [<c0188c0c>] (bus_for_each_dev+0x54/0x7c) from [<c0189b74>] (bus_add_driver+0x17c/0x248)
> [<c0189b74>] (bus_add_driver+0x17c/0x248) from [<c018a7e4>] (driver_register+0x78/0x12c)
> [<c018a7e4>] (driver_register+0x78/0x12c) from [<c00086c4>] (do_one_initcall+0x30/0x168)
> [<c00086c4>] (do_one_initcall+0x30/0x168) from [<c004c824>] (sys_init_module+0x74/0x198)
> [<c004c824>] (sys_init_module+0x74/0x198) from [<c0009260>] (ret_fast_syscall+0x0/0x2c)
> ---[ end trace e152599aa12f31d8 ]---
> ------------[ cut here ]------------
> WARNING: at lib/kobject.c:196 kobject_add_internal+0x1cc/0x1e8()
> kobject_add_internal failed for ci_hdrc.0 with -EEXIST, don't try to register things with the same name in the same directory.
> Modules linked in: ci13xxx_imx(+) ci_hdrc udc_core [last unloaded: ci13xxx_imx]
> [<c000e6c8>] (unwind_backtrace+0x0/0xf0) from [<c0015c70>] (warn_slowpath_common+0x4c/0x64)
> [<c0015c70>] (warn_slowpath_common+0x4c/0x64) from [<c0015d1c>] (warn_slowpath_fmt+0x30/0x40)
> [<c0015d1c>] (warn_slowpath_fmt+0x30/0x40) from [<c0152050>] (kobject_add_internal+0x1cc/0x1e8)
> [<c0152050>] (kobject_add_internal+0x1cc/0x1e8) from [<c0152434>] (kobject_add+0x50/0x98)
> [<c0152434>] (kobject_add+0x50/0x98) from [<c0187fe4>] (device_add+0xb8/0x358)
> [<c0187fe4>] (device_add+0xb8/0x358) from [<c018b76c>] (platform_device_add+0xf8/0x1a0)
> [<c018b76c>] (platform_device_add+0xf8/0x1a0) from [<bf006250>] (ci13xxx_add_device+0xd4/0x114 [ci_hdrc])
> [<bf006250>] (ci13xxx_add_device+0xd4/0x114 [ci_hdrc]) from [<bf022264>] (ci13xxx_imx_probe+0x1e0/0x288 [ci13xxx_imx])
> [<bf022264>] (ci13xxx_imx_probe+0x1e0/0x288 [ci13xxx_imx]) from [<c018b378>] (platform_drv_probe+0x14/0x18)
> [<c018b378>] (platform_drv_probe+0x14/0x18) from [<c018a230>] (really_probe+0x68/0x1e0)
> [<c018a230>] (really_probe+0x68/0x1e0) from [<c018a530>] (__driver_attach+0x8c/0x90)
> [<c018a530>] (__driver_attach+0x8c/0x90) from [<c0188c0c>] (bus_for_each_dev+0x54/0x7c)
> [<c0188c0c>] (bus_for_each_dev+0x54/0x7c) from [<c0189b74>] (bus_add_driver+0x17c/0x248)
> [<c0189b74>] (bus_add_driver+0x17c/0x248) from [<c018a7e4>] (driver_register+0x78/0x12c)
> [<c018a7e4>] (driver_register+0x78/0x12c) from [<c00086c4>] (do_one_initcall+0x30/0x168)
> [<c00086c4>] (do_one_initcall+0x30/0x168) from [<c004c824>] (sys_init_module+0x74/0x198)
> [<c004c824>] (sys_init_module+0x74/0x198) from [<c0009260>] (ret_fast_syscall+0x0/0x2c)
> ---[ end trace e152599aa12f31d9 ]---
> imx_usb 80080000.usb: Can't register ci_hdrc platform device, err=-17
> imx_usb: probe of 80080000.usb failed with error -17
It's caused by Patch #7 .
Thanks very much.

Richard
> 
> Marc
> 
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |
> 



--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
