From: Guenter Roeck <linux@roeck-us.net>
Subject: Tracebacks in -next due to 'of: fix of_node leak caused in
 of_find_node_opts_by_path'
Date: Fri, 10 Feb 2017 17:29:47 -0800
Message-ID: <20170211012947.GA3102@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Qi Hou <qi.hou@windriver.com>
Cc: Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

I see a number of tracebacks in test runs on qemu-next, all related to omap
configurations.

Here is an example:

[    0.000000] OF: ERROR: Bad of_node_put() on /ocp@68000000
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W 4.10.0-rc7-next-20170210 #1
[    0.000000] Hardware name: Generic OMAP3-GP (Flattened Device Tree)
[    0.000000] [<c0310604>] (unwind_backtrace) from [<c030bbf4>] (show_stack+0x10/0x14)
[    0.000000] [<c030bbf4>] (show_stack) from [<c05add8c>] (dump_stack+0x98/0xac)
[    0.000000] [<c05add8c>] (dump_stack) from [<c05af1b0>] (kobject_release+0x48/0x7c)
[    0.000000] [<c05af1b0>] (kobject_release) from [<c0ad6138>] (__of_translate_address+0xb0/0x2cc)
[    0.000000] [<c0ad6138>] (__of_translate_address) from [<c0ad6388>] (__of_address_to_resource+0x28/0xb4)
[    0.000000] [<c0ad6388>] (__of_address_to_resource) from [<c0ad66f8>] (of_address_to_resource+0x70/0x80)
[    0.000000] [<c0ad66f8>] (of_address_to_resource) from [<c08485bc>] (of_syscon_register+0x88/0x22c)
[    0.000000] [<c08485bc>] (of_syscon_register) from [<c08487f0>] (syscon_node_to_regmap+0x90/0x94)
[    0.000000] [<c08487f0>] (syscon_node_to_regmap) from [<c1210184>] (omap_control_init+0x50/0xd8)
[    0.000000] [<c1210184>] (omap_control_init) from [<c1210010>] (omap_clk_init+0x3c/0x70)
[    0.000000] [<c1210010>] (omap_clk_init) from [<c1210a14>] (__omap_sync32k_timer_init+0x20/0x2b4)
[    0.000000] [<c1210a14>] (__omap_sync32k_timer_init) from [<c1210f24>] (omap3_secure_sync32k_timer_init+0x3c/0x48)
[    0.000000] [<c1210f24>] (omap3_secure_sync32k_timer_init) from [<c1200b24>] (start_kernel+0x244/0x38c)
[    0.000000] [<c1200b24>] (start_kernel) from [<8020807c>] (0x8020807c)
[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/500 MHz

There are several such messages with different call paths.

A log with all tracebacks is available at
http://kerneltests.org/builders/qemu-arm-next/builds/627/steps/qemubuildcommand/logs/stdio

Bisect points to commit 'of: fix of_node leak caused in
of_find_node_opts_by_path'. Bisect log is attached.

It is going to be interesting to learn if the patch introduces a problem
or if it exposes one.

Guenter

---
# bad: [632571b1bee00494aef749512d9f3290dfba0ead] Add linux-next specific files for 20170210
# good: [d5adbfcd5f7bcc6fa58a41c5c5ada0e5c826ce2c] Linux 4.10-rc7
git bisect start 'HEAD' 'v4.10-rc7'
# good: [0bd52e1bdcb050ad5bef5d8e93838d40fd44ac4b] Merge remote-tracking branch 'crypto/master'
git bisect good 0bd52e1bdcb050ad5bef5d8e93838d40fd44ac4b
# bad: [6431424e2adf1b48333f7bd54cd5be8fef3953d7] Merge remote-tracking branch 'tip/auto-latest'
git bisect bad 6431424e2adf1b48333f7bd54cd5be8fef3953d7
# good: [37f0c524925ae1f8fb62e39b3330357b1dc090bf] Merge remote-tracking branch 'sound/for-next'
git bisect good 37f0c524925ae1f8fb62e39b3330357b1dc090bf
# good: [18e1b83f8219ccc8051e80384f90682739bf19c4] Merge remote-tracking branch 'mfd/for-mfd-next'
git bisect good 18e1b83f8219ccc8051e80384f90682739bf19c4
# good: [7b844fd09215b87ed67ad69a3a5e09858f761dbb] Merge remote-tracking branch 'iommu/next'
git bisect good 7b844fd09215b87ed67ad69a3a5e09858f761dbb
# good: [11e891d2e00d4c9408c8a35712538d1003e3f549] Merge branch 'sched/core'
git bisect good 11e891d2e00d4c9408c8a35712538d1003e3f549
# bad: [059a17407b8136363594f1d8c9fa53ac6ca6ac2a] Merge remote-tracking branch 'spi/for-next'
git bisect bad 059a17407b8136363594f1d8c9fa53ac6ca6ac2a
# good: [9cfda694080954aa2be700ccadcedd0c5c15277a] Merge remote-tracking branches 'spi/topic/mpc52xx', 'spi/topic/ppc4xx', 'spi/topic/pxa2xx', 'spi/topic/rockchip' and 'spi/topic/rspi' into spi-next
git bisect good 9cfda694080954aa2be700ccadcedd0c5c15277a
# good: [4b741bc35962ccf93b798a233512850c48c2646e] dt-bindings: net: remove reference to fixed link support
git bisect good 4b741bc35962ccf93b798a233512850c48c2646e
# good: [6160be71baba3dd80501c90ab44e0f17d5854721] Merge remote-tracking branches 'spi/topic/s3c64xx', 'spi/topic/sh-msiof', 'spi/topic/slave' and 'spi/topic/topcliff-pch' into spi-next
git bisect good 6160be71baba3dd80501c90ab44e0f17d5854721
# good: [2a9bcff7f0d3883f5381f0fd8232990013002f92] Merge remote-tracking branch 'audit/next'
git bisect good 2a9bcff7f0d3883f5381f0fd8232990013002f92
# bad: [e553f539f2af39db5e3b2c273cc1a22d34be49ad] of: make of_device_make_bus_id() static
git bisect bad e553f539f2af39db5e3b2c273cc1a22d34be49ad
# bad: [0549bde0fcb11a95773e7dc4121738b9e653abf4] of: fix of_node leak caused in of_find_node_opts_by_path
git bisect bad 0549bde0fcb11a95773e7dc4121738b9e653abf4
# first bad commit: [0549bde0fcb11a95773e7dc4121738b9e653abf4] of: fix of_node leak caused in of_find_node_opts_by_path
