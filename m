From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Tue, 13 Dec 2016 12:00:32 -0800
Message-ID: <CAD=FV=WhUVeq5GZ5-ae4SxypHGB9jWqgvkO02S=G6Zz6cexRzQ@mail.gmail.com>
References: <20160912185633.GH27946@sirena.org.uk> <20160913172140.GC62872@google.com>
 <20160915143945.GJ27974@sirena.org.uk> <20160915180223.GE62872@google.com>
 <20160916163253.GA10189@sirena.org.uk> <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
 <20160924184133.seh6v6eayt7hwgue@sirena.org.uk> <CAD=FV=V_ncaKDzwEyCrZNqicoE+dGXN8CJ8dDuvxQ6XP8uxsDg@mail.gmail.com>
 <20161028181521.ywzmow6bgndfotq3@sirena.org.uk> <20161212211502.GA96889@google.com>
 <20161213171904.ohsxc3xhscdinctt@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161213171904.ohsxc3xhscdinctt@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Brian Norris <briannorris@chromium.org>, Javier Martinez Canillas <javier@dowhile0.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Tue, Dec 13, 2016 at 9:19 AM, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Dec 12, 2016 at 01:15:02PM -0800, Matthias Kaehlcke wrote:
>> El Fri, Oct 28, 2016 at 07:15:21PM +0100 Mark Brown ha dit:
>> > On Mon, Sep 26, 2016 at 10:41:59AM -0700, Doug Anderson wrote:
>
>> > What you're describing to me is a discrete DCDC that has an input
>> > voltage that sets the output voltage which happens to be set with a PWM.
>
>> I experimented a bit with this. Besides the question of how to model
>> the passives I wonder how the two regulators would interact. The
>> correct thing seems to be to specify the input regulator as a supply
>> of the DCDC. dcdc->set_voltage breaks down a voltage transition into
>
> No, not unless the prior descriptions of the hardware have been wildly
> inaccurate - my understanding had been that the DCDC was a normal DCDC
> with an analogue input intended to be biased to set the output voltage
> (presumably in terms of a full rail supply) and that the PWM had been
> connected to this analogue input.  If the PWM is supplying the DCDC then
> the hardware design just seems bizzare, I can't see how this would even
> work.

Looking at one schematic, the discrete BUCK for at least one of the
rails is TPS65261RHBR, which appears to be described at
<https://store.ti.com/TPS65261RHBR.aspx>.  Data sheet appears to be at
<http://www.ti.com/product/tps65261/technicaldocuments?HQS=TI-null-null-octopart-df-pf-null-wwe>.

As you can see from the datasheet ("Adjusting the Output Voltage"
section), it is intended that you stuff a resistor to make a voltage
divider and that's how you select the output voltage.  In our case the
PWM interacts here and allows you to make a more dynamic output
voltage.  I've always thought about the input to the "FB" pin as
making an input voltage, but I guess it's not terribly simple since
the voltage divider ends up dividing between ground and the output
voltage.

Also as you can see, the datasheet never talks about using a PWM to
control the feedback and as I understand it the BUCK wasn't designed
for this, but it (mostly) works just fine.

...you can also see details about the Over Voltage Protection (at last
for this BUCK) in the TPS65261RHBR datasheet.


-Doug
