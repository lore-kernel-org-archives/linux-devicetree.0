From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/3] MIPS: dts: qca: ar9132: misc fixes
Date: Thu, 21 Jan 2016 12:59:02 +0300
Message-ID: <1453370345-16688-1-git-send-email-antonynpavlov@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Antony Pavlov (3):
  MIPS: dts: qca: ar9132_tl_wr1043nd_v1.dts: drop unused alias node
  MIPS: dts: qca: ar9132: drop unused extosc mentions
  MIPS: dts: qca: ar9132: use short references for uart and spi nodes

 arch/mips/boot/dts/qca/ar9132.dtsi               |  7 +-
 arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dts | 84 ++++++++++--------------
 2 files changed, 35 insertions(+), 56 deletions(-)

-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
