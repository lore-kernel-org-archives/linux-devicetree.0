Return-Path: <SRS0=iTDe=UQ=vergenet.net=horms@kernel.org>
From: Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 0/2] dt-bindings: usb: renease_{usbhs,gen3} Rename bindings documentation files
Date: Mon, 17 Jun 2019 11:06:01 +0200
Message-Id: <20190617090603.8449-1-horms+renesas@verge.net.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Simon Horman <horms+renesas@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi,

For consistency with the naming of (most) other documentation files for DT
bindings for Renesas IP blocks rename the Renesas USBHS and USB 3.0
peripheral documentation files.

Simon Horman (2):
  dt-bindings: usb: renesas_usbhs: Rename bindings documentation file
  dt-bindings: usb: renesas_gen3: Rename bindings documentation file

 .../devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt}        | 0
 .../devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt}      | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/usb/{renesas_usb3.txt => renesas,usb3.txt} (100%)
 rename Documentation/devicetree/bindings/usb/{renesas_usbhs.txt => renesas,usbhs.txt} (100%)

-- 
2.11.0
