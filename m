From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] MIPS: BMIPS: Add Broadcom STB device nodes
Date: Fri, 17 Nov 2017 11:19:41 +0900
Message-ID: <20171117021944.894-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds power and memory management related devie tree nodes for
Broadcom STB platforms.

Jaedon Shin (3):
  MIPS: BMIPS: Add Broadcom STB power management nodes
  MIPS: BMIPS: Add Broadcom STB wake-up timer nodes
  MIPS: BMIPS: Add Broadcom STB watchdog nodes

 arch/mips/boot/dts/brcm/bcm7125.dtsi      |  7 +++
 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 62 +++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 17 ++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 62 +++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 62 +++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7420.dtsi      |  7 +++
 arch/mips/boot/dts/brcm/bcm7425.dtsi      | 89 +++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi      | 89 +++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 ++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 +++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 +++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  8 +++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  8 +++
 arch/mips/boot/dts/brcm/bcm97420c.dts     |  4 ++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  8 +++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  8 +++
 16 files changed, 451 insertions(+)

-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
