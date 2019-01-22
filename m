From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 0/6] add quartz load support to NXP rtc drivers
Date: Tue, 22 Jan 2019 18:57:52 +0100
Message-ID: <20190122175752.GD16702@piout.net>
References: <20190119090031.29147-1-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190119090031.29147-1-sam@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Jeffery <andrew@aj.id.au>, Fabio Estevam <fabio.estevam@nxp.com>, Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>, Urs =?iso-8859-1?Q?F=E4ssler?= <urs.fassler@bbv.ch>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 19/01/2019 10:00:25+0100, Sam Ravnborg wrote:
> Respin of patchset on top of v5.0-rc2 with feedback addressed (thanks!)
> 
> Introduce a new generic property "quartz-load-femtofarad"
> to specify the quartz load.
> The default value is selected to match the current Linux
> drivers, so there are no behavior changes if a binding do not
> specify the quarts-load.
> The unit is femtofarads because several RTC's define the quarts load
> in steps of 0.5 pF.
> 
> The two drivers rtc-pcf8523 and rtc-pcf85063 are both
> updated to use the new binding.
> Previously pcf8523 hardcoded the quartz load to 12.5pF, and
> pcf85063 used the reset default of 7pF.
> With this patchset it can now be specified in the DT,
> if the defaults are not OK.
> 
> The patch-set is tested on a proprietary board for both
> RTC variants (v2 variant only as there was only trivial changes in v3).
> 
> 	Sam
> 
> v3:
> - Document generic property "quartz-load-femtofarads" in rtc.txt (Rob)
> - Fix indent several places - ups (Alexandre)
> - Use the simpler name "rtc" in DT examples (Rob)
> - Collected "Reviewed by's"
> 
> v2:
> - Introduce a generic property "quartz-load-femtofarads"
> - Add femtofarads to property-units.txt
> - Make the changes backward compatible
> - Reduced logging
> - Warn, when we continue with a default value
> - Tested, by Søren Andersen, on real HW
> - Rebased on top of v5.0-rc1
> 
>         Sam
> 
> Sam Ravnborg (6):
>       devicetree: property-units: Add femtofarads unit
>       dt-bindings: rtc: Add quartz-load-femtofarads property
>       dt-binding: pcf8523: add xtal load capacitance
>       dt-binding: pcf85063: add xtal load capacitance
>       rtc: pcf8523: set xtal load capacitance from DT
>       rtc: pcf85063: set xtal load capacitance from DT
> 

All applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
