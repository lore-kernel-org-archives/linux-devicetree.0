From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 00/54] MAINTAINERS: Add file patterns for device tree bindings
Date: Sun, 22 May 2016 11:05:37 +0200
Message-ID: <1463907991-7916-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: devicetree@vger.kernel.org

	Hi all,

Submitters of device tree binding documentation regularly forget to CC
the subsystem maintainer due to missing entries in MAINTAINERS for
Documentation/devicetree/bindings/. This patch series is an attempt to
add (most) missing entries.

Maintainers: Please apply the appropriate patch(es) directly if you want
to be involved in device tree binding documentation for your subsystem.

Thanks!

Geert Uytterhoeven (54):
  MAINTAINERS: Add file patterns for ion device tree bindings
  MAINTAINERS: Add file patterns for dove device tree bindings
  MAINTAINERS: Add file patterns for mediatek device tree bindings
  MAINTAINERS: Add file patterns for qcom device tree bindings
  MAINTAINERS: Add file patterns for rockchip device tree bindings
  MAINTAINERS: Add file patterns for backlight device tree bindings
  MAINTAINERS: Add file patterns for bcm2835 device tree bindings
  MAINTAINERS: Add file patterns for mips brcm device tree bindings
  MAINTAINERS: Add file patterns for can device tree bindings
  MAINTAINERS: Add file patterns for clocksource device tree bindings
  MAINTAINERS: Add file patterns for clock device tree bindings
  MAINTAINERS: Add file patterns for cpufreq device tree bindings
  MAINTAINERS: Add file patterns for cris device tree bindings
  MAINTAINERS: Add file patterns for crypto device tree bindings
  MAINTAINERS: Add file patterns for dma device tree bindings
  MAINTAINERS: Add file patterns for drm device tree bindings
  MAINTAINERS: Add file patterns for fpga device tree bindings
  MAINTAINERS: Add file patterns for h8300 device tree bindings
  MAINTAINERS: Add file patterns for rng device tree bindings
  MAINTAINERS: Add file patterns for iio device tree bindings
  MAINTAINERS: Add file patterns for serio device tree bindings
  MAINTAINERS: Add file patterns for iommu device tree bindings
  MAINTAINERS: Add file patterns for led device tree bindings
  MAINTAINERS: Add file patterns for ata device tree bindings
  MAINTAINERS: Add file patterns for powerpc device tree bindings
  MAINTAINERS: Add file patterns for mailbox device tree bindings
  MAINTAINERS: Add file patterns for dsa device tree bindings
  MAINTAINERS: Add file patterns for media device tree bindings
  MAINTAINERS: Add file patterns for mtd device tree bindings
  MAINTAINERS: Add file patterns for mips device tree bindings
  MAINTAINERS: Add file patterns for mmc device tree bindings
  MAINTAINERS: Add file patterns for net device tree bindings
  MAINTAINERS: Add file patterns for wireless device tree bindings
  MAINTAINERS: Add file patterns for nios2 device tree bindings
  MAINTAINERS: Add file patterns for pci device tree bindings
  MAINTAINERS: Add file patterns for pinctrl device tree bindings
  MAINTAINERS: Add file patterns for power supply device tree bindings
  MAINTAINERS: Add file patterns for pps device tree bindings
  MAINTAINERS: Add file patterns for rtc device tree bindings
  MAINTAINERS: Add file patterns for regmap device tree bindings
  MAINTAINERS: Add file patterns for remoteproc device tree bindings
  MAINTAINERS: Add file patterns for scsi device tree bindings
  MAINTAINERS: Add file patterns for sound device tree bindings
  MAINTAINERS: Add file patterns for spi device tree bindings
  MAINTAINERS: Add file patterns for staging iio device tree bindings
  MAINTAINERS: Add file patterns for ti device tree bindings
  MAINTAINERS: Add file patterns for tpm device tree bindings
  MAINTAINERS: Add file patterns for serial device tree bindings
  MAINTAINERS: Add file patterns for usb device tree bindings
  MAINTAINERS: Add file patterns for virtio device tree bindings
  MAINTAINERS: Add file patterns for w1 device tree bindings
  MAINTAINERS: Add file patterns for watchdog device tree bindings
  MAINTAINERS: Add file patterns for x86 device tree bindings
  MAINTAINERS: Add file patterns for xillybus device tree bindings

 MAINTAINERS | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert
