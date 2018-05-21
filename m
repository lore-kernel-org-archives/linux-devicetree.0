From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: draak: Describe CVBS input
Date: Mon, 21 May 2018 16:10:34 +0300
Message-ID: <1728709.thk7gXDxlo@avalon>
References: <1526654878-11143-1-git-send-email-jacopo+renesas@jmondi.org> <6943843.2osudLfTFd@avalon> <20180521123340.GA15035@w540>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180521123340.GA15035@w540>
Sender: linux-kernel-owner@vger.kernel.org
To: jacopo mondi <jacopo@jmondi.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, niklas.soderlund@ragnatech.se, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Jacopo,

On Monday, 21 May 2018 15:33:40 EEST jacopo mondi wrote:
> On Mon, May 21, 2018 at 01:54:55PM +0300, Laurent Pinchart wrote:
> > On Monday, 21 May 2018 12:57:05 EEST jacopo mondi wrote:
> >> On Fri, May 18, 2018 at 06:12:15PM +0300, Laurent Pinchart wrote:
> >>> On Friday, 18 May 2018 17:47:57 EEST Jacopo Mondi wrote:
> >>>> Describe CVBS video input through analog video decoder ADV7180
> >>>> connected to video input interface VIN4.
> >>>>=20
> >>>> The video input signal path is shared with HDMI video input, and
> >>>> selected by on-board switches SW-53 and SW-54 with CVBS input
> >>>> selected by the default switches configuration.
> >>>>=20
> >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>>> Reviewed-by: Niklas S=F6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> >>>>=20
> >>>> ---
> >>>> v2 -> v3:
> >>>> - Add comment to describe the shared input video path
> >>>> - Add my SoB and Niklas' R-b tags
> >>>> ---
> >>>>=20
> >>>>  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 42 +++++++++++++++=
+++
> >>>>  1 file changed, 42 insertions(+)
> >>>>=20
> >>>> diff --git a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> >>>> b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts index
> >>>> 9d73de8..95745fc
> >>>> 100644
> >>>> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> >>>> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
> >>>> @@ -142,6 +142,11 @@
> >>>>  		groups =3D "usb0";
> >>>>  		function =3D "usb0";
> >>>>  	};
> >>>> +
> >>>> +	vin4_pins_cvbs: vin4 {
> >>>> +		groups =3D "vin4_data8", "vin4_sync", "vin4_clk";
> >>>> +		function =3D "vin4";
> >>>> +	};
> >>>>  };
> >>>> =20
> >>>>  &i2c0 {
> >>>> @@ -154,6 +159,23 @@
> >>>>  		reg =3D <0x50>;
> >>>>  		pagesize =3D <8>;
> >>>>  	};
> >>>> +
> >>>> +	analog-video@20 {
> >>>> +		compatible =3D "adi,adv7180";
> >>>> +		reg =3D <0x20>;
> >>>> +
> >>>> +		port {
> >>>=20
> >>> The adv7180 DT bindings document the output port as 3 or 6
> >>> (respectively for the CP and ST versions of the chip). You should thus
> >>> number the port. Apart from that the patch looks good.
> >>=20
> >> I admit I have barely copied this from Gen-2 boards DTS, but reading
> >> the driver code and binding description again, I think this is
> >> correct, as the output port numbering and mandatory input port (which
> >> is missing here) only apply to adv7180cp/st chip versions.
> >>=20
> >> Here we describe plain adv7180, no need to number output ports afaict.
> >=20
> > Indeed, my bad.
> >=20
> > Shouldn't you however use "adi,adv7180cp" as that's the chip we are usi=
ng
> > ?
> > The "adi,adv7180" has no port documented in its DT bindings, so it
> > shouldn't have any port node at all.
>=20
> I'm a bit confused here.
>=20
> The only Gen-2 board using the "adi,adv7180cp" compatible string is
> Gose, which is also the only one I can get schematics for. That board
> indeed feature an ADV7180WBCP32Z, as the Draak does. I cannot get
> schematics for any other Gen-2 board, to compare the ADV7180 variant
> installed there. If anyone can confirm that all other Gen-2 board uses
> a different version (or that all other Gen-2 board DTS file use a
> wrong compatible string value), I'll re-send this with a different
> compatible value and proper port nodes numbering.

Other Gen2 boards use a ADV7180WBCP32Z as well. The issue here isn't that t=
he=20
chip you're trying to support is different. The DT bindings that were=20
initially written for the adi,adv7180 didn't have port nodes. When it was t=
ime=20
to add them, we realized that two variants of the chip existed with differe=
nt=20
connectivity. We have thus added two new compatible strings to differentiat=
e=20
them, with different port numbers. The old compatible string should be=20
deprecated in favour of the new ones.

> >>>> +			/*
> >>>> +			 * The VIN4 video input path is shared between
> >>>> +			 * CVBS and HDMI inputs through SW[49-54] switches.
> >>>> +			 *
> >>>> +			 * CVBS is the default selection, link it to VIN4 here.
> >>>> +			 */
> >>>> +			adv7180_out: endpoint {
> >>>> +				remote-endpoint =3D <&vin4_in>;
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>>  };
> >>>> =20
> >>>>  &i2c1 {
> >>>> @@ -246,3 +268,23 @@
> >>>>  	timeout-sec =3D <60>;
> >>>>  	status =3D "okay";
> >>>>  };
 >>>> +
> >>>> +&vin4 {
> >>>> +	pinctrl-0 =3D <&vin4_pins_cvbs>;
> >>>> +	pinctrl-names =3D "default";
> >>>> +
> >>>> +	status =3D "okay";
> >>>> +
> >>>> +	ports {
> >>>> +		#address-cells =3D <1>;
> >>>> +		#size-cells =3D <0>;
> >>>> +
> >>>> +		port@0 {
> >>>> +			reg =3D <0>;
> >>>> +
> >>>> +			vin4_in: endpoint {
> >>>> +				remote-endpoint =3D <&adv7180_out>;
> >>>> +			};
> >>>> +		};
> >>>> +	};
> >>>> +};

=2D-=20
Regards,

Laurent Pinchart
