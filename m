From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/3] watchdog: sam9x60_wdt: introduce sam9x60 watchdog
 timer driver
Date: Mon, 7 Oct 2019 15:14:05 +0200
Message-ID: <20191007131348.GH4254@piout.net>
References: <1570001371-8174-1-git-send-email-eugen.hristev@microchip.com>
 <1570001371-8174-2-git-send-email-eugen.hristev@microchip.com>
 <e58a3ab5-69bc-cad3-5faa-ed00ff7906c7@roeck-us.net>
 <ab7b6b45-5e6f-100d-51af-a82ac325d948@microchip.com>
 <a9adf20c-f730-a7e9-a826-59216c17f03d@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <a9adf20c-f730-a7e9-a826-59216c17f03d@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Eugen.Hristev@microchip.com, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, wim@linux-watchdog.org, robh+dt@kernel.org, Nicolas.Ferre@microchip.com
List-Id: devicetree@vger.kernel.org

On 07/10/2019 05:36:38-0700, Guenter Roeck wrote:
> On 10/7/19 12:58 AM, Eugen.Hristev@microchip.com wrote:
> [ ... ]
> > Hello Guenter,
> > 
> > Thank you for the feedback.
> > After reviewing this, can you please guide me towards one of the
> > possible two directions: merge this driver with sama5d4_wdt , and have a
> > single driver with support for both hardware blocks; or, have this
> > driver separately , as in this patch series?
> > 
> 
> I noticed the similarities. I don't know if it makes sense to reconcile
> the two drivers; it seems to me the new chip uses the same basic core with
> enhancements. In general, I prefer a single driver, but only if the result
> doesn't end up being an if/else mess. Ultimately, it is really your call
> to make.
> 

Most if not all your comments were already addressed in the other
driver. The main difference in the register interface is the location of
the counter that only really affects sama5d4_wdt_set_timeout and that
could be abstracted away by using a different struct watchdog_ops.
Interrupt enabling is also done differently, I don't think it has a huge
impact.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
