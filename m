Return-Path: <SRS0=Li/6=US=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file
Date: Wed, 19 Jun 2019 06:58:17 +0000
Message-ID: 
 <OSBPR01MB35903D8166947D92B0026AEAD8E50@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <20190617090603.8449-1-horms+renesas@verge.net.au>
 <20190617090603.8449-3-horms+renesas@verge.net.au>
In-Reply-To: <20190617090603.8449-3-horms+renesas@verge.net.au>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms+renesas@verge.net.au>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-ID: <devicetree@vger.kernel.org>

Hi Simon-san,

> From: Simon Horman, Sent: Monday, June 17, 2019 6:06 PM
> Subject: [PATCH 2/2] dt-bindings: usb: renesas_gen3: Rename bindings docu=
mentation file

s/gen3/usb3/g

> For consistency with the naming of (most) other documentation files for D=
T
> bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> documentation file from renesas-gen3.txt to renesas,gen3.txt.

Likewise.

And, if possible, I'd like to rename it to renesas,usb3-peri.txt
because the compatible is "renesas,<soc>-usb3-peri" and "usb3" is unclear
(host or peripheral).
# I don't remember, but I guess the driver side filename is
# drivers/usb/gadget/udc/renesas_usb3.c, I named the binding doc as renesas=
_usb3.txt.

After fixed them,
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
