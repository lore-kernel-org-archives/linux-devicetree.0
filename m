From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Mon, 1 Dec 2014 13:51:26 -0800
Message-ID: <71b9e172438946a5ba74efb430d1418c@BN1AFFO11FD060.protection.gbl>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com>
 <7088901.UGmPabvHQ0@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7088901.UGmPabvHQ0@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, linux-kernel@vger.kernel.org, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Mon, 2014-12-01 at 10:26PM +0100, Arnd Bergmann wrote:
> On Monday 01 December 2014 10:42:32 Soren Brinkmann wrote:
> > +       usb_phy0: usb-phy@0 {
> > +               compatible =3D "usb-nop-xceiv";
> > +               #phy-cells =3D <0>;
> > +       };
> >  };
>=20
> As discussed in an unrelated thread today, please drop the "@0" in th=
e
> node name, since the device has no 'reg' property.

What is the best practice for naming such nodes then? On these boards
it's not the case, but Zynq has two USB cores. So, there may be DTs tha=
t
will have two phys in there. Would we just do 'usb-phy-0'?

	Thanks,
	S=C3=B6ren
