Return-Path: <SRS0=WEMd=VA=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 1/2] dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
Date: Wed,  3 Jul 2019 10:35:13 +0200
Message-Id: <20190703083514.32385-2-horms+renesas@verge.net.au>
In-Reply-To: <20190703083514.32385-1-horms+renesas@verge.net.au>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS documentation file
from renesas-usbhs.txt to renesas,usbhs.txt.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
v2
* Accumulate review tags
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
