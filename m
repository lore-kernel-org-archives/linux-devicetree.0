Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dt-bindings: usb: [eo]hci: Add clocks description for R-Car Gen3
Date: Mon, 10 Sep 2018 20:15:46 +0900
Message-Id: <1536578148-27656-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch is based on the latest Greg's usb.git / usb-next branch
(the commit id = 57361846b52bc686112da6ca5368d11210796804).

Since the current dt-bindings document is unclear about usb-[eo]hci.txt
for R-Car Gen3 SoCs clocks descriptions, this patch adds detailed
information for the SoCs.

Yoshihiro Shimoda (2):
  dt-bindings: usb: ehci: Add clocks description for R-Car Gen3
  dt-bindings: usb: ohci: Add clocks description for R-Car Gen3

 Documentation/devicetree/bindings/usb/usb-ehci.txt | 6 +++++-
 Documentation/devicetree/bindings/usb/usb-ohci.txt | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

-- 
1.9.1
