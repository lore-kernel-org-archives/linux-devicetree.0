Return-Path: <SRS0=WZz2=R7=opensource.cirrus.com=ckeepax@kernel.org>
Date: Thu, 28 Mar 2019 11:25:31 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190328112531.GK46536@ediswmail.ad.cirrus.com>
References: <20190327151328.2491-1-ckeepax@opensource.cirrus.com>
 <20190327151328.2491-2-ckeepax@opensource.cirrus.com>
 <20190327193115.GA6462@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190327193115.GA6462@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Wed, Mar 27, 2019 at 12:31:15PM -0700, Guenter Roeck wrote:
> On Wed, Mar 27, 2019 at 03:13:28PM +0000, Charles Keepax wrote:
> > From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > 
> > Lochnagar is an evaluation and development board for Cirrus
> > Logic Smart CODEC and Amp devices. It allows the connection of
> > most Cirrus Logic devices on mini-cards, as well as allowing
> > connection of various application processor systems to provide a
> > full evaluation platform.
> > 
> > This driver adds support for the hardware monitoring features of
> > the Lochnagar 2 to the hwmon API. Monitoring is provided for
> > the board voltages, currents and temperature supported by the
> > board controller chip.
> > 
> > Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Looks pretty good. Down to nitpicks....
> 
> > +struct lochnagar_hwmon {
> > +	struct regmap *regmap;
> > +
> > +	long power_ms[ARRAY_SIZE(lochnagar_chan_names)];
> 
> Instead of storing the milli-seconds here, it might be better
> to store the number of samples and convert back to ms is/when
> asked for, ie when the sysfs file is read. That may result
> in some rounding changes, but read_power() would no longer
> have to execute the expensive DIV_ROUND_UP() for each call.
> 

Yeah I can switch over, had been leaning towards the sysfs file
reporting what was written into it, but happy to go the other
way.

> > +	static const unsigned int prec = 1000000;
> 
> Any reason for not using a #define ?
> 

Had been keeping it similar to the other measurements that
defines the precision inline. Will switch them all over to a
define.

> > +	power = div_u64(power + (prec / 2), prec);
> 
> 	DIV_ROUND_CLOSEST_ULL ?
> 

Oops... sorry about that, always miss these helpers will update
this one.

Thanks,
Charles
