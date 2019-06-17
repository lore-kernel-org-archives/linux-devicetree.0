Return-Path: <SRS0=iTDe=UQ=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
Date: Mon, 17 Jun 2019 11:06:02 +0200
Message-Id: <20190617090603.8449-2-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-1-horms+renesas@verge.net.au>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS documentation file
from renesas-usbhs.txt to renesas,usbhs.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas,usbhs.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas_usbhs.txt
rename to Documentation/devicetree/bindings/usb/renesas,usbhs.txt
-- 
2.11.0
