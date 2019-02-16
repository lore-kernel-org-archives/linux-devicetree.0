From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Sat, 16 Feb 2019 21:47:13 +0100
Message-ID: <E1gv6rh-0000Km-U8@stardust.g4.wien.funkfeuer.at>
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
 <20190215142029.GB32618@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190215142029.GB32618@lst.de>
Content-ID: <1286.1550350033.1@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Torsten Duwe <duwe@lst.de>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Torsten!

Torsten Duwe writes:

> > > > > > But we need a way to control the mux from userspace and aside from
> > > > > > unbinding the ideas proposed thus far are:
> > > > > >
> > > > > > a) control the gpio directly
> > > > > > b) control the gpio via leds-gpio
> > > > > > 
> > > > > > (a) was dismissed because we can't set a default from DT
> > > > > > (b) was dismissed because some rogue app might try to blink it
> 
> Hey, this is a debugging hack. If some rogue app tries to blink it, so be it.
> 
> > I suspect some distributions will pick up the patch I posted anyway, if
> > it doesn't get merged mainline. (This is how I forgot missing backlight
> > support - it just worked for too many people ...) If we ship
> > sun50i-a64-teres-i.dts with the proper nodes (but disabled), their
> > patches will be much easier to maintain as the official DT evolves.
> 
> As I wrote (held by the list admin), I consider the whole console mux
> GPIO an U-Boot hack, and would put it into sun50i-a64-teres-i-u-boot.dtsi.
> (As a LED, see above :-)

The thing is, one of the quite strict rules in kernel development is:
Never break userspace. That means: If we provide a way to userspace to
do something (ie switch between debug and audio), we are expected to
keep it around forever. So since there is a decent chance that someday
somebody might write a driver that handles this situation properly, we
don't want chain ourselves to some dirty hack.

(I'm not totally against writing such a driver myself, if there are
enough use cases. However, I think that TERES alone is not enough.)

> Would you care to submit a patch version without that GPIO handled?
> I think it's very useful and has the potential to be agreed upon.

That would enable audio from the internal speakers but select debug
output on the HP jack by default. I would be okay with that, despite
still thinking that audio on the head phones should be the default.

Maxime and Wens are the maintainers, so it's their call in the end.

HTE,
Harald
