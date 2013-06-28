From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v3 0/5] ARM: dts: imx27 Phytec phyCARD-S
Date: Fri, 28 Jun 2013 16:50:32 +0200
Message-ID: <1372431037-13519-1-git-send-email-mpa@pengutronix.de>
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
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

This series adds some device nodes for imx27 and board files for Phytec
phyCARD-S SOM and RDK. It is based on shawn's branch "imx/dt".

Regards,

Markus

Changes in v3:
 - Removed unnecessary clock-names from owire node
 - Update memory offset

Changes in v2:
 - Removed already accepted clocks patch
   "ARM: mx27: Replace clk_register_clkdev with clock DT lookup"
 - pca100 board file was splitted into two parts SOM and RDK
 - other changes described in patch notes

Fabio Estevam (1):
      ARM: imx27: Use 'AITC' for the interrupt controller name

Markus Pargmann (4):
      ARM: dts: imx27: Add imx framebuffer device
      ARM: dts: imx27: Add 1-wire
      ARM: dts: imx27 cpufreq-cpu0 frequencies
      ARM: dts: Add device tree support for phycard pca100

 arch/arm/boot/dts/Makefile                       |  2 +
 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts | 62 ++++++++++++++++++++
 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts | 72 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx27.dtsi                     | 40 ++++++++++++-
 4 files changed, 173 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx27-phytec-phycard-s-rdk.dts
 create mode 100644 arch/arm/boot/dts/imx27-phytec-phycard-s-som.dts
