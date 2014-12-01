From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] ARM: zynq: DT: Add USB to device tree
Date: Mon, 1 Dec 2014 13:24:59 -0800
Message-ID: <fb6f17c51aef4a498eb2a3e01a81df34@BN1BFFO11FD017.protection.gbl>
References: <1417459352-23401-1-git-send-email-soren.brinkmann@xilinx.com>
 <547CCEE3.6020806@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547CCEE3.6020806@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: Michal Simek <michal.simek@xilinx.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Ola Jeppson <ola@adapteva.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2014-12-01 at 09:26PM +0100, Andreas F=C3=A4rber wrote:
> Hi S=C3=B6ren,
>=20
> Am 01.12.2014 um 19:42 schrieb Soren Brinkmann:
> > Add USB nodes to zc702, zc706 and zed device trees.
> >=20
> > Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> > ---
> >  arch/arm/boot/dts/zynq-7000.dtsi | 22 +++++++++++++++++++++-
> >  arch/arm/boot/dts/zynq-zc702.dts | 11 +++++++++++
> >  arch/arm/boot/dts/zynq-zc706.dts | 10 ++++++++++
> >  arch/arm/boot/dts/zynq-zed.dts   | 10 ++++++++++
> >  4 files changed, 52 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/z=
ynq-7000.dtsi
> > index ce2ef5bec4f2..9ed60938f301 100644
> > --- a/arch/arm/boot/dts/zynq-7000.dtsi
> > +++ b/arch/arm/boot/dts/zynq-7000.dtsi
> > @@ -315,6 +315,26 @@
> >  			clocks =3D <&clkc 4>;
> >  		};
> > =20
> > +		usb0: usb@e0002000 {
> > +			compatible =3D "xlnx,zynq-usb-2.20a", "chipidea,usb2";
> > +			status =3D "disabled";
> > +			clocks =3D <&clkc 28>;
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <0 21 4>;
> > +			reg =3D <0xe0002000 0x1000>;
> > +			phy_type =3D "ulpi";
> > +		};
> > +
> > +		usb1: usb@e0003000 {
> > +			compatible =3D "xlnx,zynq-usb-2.20a", "chipidea,usb2";
> > +			status =3D "disabled";
> > +			clocks =3D <&clkc 29>;
> > +			interrupt-parent =3D <&intc>;
> > +			interrupts =3D <0 44 4>;
> > +			reg =3D <0xe0003000 0x1000>;
> > +			phy_type =3D "ulpi";
> > +		};
> > +
> >  		watchdog0: watchdog@f8005000 {
> >  			clocks =3D <&clkc 45>;
> >  			compatible =3D "xlnx,zynq-wdt-r1p2";
>=20
> This part looks good.
>=20
> > @@ -324,6 +344,6 @@
> >  			reg =3D <0xf8005000 0x1000>;
> >  			reset =3D <0>;
> >  			timeout-sec =3D <10>;
> > -		};
> > +		} ;
> >  	};
> >  };
>=20
> Unrelated accidental change here though. :)
>=20
> Did I miss a matching series actually implementing the driver? I'd ne=
ed
> to test the latest version to determine how to update the Parallella
> device tree - I assume that USB0 is in dr_mode=3D"host", but with the
> previous patchsets I was unable to verify. CC'ing Ola.

It was merged to the USB tree recently. I tested this on linux-next.

	S=C3=B6ren
