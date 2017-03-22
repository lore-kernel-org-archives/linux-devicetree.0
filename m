From: Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3] mmc: sh_mmcif: Document r7s72100 DT bindings
Date: Wed, 22 Mar 2017 13:17:06 +0000
Message-ID: <PS1PR06MB1162CACF3A130AB157C200AA8A3C0@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170112041452.14136-1-chris.brandt@renesas.com>
 <20170118213024.qreoa5k7stjmwmr7@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20170118213024.qreoa5k7stjmwmr7@rob-hp-laptop>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This one seems to have been forgotten.

Should I resend with all the acks and reviews?

Chris



On Wednesday, January 18, 2017, Rob Herring wrote:
> On Wed, Jan 11, 2017 at 11:14:52PM -0500, Chris Brandt wrote:
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > ---
> > v3:
> > * added list of how many interrupts each SOC has
> > v2:
> > * added interrupt description
> > ---
> >  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 8 ++++++++
> >  1 file changed, 8 insertions(+)
>=20
> Acked-by: Rob Herring <robh@kernel.org>



On Thursday, January 12, 2017, Simon Horman wrote:
> On Thu, Jan 12, 2017 at 08:36:10AM +0100, Geert Uytterhoeven wrote:
> > Hi Chris,
> >
> > On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt@renesas.com=
>
> wrote:
> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > >
> > > ---
> > > v3:
> > > * added list of how many interrupts each SOC has
> > > v2:
> > > * added interrupt description
> >
> > Thanks or the update!
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>=20
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


On Thursday, January 12, 2017, Geert Uytterhoeven wrote:
> On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt@renesas.com>
> wrote:
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> >
> > ---
> > v3:
> > * added list of how many interrupts each SOC has
> > v2:
> > * added interrupt description
>=20
> Thanks or the update!
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
