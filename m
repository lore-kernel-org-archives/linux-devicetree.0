From: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
Subject: Re: [PATCH v4 0/4] rtc: add mxc driver for i.MX53 SRTC
Date: Mon, 18 Dec 2017 15:17:27 +0100
Message-ID: <CAOFm3uHBMLmJd2Na7XjGMMKBBvot4htJ_YDh+F407wtwfmaG4w@mail.gmail.com>
References: <20171218115133.16371-1-linux-kernel-dev@beckhoff.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171218115133.16371-1-linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-dev <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
Cc: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 12:51 PM,  <linux-kernel-dev-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org> wrote:
> From: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
>
> Neither rtc-imxdi, rtc-mxc nor rtc-snvs are compatible with i.MX53.
>
> This is driver enables support for the low power domain SRTC features:
> - 32-bit MSB of non-rollover time counter
> - 32-bit alarm register
>
> Select the new config option RTC_DRV_MXC_V2 to build this driver
>
> Based on:
> http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/tree/drivers/=
rtc/rtc-mxc_v2.c?h=3Dimx_2.6.35_11.09.01
>
> Signed-off-by: Patrick Bruenn <p.bruenn-QonKdJ6Bx35Wk0Htik3J/w@public.gmane.org>
>
> ---
>
> v4:
> - rename "srtc" node into generic "rtc" keep the label as "srtc" to avoid
>   duplication with imx53-m53.dtsi
> - fix Signed-off-by: in bindings-patch
>
> v3:
> - introduce new config option with the same patch, which adds the driver
> - call rtc_update_irq() only if necessary
> - merge mxc_rtc_write_alarm_locked() with mxc_rtc_set_alarm()
> - only use clk_enable/disable (without "prepare") during operation
> - rebase on v4.15-rc3
> - consistently use rtc_tm_to_time64() and time64_t
> - refactor mxc_rtc_read_time(): don't lock for readl() only;
>   don't rtc_valid_tm(); use time64_t
> - check returncode of mxc_rtc_wait_for_flag()
> - restructure mxc_rtc_sync_lp_locked() to replace pr_err() with
>   dev_err_once(); remove explicit 'inline'
> - don't touch imx_v4_v5_defconfig, instead add to imx_v6_v7_defconfig
>
> v2:
> - have seperate patches for dt-binding, CONFIG option, imx53.dtsi and dri=
ver
> - add SPDX-License-Identifier and cleanup copyright notice
> - replace __raw_readl/writel() with readl/writel()
> - fix PM_SLEEP callbacks
> - add CONFIG_RTC_DRV_MXC_V2 to build rtc-mxc_v2.c
> - remove misleading or obvious comments and fix style of the remaining
> - avoid endless loop while waiting for hw
> - implement consistent locking; make spinlock a member of dev struct
> - enable clk only for register accesses
> - remove all udelay() calls since they are obsolete or redundant
>   (we are already waiting for register flags to change)
> - init platform_data before registering irq callback
> - let set_time() fail, when 32 bit rtc counter exceeded
> - make names more consistent
> - cleanup and reorder includes
> - cleanup and remove unused defines
>
> Cc: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
> Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> (maintainer:OPEN FIRMWARE AND FLA=
TTENED DEVICE TREE BINDINGS)
> Cc: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM)
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list:OPEN FIRMWARE AND FLATTENED DEV=
ICE TREE BINDINGS)
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org (open list)
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Juergen Borleis <jbe-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Noel Vellemans <Noel.Vellemans-8UENEgx6w+makBO8gow8eQ@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> (maintainer:ARM/FREESCALE IMX / =
MXC ARM ARCHITECTURE)
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> (maintainer:ARM PORT)
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated list:ARM/FREESCALE IM=
X / MXC ARM ARCHITECTURE)
>
> Cc: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
> Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> ---
>
> Patrick Bruenn (4):
>   dt-bindings: rtc: add bindings for i.MX53 SRTC
>   ARM: dts: imx53: add srtc node
>   rtc: add mxc driver for i.MX53 SRTC
>   ARM: imx_v6_v7_defconfig: enable RTC_DRV_MXC_V2
>
>  .../devicetree/bindings/rtc/rtc-mxc_v2.txt         |  17 +
>  arch/arm/boot/dts/imx53.dtsi                       |   7 +
>  arch/arm/configs/imx_v6_v7_defconfig               |   1 +
>  drivers/rtc/Kconfig                                |  10 +
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-mxc_v2.c                           | 422 +++++++++++++++=
++++++
>  6 files changed, 458 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-mxc_v2.txt
>  create mode 100644 drivers/rtc/rtc-mxc_v2.c
>
> --
> 2.11.0

For the use of SPDX license tags in this patch set:

Acked-by: Philippe Ombredanne <pombredanne-od1rfyK75/E@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
