From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: How to get related device pointer via DT?
Date: Thu, 16 Feb 2017 10:26:47 +0000
Message-ID: <HK2PR06MB0548854946E440AAEFABD526D85A0@HK2PR06MB0548.apcprd06.prod.outlook.com>
References: <HK2PR06MB054824526D2975ADE8EA0405D85B0@HK2PR06MB0548.apcprd06.prod.outlook.com>
 <20170215100136.GB26227@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170215100136.GB26227@b29397-desktop>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Peter Chen <hzpeterchen@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com" <frowand.list@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Peter,

> From: Peter Chen
> Sent: Wednesday, February 15, 2017 7:02 PM
>=20
> On Wed, Feb 15, 2017 at 02:21:55AM +0000, Yoshihiro Shimoda wrote:
< snip >
> > If my idea A), ehci0 will have companion =3D <&ohci>;
> > If my idea B), no need to add any property.
> >
> > What do you think?
> > Anyway, I will start to study DT programming :)
> >
>=20
> From my point, idea A is better. It seems you have similar idea when you
> tried Dual-role framework before. [1]
>=20
> [1] https://patchwork.kernel.org/patch/9169745/

Thank you for the comment!
Yes, I remember this. So, I will make patches using idea A.

Best regards,
Yoshihiro Shimoda

> --
>=20
> Best Regards,
> Peter Chen
