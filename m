Return-Path: <SRS0=A9sX=SF=ideasonboard.com=laurent.pinchart@kernel.org>
Date: Wed, 3 Apr 2019 13:15:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/5] ARM: imx7s: add media nodes
Message-ID: <20190403101549.GD12646@pendragon.ideasonboard.com>
References: <20190328142516.30372-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190328142516.30372-1-rui.silva@linaro.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rui,

Thank you for the patches.

On Thu, Mar 28, 2019 at 02:25:11PM +0000, Rui Miguel Silva wrote:
> This series is a continuation of the
> [PATCH v14 00/13] media: staging/imx7: add i.MX7 media driver [0] series.
> All code patches and bindings are already merged, missing only this
> dts patches.

I'm testing this on a custom i.MX7D board, with an IMX296 CSI-2 sensor,
and the system deadlocks when I start video capture:

[  112.426341] capture_start_streaming: vb2 queue ec8029a0 priv ec802840 imxmd ec7aa444
[  112.434499] imx_media_pipeline_set_stream: media device ec7aa444
[  112.442392] INFO: trying to register non-static key.
[  112.447372] the code is fine but needs lockdep annotation.
[  112.452861] turning off the locking correctness validator.
[  112.458357] CPU: 0 PID: 213 Comm: yavta Not tainted 5.0.0-00078-g97d0c7aa3256 #66
[  112.465842] Hardware name: Freescale i.MX7 Dual (Device Tree)
[  112.471616] [<c0111e20>] (unwind_backtrace) from [<c010cd64>] (show_stack+0x10/0x14)
[  112.479371] [<c010cd64>] (show_stack) from [<c0b32838>] (dump_stack+0xb0/0xe8)
[  112.486609] [<c0b32838>] (dump_stack) from [<c0174000>] (register_lock_class+0x550/0x5c8)
[  112.494798] [<c0174000>] (register_lock_class) from [<c0176ec4>] (__lock_acquire+0x6c/0x1904)
[  112.503334] [<c0176ec4>] (__lock_acquire) from [<c01790cc>] (lock_acquire+0xcc/0x1ec)
[  112.511175] [<c01790cc>] (lock_acquire) from [<c0b535a0>] (_raw_spin_lock+0x28/0x38)
[  112.518928] [<c0b535a0>] (_raw_spin_lock) from [<c0b4ed14>] (__mutex_lock+0xc8/0x900)
[  112.526766] [<c0b4ed14>] (__mutex_lock) from [<c0b4f568>] (mutex_lock_nested+0x1c/0x24)
[  112.534782] [<c0b4f568>] (mutex_lock_nested) from [<c0803cd4>] (imx_media_pipeline_set_stream+0x50/0x110)
[  112.544361] [<c0803cd4>] (imx_media_pipeline_set_stream) from [<c0805bb8>] (capture_start_streaming+0x38/0xe0)
[  112.554376] [<c0805bb8>] (capture_start_streaming) from [<c077a228>] (vb2_start_streaming+0x5c/0x150)
[  112.563604] [<c077a228>] (vb2_start_streaming) from [<c077be20>] (vb2_core_streamon+0x7c/0x14c)
[  112.572313] [<c077be20>] (vb2_core_streamon) from [<c07608fc>] (__video_do_ioctl+0x210/0x44c)
[  112.580846] [<c07608fc>] (__video_do_ioctl) from [<c0760f18>] (video_usercopy+0x294/0x7e0)
[  112.589122] [<c0760f18>] (video_usercopy) from [<c028a2a4>] (do_vfs_ioctl+0x9c/0x9ec)
[  112.596963] [<c028a2a4>] (do_vfs_ioctl) from [<c028ac28>] (ksys_ioctl+0x34/0x60)
[  112.604369] [<c028ac28>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
[  112.612030] Exception stack(0xed237fa8 to 0xed237ff0)
[  112.617089] 7fa0:                   00000000 be8bca2c 00000003 40045612 be8bca2c 00000000
[  112.625275] 7fc0: 00000000 be8bca2c 00000000 00000036 000142e8 c0445609 00000000 00014324
[  112.633457] 7fe0: 00025014 be8bca00 00012fc8 b6f5bd50
[  136.211443] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [yavta:213]
[  136.218241] Modules linked in: ath3k imx296 evbug
[  136.222960] irq event stamp: 35493
[  136.226374] hardirqs last  enabled at (35493): [<c0b53818>] _raw_spin_unlock_irq+0x24/0x2c
[  136.234648] hardirqs last disabled at (35492): [<c0b4d028>] __schedule+0xb0/0xa0c
[  136.242141] softirqs last  enabled at (35490): [<c0102434>] __do_softirq+0x2ac/0x4f8
[  136.249896] softirqs last disabled at (35481): [<c012a6ec>] irq_exit+0xbc/0x194
[  136.257214] CPU: 0 PID: 213 Comm: yavta Not tainted 5.0.0-00078-g97d0c7aa3256 #66
[  136.264702] Hardware name: Freescale i.MX7 Dual (Device Tree)
[  136.270458] PC is at do_raw_spin_lock+0x70/0x114
[  136.275083] LR is at do_raw_spin_lock+0xd8/0x114
[  136.279707] pc : [<c017c8e0>]    lr : [<c017c948>]    psr: 80000013
[  136.285980] sp : ed237cf8  ip : c0f76670  fp : c110cb94
[  136.291212] r10: ec7aa540  r9 : ec7aa560  r8 : c18cb110
[  136.296444] r7 : c11c9ca8  r6 : 00000001  r5 : ffffe000  r4 : ec7aa540
[  136.302978] r3 : 0000a444  r2 : 0000ec7a  r1 : 00000000  r0 : 00000000
[  136.309513] Flags: Nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
[  136.316656] Control: 10c5387d  Table: ad28406a  DAC: 00000051
[  136.322410] CPU: 0 PID: 213 Comm: yavta Not tainted 5.0.0-00078-g97d0c7aa3256 #66
[  136.329898] Hardware name: Freescale i.MX7 Dual (Device Tree)
[  136.335660] [<c0111e20>] (unwind_backtrace) from [<c010cd64>] (show_stack+0x10/0x14)
[  136.343415] [<c010cd64>] (show_stack) from [<c0b32838>] (dump_stack+0xb0/0xe8)
[  136.350653] [<c0b32838>] (dump_stack) from [<c01d7f30>] (watchdog_timer_fn+0x234/0x2c8)
[  136.358674] [<c01d7f30>] (watchdog_timer_fn) from [<c01a813c>] (__hrtimer_run_queues+0x190/0x578)
[  136.367561] [<c01a813c>] (__hrtimer_run_queues) from [<c01a9430>] (hrtimer_interrupt+0x128/0x2c4)
[  136.376449] [<c01a9430>] (hrtimer_interrupt) from [<c07e90d8>] (arch_timer_handler_virt+0x2c/0x34)
[  136.385423] [<c07e90d8>] (arch_timer_handler_virt) from [<c018b244>] (handle_percpu_devid_irq+0xc8/0x344)
[  136.395004] [<c018b244>] (handle_percpu_devid_irq) from [<c0185c50>] (generic_handle_irq+0x20/0x34)
[  136.404063] [<c0185c50>] (generic_handle_irq) from [<c0186238>] (__handle_domain_irq+0x50/0xb8)
[  136.412779] [<c0186238>] (__handle_domain_irq) from [<c04c2870>] (gic_handle_irq+0x4c/0xa8)
[  136.421144] [<c04c2870>] (gic_handle_irq) from [<c01019f0>] (__irq_svc+0x70/0x98)
[  136.428633] Exception stack(0xed237ca8 to 0xed237cf0)
[  136.433695] 7ca0:                   00000000 00000000 0000ec7a 0000a444 ec7aa540 ffffe000
[  136.441884] 7cc0: 00000001 c11c9ca8 c18cb110 ec7aa560 ec7aa540 c110cb94 c0f76670 ed237cf8
[  136.450069] 7ce0: c017c948 c017c8e0 80000013 ffffffff
[  136.455133] [<c01019f0>] (__irq_svc) from [<c017c8e0>] (do_raw_spin_lock+0x70/0x114)
[  136.462888] [<c017c8e0>] (do_raw_spin_lock) from [<c0b4ed14>] (__mutex_lock+0xc8/0x900)
[  136.470903] [<c0b4ed14>] (__mutex_lock) from [<c0b4f568>] (mutex_lock_nested+0x1c/0x24)
[  136.478919] [<c0b4f568>] (mutex_lock_nested) from [<c0803cd4>] (imx_media_pipeline_set_stream+0x50/0x110)
[  136.488499] [<c0803cd4>] (imx_media_pipeline_set_stream) from [<c0805bb8>] (capture_start_streaming+0x38/0xe0)
[  136.498513] [<c0805bb8>] (capture_start_streaming) from [<c077a228>] (vb2_start_streaming+0x5c/0x150)
[  136.507745] [<c077a228>] (vb2_start_streaming) from [<c077be20>] (vb2_core_streamon+0x7c/0x14c)
[  136.516455] [<c077be20>] (vb2_core_streamon) from [<c07608fc>] (__video_do_ioctl+0x210/0x44c)
[  136.524991] [<c07608fc>] (__video_do_ioctl) from [<c0760f18>] (video_usercopy+0x294/0x7e0)
[  136.533267] [<c0760f18>] (video_usercopy) from [<c028a2a4>] (do_vfs_ioctl+0x9c/0x9ec)
[  136.541110] [<c028a2a4>] (do_vfs_ioctl) from [<c028ac28>] (ksys_ioctl+0x34/0x60)
[  136.548518] [<c028ac28>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
[  136.556180] Exception stack(0xed237fa8 to 0xed237ff0)
[  136.561242] 7fa0:                   00000000 be8bca2c 00000003 40045612 be8bca2c 00000000
[  136.569430] 7fc0: 00000000 be8bca2c 00000000 00000036 000142e8 c0445609 00000000 00014324
[  136.577616] 7fe0: 00025014 be8bca00 00012fc8 b6f5bd50

Have you tested this on mainline ? :-) I investigated the issue a bit,
and it seems that the various files in the drivers play around with
platform_drvdata in a way that isn't very clean, nor very correct.

> The main difference from the version in the previous series is as
> commented by Laurent:
>  - split of dtsi and dts in 2 patches
>  - push endpoints to imx7s.dtsi
> 
> Cheers,
>    Rui
> 
> v2->v3:
> Laurent Pinchart:
>   - Add label to csi-mux
>   - Disable csi-mux in imx7s
>   - enable it in warp dts
>   - add port@0 to mux
> 
> v1->v2:
> Shawn Guo:
>   - sort alphabetically
>   - hyphen for node name
>   - indent align clocks
>   - send status to end of property list
> 
> Rui Miguel Silva (5):
>   ARM: dts: imx7s: add mipi phy power domain
>   ARM: dts: imx7s: add multiplexer controls
>   ARM: dts: imx7s: Add video mux, csi and mipi_csi
>   ARM: dts: imx7s-warp: add csi and mipi_csi node
>   ARM: dts: imx7s-warp: add ov2680 sensor node
> 
>  arch/arm/boot/dts/imx7s-warp.dts | 59 ++++++++++++++++++++
>  arch/arm/boot/dts/imx7s.dtsi     | 92 +++++++++++++++++++++++++++++++-
>  2 files changed, 149 insertions(+), 2 deletions(-)

-- 
Regards,

Laurent Pinchart
