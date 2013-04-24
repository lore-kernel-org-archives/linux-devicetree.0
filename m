From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] ARM: at91: dt: switch to pre-processor
Date: Wed, 24 Apr 2013 16:56:27 +0200
Message-ID: <20130424145627.GL4998@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
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
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

HI,

	The follow patch series switch the at91 to DT pre-processor

	So we can use macro for AIC and Pinctrl instead of magic

  ARM: at91: dt: switch to pre-processor (2013-04-24 22:54:39 +0800)

----------------------------------------------------------------
Jean-Christophe PLAGNIOL-VILLARD (3):
      ARM: at91: dt: add pinctrl pre-processor define
      ARM: at91: dt: add AIC pre-processor define
      ARM: at91: dt: switch to pre-processor

 arch/arm/boot/dts/aks-cdu.dts               |   12 +--
 arch/arm/boot/dts/animeo_ip.dts             |   19 ++--
 arch/arm/boot/dts/at91-aic.h                |   19 ++++
 arch/arm/boot/dts/at91-ariag25.dts          |    6 +-
 arch/arm/boot/dts/at91-pinctrl.h            |   35 ++++++
 arch/arm/boot/dts/at91rm9200.dtsi           |  162 ++++++++++++++--------------
 arch/arm/boot/dts/at91rm9200ek.dts          |   10 +-
 arch/arm/boot/dts/at91sam9260.dtsi          |  195 ++++++++++++++++-----------------
 arch/arm/boot/dts/at91sam9263.dtsi          |  187 ++++++++++++++++----------------
 arch/arm/boot/dts/at91sam9263ek.dts         |   25 ++---
 arch/arm/boot/dts/at91sam9g15.dtsi          |    2 +-
 arch/arm/boot/dts/at91sam9g15ek.dts         |    4 +-
 arch/arm/boot/dts/at91sam9g20.dtsi          |    2 +-
 arch/arm/boot/dts/at91sam9g20ek.dts         |    7 +-
 arch/arm/boot/dts/at91sam9g20ek_2mmc.dts    |   11 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi |   29 +++--
 arch/arm/boot/dts/at91sam9g25.dtsi          |    2 +-
 arch/arm/boot/dts/at91sam9g25ek.dts         |    4 +-
 arch/arm/boot/dts/at91sam9g35.dtsi          |    2 +-
 arch/arm/boot/dts/at91sam9g35ek.dts         |    4 +-
 arch/arm/boot/dts/at91sam9g45.dtsi          |  201 +++++++++++++++++-----------------
 arch/arm/boot/dts/at91sam9m10g45ek.dts      |   38 +++----
 arch/arm/boot/dts/at91sam9n12.dtsi          |  125 +++++++++++-----------
 arch/arm/boot/dts/at91sam9n12ek.dts         |   14 +--
 arch/arm/boot/dts/at91sam9x25.dtsi          |   22 ++--
 arch/arm/boot/dts/at91sam9x25ek.dts         |    4 +-
 arch/arm/boot/dts/at91sam9x35.dtsi          |    2 +-
 arch/arm/boot/dts/at91sam9x35ek.dts         |    4 +-
 arch/arm/boot/dts/at91sam9x5.dtsi           |  263 +++++++++++++++++++++++----------------------
 arch/arm/boot/dts/at91sam9x5cm.dtsi         |    8 +-
 arch/arm/boot/dts/at91sam9x5ek.dtsi         |   15 +--
 arch/arm/boot/dts/ethernut5.dts             |    7 +-
 arch/arm/boot/dts/evk-pro3.dts              |    6 +-
 arch/arm/boot/dts/ge863-pro3.dtsi           |    2 +-
 arch/arm/boot/dts/kizbox.dts                |   17 +--
 arch/arm/boot/dts/mpa1600.dts               |    5 +-
 arch/arm/boot/dts/pm9g45.dts                |   22 ++--
 arch/arm/boot/dts/sama5d3.dtsi              |  451 +++++++++++++++++++++++++++++++++++++++--------------------------------------
 arch/arm/boot/dts/sama5d31ek.dts            |    6 +-
 arch/arm/boot/dts/sama5d33ek.dts            |    4 +-
 arch/arm/boot/dts/sama5d34ek.dts            |    6 +-
 arch/arm/boot/dts/sama5d35ek.dts            |    4 +-
 arch/arm/boot/dts/sama5d3xcm.dtsi           |    4 +-
 arch/arm/boot/dts/sama5d3xdm.dtsi           |    2 +-
 arch/arm/boot/dts/sama5d3xmb.dtsi           |   26 ++---
 arch/arm/boot/dts/tny_a9260.dts             |    5 +-
 arch/arm/boot/dts/tny_a9263.dts             |    5 +-
 arch/arm/boot/dts/tny_a9g20.dts             |    5 +-
 arch/arm/boot/dts/usb_a9260.dts             |    5 +-
 arch/arm/boot/dts/usb_a9260_common.dtsi     |    6 +-
 arch/arm/boot/dts/usb_a9263.dts             |    9 +-
 arch/arm/boot/dts/usb_a9g20-dab-mmx.dtsi    |   22 ++--
 arch/arm/boot/dts/usb_a9g20.dts             |    5 +-
 53 files changed, 1071 insertions(+), 986 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-aic.h
 create mode 100644 arch/arm/boot/dts/at91-pinctrl.h

Best Regards,
J.
