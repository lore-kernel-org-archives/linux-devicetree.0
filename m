From: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/2] add Meson8/Meson8b serial core clock handling
Date: Sat, 28 Oct 2017 14:34:28 +0200
Message-ID: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, hgkr.klein-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset adds the tty/serial core clock handling to the UARTs
on Meson8 and Meson8b.

Basically this is the Meson8 and Meson8b version of a patchset from
Helmut Klein and Neil Armstrong, who implemented this for Meson GX
(see [0]). Back then I asked Neil to drop Meson8b from his patchset
because I was working on the Meson8 clock controller at that time.

This also removes the last users that rely on the "amlogic,meson-uart"
binding. Removing that binding from the meson_uart driver is not part
of this series though.


[0] http://lists.infradead.org/pipermail/linux-amlogic/2017-June/004173.html

Martin Blumenstingl (2):
  ARM: dts: meson8: use stable UART bindings with correct gate clock
  ARM: dts: meson8b: use stable UART bindings with correct gate clock

 arch/arm/boot/dts/meson8.dtsi  | 16 ++++++++++++----
 arch/arm/boot/dts/meson8b.dtsi | 16 ++++++++++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.14.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
