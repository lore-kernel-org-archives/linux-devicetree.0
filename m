From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCHv3 2/2] ARM64: dts: meson-gxbb-odroidc2: Fix usb phy
 regulator power failed warning
Date: Mon, 4 Feb 2019 15:06:09 +0100
Message-ID: <CAFBinCDRTeO9FWoJ-=BUc8uizN5_mhJE9EBYv0X6pse7Rxsxew@mail.gmail.com>
References: <20190129102521.4141-1-linux.amoon@gmail.com> <20190129102521.4141-3-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129102521.4141-3-linux.amoon@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
List-Id: devicetree@vger.kernel.org

Hi Anand,

On Tue, Jan 29, 2019 at 11:25 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Override the dr_mode from "host" to "otg" for USB_HOST controller (usb0)
> changes help usb_phy0->usb0 initialization of OTG bus port.
>
> Changes fix the below warning.
>
> [    1.183681] dwc2 c9000000.usb: c9000000.usb supply vusb_d not found, using dummy regulator
> [    1.190627] dwc2 c9000000.usb: Linked as a consumer to regulator.0
> [    1.196696] dwc2 c9000000.usb: c9000000.usb supply vusb_a not found, using dummy regulator
> [    1.206094] phy phy-c0000000.phy.0: USB ID detect failed!
> [    1.210243] phy phy-c0000000.phy.0: phy poweron failed --> -22
I wonder if the warning below are a side-effect of "phy poweron failed"...

> [    1.216072] WARNING: CPU: 0 PID: 78 at drivers/regulator/core.c:2054 _regulator_put.part.11+0xf0/0xf8
> [    1.225147] Modules linked in:
> [    1.228169] CPU: 0 PID: 78 Comm: kworker/0:1 Not tainted 5.0.0-rc4-xc2ml #1
> [    1.235066] Hardware name: Hardkernel ODROID-C2 (DT)
> [    1.239987] Workqueue: events deferred_probe_work_func
> [    1.245072] pstate: 80000005 (Nzcv daif -PAN -UAO)
> [    1.249816] pc : _regulator_put.part.11+0xf0/0xf8
> [    1.254473] lr : regulator_put+0x34/0x48
> [    1.258353] sp : ffff0000117b3b00
> [    1.261630] x29: ffff0000117b3b00 x28: 0000000000000000
> [    1.266891] x27: ffff80007ec1a7b8 x26: ffff000010eec280
> [    1.272153] x25: 0000000000000000 x24: 0000000000000009
> [    1.277414] x23: ffff0000117b3bc8 x22: ffff80007ecd3c00
> [    1.282675] x21: ffff0000111ad6c8 x20: ffff80007ecd3e00
> [    1.287936] x19: ffff80007ecd3e00 x18: 0000000000000124
> [    1.293198] x17: 0000000000000000 x16: 0000000000000000
> [    1.298459] x15: 0000000000000400 x14: 0000000000000400
> [    1.303720] x13: ff00000000000000 x12: ffffffffffffffff
> [    1.308981] x11: 0000000000000038 x10: 0000000000000040
> [    1.314243] x9 : ffff0000111c58b0 x8 : ffff0000111c58a8
> [    1.319504] x7 : ffff80006b055200 x6 : ffff80007edd2880
> [    1.324765] x5 : ffff80007f400248 x4 : ffff80007fb92b00
> [    1.330026] x3 : ffff0000112c9d58 x2 : ffff80007edd2880
> [    1.335288] x1 : 0000000000000000 x0 : 0000000000000001
> [    1.340549] Call trace:
> [    1.342966]  _regulator_put.part.11+0xf0/0xf8
> [    1.347278]  regulator_put+0x34/0x48
> [    1.350814]  regulator_bulk_free+0x30/0x50
> [    1.354868]  devm_regulator_bulk_release+0x18/0x20
> [    1.359612]  release_nodes+0x1b0/0x220
> [    1.363320]  devres_release_all+0x34/0x50
> [    1.367288]  really_probe+0xec/0x290
> [    1.370824]  driver_probe_device+0x54/0xe8
> [    1.374878]  __device_attach_driver+0xb8/0xe8
> [    1.379190]  bus_for_each_drv+0x78/0xc8
> [    1.382985]  __device_attach+0xd4/0x130
> [    1.386780]  device_initial_probe+0x10/0x18
> [    1.390920]  bus_probe_device+0x90/0x98
> [    1.394715]  deferred_probe_work_func+0x6c/0xa0
> [    1.399203]  process_one_work+0x1e0/0x318
> [    1.403168]  worker_thread+0x228/0x428
> [    1.406877]  kthread+0x124/0x128
> [    1.410070]  ret_from_fork+0x10/0x18
> [    1.413603] ---[ end trace 498aca4cb07e5377 ]---
phy_power_on fails above with -EINVAL and then something else breaks
(it seems like you're hitting the WARN_ON in drivers/regulator/core.c
below the comment which states: "Docs say you must disable before
calling regulator_put()")
so this looks like a bug in either the dwc2 driver or the PHY
framework. can you please report that to the dwc2 and PHY maintainers
so it can be fixed independently?


Regards
Martin
