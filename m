From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH v2 0/3] eMMC, SD-card and ethernet support for Vega S95 boards
Date: Sun,  4 Sep 2016 20:29:00 +0200
Message-ID: <20160904182903.1841-1-martin.blumenstingl@googlemail.com>
References: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160815133811.19646-1-martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: will.deacon-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This adds support for the internal eMMC, the SD-card slot and ethernet on
all Tronsmart S95 Vega boards.
There are some S95 Vega Meta clones out there where the bootloader does
not configure the ethernet registers correctly, leading to non-working
ethernet. This will be fixed in a separate series. Boards which are not
suffering from broken bootloaders have fully working ethernet.

Changes since v1:
- rebased after latest updates which added the IR decoder to
  meson-gxbb-vega-s95.dtsi

Changes since the RFC:
- added eMMC support
- renamed fixed 3V3 regulator so it can be re-used for eMMC


Martin Blumenstingl (3):
  ARM64: dts: amlogic: SD card support for all Tronsmart Vega S95
    devices
  ARM64: dts: amlogic: eMMC support for all Tronsmart Vega S95 devices
  ARM64: dts: amlogic: enable ethernet on all Tronsmart Vega S95 devices

 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 67 ++++++++++++++++++++++
 1 file changed, 67 insertions(+)

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
