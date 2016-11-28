From: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] eeprom: Add IDT 89HPESx EEPROM/CSR driver
Date: Tue, 29 Nov 2016 01:38:19 +0300
Message-ID: <1480372701-30560-1-git-send-email-fancer.lancer@gmail.com>
References: <1475450025-29507-1-git-send-email-fancer.lancer@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475450025-29507-1-git-send-email-fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: Sergey.Semin-vHJ8rsvMqnUPfZBKTuL5GA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Following changes are made in accordance with Greg KH notes as well as
fixing some found issues:
- Get rid of dev_*_idt() macros
- IDT CSR debug file is moved to debugfs
- BIN_ATTR is used to declare sysfs binary attribute
- Moved bindings file to a separate patch
- Need to create a specific bin_attribute structure for each device
- Perform a few read retries with delays if EEPROM is busy

Signed-off-by: Serge Semin <fancer.lancer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Serge Semin (2):
  MISC eeprom: Add IDT 89HPESx EEPROM/CSR driver
  MISC eeprom: Add IDT 89HPESx driver bindings file

 .../devicetree/bindings/misc/idt_89hpesx.txt       |   41 +
 drivers/misc/eeprom/Kconfig                        |   10 +
 drivers/misc/eeprom/Makefile                       |    1 +
 drivers/misc/eeprom/idt_89hpesx.c                  | 1577 ++++++++++++++++++++
 4 files changed, 1629 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/idt_89hpesx.txt
 create mode 100644 drivers/misc/eeprom/idt_89hpesx.c

-- 
2.6.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
