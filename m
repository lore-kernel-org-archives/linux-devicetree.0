From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: Excluding pins from Linux control
Date: Mon, 27 Feb 2017 19:02:01 +0100 (CET)
Message-ID: <433834766.313467.1488218521360@email.1und1.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

on BCM2835 (Raspberry Pi) the firmware on the VideoCore and Linux on the ARM core share a common pin "space". Depending on the board revision the VideoCore needs to controls some pins, which shouldn't be claimed by Linux on the ARM.

What is the right way to exclude control on Linux for those pins in order to avoid possible harmful operations?

I tought of this [1] but only for pins.

[1] - http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

Regards
Stefan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
