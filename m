Return-Path: <SRS0=ZW4x=QY=ccbib.org=harald@kernel.org>
From: Harald Geyer <harald@ccbib.org>
Subject: Re: [PATCH] regulator: gpio: Reword the binding document
In-reply-to: <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
References: <20190216174859.15738-1-marek.vasut@gmail.com> <E1gv6SG-0000Jv-KB@stardust.g4.wien.funkfeuer.at> <83550921-b0ec-fa34-b120-2dd159f256d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1276.1550413598.1@stardust.g4.wien.funkfeuer.at>
Date: Sun, 17 Feb 2019 15:26:39 +0100
Message-Id: <E1gvNOx-0000Kc-Dc@stardust.g4.wien.funkfeuer.at>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Marek Vasut writes:
> On 2/16/19 9:20 PM, Harald Geyer wrote:
> > marek.vasut@gmail.com writes:
> >> +			  regulator voltage/current listed in "states".
> >> +- gpios-states		: Initial state of GPIO pins in "gpios" array.
> >> +			  0: LOW, 1: HIGH.
> >> +			  Default is LOW if nothing else is specified.
> > 
> > This is not very clear. Maybe add an example below or explain it better.
> > 
> > I guess we can't change it now anymore anyway, but it's not clear to
> > me, why we have this in the first place: A regulator should only be
> > active when it has a consumer or is "always-on".
> 
> Be careful here, the regulator-gpio may be instantiated such that it
> will select between two voltage states, neither of which is 0V/off.
> Consider eMMC vccq supply, which alternates between 1V8 and 3V3, but
> does not have a third, 0V/off state (unless you pull the plug).

Yes, if it is always on (or simply has no enable-gpio) then we might
select a voltage while probing the device. My point is: At some point
(probably when the first consumer probes, but I think there are no
guarantees) the core will switch the regulator state. That usually
happens a few milliseconds to seconds after probing the regulator
itself. This seems to be nothing but a source of undefined behaviour.

If continuous operation of the regulator is important, I'd expect
we don't touch whatever the firmware setup instead of by default
setting all gpios to low.

However as we can't change this now, there isn't much point in
discussin this further.

> > IIRC the regulator
> > core automatically selects the lowest voltage/current compatible with
> > all consumers. It seems the only usecase is to specify an initial
> > state that is different from all states in the "states" property, before
> > the regulator is turned on for the first time. However it also is not
> > an off-state, because it won't be set again on turning the regulator off.
> 
> Correct, this is not an off state. If you have a better wording, I am
> open to that.

I think it should be clearer that this is an array. (Looking at various
users I doubt everybody was aware of that, but since we have only instances
with one gpio, there is no functional difference between array and bit field.)
Also it should be recommended to set this to match whatever the bootloader
sets up. Maybe something like:

- gpios-states: Array of GPIOs values set during probing the regulator.
		0: LOW, 1: HIGH. If continous operation during boot is
		desired, this needs to match what the firmware or bootloader
		sets up. By default all GPIOs are set to low during probing.

HTH,
Harald

-- 
If you want to support my work:
see http://friends.ccbib.org/harald/supporting/
or donate via CLAM to xASPBtezLNqj4cUe8MT5nZjthRSEjrRQXN
or via peercoin to P98LRdhit3gZbHDBe7ta5jtXrMJUms4p7w
