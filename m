From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/3] mailbox: New mailbox driver for ST
Date: Tue,  3 Mar 2015 10:41:20 +0000
Message-ID: <1425379283-1567-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This set provides support for ST's Mailbox IP.

In order to save IRQ lines, current platforms have been only been
given a single interrupt for receiving messages from co-processors.
The best way to work around this limitation is to use Mailbox 1
(A9) as the receiving MB.  This driver/binding then has the ability
to map the remaining Mailboxes back to Mailbox 1 where threaded
interrupts are used to extract data to send back to the user.

Lee Jones (3):
  ARM: STi: stih407-family: Add nodes for Mailbox
  mailbox: dt: Supply bindings for ST's Mailbox IP
  mailbox: Add support for ST's Mailbox IP

 .../devicetree/bindings/mailbox/sti-mailbox.txt    |  66 ++
 arch/arm/boot/dts/stih407-family.dtsi              |  67 +++
 drivers/mailbox/Kconfig                            |   7 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-sti.c                      | 664 +++++++++++++++++++++
 include/linux/mailbox_sti.h                        | 128 ++++
 6 files changed, 934 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/sti-mailbox.txt
 create mode 100644 drivers/mailbox/mailbox-sti.c
 create mode 100644 include/linux/mailbox_sti.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
