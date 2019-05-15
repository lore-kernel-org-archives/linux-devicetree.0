Return-Path: <SRS0=FRIL=TP=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v3 10/15] usb: renesas_usbhs: support byte addressable
 CFIFO
Date: Wed, 15 May 2019 07:57:00 +0000
Message-ID: 
 <OSBPR01MB31748EA6127F817BA7AFDE4ED8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-11-chris.brandt@renesas.com>
 <OSBPR01MB3174D47DB6FFCA64733DDFF3D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB3174D47DB6FFCA64733DDFF3D8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san again,

> From: Yoshihiro Shimoda, Sent: Wednesday, May 15, 2019 4:48 PM
>=20
> Hi Chris-san,
>=20
> > From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
> >
> > Some SoC have a CFIFO register that is byte addressable. This means
> > when the CFIFO access is set to 32-bit, you can write 8-bit values to
> > addresses CFIFO+0, CFIFO+1, CFIFO+2, CFIFO+3.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>=20
> Thank you for the patch!
>=20

Oops! I didn't write my tag...

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Best regards,
> Yoshihiro Shimoda
