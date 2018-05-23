From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 5/6] ARM: dts: rcar-gen2: Remove unused VIN properties
Date: Wed, 23 May 2018 11:33:43 -0500
Message-ID: <20180523163343.GA16505@rob-hp-laptop>
References: <1526488352-898-1-git-send-email-jacopo+renesas@jmondi.org>
 <1526488352-898-6-git-send-email-jacopo+renesas@jmondi.org>
 <20180516221307.GF17948@bigcity.dyn.berto.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180516221307.GF17948@bigcity.dyn.berto.se>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, horms@verge.net.au, geert@glider.be, laurent.pinchart@ideasonboard.com, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, May 17, 2018 at 12:13:07AM +0200, Niklas S=F6derlund wrote:
> Hi Jacopo,
> =

> Thanks for your work.
> =

> On 2018-05-16 18:32:31 +0200, Jacopo Mondi wrote:
> > The 'bus-width' and 'pclk-sample' properties are not parsed by the VIN
> > driver and only confuse users. Remove them in all Gen2 SoC that used
> > them.
> > =

> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  arch/arm/boot/dts/r8a7790-lager.dts   | 3 ---
> >  arch/arm/boot/dts/r8a7791-koelsch.dts | 3 ---
> >  arch/arm/boot/dts/r8a7791-porter.dts  | 1 -
> >  arch/arm/boot/dts/r8a7793-gose.dts    | 3 ---
> >  arch/arm/boot/dts/r8a7794-alt.dts     | 1 -
> >  arch/arm/boot/dts/r8a7794-silk.dts    | 1 -
> >  6 files changed, 12 deletions(-)
> > =

> > diff --git a/arch/arm/boot/dts/r8a7790-lager.dts b/arch/arm/boot/dts/r8=
a7790-lager.dts
> > index 063fdb6..b56b309 100644
> > --- a/arch/arm/boot/dts/r8a7790-lager.dts
> > +++ b/arch/arm/boot/dts/r8a7790-lager.dts
> > @@ -873,10 +873,8 @@
> >  	port {
> >  		vin0ep2: endpoint {
> >  			remote-endpoint =3D <&adv7612_out>;
> > -			bus-width =3D <24>;
> =

> I can't really make up my mind if this is a good thing or not. Device =

> tree describes the hardware and not what the drivers make use of. And =

> the fact is that this bus is 24 bits wide. So I'm not sure we should =

> remove these properties. But I would love to hear what others think =

> about this.

IMO, this property should only be present when all the pins are not =

connected. And by "all", I mean the minimum of what each end of the =

graph can support.

Rob
