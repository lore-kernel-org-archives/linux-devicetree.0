From: "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH 0/3] NFC: trf7970a: Add driver with NFC Type 2 and Type V Support
Date: Fri, 31 Jan 2014 15:17:08 -0700
Message-ID: <1391206631-9862-1-git-send-email-mgreer@animalcreek.com>
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Erick Macias <emacias-l0cyMroinI0@public.gmane.org>, Thierry Escande <thierry.escande-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Mark A. Greer" <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a driver for the TI TRF7970A RFID/NFC/15693 Transceiver.
The driver was started by Erick Macias and Felipe Balbi but has
been changed significantly by me.  Because of that, Felipe has
allowed me to replace his name by mine in the MODULE_AUTHOR()
line.

The trf7970a has a low-level interface so it requires the NFC
digital layer.

It has been tested on a couple different consumer Type 2 tags
and 3 different types of TI Tag-it HF-I tags.  It seems stable
but the device often reports a CRC or collision error when moving
a tag into the RF field while actively polling.  That means that
an EIO error will be reported and you'll have to retry the poll
in order to communicate with the tag.

The driver is broken into two patches: one for the majority of
the driver which includes 14443 Type 2 (MIFARE Ultralight and
Ultralight C) tags and another for 15693 Type V support.  The
third patch adds DTS documentation.

Mark A. Greer (3):
  NFC: trf7970a: Add driver with ISO/IEC 14443 Type 2 Tag Support
  NFC: trf7970a: Add ISO/IEC 15693 Support
  NFC: trf7970a: Add DTS Documentation

 .../devicetree/bindings/net/nfc/trf7970a.txt       |   37 +
 drivers/nfc/Kconfig                                |   12 +
 drivers/nfc/Makefile                               |    1 +
 drivers/nfc/trf7970a.c                             | 1338 ++++++++++++++++++++
 4 files changed, 1388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nfc/trf7970a.txt
 create mode 100644 drivers/nfc/trf7970a.c

-- 
1.8.3.4

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
