From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2 0/2] arm64: Trivial DT cleanups
Date: Tue, 14 Jun 2016 08:00:12 -0500
Message-ID: <20160614125756.22169.50783.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Duc Dang <dhdang-qTEPVZfXA3Y@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use lowercase consistently and drop '0x' prefixes from unit addresses.
These could be squashed together; I just separated them for ease of
reviewing.

---

Bjorn Helgaas (2):
      arm64: dts: apm: Use lowercase consistently for hex constants
      arm64: dts: apm: Remove leading '0x' from unit addresses


 .../devicetree/bindings/net/apm-xgene-enet.txt     |    4 +
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |   60 ++++++++++----------
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |   36 ++++++------
 3 files changed, 50 insertions(+), 50 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
