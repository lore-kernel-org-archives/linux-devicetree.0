From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] ARM: dts: fix cpu compatible values
Date: Fri, 25 Sep 2015 20:35:06 +0300
Message-ID: <1443202506-13732-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The changeset corrects severeal cpu compatible properties
to defined ones in Documentation/devicetree/bindings/arm/cpus.txt

Vladimir Zapolskiy (5):
  ARM: dts: i.MX31: fix cpu compatible value
  ARM: dts: i.MX35: fix cpu compatible value
  ARM: dts: S3C2416: fix cpu compatible value
  ARM: dts: TI-Nspire: fix cpu compatible value
  ARM: dts: WM8750: fix cpu compatible value

 arch/arm/boot/dts/imx31.dtsi   | 2 +-
 arch/arm/boot/dts/imx35.dtsi   | 2 +-
 arch/arm/boot/dts/nspire.dtsi  | 2 +-
 arch/arm/boot/dts/s3c2416.dtsi | 2 +-
 arch/arm/boot/dts/wm8750.dtsi  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
