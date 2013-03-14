From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] Remove mxsfb auxdata
Date: Thu, 14 Mar 2013 13:53:24 +0800
Message-ID: <1363240410-16865-1-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Florian Tobias Schandinat <FlorianSchandinat-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The mxsfb driver was converted to device tree by asking platform to
pass mxsfb_platform_data with auxdata.  We did this to have mach-mxs
be DT only platform when there was no videomode bindings.  Now with
the videomode bindings and helpers in place, the series changes mxsfb
driver to get display_timings from device tree, and removes mxsfb
platform_data and auxdata completely.

To maintain the bisectability, the series needs to go via single tree,
and I prefer to arm-soc tree.

Shawn Guo (6):
  video: mxsfb: use devm_* managed functions
  video: mxsfb: remove fb_phys/fb_size from platform_data
  video: mxsfb: remove dotclk_delay from platform_data
  video: mxsfb: get display timings from device tree
  ARM: mxs: move display timing configurations into device tree
  video: mxsfb: remove mxsfb_platform_data

 Documentation/devicetree/bindings/fb/mxsfb.txt |   34 ++++
 arch/arm/boot/dts/imx23-evk.dts                |   25 +++
 arch/arm/boot/dts/imx28-apf28dev.dts           |   25 +++
 arch/arm/boot/dts/imx28-apx4devkit.dts         |   25 +++
 arch/arm/boot/dts/imx28-cfa10049.dts           |   25 +++
 arch/arm/boot/dts/imx28-evk.dts                |   25 +++
 arch/arm/boot/dts/imx28-m28evk.dts             |   25 +++
 arch/arm/mach-mxs/mach-mxs.c                   |  153 -----------------
 drivers/video/Kconfig                          |    2 +
 drivers/video/mxsfb.c                          |  219 +++++++++++++++---------
 include/linux/mxsfb.h                          |   49 ------
 11 files changed, 320 insertions(+), 287 deletions(-)
 delete mode 100644 include/linux/mxsfb.h

-- 
1.7.9.5
