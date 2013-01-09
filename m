From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [RFC PATCH 0/5] Use SRC to reset IP modules on i.MX5 and i.MX6
Date: Wed,  9 Jan 2013 18:17:14 +0100
Message-ID: <1357751839-19680-1-git-send-email-p.zabel@pengutronix.de>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The system reset controller (SRC) on i.MX51, i.MX53, and i.MX6q controls
reset lines to the GPU, VPU, IPU, and OpenVG IP modules.

The following patches allow to link modules and SRC reset lines via phandle
properties in the device tree. Drivers can then request their IP modules
to be reset by the SRC.
The IPU driver is made to use this mechanism during initialization, to
improve robustness in the case of bootloaders leaving the IPU enabled.

Fabio, does this help with your spurious interrupt issue?

regards
Philipp

---
 .../devicetree/bindings/reset/fsl,imx-src.txt      |   45 +++++++++++++++++
 .../bindings/staging/imx-drm/fsl-imx-drm.txt       |    3 ++
 arch/arm/boot/dts/imx51.dtsi                       |    6 +++
 arch/arm/boot/dts/imx53.dtsi                       |    9 ++++
 arch/arm/boot/dts/imx6q.dtsi                       |    3 ++
 arch/arm/mach-imx/Kconfig                          |    1 +
 arch/arm/mach-imx/common.h                         |    3 +-
 arch/arm/mach-imx/mach-imx6q.c                     |    2 +-
 arch/arm/mach-imx/mm-imx5.c                        |    2 +
 arch/arm/mach-imx/src.c                            |   52 +++++++++++++++++++-
 drivers/staging/imx-drm/ipu-v3/ipu-common.c        |   20 ++++++--
 include/linux/imx-src.h                            |    6 +++
 12 files changed, 146 insertions(+), 6 deletions(-) 
