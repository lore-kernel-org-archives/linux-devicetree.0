From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [RFC v2 4/9] of: add clock providers
Date: Thu, 15 Dec 2011 21:51:30 +0800
Message-ID: <20111215135129.GA2831@S2100-06.ap.freescale.net>
References: <1323727329-4989-1-git-send-email-grant.likely@secretlab.ca>
 <1323727329-4989-4-git-send-email-grant.likely@secretlab.ca>
 <20111212232903.GC2616@gallagher>
 <CACxGe6t50zJNpo=QWPzgFMpQ6Cfi9YZyrKuMSTrrA2oYiLF2Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACxGe6t50zJNpo=QWPzgFMpQ6Cfi9YZyrKuMSTrrA2oYiLF2Pw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Jamie Iles <jamie@jamieiles.com>, Sascha Hauer <kernel@pengutronix.de>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Mike Turquette <mturquette@ti.com>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 13, 2011 at 10:54:58AM -0700, Grant Likely wrote:
> On Mon, Dec 12, 2011 at 4:29 PM, Jamie Iles <jamie@jamieiles.com> wro=
te:
> > Hi Grant,
> >
> > I'm still going through these and trying to digest them but a coupl=
e of
> > quick questions/comments.
> >
> > Jamie
> >
> > On Mon, Dec 12, 2011 at 03:02:04PM -0700, Grant Likely wrote:
> >> diff --git a/Documentation/devicetree/bindings/clock/clock-binding=
s.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> new file mode 100644
> >> index 0000000..e40c436
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> >> @@ -0,0 +1,114 @@
> >> +This binding is a work-in-progress, and are based on some experim=
ental
> >> +work by benh[1].
> >> +
> >> +Sources of clock signal can be represented by any node in the dev=
ice
> >> +tree. =A0Those nodes are designated as clock providers. =A0Clock =
consumer
> >> +nodes use a phandle and clock specifier pair to connect clock pro=
vider
> >> +outputs to clock inputs. =A0Similar to the gpio specifiers, a clo=
ck
> >> +specifier is an array of one more more cells identifying the cloc=
k
> >> +output on a device. =A0The length of a clock specifier is defined=
 by the
> >> +value of a #clock-cells property in the clock provider node.
> >> +
> >> +[1] http://patchwork.ozlabs.org/patch/31551/
> >> +
> >> +=3D=3DClock providers=3D=3D
> >> +
> >> +Required properties:
> >> +#clock-cells: =A0 =A0 =A0 =A0 =A0 Number of cells in a clock spec=
ifier; typically will be
> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0set to 1
> >
> > I'm not sure I fully understand what the extra cells actually mean =
for
> > clocks. =A0I think the first integer is the clock output to use but=
 some
> > of the versatile and highbank ones only have a phandle or is it mor=
e
> > implementation defined? =A0The clock-output-names description hints=
 at
> > recommended, so I find this a little confusing, but that could just=
 be
> > me!
>=20
> I'm following convention here that has been established with
> interrupts, gpios, and others.  Sometimes more information is needed
> that just the clock number.  Using #clock-cells gives a clock provide=
r
> the option of having additional fields for clock flags or other data.
> This is very much implementation defined.  Simple clock providers tha=
t
> only have a single clock output can easily use #clock-cells =3D <0>.
> Providers with multiple outputs will need to use 1 or more cells.
>=20
It totally destroys my understanding on #clock-cells :)

I thought it's introduced to reduce the clock nodes in dts.  That said,
#clock-cells stands for the number of clks we describe in the node.
When #clock-cells > 1 for a node, the node becomes a clk blob which
actually contains multiple clks.  I migrated the imx6 clock to your
first post with this approach [1], using 70 nodes to describe 110
clocks (~35% nodes reduced).

Now, you are saying it's not designed for this purpose.  I'm pretty
confused, because the only reasonable use of #clock-cells to me is
just that way, and I fail to see why we need #clock-cells if we do
not use it that way.

http://comments.gmane.org/gmane.linux.drivers.devicetree/9631

--=20
Regards,
Shawn
