From: Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH V3 0/4] dw-hdmi: make imx hdmi publicly used by dw hdmi
 compatible platform
Date: Thu,  6 Nov 2014 19:21:53 +0800
Message-ID: <1415272913-56889-1-git-send-email-andy.yan@rock-chips.com>
References: <1415192101-6404-1-git-send-email-andy.yan@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1415192101-6404-1-git-send-email-andy.yan@rock-chips.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: airlied@linux.ie, heiko@sntech.de, fabio.estevam@freescale.com, rmk+kernel@arm.linux.org.uk
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Zubair.Kakakhel@imgtec.com, Arnd Bergmann <arnd@arndb.de>, Josh Boyer <jwboyer@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ykk@rock-chips.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>, linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>, djkurtz@google.com, Philipp Zabel <p.zabel@pengutronix.de>, Dave Airlie <airlied@redhat.com>, Grant Likely <grant.likely@linaro.org>, Andy yan <andy.yan@rock-chips.com>, Shawn Guo <shawn.guo@linaro.org>, jay.xu@rock-chips.com, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

We found freescale imx6 and rockchip rk3288 and Ingenic JZ4780 (Xburst/MIPS)
use the interface compatible Designware HDMI IP, but they also have some
lightly difference, such as phy pll configuration, register width(imx hdmi
register is one byte, but rk3288 is 4 bytes width and can only access by word),
4K support(imx6 doesn't support 4k, but rk3288 does).

To reuse the imx-hdmi driver, we do this patch set:
patch (1): split out imx-soc code from imx-hdmi to dw_hdmi-imx.c
patch (2): move imx-hdmi to bridge/, and rename to dw-hdmi to
patch (3): add multi byte register access support
make this driver indepent of drm-imx . And we will add rockchip
platform specific code dw_hdmi-rockchip.c later, this is depend
on drm-rockchip.

Changes in V3:
- refactor multi byte register access, and split it
  to one indepent patch
- convert it to a drm_bridge driver

Changes in V2:
- use git format-patch -M to generate these patch
- remove change-id
- remove from


Andy Yan (3):
  imx-drm: imx-hdmi: split imx soc specific code from imx-hdmi
  dw-hdmi: move imx-hdmi to bridge/dw-hdmi
  dw-hdmi: add support for multi byte register width access

ykk (1):
  dw-hdmi: convert dw-hdmi to drm_bridge mode

 drivers/gpu/drm/bridge/Kconfig                     |   5 +
 drivers/gpu/drm/bridge/Makefile                    |   1 +
 .../imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c}        | 619 +++++++++------------
 .../imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h}        |   5 +-
 drivers/staging/imx-drm/Kconfig                    |   1 +
 drivers/staging/imx-drm/Makefile                   |   2 +-
 drivers/staging/imx-drm/dw_hdmi-imx.c              | 263 +++++++++
 include/drm/bridge/dw_hdmi.h                       |  52 ++
 8 files changed, 575 insertions(+), 373 deletions(-)
 rename drivers/{staging/imx-drm/imx-hdmi.c => gpu/drm/bridge/dw_hdmi.c} (75%)
 rename drivers/{staging/imx-drm/imx-hdmi.h => gpu/drm/bridge/dw_hdmi.h} (99%)
 create mode 100644 drivers/staging/imx-drm/dw_hdmi-imx.c
 create mode 100644 include/drm/bridge/dw_hdmi.h

-- 
1.9.1
