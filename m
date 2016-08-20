From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 0/7] ARM: dts: imx: add gpio-ranges properties to some iMX GPIO controllers
Date: Sat, 20 Aug 2016 23:04:44 +0300
Message-ID: <1471723491-15330-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Deepak Das <deepak_das-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

% gawk -n '{ sub(/.*__/, ""); if ($1 ~ "^GPIO") print $1, $2/4}' \
	arch/arm/boot/dts/imxXX-pinfunc.h | sort -n

Note that this means that potential errors in arch/arm/boot/dts/imx*-pinfunc.h
descriptions may migrate to this change, please double check the values.

If needed similar changes may be done for the rest of iMX SoCs.

Changes from v1 to v2:
* in copy-pasted commit messages corrected SoC names

Vladimir Zapolskiy (7):
  ARM: dts: add gpio-ranges property to iMX50 GPIO controllers
  ARM: dts: add gpio-ranges property to iMX6Q/D GPIO controllers
  ARM: dts: add gpio-ranges property to iMX6DL/S GPIO controllers
  ARM: dts: add gpio-ranges property to iMX6SL GPIO controllers
  ARM: dts: add gpio-ranges property to iMX6SX GPIO controllers
  ARM: dts: add gpio-ranges property to iMX6UL GPIO controllers
  ARM: dts: add gpio-ranges property to iMX7D/S GPIO controllers

 arch/arm/boot/dts/imx50.dtsi  | 16 +++++++++++++
 arch/arm/boot/dts/imx6dl.dtsi | 53 +++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q.dtsi  | 37 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6sl.dtsi | 52 ++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/imx6sx.dtsi | 14 ++++++++++++
 arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++
 arch/arm/boot/dts/imx7s.dtsi  | 14 ++++++++++++
 7 files changed, 197 insertions(+)

-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
