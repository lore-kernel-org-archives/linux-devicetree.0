Return-Path: <SRS0=WEMd=VA=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v2 0/2] dt-bindings: usb: renease_{usbhs,gen3} Rename bindings documentation files
Date: Wed,  3 Jul 2019 10:35:12 +0200
Message-Id: <20190703083514.32385-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi,

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS and USB 3.0
peripheral documentation files.

Changes since v1
* Accumulate review tags
* Use renesas,usb3-peri.txt as new filename for renesas_gen3,
  as suggested by Shimoda-san

Simon Horman (2):
  dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
  dt-bindings: usb: renesas_gen3: Rename bindings documentation file

 .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt}   | 0
 .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3-peri.txt} (100%)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

-- 
2.11.0
