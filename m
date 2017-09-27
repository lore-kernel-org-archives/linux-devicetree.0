From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/6] dt-bindings: rtc: document existing bindings
Date: Wed, 27 Sep 2017 16:03:39 +0200
Message-ID: <20170927140345.5537-1-alexandre.belloni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Document currently undocumented bindings.

Rob, as discussed, all of this can probably go through your tree.

Changes in v2:
 - made a proper series
 - fixed sirf2 example
 - listed the ds1307 compatible that support the trickle charging properties

Alexandre Belloni (6):
  dt-bindings: trivial: Add RTCs
  dt-bindings: rtc: add stericsson,coh901331 bindings
  dt-bindings: rtc: Add sirf,prima2-sysrtc bindings
  dt-bindings: rtc: DS1307 and compatibles are not trivial
  dt-bindings: rtc: Add bindings for m41t80 and compatibles
  dt-bindings: rtc: merge ds1339 in ds1307 documentation

 .../devicetree/bindings/rtc/dallas,ds1339.txt      | 18 ---------
 .../devicetree/bindings/rtc/rtc-ds1307.txt         | 44 ++++++++++++++++++++++
 .../devicetree/bindings/rtc/rtc-m41t80.txt         | 31 +++++++++++++++
 .../devicetree/bindings/rtc/sirf,prima2-sysrtc.txt | 13 +++++++
 .../bindings/rtc/stericsson,coh901331.txt          | 17 +++++++++
 .../devicetree/bindings/trivial-devices.txt        | 13 +++----
 6 files changed, 110 insertions(+), 26 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/dallas,ds1339.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-m41t80.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/sirf,prima2-sysrtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/stericsson,coh901331.txt

-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
