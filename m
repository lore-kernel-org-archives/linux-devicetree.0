From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/2] arm: dts: berlin: use stdout-path
Date: Mon, 6 Jul 2015 17:50:32 +0800
Message-ID: <1436176234-819-1-git-send-email-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These two simple patches use stdout-path to specify the console.
The first patch add aliases for serial uarts. The second patch
removes the console argument from the command line, uses stdout-path
instead.

Jisheng Zhang (2):
  arm: dts: berlin: add aliases for serial
  arm: dts: berlin: use stdout-path

 arch/arm/boot/dts/berlin2-sony-nsz-gs7.dts        | 3 ++-
 arch/arm/boot/dts/berlin2.dtsi                    | 6 ++++++
 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 3 ++-
 arch/arm/boot/dts/berlin2cd.dtsi                  | 5 +++++
 arch/arm/boot/dts/berlin2q-marvell-dmp.dts        | 3 ++-
 arch/arm/boot/dts/berlin2q.dtsi                   | 5 +++++
 6 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
