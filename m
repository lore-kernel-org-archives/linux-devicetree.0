Return-Path: <SRS0=Q6ta=TH=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 00/10] usb: Add host and device support for RZ/A2
Date: Tue, 7 May 2019 09:17:16 +0000
Message-ID: 
 <OSBPR01MB317442B092744C8D312682DCD8310@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-1-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> For the most part, the RZ/A2 has the same USB 2.0 host and device
> HW as the R-Car Gen3, so we can reuse a lot of the code.
>=20
> However, there are a couple extra register bits, and the CFIFO
> register 8-bit access works a little different (weird, no idea why).

This is just my gut feeling, but if we set the BIGEND bit in the CFIFOSEL
of RZ/A2M (R-Car Gen3 doesn't have such a bit though), could the original
code work correctly?

Best regards,
Yoshihiro Shimoda
