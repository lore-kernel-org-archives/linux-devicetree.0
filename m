From: Anand Moon <linux.amoon@gmail.com>
Subject: [RFCv1 3/3] ARM: dts: meson8b: odroidc1: enable the OTG capable USB
 controller
Date: Wed, 23 Jan 2019 15:12:09 +0000
Message-ID: <20190123151209.2080-4-linux.amoon@gmail.com>
References: <20190123151209.2080-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190123151209.2080-1-linux.amoon@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Override the dr_mode from "host" to "otg" for USB_HOST controller (usb0)
changes help usb_phy0->usb0 initialization of OTG bus port.

Changes fix the below warning.

[    1.810267] phy phy-c1108800.phy.0: USB ID detect failed!
[    1.814333] phy phy-c1108800.phy.0: phy poweron failed --> -22
[    1.820178] ------------[ cut here ]------------
[    1.824758] WARNING: CPU: 0 PID: 29 at drivers/regulator/core.c:2054 _regulator_put.part.8+0xf8/0xfc
[    1.833884] Modules linked in:
[    1.836907] CPU: 0 PID: 29 Comm: kworker/0:1 Not tainted 5.0.0-rc3-xc1ml #1
[    1.843849] Hardware name: Amlogic Meson platform
[    1.848552] Workqueue: events deferred_probe_work_func
[    1.853683] [<c031222c>] (unwind_backtrace) from [<c030cb74>] (show_stack+0x10/0x14)
[    1.861404] [<c030cb74>] (show_stack) from [<c0e29c78>] (dump_stack+0x8c/0xa0)
[    1.868610] [<c0e29c78>] (dump_stack) from [<c03460c4>] (__warn.part.3+0xbc/0xd8)
[    1.876074] [<c03460c4>] (__warn.part.3) from [<c0346240>] (warn_slowpath_null+0x44/0x4c)
[    1.884236] [<c0346240>] (warn_slowpath_null) from [<c07e20c4>] (_regulator_put.part.8+0xf8/0xfc)
[    1.893093] [<c07e20c4>] (_regulator_put.part.8) from [<c07e20f0>] (regulator_put+0x28/0x38)
[    1.901516] [<c07e20f0>] (regulator_put) from [<c07e2128>] (regulator_bulk_free+0x28/0x38)
[    1.909770] [<c07e2128>] (regulator_bulk_free) from [<c0947f38>] (release_nodes+0x1bc/0x200)
[    1.918191] [<c0947f38>] (release_nodes) from [<c0943f0c>] (really_probe+0x110/0x2cc)
[    1.926005] [<c0943f0c>] (really_probe) from [<c094422c>] (driver_probe_device+0x60/0x16c)
[    1.934256] [<c094422c>] (driver_probe_device) from [<c09423b4>] (bus_for_each_drv+0x80/0xc4)
[    1.942766] [<c09423b4>] (bus_for_each_drv) from [<c0943d8c>] (__device_attach+0xd0/0x138)
[    1.951015] [<c0943d8c>] (__device_attach) from [<c09431c4>] (bus_probe_device+0x84/0x8c)
[    1.959180] [<c09431c4>] (bus_probe_device) from [<c0943660>] (deferred_probe_work_func+0x60/0x8c)
[    1.968127] [<c0943660>] (deferred_probe_work_func) from [<c035fd30>] (process_one_work+0x218/0x504)
[    1.977243] [<c035fd30>] (process_one_work) from [<c0360e20>] (worker_thread+0x2a8/0x5bc)
[    1.985404] [<c0360e20>] (worker_thread) from [<c0365990>] (kthread+0x14c/0x154)
[    1.992785] [<c0365990>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    1.999987] Exception stack(0xee0dbfb0 to 0xee0dbff8)
[    2.005027] bfa0:                                     00000000 00000000 00000000 00000000
[    2.013191] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.021353] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.027984] ---[ end trace 81270e5c573fd4b5 ]---
[    2.032661] ------------[ cut here ]------------
[    2.037162] WARNING: CPU: 0 PID: 29 at drivers/regulator/core.c:2054 _regulator_put.part.8+0xf8/0xfc
[    2.046296] Modules linked in:
[    2.049331] CPU: 0 PID: 29 Comm: kworker/0:1 Tainted: G        W         5.0.0-rc3-xc1ml #1
[    2.057647] Hardware name: Amlogic Meson platform
[    2.062344] Workqueue: events deferred_probe_work_func
[    2.067471] [<c031222c>] (unwind_backtrace) from [<c030cb74>] (show_stack+0x10/0x14)
[    2.075197] [<c030cb74>] (show_stack) from [<c0e29c78>] (dump_stack+0x8c/0xa0)
[    2.082405] [<c0e29c78>] (dump_stack) from [<c03460c4>] (__warn.part.3+0xbc/0xd8)
[    2.089871] [<c03460c4>] (__warn.part.3) from [<c0346240>] (warn_slowpath_null+0x44/0x4c)
[    2.098034] [<c0346240>] (warn_slowpath_null) from [<c07e20c4>] (_regulator_put.part.8+0xf8/0xfc)
[    2.106891] [<c07e20c4>] (_regulator_put.part.8) from [<c07e20f0>] (regulator_put+0x28/0x38)
[    2.115314] [<c07e20f0>] (regulator_put) from [<c07e2128>] (regulator_bulk_free+0x28/0x38)
[    2.123566] [<c07e2128>] (regulator_bulk_free) from [<c0947f38>] (release_nodes+0x1bc/0x200)
[    2.131988] [<c0947f38>] (release_nodes) from [<c0943f0c>] (really_probe+0x110/0x2cc)
[    2.139802] [<c0943f0c>] (really_probe) from [<c094422c>] (driver_probe_device+0x60/0x16c)
[    2.148054] [<c094422c>] (driver_probe_device) from [<c09423b4>] (bus_for_each_drv+0x80/0xc4)
[    2.156564] [<c09423b4>] (bus_for_each_drv) from [<c0943d8c>] (__device_attach+0xd0/0x138)
[    2.164813] [<c0943d8c>] (__device_attach) from [<c09431c4>] (bus_probe_device+0x84/0x8c)
[    2.172978] [<c09431c4>] (bus_probe_device) from [<c0943660>] (deferred_probe_work_func+0x60/0x8c)
[    2.181923] [<c0943660>] (deferred_probe_work_func) from [<c035fd30>] (process_one_work+0x218/0x504)
[    2.191040] [<c035fd30>] (process_one_work) from [<c0360e20>] (worker_thread+0x2a8/0x5bc)
[    2.199201] [<c0360e20>] (worker_thread) from [<c0365990>] (kthread+0x14c/0x154)
[    2.206582] [<c0365990>] (kthread) from [<c03010e8>] (ret_from_fork+0x14/0x2c)
[    2.213785] Exception stack(0xee0dbfb0 to 0xee0dbff8)
[    2.218824] bfa0:                                     00000000 00000000 00000000 00000000
[    2.226989] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.235151] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.241774] ---[ end trace 81270e5c573fd4b6 ]---
[    2.246415] dwc2: probe of c9040000.usb failed with error -22

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from previous patch.

Fix the subject and commit message as per Martin's request
--Fix the commit message.
--TODO: allthough the bus port is initialization,
  but their is not usb device detected on the otg port.
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index bfa472a679d9..a41912039522 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -323,6 +323,7 @@
 
 &usb0 {
 	status = "okay";
+	dr_mode = "otg";
 };
 
 &usb1 {
-- 
2.20.1
