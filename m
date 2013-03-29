From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: RFC v2: Zynq Clock Controller
Date: Fri, 29 Mar 2013 15:36:18 -0700
Message-ID: <9b6821a5-8275-427e-a5aa-1bfd8e800d1b@TX2EHSMHS027.ehs.local>
References: <27dae808-1d3a-4001-8eb2-b0a6e2a34b8f@AM1EHSMHS013.ehs.local>
 <515093B4.2090701@wwwdotorg.org>
 <8fd7278d-37c5-48ff-8d06-edc64d532a96@VA3EHSMHS037.ehs.local>
 <5150DEB6.7070208@wwwdotorg.org>
 <b810d127-dad8-447c-bf88-8ac715debbff@CO9EHSMHS026.ehs.local>
 <20130327021844.4014.43809@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130327021844.4014.43809@quantum>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Josh Cartwright <josh.cartwright@ni.com>, Michal Simek <michal.simek@xilinx.com>, Peter Crosthwaite <pcrost@xilinx.com>, Lars-Peter Clausen <lars@metafoo.de>, Prashant Gaikwad <pgaikwad@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, git@xilinx.com, Jan =?utf-8?B?TMO8YmJl?= <jlu@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Peter De Schrijver <pdeschrijver@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Tue, Mar 26, 2013 at 07:18:44PM -0700, Mike Turquette wrote:
> Quoting S=C3=B6ren Brinkmann (2013-03-25 17:03:24)
> > On Mon, Mar 25, 2013 at 05:33:10PM -0600, Stephen Warren wrote:
> > > On 03/25/2013 12:27 PM, S=C3=B6ren Brinkmann wrote:
> > > > Hi Stephen,
> > > >=20
> > > > On Mon, Mar 25, 2013 at 12:13:08PM -0600, Stephen Warren wrote:
> > > >> On 03/20/2013 05:56 PM, S=C3=B6ren Brinkmann wrote:
> > > >>> Hi,
> > > >>>
> > > >>> I spent some time working on this and incorporating feedback.=
 Here's an updated proposal for a clock controller for Zynq:
> > > >>>
> > > >>> Required properties:
> > > >>>  - #clock-cells : Must be 1
> > > >>>  - compatible : "xlnx,ps7-clkc"  (this may become 'xlnx,zynq-=
clkc' terminology differs a bit between Xilinx internal and mainline)
> > > >>>  - ps-clk-frequency : Frequency of the oscillator providing p=
s_clk in HZ
> > > >>>                      (usually 33 MHz oscillators are used for=
 Zynq platforms)
> > > >>
> > > >> This may have been mentioned before, but shouldn't the input c=
lock be
> > > >> represented as an actual clock in DT, and hence as an entry in=
 this
> > > >> node's clocks property? The crystal/... itself can be represen=
ted in DT
> > > >> as a fixed-clock.
> > > > Lars-Peter brought that up, too. Please refer to my answer to h=
im.
> > > >=20
> > > >>
> > > >>>  - clock-output-names : List of strings used to name the cloc=
k outputs. Shall be a list of the outputs given below.
> > > >>
> > > >> That shouldn't be required.
> > > >
> > > > When I want to support of_clk_get_parent_name() for my clocks, =
I think
> > > > it is. And I'm inclined to not brake this functionality.
> > >=20
> > > The solution here is to make clock parent names irrelevant.
> > >=20
> > > Also note that device tree is supposed to describe HW. As such, t=
his
> > > kind of internal implementation detail of the Linux clock driver =
should
> > > have basically zero effect on the DT binding definition.
> > >=20
> > > >>> Optional properties:
> > > >>>  - clocks : as described in the clock bindings
> > > >>>  - clock-names : as described in the clock bindings
> > > >>
> > > >> I think clocks should be required, with at least the main crys=
tal clock
> > > >> input always present, but perhaps having some optional entries=
 for the
> > > >> (E)MIO feature you mention.
> > > >
> > > > This is why I have the xtal separate. This way these props are =
purely
> > > > optional and the xtal frequency is obtained separately. It also=
 makes it
> > > > a little easier internally, because I don't have to cope with a=
 variable
> > > > name for the xtal this way.
> > > >=20
> > > > Describing the xtal as fixed clock in DT means a mandatory entr=
y for
> > > > 'clocks' and 'clock-names' and a variable name for the xtal clo=
ck. I
> > > > wanted to avoid this.
> > >=20
> > > I don't see any benefit with some properties being purely optiona=
l.
> > > Having optional entries in a property seems just fine to me.
> > >=20
> > > The name of the crystal clock should be irrelevant; that issue si=
mply
> > > needs to be fixed. It's driving too much of this discussion, and =
it will
> > > be irrelevant once it's fixed.
> > >=20
> > > >>> Example:
> > > >>>         clkc: clkc {
> > > >>>                 #clock-cells =3D <1>;
> > > >>>                 compatible =3D "xlnx,ps7-clkc";
> > > >>>                 ps-clk-frequency =3D <33333333>;
> > > >>>                 clock-output-names =3D "armpll", "ddrpll", "i=
opll", "cpu_6or4x", "cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x", =
"dci", "lqspi", "smc", "pcap", "gem0", "gem1", "fclk0", "fclk1", "fclk2=
", "fclk3", "can0", "can1", "sdio0", "sdio1", "uart0", "uart1", "spi0",=
 "spi1", "dma", "usb0_aper", "usb1_aper", "gem0_aper", "gem1_aper", "sd=
io0_aper", "sdio1_aper", "spi0_aper", "spi1_aper", "can0_aper", "can1_a=
per", "i2c0_aper", "i2c1_aper", "uart0_aper", "uart1_aper", "gpio_aper"=
, "lqspi_aper", "smc_aper", "swdt", "dbg_trc", "dbg_apb";  /* long list=
=2E.. explanation below */
> > > >>>                 /* optional props */
> > > >>>                 clocks =3D <&clkc 16>, <&clk_foo>;
> > > >>>                 clock-names =3D "gem1_emio_clk", "can_mio_clk=
_23";
> > > >>>         };
> > > >>>
> > > >>> The downside of supporting this is, that I don't see a way ar=
ound explicitly listing the clock output names in the DT.
> > > >>
> > > >> (Please wrap your emails to ~74 characters or so)
> > > > I changed my settings.
> > > >=20
> > > >>
> > > >> As Mike mentioned off-list, one can create a new clk registrat=
ion API
> > > >> that takes a struct clk* as parent rather than a char *clk_nam=
e.
> > > >
> > > > Then we also have to make sure clocks are probed in a specific =
order. To
> > > > obtain a 'struct clk *' through clk_get() the requested clock h=
as to be
> > > > already been probed. Currently clock probing relies purely on d=
ata present
> > > > in DT. This makes this proposal not that trivial, IMHO.
> > >=20
> > > Simply use deferred probe.
> > This would require major changes to the whole clock probing mechani=
sm.
>=20
> Which mechanism are you referring to?
of_clk_init()

>=20
> > Currently, clocks can not defer probing. And in case of circular
> > dependencies in the clock tree, it would rather require a multiple =
steps
> > probe. Simply deferring won't be enough.
>=20
> Circular dependencies in the clock tree?
Yes, I can route a clock from the processor part into the FPGA and back
to be used as source for a couple of peripherals. And in the FPGA there
may be all kinds of logic altering that clock.

>=20
> Anyways the clock core maintains an orphan list that was originally
> designed for this problem: registering a clock before that clock's
> parent is registered.  Just for kicks I have actually registered all =
of
> OMAP4's clocks in exactly the opposite order and everything still wor=
ks.
> Of course this makes the clock registration parent-discovery code
> O(n^2), but that is the same worst case for deferred probe.
>=20
> As long as a key exists to link two clocks together then registration
> order shouldn't matter.  Originally this key was an immutable clk nam=
e
> string.
>=20
> If clock parents are specified in DT then that should also suffice, i=
n
> place of doing string comparisons.
>=20
> If no key to pair up clocks exists then yes we will have to rely pure=
ly
> on the struct clk *opaque_cookie and register clocks in order.
Okay, so I guess, the fundamental mechanisms should be in place. What i=
s
needed, is changing the key from being the clk name to something else.
And preferably this something else is made up of something available
through DT, so a child can reference its parent w/o the parent to be
probed first. E.g. the provider's node name + the index of the clock
output?
You mentioned, something like this was supposed to happen anyway, right=
?
Do you already have something specific in mind/are working on a
solution?

	S=C3=B6ren
