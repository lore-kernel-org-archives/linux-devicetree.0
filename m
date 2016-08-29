From: Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 0/2 v2] arm64: dts: ls1043a/ls2080a serial updates
Date: Mon, 29 Aug 2016 13:31:11 -0500
Message-ID: <1472495473-27387-1-git-send-email-stuart.yoder@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stuart Yoder <stuart.yoder-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series serial aliases for ls2080a-rdb/qds and ls1043a-rdb,
fixes the aliases in ls1043a-qds and sets stdout-path for all the
boards.

-v2:
  -fix typo in commit message

Stuart Yoder (2):
  arm64: dts: updates serial aliases for ls1043a rdb and qds boards
  arm64: dts: add stdout-path to chosen node for ls2080a/ls1043a boards

 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts | 14 ++++++++------
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts |  8 ++++++++
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts |  3 +++
 arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dts |  4 ++++
 4 files changed, 23 insertions(+), 6 deletions(-)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
