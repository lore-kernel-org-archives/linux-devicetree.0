From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 0/4] drm: Add support for the ARM HDLCD display controller
Date: Wed,  5 Aug 2015 15:28:08 +0100
Message-ID: <1438784892-27888-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Jon Medhurst <tixy@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>
List-Id: devicetree@vger.kernel.org

This series adds support for ARM's HDLCD display controller found in Juno
and ARM TC2 Coretile. The HDLCD outputs an RGB stream that feeds into a
single digital encoder (DVI or HDMI).

This series depends on Sudeep Holla's series that introduces support for
SCPI[1] on Juno.

Only the Juno functionality has been tested as the TC2 Coretile require
a working SiI9022 driver for VExpress that is not subject of this patchset.

This is my first driver for the DRM subsystem and as such probably contains
misuses of the APIs that I will be glad to correct if pointed out.

Best regards,
Liviu


[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2015-August/362219.html

Liviu Dudau (4):
  drm: arm: Add DT bindings documentation for HDLCD driver.
  drm: Add support for ARM's HDLCD controller.
  arm64: Juno: Add HDLCD support to the Juno boards.
  MAINTAINERS: Add Liviu Dudau as maintainer for ARM HDLCD driver.

 .../devicetree/bindings/drm/arm/arm,hdlcd.txt      |  74 ++++
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/arm/juno-base.dtsi             |  70 ++-
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/arm/Kconfig                        |  20 +
 drivers/gpu/drm/arm/Makefile                       |   2 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                   | 265 +++++++++++
 drivers/gpu/drm/arm/hdlcd_drv.c                    | 490 +++++++++++++++++++++
 drivers/gpu/drm/arm/hdlcd_drv.h                    |  51 +++
 drivers/gpu/drm/arm/hdlcd_regs.h                   |  87 ++++
 11 files changed, 1066 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/arm/arm,hdlcd.txt
 create mode 100644 drivers/gpu/drm/arm/Kconfig
 create mode 100644 drivers/gpu/drm/arm/Makefile
 create mode 100644 drivers/gpu/drm/arm/hdlcd_crtc.c
 create mode 100644 drivers/gpu/drm/arm/hdlcd_drv.c
 create mode 100644 drivers/gpu/drm/arm/hdlcd_drv.h
 create mode 100644 drivers/gpu/drm/arm/hdlcd_regs.h

-- 
2.4.6
