From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] regulator: fixed: add possibility to enable by
 clock
Date: Mon, 7 Oct 2019 06:29:18 -0700
Message-ID: <20191007132918.GA580@roeck-us.net>
References: <20190910062103.39641-1-philippe.schenker@toradex.com>
 <20190910062103.39641-2-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190910062103.39641-2-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Max Krummenacher <max.krummenacher@toradex.com>, Rob Herring <robh+dt@kernel.org>, Stefan Agner <stefan.agner@toradex.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Mark Rutland <mark.rutland@arm.com>, Luka Pivk <luka.pivk@toradex.com>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 10, 2019 at 06:21:15AM +0000, Philippe Schenker wrote:
> This commit adds the possibility to choose the compatible
> "regulator-fixed-clock" in devicetree.
> 
> This is a special regulator-fixed that has to have a clock, from which
> the regulator gets switched on and off.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>

This patch causes a crash in one of my qemu tests (kzm machine with
imx_v6_v7_defconfig). Reverting this patch fixes the problem.
Crash backtrace and bisect log attached below.

Guenter

---
[   24.718451] Unable to handle kernel NULL pointer dereference at virtual address 000000c0
[   24.718774] pgd = (ptrval)
[   24.718946] [000000c0] *pgd=00000000
[   24.719688] Internal error: Oops: 5 [#1] SMP ARM
[   24.720007] Modules linked in:
[   24.720356] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc1-00258-g2d00aee21a5d #1
[   24.720522] Hardware name: Kyoto Microcomputer Co., Ltd. KZM-ARM11-01
[   24.721143] PC is at reg_fixed_voltage_probe+0x38/0x2f4
[   24.721279] LR is at reg_fixed_voltage_probe+0x2c/0x2f4
[   24.721407] pc : [<c070c740>]    lr : [<c070c734>]    psr: 60000053
[   24.721551] sp : c20a9d60  ip : 00000000  fp : c13bf34c
[   24.721677] r10: 00000000  r9 : c1479348  r8 : c30208d0
[   24.721805] r7 : c1408b08  r6 : c30208e0  r5 : 00000000  r4 : c30208e0
[   24.721958] r3 : 00000000  r2 : 00000dc0  r1 : 000000e8  r0 : 00000000
[   24.722145] Flags: nZCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment none
[   24.722273] Control: 00c5387d  Table: 80004008  DAC: 00000051
[   24.722435] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[   24.722616] Stack: (0xc20a9d60 to 0xc20aa000)
[   24.723031] 9d60: c3019d90 c033ff9c 00000000 c301b380 c21c2700 00000000 c21c2700 c301b380
[   24.723407] 9d80: c3019d90 61093934 00000001 c30208e0 00000000 c1479348 00000000 00000000
[   24.723767] 9da0: c1479348 00000000 c13bf34c c07ae608 c30208e0 c1b63da0 c1b63da4 00000000
[   24.724120] 9dc0: 00000000 c07ac34c c30208e0 c1479348 c07ac7a0 c1408b08 00000001 00000000
[   24.724485] 9de0: c1300584 c07ac5e0 c1479348 c20a9e44 c30208e0 00000000 c20a9e44 c07ac7a0
[   24.724862] 9e00: c1408b08 00000001 00000000 c1300584 c13bf34c c07aa4fc fffffff3 c20904d4
[   24.725215] 9e20: c21a1dd4 61093934 c30208e0 c30208e0 c3020968 c1408b08 c1408b08 c07ac0a4
[   24.725575] 9e40: c209c000 c30208e0 00000001 61093934 c30208e0 c30208e0 c1488db8 c1408b08
[   24.725963] 9e60: 00000000 c07ab3b4 c30208e0 c1488b00 00000000 c07a7ab8 c1300584 c0dd7b04
[   24.726347] 9e80: c1408b08 c30208d0 c30208d0 61093934 c20a9ea8 c3020800 00000000 c30208d0
[   24.726744] 9ea0: c30208e0 c14146d8 c14f93cc c07ae3d4 c3020800 c30208d0 00000000 00000002
[   24.727127] 9ec0: c14146d8 c14f93cc c1300584 c070a4a8 c14146d8 c1408b28 c1408b08 c1303c60
[   24.727504] 9ee0: 00000000 c130d094 00000000 c01aa5a4 c14fa7a0 c1303c7c c14fa7a0 c01031d8
[   24.727894] 9f00: 0000019e 00000000 c7ffccec c7ffccda c12b19ac 0000019e 0000019e c01513b8
[   24.728277] 9f20: c1408b08 c018ab84 c1408b08 c14fa7a0 c1408b28 c1500700 c139f850 0000019e
[   24.728662] 9f40: c1300584 c01aa5a4 00000000 61093934 c139f874 c1500700 00000008 c1500700
[   24.729041] 9f60: c139f854 0000019e c1300584 c1301028 00000007 00000007 00000000 c1300584
[   24.729410] 9f80: 00000000 00000000 c0decf18 00000000 00000000 00000000 00000000 00000000
[   24.729788] 9fa0: 00000000 c0decf20 00000000 c01010b4 00000000 00000000 00000000 00000000
[   24.730167] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   24.730544] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[   24.730948] [<c070c740>] (reg_fixed_voltage_probe) from [<c07ae608>] (platform_drv_probe+0x48/0x98)
[   24.731194] [<c07ae608>] (platform_drv_probe) from [<c07ac34c>] (really_probe+0x22c/0x34c)
[   24.731404] [<c07ac34c>] (really_probe) from [<c07ac5e0>] (driver_probe_device+0x5c/0x16c)
[   24.731606] [<c07ac5e0>] (driver_probe_device) from [<c07aa4fc>] (bus_for_each_drv+0x54/0xb8)
[   24.731810] [<c07aa4fc>] (bus_for_each_drv) from [<c07ac0a4>] (__device_attach+0xcc/0x140)
[   24.732010] [<c07ac0a4>] (__device_attach) from [<c07ab3b4>] (bus_probe_device+0x88/0x90)
[   24.732210] [<c07ab3b4>] (bus_probe_device) from [<c07a7ab8>] (device_add+0x388/0x608)
[   24.732406] [<c07a7ab8>] (device_add) from [<c07ae3d4>] (platform_device_add+0x100/0x210)
[   24.732612] [<c07ae3d4>] (platform_device_add) from [<c070a4a8>] (regulator_register_always_on+0xa0/0xc8)
[   24.732847] [<c070a4a8>] (regulator_register_always_on) from [<c130d094>] (kzm_late_init+0x48/0x88)
[   24.733069] [<c130d094>] (kzm_late_init) from [<c1303c7c>] (init_machine_late+0x1c/0x8c)
[   24.733292] [<c1303c7c>] (init_machine_late) from [<c01031d8>] (do_one_initcall+0x80/0x3ac)
[   24.733500] [<c01031d8>] (do_one_initcall) from [<c1301028>] (kernel_init_freeable+0x120/0x1e8)
[   24.733710] [<c1301028>] (kernel_init_freeable) from [<c0decf20>] (kernel_init+0x8/0x118)
[   24.733909] [<c0decf20>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
[   24.734111] Exception stack(0xc20a9fb0 to 0xc20a9ff8)
[   24.734355] 9fa0:                                     00000000 00000000 00000000 00000000
[   24.734758] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   24.735101] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   24.735650] Code: eb0d74e5 e3a03000 e3a02d37 e3a010e8 (e59090c0)
[   24.737370] ---[ end trace d0f5e68eb88278a8 ]---
[   24.739335] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b

---
# bad: [ad062195731bea1624ce7160e79e0fcdaa25c1b5] Merge tag 'platform-drivers-x86-v5.4-1' of git://git.infradead.org/linux-platform-drivers-x86
# good: [4d856f72c10ecb060868ed10ff1b1453943fc6c8] Linux 5.3
git bisect start 'ad062195731b' '4d856f72c10e'
# bad: [d47ebd684229f0048be5def6027bfcfbfe2db0d6] Merge tag 'armsoc-defconfig' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect bad d47ebd684229f0048be5def6027bfcfbfe2db0d6
# bad: [52a5525214d0d612160154d902956eca0558b7c0] Merge tag 'iommu-updates-v5.4' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect bad 52a5525214d0d612160154d902956eca0558b7c0
# bad: [aa62325dc38de2be8b1c27eb180ad3751b3f58ec] Merge tag 'spi-v5.4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi
git bisect bad aa62325dc38de2be8b1c27eb180ad3751b3f58ec
# bad: [c4d11ccb2b5cec6cdef7aeeb0017473d23031d96] Merge tag 'regulator-v5.4' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
git bisect bad c4d11ccb2b5cec6cdef7aeeb0017473d23031d96
# good: [6729fb666a3b5a9a5ffa1bb6589127f7e4d35c38] Merge tag 'hwmon-for-v5.4' of git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging
git bisect good 6729fb666a3b5a9a5ffa1bb6589127f7e4d35c38
# good: [92fd0db2cd414c5c78f8f959ed7325e2b24f9445] regulator: sy8824x: add SY20276 support
git bisect good 92fd0db2cd414c5c78f8f959ed7325e2b24f9445
# good: [c0b913447b75538c3cf4b8016fd2e06509895020] regulator: slg51000: use devm_gpiod_get_optional() in probe
git bisect good c0b913447b75538c3cf4b8016fd2e06509895020
# bad: [c82f27df07573ec7b124efe176d2ac6c038787a5] regulator: core: Fix error return for /sys access
git bisect bad c82f27df07573ec7b124efe176d2ac6c038787a5
# bad: [9c86d003d62030e064f5670fb6172b65afd21e86] dt-bindings: regulator: add regulator-fixed-clock binding
git bisect bad 9c86d003d62030e064f5670fb6172b65afd21e86
# good: [d57d90f4443bd725b3facdc6130a1940af4560c4] regulator: s2mps11: Consistently use local variable
git bisect good d57d90f4443bd725b3facdc6130a1940af4560c4
# bad: [8959e5324485ace9bedc33ce1e760b759d4dd2ac] regulator: fixed: add possibility to enable by clock
git bisect bad 8959e5324485ace9bedc33ce1e760b759d4dd2ac
# first bad commit: [8959e5324485ace9bedc33ce1e760b759d4dd2ac] regulator: fixed: add possibility to enable by clock
