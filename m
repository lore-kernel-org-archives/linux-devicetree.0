From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [RFC PATCH v1 0/3] device property: Support MAC address in VPD
Date: Wed, 15 Aug 2018 15:07:00 -0700
Message-ID: <153437082071.28926.11684780766239178367@swboyd.mtv.corp.google.com>
References: <20180814223758.117433-1-briannorris@chromium.org>
 <a240b3f9-d41b-30d7-ef11-5dcd1a981c0f@gmail.com>
 <20180815002204.GA258561@ban.mtv.corp.google.com>
 <bb1b2b7d-2c47-a6b3-7618-063351f379b2@gmail.com>
 <20180815014436.GA17200@ban.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180815014436.GA17200@ban.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>, Brian Norris <briannorris@chromium.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

Quoting Brian Norris (2018-08-14 18:44:36)
> Hi,
> =

> On Tue, Aug 14, 2018 at 05:52:49PM -0700, Florian Fainelli wrote:
> > On 08/14/2018 05:22 PM, Brian Norris wrote:
> =

> > >> Also, aliases in DT are meant to provide some stability.
> > > =

> > > How, specifically? I don't see any relevant binding description for
> > > aliases under Documentation/devicetree/bindings/net/.
> > =

> > Indeed they are not, likewise, we should probably update devicetree-spec
> > to come up with standard names that of_alias_get_id() already consumes.
> =

> A quick grep shows we already have divergence: both "eth" and "ethernet"
> are in use.
> =

> But anyway, would the idea be that you just put 'ethernet{0,1,...}' and
> 'wifi{0,1,...}' aliases in the /chosen node, then require boot firmware
> to insert any {ethernet,wifi}_mac{0,1,...} into the paths represented by
> the corresponding aliases? I suppose that would reduce the problems with
> (1), but it still doesn't really help with (2).

Yes. Aliases are the way to do this. It obviates much of this discussion
about finding things in DT by directly pointing to the node the
bootloader wants to go modify.

> > > =

> > > And finally, this may be surmountable, but the existing APIs seem very
> > > device tree centric. We use this same format on ACPI systems, and the
> > > current series would theoretically work on both [1]. I'd have to rewr=
ite
> > > the current (OF-only) helpers to get equivalent support...

Where does it go on ACPI systems? Does the firmware stick it into some
ACPI table by reading from VPD?
