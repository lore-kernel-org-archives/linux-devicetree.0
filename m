From: Daniel Kurtz <djkurtz@google.com>
Subject: Re: [PATCH v11 0/12] dw-hdmi: convert imx hdmi to bridge/dw_hdmi
Date: Sat, 15 Nov 2014 13:46:17 +0800
Message-ID: <CAGS+omCkrh3rh3Sjc4CPBJ+dFaaAFi27FpoAJN6_YKvxVnaH7w@mail.gmail.com>
References: <1415934583-16290-1-git-send-email-andy.yan@rock-chips.com>
 <1415972231-8283-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415972231-8283-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, Yakir Yang <ykk@rock-chips.com>, devel@driverdev.osuosl.org, Pawel Moll <pawel.moll@arm.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Grant Likely <grant.likely@linaro.org>, Dave Airlie <airlied@redhat.com>, Xu Jianqun <jay.xu@rock-chips.com>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Inki Dae <inki.dae@samsung.com>, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, rmk+kernel@arm.linux.org.uk, "mark.yao@rock-chips.com" <mark.yao@rock-chips.com>, fabio.estevam@freescale.com, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@l>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 14, 2014 at 9:37 PM, Andy Yan <andy.yan@rock-chips.com> wrote:
>
> We found Freescale imx6 and Rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
> use the interface compatible Designware HDMI IP, but they also have some
> lightly differences, such as phy pll configuration, register width(imx hdmi
> register is one byte, but rk3288 is 4 bytes width and can only be accessed
> by word), 4K support(imx6 doesn't support 4k, but rk3288 does), and HDMI2.0
> support.
>
> To reuse the imx-hdmi driver, we make this patch set:
> (1): fix some CodingStyle warning to make checkpatch happy
> (2): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
> (3): move imx-hdmi to bridge/dw-hdmi, and convert it to a drm_bridge driver
> (4): add rockchip rk3288 platform specific code dw_hdmi-rockchip.c
>
> Changes in v11:
> - rearrange the patch order
> - squash patch  <split some phy configuration to platform driver>
> - split some modification form patch <dw_hdmi: add rk3288 support>
>
> Changes in v10:
> - split generic dw_hdmi.c improvements from patch#11 (add rk3288 support)
> - add more display mode support mpll configuration for rk3288
>
> Changes in v9:
> - move some phy configuration to platform driver
>
> Changes in v8:
> - correct some spelling mistake
> - modify ddc-i2c-bus and interrupt description
> - Add documentation for rockchip dw hdmi
>
> Changes in v7:
> - remove unused variables from structure dw_hdmi
> - remove a wrong modification
> - add copyrights for dw_hdmi-imx.c
>
> Changes in v6:
> - rearrange the patch order
> - move some modification from patch#5
> - move some modification to  patch#6
> - refactor register access without reg_shift
>
> Changes in v5:
> - refactor reg-io-width
>
> Changes in v4:
> - fix checkpatch CHECK
> - defer probe ddc i2c adapter
>
> Changes in v3:
> - split multi-register access to one indepent patch
>
> Changes in v2:
> - use git format -M to generate these patch
>
> Andy Yan (11):
>   staging: imx-drm: imx-hdmi: make checkpatch happy
>   staging: imx-drm: imx-hdmi: return defer if can't get ddc i2c adapter
>   staging: imx-drm: imx-hdmi: split imx soc specific code from imx-hdmi
>   staging: imx-drm: imx-hdmi: move imx-hdmi to bridge/dw_hdmi
>   dt-bindings: add document for dw_hdmi
>   drm: bridge/dw_hdmi: add support for multi-byte register width access
>   drm: bridge/dw_hdmi: add mode_valid support
>   drm: bridge/dw_hdmi: clear i2cmphy_stat0 reg in hdmi_phy_wait_i2c_done
>   drm: bridge/dw_hdmi: add function dw_hdmi_phy_enable_spare
>   dt-bindings: Add documentation for rockchip dw hdmi
>   drm: bridge/dw_hdmi: add rockchip rk3288 support
>
> Yakir Yang (1):
>   drm: bridge/dw_hdmi: convert dw-hdmi to drm_bridge mode

Patch 1 & 2 are:

Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>

I think these first two are ready (or will be, after a small nit fix to #2).

Since they are independent of the imx/dw_hdmi split, can we get them
accepted first, to help shrink Andy's patch set?

Thanks,
-djk

>
>  .../devicetree/bindings/drm/bridge/dw_hdmi.txt     |  40 ++
>  .../devicetree/bindings/video/dw_hdmi-rockchip.txt |  43 ++
>  drivers/gpu/drm/bridge/Kconfig                     |   5 +
>  drivers/gpu/drm/bridge/Makefile                    |   1 +
>  .../imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c}        | 762 +++++++++------------
>  .../imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h}        |   8 +-
>  drivers/gpu/drm/rockchip/Kconfig                   |  10 +
>  drivers/gpu/drm/rockchip/Makefile                  |   2 +-
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 355 ++++++++++
>  drivers/staging/imx-drm/Kconfig                    |   1 +
>  drivers/staging/imx-drm/Makefile                   |   2 +-
>  drivers/staging/imx-drm/dw_hdmi-imx.c              | 274 ++++++++
>  include/drm/bridge/dw_hdmi.h                       |  60 ++
>  13 files changed, 1138 insertions(+), 425 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/drm/bridge/dw_hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/video/dw_hdmi-rockchip.txt
>  rename drivers/{staging/imx-drm/imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c} (70%)
>  rename drivers/{staging/imx-drm/imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h} (99%)
>  create mode 100644 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>  create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
>  create mode 100644 include/drm/bridge/dw_hdmi.h
>
> --
> 1.9.1
>



-- 
Daniel Kurtz | Software Engineer | djkurtz@google.com | 650.204.0722
