From: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v6 0/7] STM32 DSI HOST
Date: Tue, 18 Jul 2017 13:27:25 +0530
Message-ID: <f33755c3-f138-3b53-ade0-f149bb3e9a68@codeaurora.org>
References: <1500277223-29553-1-git-send-email-philippe.cornu@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1500277223-29553-1-git-send-email-philippe.cornu-qxv4g6HH51o@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Yannick Fertre <yannick.fertre-qxv4g6HH51o@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Xinliang Liu <xinliang.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Xinwei Kong <kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Chen Feng <puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Mark Yao <mark.yao@rock-chip>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fabien Dessenne <fabien.dessenne-qxv4g6HH51o@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mickael Reulier <mickael.reulier-qxv4g6HH51o@public.gmane.org>, Vincent Abriou <vincent.abriou-qxv4g6HH51o@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org


Hi,

On 07/17/2017 01:10 PM, Philippe CORNU wrote:
> Version 6:
> - bridge/synopsys/dw-mipi-dsi.c: drm_bridge_add update (Archit Taneja)

queued patches #1 to #4 to drm-misc-next. Please let me know when you apply
the remainder of the ST patches. Once that's done, we can add CONFIG_DRM_STM_DSI=y
in the drm-misc defconfigs for arm/arm64.

Thanks,
Archit

> 
> Version 5:
> - bridge/synopsys/dw-mipi-dsi.c: Improve the direct call to panel
>    bridge post_disable() & related comments (Archit Taneja)
> - stm/ltdc.c: fix leak of pixel clock enable in some error
>    paths (Eric Anholt)
> - bindings/display/bridge/dw_mipi_dsi.txt: add pixel clock & remove
>    "driver" (Rob Herring, Archit Taneja)
> - bindings/display/st,stm32-ltdc.txt: remove "driver" (Rob Herring,
>    Archit Taneja)
> 
> Version 4:
> - bridge/synopsys/dw-mipi-dsi.c: Add panel-bridge support (-45 lines,
>    but no so easy to do) and is_panel_bridge for a better clean up, add
>    stm copyright/remove dpms_mode/remove drm_of.h/improve clk
>    management/add mode_valid (thanks to comments of Archit Taneja), use
>    "DesignWare" instead of "Designware (thanks to comments of Neil
>    Armstrong)
> - bridge/synopsys/Kconfig: Remove help section to hide it in menuconfig
>    (thanks to comments of Archit Taneja)
> - include/drm/bridge/dw_mipi_dsi.h: Remove drmP.h (thanks to comments
>    of Archit Taneja)
> - bindings/display/bridge/dw_mipi_dsi.txt: Improve optional property
>    explanations (thanks to comments of Neil Armstrong)
> - stm/ltdc.c: Add is_panel_bridge for a better clean up/remove
>    drm_encoder_helper_add() (thanks to comments of Eric Anholt)
> - stm/dw_mipi_dsi-stm.c: remove math64.h/use DRM_WARN/remove warnings
>    (thanks to comments of Archit Taneja), minor alignment fix (thanks to
>    comments of Neil Armstrong)
> - bindings/display/st,stm32-ltdc.txt: use graph binding in the
>    example/improve ports usage doc (thanks to comments of Rob Herring),
>    use "DSI" instead of "dsi" where relevant (thanks to comments of Neil
>    Armstrong)
> 
> Version 3:
> - stm/ltdc: Use panel-bridge (-170 lines), thanks to comments of Eric Anholt,
>    Boris Brezillon, Archit Taneja & Andrzej Hajda.
> - Synopsys dsi: Add dw_mipi_dsi.h (forgotten in v2), thanks to comments of
>    Neil Armstrong.
> - Synopsys dsi/dw-mipi-dsi.c: add dw_mipi_dsi_dphy_init() &
>    dw_mipi_dsi_dphy_enable() to better manage DW phy-dedicated regs, remove
>    dw_mipi_dsi_mode enum, remove stm32 patch for lpm, remove pllref (manage in
>    the vendor phy) thanks to comments of Archit Taneja. Add mode_flags to phy
>    parameters to better adjust lane mbps according to dsi burst and non burst
>    modes todos in caps.
> - stm/dw_mipi_dsi-stm.c: Add pllref management.
> - dt-bindings/display/stm: Split dt-bindings patch in two (parent node
>    removal/ dsi), add required nodes (port & panel/bridge), updates thanks to
>    comments of Rob Herring.
> - dt-bindings/display/Synopsys dsi: remove port as part of the vendor
>    documentation, add panel/bridge node, update dt-bindings thanks to comments
>    of Rob Herring.
> - Add more people from Hisilicon & Rockchip.
> 
> Version 2:
> - Add a generic Synopsys DesignWare MIPI DSI bridge driver following
>    comments from Neil Armstrong & Archit Taneja.
> - Use drm_of_find_panel_or_bridge() thanks to Eric Anholt comments
> - Update dt-bindings thanks to Rob Herring comments
> 
> Version 1:
> - Initial commit
> 
> The purpose of this set of patches is to add the mipi dsi host driver
> to the stm32 family.
> 
> This mipi dsi host driver is based on the Rockchip version of the
> Synopsys Designware mipi dsi driver (rockchip/dw-mipi-dsi.c)
> modified for the stm32 family:
>      - replace Rockchip digital & phy specific extensions with stm32's ones.
>      - add a bridge
> 
> Philippe CORNU (7):
>    drm/stm: ltdc: Fix leak of px clk enable in some error paths
>    drm/stm: ltdc: Add panel-bridge support
>    dt-bindings: display: Add Synopsys DW MIPI DSI host controller
>    drm/bridge/synopsys: Add MIPI DSI host controller bridge
>    dt-bindings: display: stm32: remove st-display-subsystem parent node
>      requirement
>    dt-bindings: display: stm32: Add DSI controller
>    drm/stm: Add STM32 DSI controller driver
> 
>   .../bindings/display/bridge/dw_mipi_dsi.txt        |  32 +
>   .../devicetree/bindings/display/st,stm32-ltdc.txt  | 105 ++-
>   drivers/gpu/drm/bridge/synopsys/Kconfig            |   6 +
>   drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      | 981 +++++++++++++++++++++
>   drivers/gpu/drm/stm/Kconfig                        |   9 +-
>   drivers/gpu/drm/stm/Makefile                       |   2 +
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c              | 352 ++++++++
>   drivers/gpu/drm/stm/ltdc.c                         | 220 +----
>   drivers/gpu/drm/stm/ltdc.h                         |   3 +-
>   include/drm/bridge/dw_mipi_dsi.h                   |  39 +
>   11 files changed, 1568 insertions(+), 183 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/dw_mipi_dsi.txt
>   create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>   create mode 100644 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
>   create mode 100644 include/drm/bridge/dw_mipi_dsi.h
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
