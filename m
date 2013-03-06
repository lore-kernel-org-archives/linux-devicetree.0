From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: RFC: Zynq Clock Controller
Date: Wed, 6 Mar 2013 09:27:46 -0800
Message-ID: <f288874c-d0ae-4581-8d0f-2b9abe4d3117@CO9EHSMHS002.ehs.local>
References: <37032699-343e-485c-80e0-9b23e3706c58@VA3EHSMHS013.ehs.local>
 <1362570681.5269.98.camel@coredoba.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1362570681.5269.98.camel@coredoba.hi.pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan =?utf-8?B?TMO8YmJl?= <jlu@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Mike Turquette <mturquette@linaro.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com
List-Id: devicetree@vger.kernel.org

Hi Jan,
=20
what a small world. Good to hear from you.

On Wed, Mar 06, 2013 at 12:51:21PM +0100, Jan L=C3=BCbbe wrote:
> Hi S=C3=B6ren,
>=20
> On Tue, 2013-03-05 at 12:04 -0800, S=C3=B6ren Brinkmann wrote:
> > For this reasons, I'd like to propose moving Zynq into the same
> > direction. I.e. adding a clock controller with the following DT
> > description (details may change but the general idea should become
> > clear):
> > 	clkc: clkc {
> >                 #clock-cells =3D <1>;
> >                 compatible =3D "xlnx,ps7-clkc";
> >                 ps_clk_frequency =3D <33333333>;	# board x-tal
> >                 # optional props
> >                 gem0_emio_clk_freq =3D <125000000>;
> >                 gem1_emio_clk_freq =3D <50000000>;
> >                 can_mio_clk_freq_xx =3D <1234>; # this is possible =
54 times with xx =3D 00..53
> >         };
>=20
> The clock controller should only contain properties for input frequen=
cy
> (which can obviously not be calculated at run-time).
>=20
> Are the gem*, can* properties inputs? If they are actually outputs, t=
he
> corresponding frequencies should be requested by the clock consumers =
and
> not hard-coded in DT.
They are inputs. GEM and CAN have the option to be clocked through (E)M=
IO pins, i.e. some external clock input which cannot be derived from ps=
_clk like all other clocks. I plan to register a fixed rate, root clock=
 for each of those properties, if present.

>=20
> Please keep in mind that DT properties use dashes instead of
> underscores.
Okay, I'll make that substitution.

	S=C3=B6ren
