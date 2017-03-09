From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v2 1/2] regulator: core: add
 regulator_has_continuous_voltage_range()
Date: Thu, 9 Mar 2017 11:40:54 -0800
Message-ID: <20170309194054.GA15095@google.com>
References: <20170308200246.126331-1-mka@chromium.org>
 <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170309102819.bx5paxtffvmvmuov@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>
List-Id: devicetree@vger.kernel.org

Hi Mark,

El Thu, Mar 09, 2017 at 11:28:19AM +0100 Mark Brown ha dit:

> On Wed, Mar 08, 2017 at 12:02:45PM -0800, Matthias Kaehlcke wrote:
> 
> > The new function allows consumers to determine if a regulator is
> > continuous or discrete, and whether the results of
> 
> Why?  As we discussed at ELC this is an implementation detail of the
> regulator and it's to an extent a taste decision if the regulator is
> represented as a linear range or a continuous range (in fact given
> improvements in the core we could probably just update all continuous
> range regulators to linear ones).

The second patch of this series is a driver for voltage controlled
regulators (vctrl), ie the output voltage of a vctrl regulator is
controlled through the voltage of another regulator. The control
regulator can be continuous or discrete and I think it makes sense for
the vctrl regulator to mirror its control regulator in this aspect.
Why should it pretend to have a continuous range when it is actually
discrete due to the control regulator?

Also the vctrl driver allows to break down a voltage change into
multiple steps to prevent overvoltage protection (OVP) circuitry
from shutting down the regulator when a voltage change in a
single step would exceed the OVP threshold.
For continuous control regulators we can simply calculate a "safe"
voltage for the next step and pass it to the control regulator. In
case of a discrete control regulator this calculated voltage may not
be directly available, without knowing the available steps the vctrl
driver has to try different voltage ranges until it finds one that is
accepted by the control regulator. Obviously this can be done but it
adds code complexity and runtime overhead which is not necessary if we
know the available steps (and regulator_list_voltage() is already
there to provide them).

> > regulator_count_voltages() and regulator_list_voltage() correspond
> > to the regulator itself or its supply.
> 
> Why?

Please see my explication above on why the vctrl driver needs to know
this.

In general I think the behavior of these APIs can be confusing for
users without intimate knowledge of the regulator core. For me (as a
possibly naive user) it isn't clear why regulator_count_voltages() of
a continuous regulator would return the voltage count of its supply,
instead of a value like 0 or -EINVAL that indicates that it is
continuous. Similar for regulator_list_voltage(). I'm sure there are
reasons for it, but it's not really intuitive.

Above you characterize discrete vs. continuous as an implementation
detail. Aren't we already exposing large parts of it through
regulator_count_voltages() and regulator_list_voltage()?

> > Change-Id: I1198cee9fff60dc747a02860e9652034f4d5da33
> 
> Don't include noise like this upstream.

Sorry, will remove

Matthias
