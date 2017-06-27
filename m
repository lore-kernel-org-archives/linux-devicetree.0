From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: [PATCH 1/4] ARM: aspeed: g4: Add USB functions to pinctrl bindings
Date: Tue, 27 Jun 2017 11:42:11 +0930
Message-ID: <20170627021214.23323-2-andrew@aj.id.au>
References: <20170627021214.23323-1-andrew@aj.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170627021214.23323-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, ryan_chen-SAlXDmAnmOAqDJ6do+/SaQ@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The AST2400 contains several USB controllers:

* USB 1.1 Host Controller
* USB 2.0 Host Controller
* Combined USB 2.0 Virtual Hub and USB 1.1 HID Controller

Pins for three ports are routed to the three controllers such that:

* Port 1 is a dedicated USB 1.1 host port
* Port 2 is shared between the USB 1.1 host and HID controllers
* Port 3 is shared between the USB 2.0 host and Hub controllers

As the pins for port 1 are fixed function there is no associated mux
function or group described in the bindings. Ports 2 and 3 are muxed as
above, and the table below describes the mapping between pinmux function
names and ports:

Port  | USB Version  | USB Mode  | Mux Function
------|--------------|-----------|-------------
1     | 1.1          | Host      | -
2     | 1.1          | Host      | USB11H2
2     | 1.1          | Device    | USB11D1
3     | 2.0          | Host      | USB2H1
3     | 2.0          | Device    | USB2D1

Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
index ca01710ee29a..09142dab47db 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
@@ -69,8 +69,9 @@ PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RGMII2 RMII1 RMII2 ROM16 ROM8 ROMCS1
 ROMCS2 ROMCS3 ROMCS4 RXD1 RXD2 RXD3 RXD4 SALT1 SALT2 SALT3 SALT4 SD1 SD2 SGPMCK
 SGPMI SGPMLD SGPMO SGPSCK SGPSI0 SGPSI1 SGPSLD SIOONCTRL SIOPBI SIOPBO SIOPWREQ
 SIOPWRGD SIOS3 SIOS5 SIOSCI SPI1 SPI1DEBUG SPI1PASSTHRU SPICS1 TIMER3 TIMER4
-TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USBCKI VGABIOS_ROM VGAHS
-VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1 WDTRST2
+TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD2 TXD3 TXD4 UART6 USB11D1 USB11H2 USB2D1
+USB2H1 USBCKI VGABIOS_ROM VGAHS VGAVS VPI18 VPI24 VPI30 VPO12 VPO24 WDTRST1
+WDTRST2
 
 aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
