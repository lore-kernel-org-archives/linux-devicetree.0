From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] scripts/dtc: dt_to_config - show lists
Date: Fri, 10 Jun 2016 16:03:52 -0700
Message-ID: <575B4758.5090209@gmail.com>
References: <575B46CE.6080903@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <575B46CE.6080903-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gaurav.minocha.os-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org
List-Id: devicetree@vger.kernel.org


These compatibles are hard coded to have no driver.

   none
   pci
   simple-bus


The driver for these compatibles is hard coded (white list).

   cache          hardcoded_no_driver
   eeprom         hardcoded_no_driver
   gpio           hardcoded_no_driver
   gpio-keys      drivers/input/keyboard/gpio_keys.c
   i2c-gpio       drivers/i2c/busses/i2c-gpio.c
   isa            arch/mips/mti-malta/malta-dt.c
                  arch/x86/kernel/devicetree.c
   led            hardcoded_no_driver
   m25p32         hardcoded_no_driver
   m25p64         hardcoded_no_driver
   m25p80         hardcoded_no_driver
   mtd-ram        drivers/mtd/maps/physmap_of.c
   pwm-backlight  drivers/video/backlight/pwm_bl.c
   spidev         hardcoded_no_driver
   syscon         drivers/mfd/syscon.c
   tlv320aic23    hardcoded_no_driver
   wm8731         hardcoded_no_driver


The configuration option for these drivers is hard coded (white list).

   arch/arm/mach-imx/platsmp.c        CONFIG_SOC_IMX6 && CONFIG_SMP
                                      CONFIG_SOC_LS1021A && CONFIG_SMP
   drivers/usb/host/ehci-ppc-of.c     CONFIG_USB_EHCI_HCD
                                      CONFIG_USB_EHCI_HCD_PPC_OF
   drivers/usb/host/ehci-xilinx-of.c  CONFIG_USB_EHCI_HCD
                                      CONFIG_USB_EHCI_HCD_XILINX
   drivers/usb/host/ohci-ppc-of.c     CONFIG_USB_OHCI_HCD
                                      CONFIG_USB_OHCI_HCD_PPC_OF
   drivers/usb/host/uhci-platform.c   CONFIG_USB_UHCI_HCD
                                      CONFIG_USB_UHCI_PLATFORM


These drivers are black listed.



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
