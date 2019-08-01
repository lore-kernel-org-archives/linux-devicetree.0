Return-Path: <SRS0=yW19=V5=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: usb: renesas_gen3: Rename bindings documentation file to reflect IP block
Date: Thu,  1 Aug 2019 11:13:37 +0200
Message-Id: <20190801091337.27786-1-horms+renesas@verge.net.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
documentation file from renesas,gen3.txt to renesas,usb3-peri.txt

This refines a recent rename from renesas,gen3.txt to renesas-gen3.txt.
The motivation is to to more accurately reflect the IP block documented in
this file.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
* Based on v5.3-rc1
---
 .../devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas,usb3.txt => renesas,usb3-peri.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas,usb3.txt
rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
-- 
2.11.0
