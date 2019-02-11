From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH RFC] arm64: dts: allwinner: a64: teres-i: Enable audio
Date: Mon, 11 Feb 2019 14:36:53 +0100
Message-ID: <E1gtBlV-0000Wl-Cv@stardust.g4.wien.funkfeuer.at>
References: <20190211111245.GA18147@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190211111245.GA18147@lst.de>
Content-ID: <2029.1549892212.1@stardust.g4.wien.funkfeuer.at>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 20190201113743.10058-1-harald@ccbib.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, info@olimex.com, Maxime Ripard <maxime.ripard@bootlin.com>, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, ibu@radempa.de, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi Torsten!

Torsten Duwe writes:
> > hpvcc-supply vs. cpvdd-supply:
> > On the A64 manual the pin is called CPVDD and the binding documents
> > requires a cpvdd-supply property. However in the actual driver and
> > devicetrees so far hpvcc-supply is used. This is a very new binding,
> > so we have the luxury to decide either way, I think. Any input from
> > the devicetree maintainers would be appreciated.
> 
> I don't really have a strong opinion here, besides settling this ASAP,
> to minimise confusion.

Yeah, given that this issue was introduced only in 5.0 and 5.0 is
almost out of the door, I'd have believed people to be more eager to
get this fixed soon.

Well, if nobody speaks up, I'll just include a patch to change the
binding to match the source in the next version of my submission.

> > debug console multiplexing:
> > Olimex have a userspace script that controls gpio PL9 during boot,
> > to select between HP and serial console. I guess this is not acceptable
> > for mainline.
> 
> > The best solution I can see is to switch the HP jack from serial console
> > to audio once the audio drivers load. With this people can still capture
> > the bootlogs but everybody gets audio once the system is up and
> > switching back to console output is as simple as unloading the audio
> > drivers.
> 
> IMO it is really not the audio driver's business to mess with this switch.
> You could argue as well that the serial driver should get a flag to claim
> the HP jack, which would be similarily unjustified.

Not the audio driver's business, but perheps the audio card's DT node.
Which is why I came up with the pinctrl idea.

> My solution is to confine this choice inside U-Boot:
> in sun50i-a64-teres-i-u-boot.dtsi I put
> 
> / {
>         leds {
>                 compatible = "gpio-leds";
>                 /* Not really a LED, but the least intrusive workaround */
>                 audioconsole {
>                         label = "teres-i:audio:console";
>                         gpio = <&r_pio 0 9 GPIO_ACTIVE_LOW>; /* PL9 */
>                         default-state = "on";
>                 };
>         };
> [...]
> 
> and place a "gpio set PL9;" somewhere in the bootcmd_* logic. Otherwise there's
> a *lot* of chirping on the right ear during boot ;-)
> The switch is for early boot debugging, so it's best to have U-Boot enable it
> when required, and keep it off by default.

I agree that some quirk in u-boot will be required for those who want
to boot with headphones plugged in.

But I still think we need a proper description of the HW in the linux DT:
* When linux doesn't know about the pin at all, there are no guarantees
  that it won't accidentally touch the pin during some operations like
  suspend/resume, etc.
* There is the usecase where somebody puts the system console on ttyS1
  and uses ttyS0 to connect to some other board. (Actually I believe this
  is a quite likely usecase given Olimex' usual target market.) I'd like
  to support this.

Using something like your leds hack in the linux DT would be fine for
me, if the maintainers are willing to accept it.

As it is, I'm currently working on supporting "output-high" property
in pinctrl-sunxi.
 
> > Testing:
> > I don't have a headset with combo connector, so I could only test the
> > headphones output, but not the headset mic. If somebody happens to
> > have a TERES-I and a suitable headset, testing this would be nice.
> 
> The pinout required is the "CTIA" one, *not* OMTP (standards are great...) see
> https://source.android.com/devices/accessories/headset/plug-headset-spec#mechanical
> 
> I do have a compatible headset, but was neither able to record from the HS mic
> nor from the internal mic, so I have to try harder, I guess ;-) I could hear
> both mics when choosing the mixer as output source though. Mute and boost
> worked for both mics, in alsamixer.

Probably you need to enable more controls in alsamixer.
"AIF1 Data Digital ADC" comes to mind as a plausible candidate.

> Kernel is 4.20.6, so ca0412a05756cd0b
> is missing; which shouldn't make a difference in this respect, right?

I suppose not, but I didn't actually test audio on 4.20.

Thanks,
Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
