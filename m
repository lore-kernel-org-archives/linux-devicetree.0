From: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Fri, 15 Feb 2019 15:20:29 +0100
Message-ID: <20190215142029.GB32618@lst.de>
References: <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
 <20190212100929.iqsxu443qrkl6myf@flea>
 <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
 <20190213094442.da2dy6d5bb527nft@flea>
 <E1gtsx9-0000RP-08@stardust.g4.wien.funkfeuer.at>
 <20190213155311.ovkpim3lxwyvuhhj@flea>
 <E1gu4dx-0000Sy-2B@stardust.g4.wien.funkfeuer.at>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <E1gu4dx-0000Sy-2B@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Harald Geyer <harald@ccbib.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is becoming big; can we please split this thread into 3 separate issues?
AFAICS there's the original request to have DT audio nodes for Teres-I,
then a discussion about gpio/pinctrl properties, and one about formal 
device tree verification.

Nonetheless I'll add to points 1 and 3 here :)

On Thu, Feb 14, 2019 at 01:12:44AM +0100, Harald Geyer wrote:
> Hi Maxime!
> 
> Maxime Ripard writes:
> > On Wed, Feb 13, 2019 at 12:43:46PM +0100, Harald Geyer wrote:
> > > Maxime Ripard writes:
> > > > On Tue, Feb 12, 2019 at 08:37:36PM +0100, Harald Geyer wrote:

[ GPIO discussion ]

> I believe it should be possible to tell if a DT is valid, just be looking
> at the binding documentation. Without looking on the linux source code
> or other side channel information.
> 
> As you write below, people are putting DTs into ROM. Which means that
> IMO the DTs should actually be OS independent, so that people can use
> different OSes on their equipment. This in turn requires the binding
> documentation to be comprehensive.

>From my view device trees are maintained in the linux kernel source just
because it's the most active, vivid community, with established procedures
on how to review and make changes. So yes, DTs should be OS agnostic, and
ideally comply with a binding spec (sic!). It's simply pragmatic to do this
on kernel.org.

And yes, some DT formal verification spinning off of this would be a really
good idea, to take ARM (et al.), Linux, and U-Boot further.

[...]

> > > > > But we need a way to control the mux from userspace and aside from
> > > > > unbinding the ideas proposed thus far are:
> > > > >
> > > > > a) control the gpio directly
> > > > > b) control the gpio via leds-gpio
> > > > > 
> > > > > (a) was dismissed because we can't set a default from DT
> > > > > (b) was dismissed because some rogue app might try to blink it

Hey, this is a debugging hack. If some rogue app tries to blink it, so be it.

> I suspect some distributions will pick up the patch I posted anyway, if
> it doesn't get merged mainline. (This is how I forgot missing backlight
> support - it just worked for too many people ...) If we ship
> sun50i-a64-teres-i.dts with the proper nodes (but disabled), their
> patches will be much easier to maintain as the official DT evolves.

As I wrote (held by the list admin), I consider the whole console mux
GPIO an U-Boot hack, and would put it into sun50i-a64-teres-i-u-boot.dtsi.
(As a LED, see above :-)

Would you care to submit a patch version without that GPIO handled?
I think it's very useful and has the pontential to be agreed upon.

	Torsten
