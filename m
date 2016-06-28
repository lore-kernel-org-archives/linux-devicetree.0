From: Guenter Roeck <groeck-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [v4 PATCH 0/5] Rockchip Type-C and DispplayPort driver
Date: Tue, 28 Jun 2016 06:49:38 -0700
Message-ID: <CABXOdTcGs3JQFFobBjT7u867-uZ0hz7Qw5-gcrndpArqcH5fFA@mail.gmail.com>
References: <1467116681-9330-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467116681-9330-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Douglas Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, =?UTF-8?B?5aea5pm65oOF?= <yzq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, wulf <wulf-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Kever Yang <kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Yao <mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jun 28, 2016 at 5:24 AM, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org> wrote:
>
> Hi all
>

Hi Chris,

I keep forgetting:

Subject line: s/DispplayPort/DisplayPort/

Guenter

> This series patch is for rockchip Type-C phy and DisplayPort controller
> driver.
>
> The USB Type-C PHY is designed to support the USB3 and DP applications.
> The PHY basically has two main components: USB3 and DisplyPort. USB3
> operates in SuperSpeed mode and the DP can operate at RBR, HBR and HBR2
> data rates. The Type-C cable orientation detection and Power Delivery
> (PD) is accomplished using a PD PHY or a exernal PD chip.
>
> The DP controller is compliant with DisplayPort Specification,
> Version 1.3, This IP is compatible with the rockchip type-c PHY IP.
> There is a uCPU in DP controller, it need a firmware to work, please
> put the firmware file to /lib/firmware/cdn/dptx.bin. The uCPU in charge
> of aux communication and link training, the host use mailbox to
> communicate with the ucpu.
>
> The DP contoller has register a notification with extcon API, to get the
> alt mode from PD, the PD driver need call the devm_extcon_dev_allocate
> to create a extcon device and use extcon_set_state to notify DP
> controller.
>
> About the DP audio, cdn-dp registered 2 DAIs: 0 is I2S, 1 is SPDIF.
> We can reference them in simple-card.
>
> This series is based on Mark Yao's branch:
> https://github.com/markyzq/kernel-drm-rockchip/tree/drm-rockchip-next-2016-05-23
>
> I test this patches on the rk3399-evb board, with a fusb302 driver,
> this branch has no rk3399.dtsi, so the patch about dts is not included
> in this series.
>
>
> Changes in v4:
> - remove DP alt mode
> - add a #phy-cells node
> - select EXTCON
> - use phy framework to control the USB3 and DP function
> - rename PIN_MAP_ to PIN_ASSIGN_
> - add a reset node
> - support 2 phys
> - use phy framework to control DP phy
> - support 2 phys
>
> Changes in v3:
> - use compatible: rockchip,rk3399-typec-phy
> - use dashes instead of underscores.
> - remove the phy framework(Kishon Vijay Abraham I)
> - add parentheses around the macro
> - use a single space between type and name
> - add spaces after opening and before closing braces.
> - use u16 for register value
> - remove type-c phy header file
> - CodingStyle optimization
> - use some cable extcon to get type-c port information
> - add a extcon to notify Display Port
> - add SoC specific compatible string
> - remove reg = <1>;
> - use EXTCON_DISP_DP and EXTCON_DISP_DP_ALT cable to get dp port state.
> - reset spdif before config it
> - modify the firmware clk to 100Mhz
> - retry load firmware if fw file is requested too early
>
> Changes in v2:
> - add some registers description
> - select RESET_CONTROLLER
> - alphabetic order
> - modify some spelling mistakes
> - make mode cleaner
> - use bool for enable/disable
> - check all of the return value
> - return a better err number
> - use more readx_poll_timeout()
> - clk_disable_unprepare(tcphy->clk_ref);
> - remove unuse functions, rockchip_typec_phy_power_on/off
> - remove unnecessary typecast from void *
> - use dts node to distinguish between phys.
> - Alphabetic order
> - remove excess error message
> - use define clk_rate
> - check all return value
> - remove dev_set_name(dp->dev, "cdn-dp");
> - use schedule_delayed_work
> - remove never-called functions
> - remove some unnecessary ()
>
> Changes in v1:
> - add extcon node description
> - move the registers in phy driver
> - remove the suffix of reset
> - update the licence note
> - init core clock to 50MHz
> - use extcon API
> - remove unused global
> - add some comments for magic num
> - change usleep_range(1000, 2000) tousleep_range(1000, 1050)
> - remove __func__ from dev_err
> - return err number when get clk failed
> - remove ADDR_ADJ define
> - use devm_clk_get(&pdev->dev, "tcpdcore")
> - add extcon node description
> - add #sound-dai-cells description
> - use extcon API
> - use hdmi-codec for the DP Asoc
> - do not initialize the "ret"
> - printk a err log when drm_of_encoder_active_endpoint_id
> - modify the dclk pin_pol to a single line
>
> Chris Zhong (5):
>   extcon: Add Type-C and DP support
>   Documentation: bindings: add dt doc for Rockchip USB Type-C PHY
>   phy: Add USB Type-C PHY driver for rk3399
>   Documentation: bindings: add dt documentation for cdn DP controller
>   drm/rockchip: cdn-dp: add cdn DP support for rk3399
>
>  .../bindings/display/rockchip/cdn-dp-rockchip.txt  |  67 ++
>  .../devicetree/bindings/phy/phy-rockchip-typec.txt |  77 ++
>  drivers/extcon/extcon.c                            |   5 +
>  drivers/gpu/drm/rockchip/Kconfig                   |   9 +
>  drivers/gpu/drm/rockchip/Makefile                  |   1 +
>  drivers/gpu/drm/rockchip/cdn-dp-core.c             | 761 ++++++++++++++++
>  drivers/gpu/drm/rockchip/cdn-dp-core.h             | 113 +++
>  drivers/gpu/drm/rockchip/cdn-dp-reg.c              | 731 ++++++++++++++++
>  drivers/gpu/drm/rockchip/cdn-dp-reg.h              | 404 +++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |   6 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.h        |   2 +
>  drivers/gpu/drm/rockchip/rockchip_vop_reg.c        |   2 +
>  drivers/phy/Kconfig                                |   9 +
>  drivers/phy/Makefile                               |   1 +
>  drivers/phy/phy-rockchip-typec.c                   | 963 +++++++++++++++++++++
>  include/linux/extcon.h                             |   5 +
>  16 files changed, 3155 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt
>  create mode 100644 drivers/gpu/drm/rockchip/cdn-dp-core.c
>  create mode 100644 drivers/gpu/drm/rockchip/cdn-dp-core.h
>  create mode 100644 drivers/gpu/drm/rockchip/cdn-dp-reg.c
>  create mode 100644 drivers/gpu/drm/rockchip/cdn-dp-reg.h
>  create mode 100644 drivers/phy/phy-rockchip-typec.c
>
> --
> 2.6.3
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
