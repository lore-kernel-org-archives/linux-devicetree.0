Return-Path: <SRS0=z3qq=TI=renesas.com=Chris.Brandt@kernel.org>
From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH 10/10] ARM: dts: r7s9210-rza2mevb: Add USB host support
Date: Wed, 8 May 2019 12:48:36 +0000
Message-ID: 
 <TY1PR01MB15624892AE0A749A63053DA98A320@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-11-chris.brandt@renesas.com>
 <20190508094230.5j2skmmlkzlmy2ls@verge.net.au>
In-Reply-To: <20190508094230.5j2skmmlkzlmy2ls@verge.net.au>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Simon,

On Wed, May 08, 2019, Simon Horman wrote:
> Please add a space between the usb2_phy0 and ehci0 nodes.
> Likewise below between the usb2_phy1 and ehci1 nodes.
>=20
> Otherwise this patch looks good to me.

I also see that you renamed some patch titles from
  "ARM: dts: r7s9210-rza2mevb: xxx"=20
to
  "ARM: dts: rza2mevb: xxx"

when you applied them.
So I will make that change as well.

Chris
