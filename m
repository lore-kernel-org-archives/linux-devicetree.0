From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Tue, 12 Feb 2019 10:42:03 +0100
Message-ID: <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190212083850.7genwc6ipnxtl7eo@flea>
Content-ID: <1456.1549964523.1@stardust.g4.wien.funkfeuer.at>
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
> On Mon, Feb 11, 2019 at 08:32:35PM +0100, Harald Geyer wrote:
> > > We want to model this properly. I guess using a pinctrl driver
> > > controlled through GPIO (similar to what regulator-gpio is) would be a
> > > good first step.
> > 
> > I considered this too, but didn't like it:
> > 
> > 1) Seems like a bit of overkill.
> >
> > 2) The HW at hand is a rather different kind of multiplexer than
> > what pinctrl assumes. We don't want two mutually exclusive devices,
> > (Ie don't make the kernel unbind /dev/console for the sake of audio.)
> > but we want switch the jack between two devices, that might both be
> > active at the same time. This looks more like the channel multiplexers
> > used with many ADCs and such. I guess, I could start a new subsystem
> > around this. Seems like even more overkill.
> 
> I'm not quite sure about how that's different from what pinctrl
> assumes. pinctrl assumes to handle devices that have multiple signals
> as input, and one as output. Isn't that exactly what you have?

I think the pinctrl way would be to have the audio card device
request the HP jack and the uart node request the HP jack and only
once device could probe successfully. Ie it is about ressource
allocation, not true multiplexing where both devices can use the
ressource at the same time. Am I wrong?

Or course we don't actually want true multiplexing for audio quality
reasons, but I don't see how we could use pinctrl without doing nasty
things to /dev/console ...
 
> And pinctrl can be used dynamically as well if you need to

Can you explain or point me to the relevant explanation in the docs?
I don't seem to know about it.

> > Instead I just got the original patch working, by implementing
> > "output-high" DT property in sunxi-pinctrl. I'll send a patch for
> > review soon.
> 
> What do you want to do with output-high exactly?

Exactly what I do in the patch that started this thread.
(I'll resend when wens' cpvdd patch is available for me to rebase onto.)

Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
