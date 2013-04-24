From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/7] ARM: i.MX53: dts: add Ka-Ro tx53
Date: Wed, 24 Apr 2013 11:41:19 +0200
Message-ID: <1366796486-10641-1-git-send-email-s.trumtrar@pengutronix.de>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi!

This series adds a dtsi for the Ka-Ro TX53 System-On-Module and all necessary
pinctrls that are not already in the imx53.dtsi.
I tested this on 3.9-rc8 with a custom baseboard, but rebased everything to
Shawns imx/dt-3.11, which I presume is the correct base for future dts.

Regards,
Steffen

Steffen Trumtrar (7):
  ARM: i.MX53: add audmux pinctrl
  ARM: i.MX53: add csi pinctrl
  ARM: i.MX53: add ecspi pinctrl
  ARM: i.MX53: add pwm2 pinctrl
  ARM: i.MX53: add uart1 pinctrl
  ARM: i.MX53: add uart2 pinctrl
  ARM: dts: add Ka-Ro tx53 devicetree

 arch/arm/boot/dts/imx53-tx53.dtsi | 122 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx53.dtsi      |  60 +++++++++++++++++++
 2 files changed, 182 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-tx53.dtsi

-- 
1.8.2.rc2
