From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 0/5] arm64: dts: Initial RTD1293/RTD1296 and DS418j/DS418 support
Date: Mon, 16 Oct 2017 06:01:45 +0200
Message-ID: <20171016040150.23400-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bizon <bizongod-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, info-UelDjCVBxVpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

This series adds Device Trees for the Realtek RTD1293 and RTD1296 SoCs and
Synology DiskStation DS418j and DS418 NAS devices.

To avoid too much duplication, a shared rtd129x.dtsi is introduced.

More details at:
https://en.opensuse.org/HCL:DS418j
https://en.opensuse.org/HCL:DS418

Latest experimental patches at:
https://github.com/afaerber/linux/commits/rtd1295-next

Have a lot of fun!

Cheers,
Andreas

Cc: info-UelDjCVBxVpWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Andreas Färber (5):
  arm64: dts: realtek: Factor out common RTD129x parts
  dt-bindings: arm: realtek: Document RTD1293 and Synology DS418j
  arm64: dts: realtek: Add RTD1293 and Synology DS418j
  dt-bindings: arm: realtek: Document RTD1296 and Synology DS418
  arm64: dts: realtek: Add RTD1296 and Synology DS418

 Documentation/devicetree/bindings/arm/realtek.txt | 34 +++++++++++
 arch/arm64/boot/dts/realtek/Makefile              |  4 ++
 arch/arm64/boot/dts/realtek/rtd1293-ds418j.dts    | 31 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1293.dtsi          | 56 +++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi          | 65 ++------------------
 arch/arm64/boot/dts/realtek/rtd1296-ds418.dts     | 31 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi          | 74 +++++++++++++++++++++++
 arch/arm64/boot/dts/realtek/rtd129x.dtsi          | 72 ++++++++++++++++++++++
 8 files changed, 306 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1293-ds418j.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1293.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296-ds418.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296.dtsi
 create mode 100644 arch/arm64/boot/dts/realtek/rtd129x.dtsi

-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
