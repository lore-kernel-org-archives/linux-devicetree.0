From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 0/2] Split pinctrl device for Meson8 / Meson8b and update docs
Date: Wed, 23 Mar 2016 10:13:58 +0100
Message-ID: <1458724440-32228-1-git-send-email-carlo@caione.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-6IF/jdPJHihWk0Htik3J/w@public.gmane.org, linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>

With http://www.spinics.net/lists/devicetree/msg116771.html we split / refactor
the pinctrl driver to have two different pinctrl devices for each bus.

Unfortunately these two patches still haven't found their way to mainline.
Reposting them as standalone patchset. Hopefully they can be ACKed as soon as
possible.

Carlo Caione (2):
  ARM: dts: amlogic: Split pinctrl device for Meson8 / Meson8b
  documentation: Fix pinctrl documentation for Meson8 / Meson8b

 .../devicetree/bindings/pinctrl/meson,pinctrl.txt  | 38 +++------------
 arch/arm/boot/dts/meson8.dtsi                      | 57 ++++++++++++----------
 arch/arm/boot/dts/meson8b.dtsi                     | 12 ++++-
 3 files changed, 49 insertions(+), 58 deletions(-)

-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
