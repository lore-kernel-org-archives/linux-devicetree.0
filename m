Return-Path: <SRS0=WEMd=VA=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 2/2] dt-bindings: usb: renesas_gen3: Rename bindings documentation file
Date: Wed,  3 Jul 2019 10:35:14 +0200
Message-Id: <20190703083514.32385-3-horms+renesas@verge.net.au>
In-Reply-To: <20190703083514.32385-1-horms+renesas@verge.net.au>
References: <20190703083514.32385-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
documentation file from renesas-gen3.txt to renesas,usb3-peri.txt

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

---
v2
* Accumulate review tags
* Use renesas,usb3-peri.txt as new filename as suggested by Shimoda-san
---
 .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt} (100%)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usb3.txt b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
similarity index 100%
rename from Documentation/devicetree/bindings/usb/renesas_usb3.txt
rename to Documentation/devicetree/bindings/usb/renesas,usb3-peri.txt
-- 
2.11.0
