From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/3] arm64: remove paragraph about writing to FSF
Date: Tue, 21 Jul 2015 22:43:57 +0800
Message-ID: <1437489840-2368-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These patches remove paragraph about writing to FSF in arch/arm64 dir.

Jisheng Zhang (3):
  arm64: hugetlb: remove paragraph about writing to FSF
  arm64: dts: cavium: remove paragraph about writing to FSF
  arm64: dts: freescale: remove paragraph about writing to FSF

 arch/arm64/boot/dts/cavium/thunder-88xx.dts        | 5 -----
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       | 5 -----
 arch/arm64/boot/dts/freescale/fsl-ls2085a-simu.dts | 5 -----
 arch/arm64/boot/dts/freescale/fsl-ls2085a.dtsi     | 5 -----
 arch/arm64/include/asm/hugetlb.h                   | 4 ----
 arch/arm64/mm/hugetlbpage.c                        | 4 ----
 6 files changed, 28 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
