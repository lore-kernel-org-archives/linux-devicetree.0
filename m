From: Ran Wang <ran.wang_1@nxp.com>
Subject: [PATCH 1/2] usb: dwc3: Add avoiding vbus glitch happen during xhci
 reset
Date: Wed, 16 Jan 2019 06:48:06 +0000
Message-ID: <20190116064820.20007-2-ran.wang_1@nxp.com>
References: <20190116064820.20007-1-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116064820.20007-1-ran.wang_1@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ran Wang <ran.wang_1@nxp.com>
List-Id: devicetree@vger.kernel.org

When DWC3 is set to host mode by programming register DWC3_GCTL, VUBS
(or its control signal) will on immediately on related Root Hub ports.
Then the VUBS will be de-asserted for a little while during xhci
reset (conducted by xhci driver) for a little while and back to normal.

This VBUS glitch might cause some USB devices emuration fail if kernel boot
with them connected. One SW workaround which can fix this is to program
all PORTSC[PP] to 0 to turn off VBUS immediately after setting host mode
in DWC3 driver(per signal measurement result, it will be too late to do
it in xhci-plat.c or xhci.c).

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
 Documentation/devicetree/bindings/usb/dwc3.txt |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation=
/devicetree/bindings/usb/dwc3.txt
index 8e5265e..dadb530 100644
--- a/Documentation/devicetree/bindings/usb/dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/dwc3.txt
@@ -106,6 +106,9 @@ Optional properties:
 			When just one value, which means INCRX burst mode enabled. When
 			more than one value, which means undefined length INCR burst type
 			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
+ - snps,avoid-vbus-glitch-when-set-host: Power off all Root Hub ports imme=
diately
+			after setting host mode to avoid vbus (negative) glitch happen in later
+			xhci reset. And the vbus will back to 5V automatically when reset done.
=20
  - in addition all properties from usb-xhci.txt from the current directory=
 are
    supported as well
--=20
1.7.1
