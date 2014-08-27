From: atull <atull@opensource.altera.com>
Subject: Re: [PATCH 3/3] GPIO: gpio-dwapb: Suspend & Resume PM enabling
Date: Wed, 27 Aug 2014 11:15:04 -0500
Message-ID: <alpine.DEB.2.02.1408271103120.11131@atx-linux-37>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com> <1409161588-19417-4-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1409161588-19417-4-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Mika Westerberg <mika.westerberg@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>, yvanderv@opensource.altera.com, dinguyen@opensource.altera.com
List-Id: devicetree@vger.kernel.org

On Wed, 27 Aug 2014, Weike Chen wrote:

> This patch enables suspend and resume mode for the power management, and
> it is based on Josef Ahmad's previous work.
> 
> Reviewed-by: Hock Leong Kweh <hock.leong.kweh@intel.com>
> Reviewed-by: Shevchenko, Andriy <andriy.shevchenko@intel.com>
> Signed-off-by: Weike Chen <alvin.chen@intel.com>
> ---
>  drivers/gpio/gpio-dwapb.c |   67 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 

Hi Weike,

I tried out these patches on the current master branch (v3.17-rc2-9-g68e3702) with a socfpga cyclone5 board.

If I apply all 3 patches, the kernel doesn't boot.

If I rebuild with only the first patch, I get only one gpio block showing up (should
have 3 for this board) and these messages:

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at /home/atull/repos/linux-socfpga/fs/sysfs/dir.c:31 sysfs_warn_dup+0x58/0x74()
sysfs: cannot create duplicate filename '/class/gpio/gpiochip0'
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.17.0-rc2-00012-g7ad6a41 #1
[<c0014ab4>] (unwind_backtrace) from [<c0011684>] (show_stack+0x10/0x14)
[<c0011684>] (show_stack) from [<c03d3d80>] (dump_stack+0x74/0x90)
[<c03d3d80>] (dump_stack) from [<c0020c88>] (warn_slowpath_common+0x68/0x8c)
[<c0020c88>] (warn_slowpath_common) from [<c0020d40>] (warn_slowpath_fmt+0x30/0x40)
[<c0020d40>] (warn_slowpath_fmt) from [<c0144e5c>] (sysfs_warn_dup+0x58/0x74)
[<c0144e5c>] (sysfs_warn_dup) from [<c0145180>] (sysfs_do_create_link_sd+0xbc/0xc4)
[<c0145180>] (sysfs_do_create_link_sd) from [<c02357f4>] (device_add+0x304/0x4ec)
[<c02357f4>] (device_add) from [<c0235a78>] (device_create_groups_vargs+0x9c/0xcc)
[<c0235a78>] (device_create_groups_vargs) from [<c0235af4>] (device_create_vargs+0x20/0x28)
[<c0235af4>] (device_create_vargs) from [<c0235b1c>] (device_create+0x20/0x28)
[<c0235b1c>] (device_create) from [<c020be4c>] (gpiochip_export+0x4c/0x98)
[<c020be4c>] (gpiochip_export) from [<c020a408>] (gpiochip_add+0x114/0x29c)
[<c020a408>] (gpiochip_add) from [<c020c818>] (dwapb_gpio_probe+0x16c/0x634)
[<c020c818>] (dwapb_gpio_probe) from [<c0239198>] (platform_drv_probe+0x2c/0x5c)
[<c0239198>] (platform_drv_probe) from [<c0237bd4>] (driver_probe_device+0x78/0x208)
[<c0237bd4>] (driver_probe_device) from [<c0237df0>] (__driver_attach+0x8c/0x90)
[<c0237df0>] (__driver_attach) from [<c02364b8>] (bus_for_each_dev+0x54/0x88)
[<c02364b8>] (bus_for_each_dev) from [<c023748c>] (bus_add_driver+0xd8/0x1d4)
[<c023748c>] (bus_add_driver) from [<c0238564>] (driver_register+0x78/0xf4)
[<c0238564>] (driver_register) from [<c0008884>] (do_one_initcall+0x80/0x1b8)
[<c0008884>] (do_one_initcall) from [<c052fcd4>] (kernel_init_freeable+0x170/0x240)
[<c052fcd4>] (kernel_init_freeable) from [<c03d0238>] (kernel_init+0x8/0xec)
[<c03d0238>] (kernel_init) from [<c000e578>] (ret_from_fork+0x14/0x3c)
---[ end trace 209e273f37ff62dd ]---
gpiochip_add: GPIOs 0..28 (ff709000.gpio) failed to register
gpio-dwapb ff709000.gpio: failed to register gpiochip for /soc/gpio@ff709000/gpio-controller@0
gpio-dwapb: probe of ff709000.gpio failed with error -17
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at /home/atull/repos/linux-socfpga/fs/sysfs/dir.c:31 sysfs_warn_dup+0x58/0x74()
sysfs: cannot create duplicate filename '/class/gpio/gpiochip0'
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W      3.17.0-rc2-00012-g7ad6a41 #1
[<c0014ab4>] (unwind_backtrace) from [<c0011684>] (show_stack+0x10/0x14)
[<c0011684>] (show_stack) from [<c03d3d80>] (dump_stack+0x74/0x90)
[<c03d3d80>] (dump_stack) from [<c0020c88>] (warn_slowpath_common+0x68/0x8c)
[<c0020c88>] (warn_slowpath_common) from [<c0020d40>] (warn_slowpath_fmt+0x30/0x40)
[<c0020d40>] (warn_slowpath_fmt) from [<c0144e5c>] (sysfs_warn_dup+0x58/0x74)
[<c0144e5c>] (sysfs_warn_dup) from [<c0145180>] (sysfs_do_create_link_sd+0xbc/0xc4)
[<c0145180>] (sysfs_do_create_link_sd) from [<c02357f4>] (device_add+0x304/0x4ec)
[<c02357f4>] (device_add) from [<c0235a78>] (device_create_groups_vargs+0x9c/0xcc)
[<c0235a78>] (device_create_groups_vargs) from [<c0235af4>] (device_create_vargs+0x20/0x28)
[<c0235af4>] (device_create_vargs) from [<c0235b1c>] (device_create+0x20/0x28)
[<c0235b1c>] (device_create) from [<c020be4c>] (gpiochip_export+0x4c/0x98)
[<c020be4c>] (gpiochip_export) from [<c020a408>] (gpiochip_add+0x114/0x29c)
[<c020a408>] (gpiochip_add) from [<c020c818>] (dwapb_gpio_probe+0x16c/0x634)
[<c020c818>] (dwapb_gpio_probe) from [<c0239198>] (platform_drv_probe+0x2c/0x5c)
[<c0239198>] (platform_drv_probe) from [<c0237bd4>] (driver_probe_device+0x78/0x208)
[<c0237bd4>] (driver_probe_device) from [<c0237df0>] (__driver_attach+0x8c/0x90)
[<c0237df0>] (__driver_attach) from [<c02364b8>] (bus_for_each_dev+0x54/0x88)
[<c02364b8>] (bus_for_each_dev) from [<c023748c>] (bus_add_driver+0xd8/0x1d4)
[<c023748c>] (bus_add_driver) from [<c0238564>] (driver_register+0x78/0xf4)
[<c0238564>] (driver_register) from [<c0008884>] (do_one_initcall+0x80/0x1b8)
[<c0008884>] (do_one_initcall) from [<c052fcd4>] (kernel_init_freeable+0x170/0x240)
[<c052fcd4>] (kernel_init_freeable) from [<c03d0238>] (kernel_init+0x8/0xec)
[<c03d0238>] (kernel_init) from [<c000e578>] (ret_from_fork+0x14/0x3c)
---[ end trace 209e273f37ff62de ]---
gpiochip_add: GPIOs 0..26 (ff70a000.gpio) failed to register
gpio-dwapb ff70a000.gpio: failed to register gpiochip for /soc/gpio@ff70a000/gpio-controller@0
gpio-dwapb: probe of ff70a000.gpio failed with error -17

How are you testing this?

Alan
