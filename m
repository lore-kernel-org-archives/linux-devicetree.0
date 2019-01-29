From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv3 2/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy regulator power failed warning
Date: Tue, 29 Jan 2019 10:25:21 +0000
Message-ID: <20190129102521.4141-3-linux.amoon@gmail.com>
References: <20190129102521.4141-1-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129102521.4141-1-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Override the dr_mode from "host" to "otg" for USB_HOST controller (usb0)
changes help usb_phy0->usb0 initialization of OTG bus port.

Changes fix the below warning.

[    1.183681] dwc2 c9000000.usb: c9000000.usb supply vusb_d not found, using dummy regulator
[    1.190627] dwc2 c9000000.usb: Linked as a consumer to regulator.0
[    1.196696] dwc2 c9000000.usb: c9000000.usb supply vusb_a not found, using dummy regulator
[    1.206094] phy phy-c0000000.phy.0: USB ID detect failed!
[    1.210243] phy phy-c0000000.phy.0: phy poweron failed --> -22
[    1.216072] WARNING: CPU: 0 PID: 78 at drivers/regulator/core.c:2054 _regulator_put.part.11+0xf0/0xf8
[    1.225147] Modules linked in:
[    1.228169] CPU: 0 PID: 78 Comm: kworker/0:1 Not tainted 5.0.0-rc4-xc2ml #1
[    1.235066] Hardware name: Hardkernel ODROID-C2 (DT)
[    1.239987] Workqueue: events deferred_probe_work_func
[    1.245072] pstate: 80000005 (Nzcv daif -PAN -UAO)
[    1.249816] pc : _regulator_put.part.11+0xf0/0xf8
[    1.254473] lr : regulator_put+0x34/0x48
[    1.258353] sp : ffff0000117b3b00
[    1.261630] x29: ffff0000117b3b00 x28: 0000000000000000
[    1.266891] x27: ffff80007ec1a7b8 x26: ffff000010eec280
[    1.272153] x25: 0000000000000000 x24: 0000000000000009
[    1.277414] x23: ffff0000117b3bc8 x22: ffff80007ecd3c00
[    1.282675] x21: ffff0000111ad6c8 x20: ffff80007ecd3e00
[    1.287936] x19: ffff80007ecd3e00 x18: 0000000000000124
[    1.293198] x17: 0000000000000000 x16: 0000000000000000
[    1.298459] x15: 0000000000000400 x14: 0000000000000400
[    1.303720] x13: ff00000000000000 x12: ffffffffffffffff
[    1.308981] x11: 0000000000000038 x10: 0000000000000040
[    1.314243] x9 : ffff0000111c58b0 x8 : ffff0000111c58a8
[    1.319504] x7 : ffff80006b055200 x6 : ffff80007edd2880
[    1.324765] x5 : ffff80007f400248 x4 : ffff80007fb92b00
[    1.330026] x3 : ffff0000112c9d58 x2 : ffff80007edd2880
[    1.335288] x1 : 0000000000000000 x0 : 0000000000000001
[    1.340549] Call trace:
[    1.342966]  _regulator_put.part.11+0xf0/0xf8
[    1.347278]  regulator_put+0x34/0x48
[    1.350814]  regulator_bulk_free+0x30/0x50
[    1.354868]  devm_regulator_bulk_release+0x18/0x20
[    1.359612]  release_nodes+0x1b0/0x220
[    1.363320]  devres_release_all+0x34/0x50
[    1.367288]  really_probe+0xec/0x290
[    1.370824]  driver_probe_device+0x54/0xe8
[    1.374878]  __device_attach_driver+0xb8/0xe8
[    1.379190]  bus_for_each_drv+0x78/0xc8
[    1.382985]  __device_attach+0xd4/0x130
[    1.386780]  device_initial_probe+0x10/0x18
[    1.390920]  bus_probe_device+0x90/0x98
[    1.394715]  deferred_probe_work_func+0x6c/0xa0
[    1.399203]  process_one_work+0x1e0/0x318
[    1.403168]  worker_thread+0x228/0x428
[    1.406877]  kthread+0x124/0x128
[    1.410070]  ret_from_fork+0x10/0x18
[    1.413603] ---[ end trace 498aca4cb07e5377 ]---
[    1.418251] WARNING: CPU: 0 PID: 78 at drivers/regulator/core.c:2054 _regulator_put.part.11+0xf0/0xf8
[    1.427316] Modules linked in:
[    1.430338] CPU: 0 PID: 78 Comm: kworker/0:1 Tainted: G        W         5.0.0-rc4-xc2ml #1
[    1.438615] Hardware name: Hardkernel ODROID-C2 (DT)
[    1.443534] Workqueue: events deferred_probe_work_func
[    1.448621] pstate: 80000005 (Nzcv daif -PAN -UAO)
[    1.453366] pc : _regulator_put.part.11+0xf0/0xf8
[    1.458023] lr : regulator_put+0x34/0x48
[    1.461903] sp : ffff0000117b3b00
[    1.465180] x29: ffff0000117b3b00 x28: 0000000000000000
[    1.470441] x27: ffff80007ec1a7b8 x26: ffff000010eec280
[    1.475703] x25: 0000000000000000 x24: 0000000000000009
[    1.480964] x23: ffff0000117b3bc8 x22: ffff80007ecd3c00
[    1.486225] x21: ffff0000111ad6c8 x20: ffff80007ecd3f00
[    1.491486] x19: ffff80007ecd3f00 x18: 0000000000000007
[    1.496748] x17: 0000000000000000 x16: 0000000000000000
[    1.502009] x15: 0000000000000400 x14: ffff80000531da90
[    1.507270] x13: ffff80007f4ae050 x12: 0000000000000000
[    1.512531] x11: ffff80007f4adff0 x10: 0000000000000040
[    1.517793] x9 : ffff80000531da98 x8 : 0000000040000000
[    1.523054] x7 : ffff80006b054700 x6 : 0000000000000001
[    1.528315] x5 : ffff0000105a868c x4 : ffff80007edd2880
[    1.533576] x3 : ffff0000112c9d58 x2 : ffff80007edd2880
[    1.538838] x1 : 0000000000000000 x0 : 0000000000000001
[    1.544098] Call trace:
[    1.546516]  _regulator_put.part.11+0xf0/0xf8
[    1.550828]  regulator_put+0x34/0x48
[    1.554364]  regulator_bulk_free+0x30/0x50
[    1.558417]  devm_regulator_bulk_release+0x18/0x20
[    1.563161]  release_nodes+0x1b0/0x220
[    1.566870]  devres_release_all+0x34/0x50
[    1.570838]  really_probe+0xec/0x290
[    1.574374]  driver_probe_device+0x54/0xe8
[    1.578428]  __device_attach_driver+0xb8/0xe8
[    1.582740]  bus_for_each_drv+0x78/0xc8
[    1.586535]  __device_attach+0xd4/0x130
[    1.590330]  device_initial_probe+0x10/0x18
[    1.594470]  bus_probe_device+0x90/0x98
[    1.598265]  deferred_probe_work_func+0x6c/0xa0
[    1.602751]  process_one_work+0x1e0/0x318
[    1.606718]  worker_thread+0x228/0x428
[    1.610427]  kthread+0x124/0x128
[    1.613618]  ret_from_fork+0x10/0x18
[    1.617153] ---[ end trace 498aca4cb07e5378 ]---
[    1.621778] dwc2: probe of c9000000.usb failed with error -22

Fixes: 5a0803bd5ae (ARM64: dts: meson-gxbb-odroidc2: Enable USB Nodes)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Changes from previous patch
change dr_mode from "peripheral" to "otg"
Since usb_phy0 is otg port as per the shematic
Fixed the commit messages with latest warning

This patch depend on this below patch
[0] https://patchwork.kernel.org/patch/10777359/

/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=usb-storage, 480M
        |__ Port 3: Dev 3, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 1, Class=Video, Driver=uvcvideo, 480M
        |__ Port 3: Dev 3, If 2, Class=Audio, Driver=, 480M
        |__ Port 3: Dev 3, If 3, Class=Audio, Driver=, 480M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=dwc2/1p, 480M

drop tested but from Kevin
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index da729ed00408..5d81ad02483b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -312,6 +312,7 @@
 
 &usb0 {
 	status = "okay";
+	dr_mode = "otg";
 };
 
 &usb1 {
-- 
2.20.1
