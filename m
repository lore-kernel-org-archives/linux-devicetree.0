From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: draak: Describe HDMI input
Date: Mon, 14 May 2018 19:52:07 +0300
Message-ID: <3200357.ZFfGXgsVol@avalon>
References: <1526032802-14376-1-git-send-email-jacopo+renesas@jmondi.org> <26780153.JLo9OE30iv@avalon> <20180514094900.GF30519@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180514094900.GF30519@bigcity.dyn.berto.se>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, horms@verge.net.au, geert@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Niklas,

On Monday, 14 May 2018 12:49:00 EEST Niklas S=F6derlund wrote:
> On 2018-05-14 05:49:41 +0300, Laurent Pinchart wrote:
>=20
> [snip]
>=20
> >>> +&vin4 {
> >>> +	pinctrl-0 =3D <&vin4_pins>;
> >>> +	pinctrl-names =3D "default";
> >>> +
> >>> +	status =3D "okay";
> >>> +
> >>> +	ports {
> >>> +		#address-cells =3D <1>;
> >>> +		#size-cells =3D <0>;
> >>> +
> >>> +		port@0 {
> >>> +			reg =3D <0>;
> >>> +			vin4_in: endpoint {
> >>> +				hsync-active =3D <0>;
> >>> +				vsync-active =3D <0>;
> >>=20
> >> Comparing this to the Gen2 bindings some properties are missing,
> >>=20
> >> bus-width =3D <24>;
> >> pclk-sample =3D <1>;
> >> data-active =3D <1>;
> >>=20
> >> This is not a big deal as the VIN driver don't use these properties so
> >> no functional change should come of this but still a difference.
> >=20
> > I think the VIN DT bindings should be updated to explicitly list the
> > endpoint properties that are mandatory, optional, or not allowed.
>=20
> I think it's documented as it reference video-interfaces.txt which lists
> all these properties as optional. And in deed they are all optional.

I don't think that's good enough. They're all listed as optional in video-
interfaces.txt as the generic documentation can't know whether a particular=
=20
device will require a particular property or not. It's the responsibility o=
f=20
device DT bindings to refine the bindings description. The VIN DT bindings=
=20
should explicitly list the properties that apply to the VIN and tell whethe=
r=20
they're optional or mandatory for the VIN. For optional properties, the=20
default behaviour when the property is not specified should be documented t=
oo.

=46or instance, does VIN support selecting which pixel clock edge to sample=
 data=20
on ? If so the pclk-sample property should listed as either mandatory or=20
optional with a documented default, even if not used by the driver today.

> If the VIN driver makes use of all the optional ones is another matter. H=
ow
> do we know that the remote subdevice is not looking at its remote
> endpoint for bus parameters not considered by the rcar-vin driver?

No driver should parse properties of remote nodes, as those properties are =
to=20
be interpreted in the context of the remote node's DT bindings, which the=20
driver doesn't know about. Parsing OF graph properties (ports and endpoints=
)=20
is an exception, as by connecting a remote node to the local node with OF=20
graph properties you imply that the remote node uses OF graph DT bindings, =
so=20
those properties (and only those properties) can be parsed.

> The thing is that the rcar-vin driver only looks at the remote endpoint
> for these properties and ignores the on its local endpoint. Maybe some
> v4l2 framework change is needed here to make sure the bus properties are
> the same on both endpoints of a link. But I fear such a change would
> break a lot of stuff.

Properties are specified on both endpoints to account for components such a=
s=20
inverter gates between the two devices. They can thus be different on the t=
wo=20
sides, that's perfectly valid. The VIN driver should parse its local=20
properties, not the remote properties.

=2D-=20
Regards,

Laurent Pinchart
