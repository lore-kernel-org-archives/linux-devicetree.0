From: Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
Subject: [PATCH v2 0/7] NFC: trf7970a: Fixups & convert to desc-based GPIO
Date: Tue, 20 Dec 2016 11:32:37 -0700
Message-ID: <20161220183244.5171-1-mgreer@animalcreek.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lauro Ramos Venancio <lauro.venancio-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, Aloisio Almeida Jr <aloisio.almeida-430g2QfJUUCGglJvpFV4uA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, Mark Greer <mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

These trf7970a driver patches do the following things:
 - a couple minor fixups
 - allow EN2 to not be managed by the driver (e.g., when its tied low by
   hardware
 - convert the driver to use the descriptor-based GPIO interface
 - fix up coding style issues
 - change the DTS example to indicate that EN and EN2 are active high GPIOs
 - Add Mark Greer as the maintainer of the trf7970a driver

Samuel, these will likely conflict with patches from Geoff Lansberry
so let me know if you want me to rebase on top of his patches.

Based on e93b1cc8a896 (Merge branch 'for_linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs)

v1->v2:
 - Commit description fixups only; no functional changes.

Mark Greer (7):
  NFC: trf7970a: Don't de-assert EN2 unless it was asserted
  NFC: trf7970a: Don't manage EN2 when not specified in DT
  NFC: trf7970a: Convert to descriptor based GPIO interface
  NFC: trf7970a: Remove useless comment
  NFC: trf7970a: Clean up coding style issues
  NFC: trf7970a: Enable pins are active high not active low
  MAINTAINERS: NFC: trf7970a: Add Mark Greer as maintainer

 .../devicetree/bindings/net/nfc/trf7970a.txt       |   4 +-
 MAINTAINERS                                        |   7 +
 drivers/nfc/Kconfig                                |   2 +-
 drivers/nfc/trf7970a.c                             | 311 ++++++++++-----------
 4 files changed, 165 insertions(+), 159 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
