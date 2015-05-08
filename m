From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] MIPS: BMIPS: dts: update device nodes for bcm7xxx platforms
Date: Fri,  8 May 2015 21:59:16 +0900
Message-ID: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This patch series contain changing device nodes of the bcm7xxx platforms.

Jaedon Shin (2):
  MIPS: BMIPS: dts: remove unsupported entry for bcm7362
  MIPS: BMIPS: dts: add uart device nodes to bcm7xxx platforms

 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  | 10 +++++++++-
 8 files changed, 137 insertions(+), 1 deletion(-)

-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
