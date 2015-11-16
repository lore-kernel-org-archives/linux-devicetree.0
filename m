From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RESEND 0/8] {arm|arm64}: berlin: add watchdog support
Date: Mon, 16 Nov 2015 19:09:46 +0800
Message-ID: <1447672194-483-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In Marvell berlin SoCs, there are watchdogs which are compatible with the
snps,dw-wdt driver. This series try to add watchdog support for them.

Jisheng Zhang (8):
  arm: dts: berlin2q: add watchdog nodes
  arm: dts: berlin2cd: add watchdog nodes
  arm: dts: berlin2: add watchdog nodes
  arm64: dts: berlin4ct: add watchdog nodes
  arm: dts: berlin: enable wdt0 on Sony NSZ-GS7
  ARM: dts: berlin: enable wdt0 on the Google Chromecast
  arm: dts: berlin: enable wdt0 on the Marvell BG2Q DMP
  arm64: dts: berlin: enable wdt0 on the Marvell BG4CT STB board

 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        |  2 ++
 arch/arm/boot/dts/berlin2.dtsi                    | 24 +++++++++++++++++++++++
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts |  2 ++
 arch/arm/boot/dts/berlin2cd.dtsi                  | 24 +++++++++++++++++++++++
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts        |  4 ++++
 arch/arm/boot/dts/berlin2q.dtsi                   | 24 +++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/berlin4ct-stb.dts     |  4 ++++
 arch/arm64/boot/dts/marvell/berlin4ct.dtsi        | 24 +++++++++++++++++++++++
 8 files changed, 108 insertions(+)

-- 
2.6.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
