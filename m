From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Tue, 12 Feb 2019 20:37:36 +0100
Message-ID: <E1gtds8-0000NB-Re@stardust.g4.wien.funkfeuer.at>
References: <20190211111245.GA18147@lst.de>
 <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
 <20190211153945.e34fpwkuk67l7lc6@flea>
 <E1gtHJj-0000iY-G8@stardust.g4.wien.funkfeuer.at>
 <20190212083850.7genwc6ipnxtl7eo@flea>
 <E1gtUZn-0000NW-MA@stardust.g4.wien.funkfeuer.at>
 <20190212100929.iqsxu443qrkl6myf@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190212100929.iqsxu443qrkl6myf@flea>
Content-ID: <1435.1550000256.1@stardust.g4.wien.funkfeuer.at>
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

Hi Maxime!

Maxime Ripard writes:
> > > And pinctrl can be used dynamically as well if you need to
> >
> > Can you explain or point me to the relevant explanation in the docs? I
> > don't seem to know about it.
> 
> pinctrl_select_state is what you would want to call,
> you would have a good example of that runtime change in
> drivers/i2c/muxes/i2c-mux-pinctrl.c.

I believe we have misunderstood each other somewhere. The above example
seems to be about one device (mux driver) requesting a set of pins and then
switching between different pinconfig states thereby activating
different subsets of pins. I don't see a way to have two devices
request the same set of pins. I could write gpio-mux-pinctrl, but I
don't see how this helps much either.

> > > > Instead I just got the original patch working, by implementing
> > > > "output-high" DT property in sunxi-pinctrl. I'll send a patch for
> > > > review soon.
> > >
> > > What do you want to do with output-high exactly?
> >
> > Exactly what I do in the patch that started this thread. (I'll resend
> > when wens' cpvdd patch is available for me to rebase onto.)
> 
> There's a few issues with that approach as well:
> 
>   - We're actively trying to remove the pinctrl nodes for the GPIOs

For what reason? Maybe it doesn't apply to this usecase?

>   - It's completely static: if one only wants to use the UART all the
>   time, they would have to change the DTB, which might or might not be
>   possible. Note that this could be trickier: why would you prevent the
>   console from working for example if the audio support isn't built in?
>   or as a module that might or might not be loaded?

No, it's not that static:
* Before the audio device probes, UART is active. (You want UART all the
  time: Just prevent the audio module from loading.)
* When you have used audio and suddenly want to have UART instead: Just
  unbind the audio device and set the gpio to low or input from userspace.
  (I intended unbinding to be sufficient, but it seems pinctrl doesn't
   set the pin back to input when it is freed and I don't see a straight
   forward way to force that. I guess it is okay however: Somebody
   switching between UART and audio regularly has to know about the
   details anyway.)

I also tested suspend/resume/poweroff and it mostly works. The only
glitch is, that during suspend there is a short period of UART noise
on the HP. (But no such problem during resume or poweroff.) I suspect
the regulator supplying the gpio bank is shut down quite early when
suspending. It doesn't matter for this discussion: There likely would
be the same behaviour with any other approach too.

I think the real downside of this approach is, that using the UART
makes the internal speakers/mic unuseable too. But we need a way to
control the mux from userspace and aside from unbinding the ideas
proposed thus far are:
a) control the gpio directly
b) control the gpio via leds-gpio

(a) was dismissed because we can't set a default from DT
(b) was dismissed because some rogue app might try to blink it

The clean solution might be to write mux-gpio, which is actually
identical to leds-gpio but lives in /sys/class/mux_switches/ and
uses different filenames. But that's going down the "invent a new
subsystem road", which I believe is overkill for what is a debugging
facility for a single board.

Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
