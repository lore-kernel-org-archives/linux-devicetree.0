Return-Path: <SRS0=nQ6t=OO=fpond.eu=uli+renesas@kernel.org>
From: Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 0/2] dt-bindings: can: rcar_can*: add R-Car D3
Date: Wed,  5 Dec 2018 09:17:03 +0800
Message-Id: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org, wsa@the-dreams.de
Cc: devicetree@vger.kernel.org, linux-can@vger.kernel.org, robh@kernel.org, geert+renesas@glider.be, horms+renesas@verge.net.au, Ulrich Hecht <uli+renesas@fpond.eu>
List-ID: <devicetree@vger.kernel.org>

Hi!

These are the bindings for CAN and CAN FD controllers on R-Car D3
(R8A77995).

Changes since v2:
- rebased
- made wording less redundant in rcar_canfd.txt
- added dt-bindings prefix to subjects

CU
Uli


Ulrich Hecht (2):
  dt-bindings: can: rcar_can: add r8a77995 (R-Car D3) compatibility
    strings
  dt-bindings: can: rcar_canfd: add r8a77995 (R-Car D3) compatibility
    strings

 Documentation/devicetree/bindings/net/can/rcar_can.txt   | 3 ++-
 Documentation/devicetree/bindings/net/can/rcar_canfd.txt | 8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

-- 
2.7.4
