From: Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH 0/3] usb: add device tree support for fotg2-hcd driver
Date: Wed,  8 Feb 2017 21:00:07 +0100
Message-ID: <20170208200010.21522-1-ulli.kroll@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding and DT driver support for fotg2-hcd controller
The device is used on Gemini SoC.

striped down dmesg

fotg210_hcd: FOTG210 Host Controller (EHCI) Driver
fotg210-hcd 68000000.usb: Faraday USB2.0 Host Controller
fotg210-hcd 68000000.usb: new USB bus registered, assigned bus number 1
fotg210-hcd 68000000.usb: irq 27, io mem 0x68000000
fotg210-hcd 68000000.usb: USB 2.0 started, EHCI 1.00
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
fotg210-hcd 69000000.usb: Faraday USB2.0 Host Controller
fotg210-hcd 69000000.usb: new USB bus registered, assigned bus number 2
fotg210-hcd 69000000.usb: irq 28, io mem 0x69000000
fotg210-hcd 69000000.usb: USB 2.0 started, EHCI 1.00
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected

Greetings
Hans Ulli Kroll


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
