Return-Path: <SRS0=RYHl=RY=gmail.com=groeck7@kernel.org>
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 Mar 2019 09:03:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/3] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190321160348.GA13195@roeck-us.net>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
 <20190320145818.30644-3-ckeepax@opensource.cirrus.com>
 <20190320164010.GA13650@roeck-us.net>
 <20190321115930.GX46536@ediswmail.ad.cirrus.com>
 <792e97a0-8131-7497-fd2b-2285134ef94d@roeck-us.net>
 <20190321154753.GY46536@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190321154753.GY46536@ediswmail.ad.cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, corbet@lwn.net, devicetree@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 21, 2019 at 03:47:53PM +0000, Charles Keepax wrote:
> On Thu, Mar 21, 2019 at 06:14:23AM -0700, Guenter Roeck wrote:
> > On 3/21/19 4:59 AM, Charles Keepax wrote:
> > >On Wed, Mar 20, 2019 at 09:40:10AM -0700, Guenter Roeck wrote:
> > >>On Wed, Mar 20, 2019 at 02:58:18PM +0000, Charles Keepax wrote:
> > >>>From: Lucas Tanure <tanureal@opensource.cirrus.com>
> > >>Is this an ieee754 floating point format ? Please add a comment stating it.
> > >>Also, if the format supports it, please check for NaN. If the HW guarantees
> > >>to never return NaN, please add a respective comment.
> > >>
> > >>How likely is it that the values overflow ? A precision multipler of
> > >>1,000,000,000 means that numbers will overflow quite easily. And does
> > >>the the hardware really report voltages and currents in pico-units,
> > >>and are temperatures really reported in micro-degrees C ?
> > >>
> > >
> > >I believe the hardware can't return NaN. But will check that,
> > >what ranges are possible and add some overflow checking.
> > >
> > 
> > How about the units ? Maybe add a note explaining what the HW actually returns.
> > 
> 
> Yup can do.
> 
> > >>Overall it might make sense to reconfigure the hardware into continuous
> > >>measurement mode and get rid of the delays (if that can be configured -
> > >>the user guide isn't detailed enough to be able to determine for sure).
> > >>After all, it is quite unlikely that the board will be used in an
> > >>environment where the power savings would be worth the inconvenience
> > >>of having to wait more than two seconds for a set of measurement values
> > >>(adding all the current and temperature delays up).
> > >>
> > >
> > >Yeah the hardware is quite slow and regrettably doesn't have a
> > >continuous measurement mode. We could potentially add a thread to
> > >poll them but mostly the usage for this data is just taking power
> > >measurements of various audio use-cases so the large delay isn't
> > >a huge problem and not sure it warrents the additional
> > >complexity.
> > >
> > >>>+	msleep(nsamples);
> > >>>+
> > >>
> > >>This needs some explanation how nsamples translates into millisecond waits,
> > >>especially since that wait can add up significantly (reading the temperature
> > >>will take forever, as will reading all currents).
> > >>
> > >>>+	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
> > >>>+					val & LOCHNAGAR2_IMON_DONE_MASK,
> > >>>+					5000, 2000000);
> > >>
> > >>Can that indeed take another two seconds on top of the sleep above ?
> > >>
> > >
> > >It does about about 1.5-2 seconds I think last time I checked.
> > >
> > >Essentially the hardware will average a number of readings and
> > >return that. The number of readings given in the driver is what
> > >the hardware guys recommended for each, that said we could
> > >potentially make it configurable if that helps at all? Also
> > >I could get the msleep a bit closer to the actual runtime,
> > >just need to check how linear the time is with the number of
> > >samples take (I assume very).
> > >
> > 
> > Brr. Just add a note explaining that the long times are indeed intentional,
> > and that the HW takes that long.
> > 
> 
> From some more detailed discussions with the hardware guys
> (shame on me for following the documentation) it seems
> there isn't really much need for the temp to take so many
> measurements. The current one makes sense as the hardware
> actually does some analogue averaging so it should take account
> of spikes in the current draw from the part under test. But
> the temp should really only change slowly. I have also managed
> to refine the estimates for the time taken by the measurements
> so will factor that lot into the v2 as well.
> 

Ok, that makes more sense.

> Thanks very much for the review, will probably take me a few more

Mu pleasure. And many thanks for the new macro - that is really very useful.

> days to beat the last few clarifications out of the hardware guys
> then I will fire up a v2.
> 

Take your time. It is a few weeks until the next commit window,
after all.

Thanks,
Guenter
