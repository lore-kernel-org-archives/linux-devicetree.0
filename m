From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/11] LVDS Display Bridge support for i.MX
Date: Tue, 26 Mar 2013 15:13:55 +0100
Message-ID: <1364307246-9017-1-git-send-email-p.zabel@pengutronix.de>
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
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>, Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

the following patches add support for LVDS displays on
i.MX53 and i.MX6q boards.

The clock patches are needed because the LVDS serial clock
has to be in lockstep with the IPU display interface clock
providing the pixel data. A fixed factor of 7:1 (or 3.5:1 in
dual link mode) needs to be maintained. This is achieved on
i.MX by clocking the LDB interface clock directly from a PLL,
and manually setting the 3.5/7:1 divider depending on dual/single
link mode. The IPU display interface clock is then sourced
from the divided LDB clock.

regards
Philipp

---
 arch/arm/boot/dts/imx51.dtsi        |   2 +
 arch/arm/boot/dts/imx53.dtsi        |  34 ++
 arch/arm/boot/dts/imx6q.dtsi        |  17 +
 arch/arm/boot/dts/imx6qdl.dtsi      |  26 ++
 arch/arm/mach-imx/clk-imx51-imx53.c |  19 +-
 arch/arm/mach-imx/clk-imx6q.c       |  43 ++-
 arch/arm/mach-imx/clk.h             |  17 +
 arch/arm/mach-imx/common.h          |   1 +
 arch/arm/mach-imx/mach-imx6q.c      |   2 +-
 drivers/staging/imx-drm/Kconfig     |   7 +
 drivers/staging/imx-drm/Makefile    |   1 +
 drivers/staging/imx-drm/imx-ldb.c   | 614 ++++++++++++++++++++++++++++++++++++
 12 files changed, 758 insertions(+), 25 deletions(-)
