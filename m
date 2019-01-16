From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH 0/2] usb: dwc3: Add avoiding vbus glitch happen during xhci
 reset
Date: Wed, 16 Jan 2019 06:48:03 +0000
Message-ID: <20190116064820.20007-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

This to fix USB enumeration compatibility issue found on DWC3 (host mode)
IP only.

Some pre-discussion mails can be referred from:
https://lkml.org/lkml/2018/11/23/387
https://lkml.org/lkml/2018/11/22/683

As to the workaround, I know programming xhci register in DWC3 dirver
(probe function) is not good from perspective of SW stack, but it seems
to be the only place to fix this real existing problem (test result show
that doing this in xhci-plat.c or xhci.c would not hlep on this kind of
failure). If who have better idea, please let me know, thanks in advanced.

Ran Wang (2):
 dt-bindings: Add workaround for host mode VBUS glitch when boot
 dwc3 core driver: Add avoiding vbus glitch happen during xhci reset

 Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
 drivers/usb/dwc3/core.c |   47 +++++++++++++++++++++++++++++++++++++++++++=
++++
 drivers/usb/dwc3/core.h |   10 +++++++++-
 3 files changed, 60 insertions(+), 0 deletions(-)
--=20
1.7.1
