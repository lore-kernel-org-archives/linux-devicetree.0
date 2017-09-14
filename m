From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/3] SoM1 EK board fixes
Date: Thu, 14 Sep 2017 17:28:11 +0300
Message-ID: <1505399294-20041-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: devicetree@vger.kernel.org

Hi,

This series contains fixes for SAMA5D27 SoM1 EK board. It would be
good if we will have this in 4.14 version.

Thank you,
Claudiu

Ludovic Desroches (2):
  ARM: dts: at91: sama5d27_som1_ek: update pinmux/pinconf for LEDs and
    USB
  ARM: dts: at91: sama5d27_som1_ek: fix typos

Nicolas Ferre (1):
  ARM: dts: at91: sama5d27_som1_ek: fix USB host vbus

 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

-- 
2.7.4
