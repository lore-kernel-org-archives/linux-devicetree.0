From: Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 0/2] Add devicetree for TQMA53 embedded module
Date: Mon,  7 Jan 2013 16:15:58 +0100
Message-ID: <1357571760-487-1-git-send-email-s.trumtrar@pengutronix.de>
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
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi!

This series adds devicetree support for the TQMA53 embedded module.
As this module can't operate without a base board, most devices are
disabled in the DT and would have to be enabled in an extra .dts, that
includes the imx53-tqma53.dtsi.

Also, add the missing pinctrl groups to the imx53.dtsi.

The base for this patches is 3.8-rc2.

Regards,
Steffen


Sascha Hauer (1):
  ARM i.MX53: add dts for the TQ tqma53 module

Steffen Trumtrar (1):
  ARM: dts: imx53: pinctrl update

 arch/arm/boot/dts/imx53-tqma53.dtsi |  207 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx53.dtsi        |   53 +++++++++
 2 files changed, 260 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx53-tqma53.dtsi

-- 
1.7.10.4
