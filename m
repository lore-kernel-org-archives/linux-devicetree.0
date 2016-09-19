From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 4/4] regulator: Prevent falling too fast
Date: Mon, 19 Sep 2016 11:39:24 -0700
Message-ID: <CAD=FV=U2bi7GEA3Tq4vpzqF8J2hpgN-Vq4Jv=PnaGYhA3Z6vGg@mail.gmail.com>
References: <20160906190524.GB79728@google.com> <20160912185633.GH27946@sirena.org.uk>
 <20160913172140.GC62872@google.com> <20160915143945.GJ27974@sirena.org.uk>
 <20160915180223.GE62872@google.com> <20160916163253.GA10189@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160916163253.GA10189@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Brian Norris <briannorris@chromium.org>, Javier Martinez Canillas <javier@dowhile0.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, Sep 16, 2016 at 9:32 AM, Mark Brown <broonie@kernel.org> wrote:
> On Thu, Sep 15, 2016 at 11:02:23AM -0700, Matthias Kaehlcke wrote:
>> El Thu, Sep 15, 2016 at 03:39:45PM +0100 Mark Brown ha dit:
>
>> > The obvious question here is how the OVP hardware knows about the new
>> > voltage and why we're bodging this in the regulator core rather than in
>> > the OVP hardware.
>
>> The OVP hardware is part of the regulator and the regulator is not
>> notified directly about voltage changes. The regulator transforms the
>> PWM input into DC output and does the OVP internally with the limits
>> described above.
>
> So the PWM is just configuring this external regulator chip (which
> doesn't seem to be described in DT...) and that's just incredibly bad at
> coping with voltage changes?  It does sound rather like we ought to be
> representing this chip directly in case it needs other workarounds.

I'm not 100% sure you can blame the regulator chip.  What we describe
in the device tree as a "PWM Regulator" is actually:

1. Some discreet buck regulator whose output voltage is configured by
adjusting an input voltage.  AKA: the buck regulator has "3" inputs:
vin, vout, config.  You put a certain voltage on the "config" pin and
that controls the value that comes out of "vout".

2. A network of resistors, capacitors, and inductors that take the
output of a PWM and filter / smooth it enough that it can be a good
config input to the discreet buck.


The actual behavior of the PWM regulator depends as much (or more) on
what values you have for the resistors, capacitors, and inductors than
it does on the actual buck.  ...so two people using the same discreet
buck might have very different behaviors in terms of rise time and how
much they are impacted by the over voltage protection.


-Doug
