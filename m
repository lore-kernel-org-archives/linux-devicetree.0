From: Philippe CORNU <philippe.cornu-qxv4g6HH51o@public.gmane.org>
Subject: Re: [PATCH v5 0/8] drm/rockchip: migrate to common dw-mipi-dsi bridge
 and dual-dsi
Date: Thu, 23 Aug 2018 13:48:49 +0000
Message-ID: <d0e324cb-45f9-9386-821d-64f1a3474ee7@st.com>
References: <20180821140515.22246-1-heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180821140515.22246-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Content-Language: en-US
Content-ID: <D8EF1E4E84E51443B4F30D73C64AE2AD-qxv4g6HH51o@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hoegsberg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yannick FERTRE <yannick.fertre-qxv4g6HH51o@public.gmane.org>, "linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org" <nickey.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org" <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <mka-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Heiko,

On 08/21/2018 04:05 PM, Heiko Stuebner wrote:
> The Rockchip DSI driver was separate till now, not using the common
> bridge driver that was introduced a bit later. So this series migrates
> over to use that common bridge driver and then also adds support for
> dual-dsi to both the bridge and Rockchip glue code.
> 
> The bridge-migration itself is based on Nickeys earlier v8
> work, but adapted to current kernels and with a new split between probe
> and bind, so that we do not create and drop the dsi-host on each deferred
> bind attempt.
> 
> changes in v2:
> - rebase against newer drm code (dsi-bridge+rockchip changes)
> - add SPDX header to new glue driver
> - expect regular interface lanes from panel (like 4) not the double number
>    Similar to tegra
> - keep links to both master and slave
> changes in v3:
> - don't defer in bridge_attach, instead add ability to check for finalized
>    panel attachement, for example in bind
> - address bridge-conversion comments from Andrzej:
>    - include ordering
>    - moved hwaccess from mode_set to enable callback
>    - move pllref_clk enablement to bind (needed by bridge mode_set->lane_mbps)
> - limited slave settings to dw_mipi_dsi_set_slave
> - address dual-dsi comments from Philippe:
>    - remove unneeded separate variables
>    - remove unneeded second slave settings
>    - disable slave before master
>    - lane-sum calculation comments
> changes in v4:
> - rebase against some legacy rockchip-dsi changes
> - add dsi-component only after panel has attached to dsi host
>    This solves quite some concurrency problems that happen when trying
>    to determine dsi-panel availability
> changes in v5:
> - use driver-internal method to find second host
> - drop of-graph based dsi method for it

FYI, Yannick tested successfully the v5 version on stm32 boards. Note 
that drm stm32 drivers do not use bind/unbind & dual-dsi so this email 
is simply to share with you this minor information: "v5 patch does not 
break stm32 dsi", hope it helps a little.
Many thanks,
Philippe :-)

> 
> Unchanged from review comments:
> - kept dw_mipi_dsi_bind, as the dsi->bridge member is only part of the
>    bridge drivers struct, so not accessible from glue drivers
> - kept dual-dsi handling that mimicks tegra
> 
> 
> Heiko Stuebner (4):
>    drm/bridge/synopsys: dsi: move mipi_dsi_host_unregister to
>      __dw_mipi_dsi_remove
>    drm/bridge/synopsys: dsi: don't call __dw_mipi_dsi_probe from
>      dw_mipi_dsi_bind
>    drm/bridge/synopsys: dsi: add ability to have glue-specific attach and
>      detach
>    drm/rockchip: dsi: add dual mipi support
> 
> Nickey Yang (3):
>    dt-bindings: display: rockchip: update DSI controller
>    drm/rockchip: dsi: migrate to use dw-mipi-dsi bridge driver
>    drm/bridge/synopsys: dsi: add dual-dsi support
> 
>   .../display/rockchip/dw_mipi_dsi_rockchip.txt |   23 +-
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  114 +-
>   drivers/gpu/drm/rockchip/Kconfig              |    2 +-
>   drivers/gpu/drm/rockchip/Makefile             |    2 +-
>   .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 1044 +++++++++++++
>   drivers/gpu/drm/rockchip/dw-mipi-dsi.c        | 1349 -----------------
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |    2 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |    3 +-
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |    3 +
>   drivers/gpu/drm/rockchip/rockchip_drm_vop.h   |    4 +
>   drivers/gpu/drm/rockchip/rockchip_vop_reg.c   |    1 +
>   include/drm/bridge/dw_mipi_dsi.h              |   14 +-
>   12 files changed, 1182 insertions(+), 1379 deletions(-)
>   create mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>   delete mode 100644 drivers/gpu/drm/rockchip/dw-mipi-dsi.c
> 
