From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] MIPS: BMIPS: dts: add NAND device nodes for bcm7xxx platforms
Date: Wed, 24 Jun 2015 15:08:30 +0900
Message-ID: <cover.1435124524.git.jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series contain changing device nodes of the bcm7xxx platforms.

Jaedon Shin (4):
  MIPS: BMIPS: bcm7346: add nodes for NAND
  MIPS: BMIPS: bcm7358: add nodes for NAND
  MIPS: BMIPS: bcm7360: add nodes for NAND
  MIPS: BMIPS: bcm7362: add nodes for NAND

 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  | 23 +++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  | 23 +++++++++++++++++++++++
 8 files changed, 180 insertions(+)

-- 
2.4.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
