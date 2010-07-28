From: John Rigby <john.rigby-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [RFC PATCH 0/3] *** Add device tree support for ARM to U-Boot ***
Date: Wed, 28 Jul 2010 15:59:52 -0600
Message-ID: <1280354395-9128-1-git-send-email-john.rigby@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches add device tree support to the bootm command in u-boot
for the ARM.  I'm sending the patches to this list first for comments
before sending it to the wider audience on the u-boot list.

The only testing so far has shown that this patch does not break non-dt
booting.  I don't have a dt enabled beagle kernel so I have not tried that
yet.

John Rigby (3):
  FDT: Add fixup support of multiple banks of memory
  ARM: WIP: add flat device tree support
  ARM: add config for beagle with fdt enabled

 MAKEALL                           |    1 +
 arch/arm/include/asm/config.h     |    1 +
 arch/arm/lib/bootm.c              |  128 ++++++++++++++-
 boards.cfg                        |    1 +
 common/cmd_bootm.c                |    5 +-
 common/fdt_support.c              |   86 +++++-----
 common/image.c                    |    7 +-
 include/configs/omap3_beagle_dt.h |  344 +++++++++++++++++++++++++++++++++++++
 include/fdt_support.h             |    1 +
 include/image.h                   |    2 +-
 10 files changed, 531 insertions(+), 45 deletions(-)
 create mode 100644 include/configs/omap3_beagle_dt.h
