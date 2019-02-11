From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Mon, 11 Feb 2019 20:32:35 +0100
Message-ID: <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190211153945.e34fpwkuk67l7lc6@flea>
Content-ID: <2760.1549913555.1@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Maxime Ripard writes:
> On Mon, Feb 11, 2019 at 02:36:53PM +0100, Harald Geyer wrote:
> > > > debug console multiplexing:
> > > > Olimex have a userspace script that controls gpio PL9 during boot,
> > > > to select between HP and serial console. I guess this is not acceptable
> > > > for mainline.
> > > >
> > > > The best solution I can see is to switch the HP jack from serial console
> > > > to audio once the audio drivers load. With this people can still capture
> > > > the bootlogs but everybody gets audio once the system is up and
> > > > switching back to console output is as simple as unloading the audio
> > > > drivers.
> > >
> > > IMO it is really not the audio driver's business to mess with this switch.
> > > You could argue as well that the serial driver should get a flag to claim
> > > the HP jack, which would be similarily unjustified.
> >
> > Not the audio driver's business, but perheps the audio card's DT node.
> > Which is why I came up with the pinctrl idea.
> > 
> > I know that the nexus7 is quite well supported, and iirc they were using
> > a similar trick on their UART. Have you looked at how they were doing
> > that?

I didn't know that. Thanks for the info, it was quite interessting reading.
Alas it seems it doesn't help us:
1) I couldn't find proof that audio support is actually in mainline.
2) Their HW works differently: Their debug cable uses external voltage
on the mic pin to drive the switch. (They also have a GPIO, but it's
input to detect the debug adapter in software, not output as in the
case of the teres.)
 
> We want to model this properly. I guess using a pinctrl driver
> controlled through GPIO (similar to what regulator-gpio is) would be a
> good first step.

I considered this too, but didn't like it:

1) Seems like a bit of overkill.

2) The HW at hand is a rather different kind of multiplexer than
what pinctrl assumes. We don't want two mutually exclusive devices,
(Ie don't make the kernel unbind /dev/console for the sake of audio.)
but we want switch the jack between two devices, that might both be
active at the same time. This looks more like the channel multiplexers
used with many ADCs and such. I guess, I could start a new subsystem
around this. Seems like even more overkill.

Instead I just got the original patch working, by implementing
"output-high" DT property in sunxi-pinctrl. I'll send a patch for
review soon.

Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
