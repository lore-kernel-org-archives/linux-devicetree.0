From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 2/2] rtc: pcf2127: add battery-low INTn generation
Date: Wed, 3 Apr 2019 17:56:54 +0200
Message-ID: <20190403155654.GR22216@piout.net>
References: <1554303165-24813-1-git-send-email-f.suligoi@asem.it>
 <1554303165-24813-2-git-send-email-f.suligoi@asem.it>
 <20190403150824.GO22216@piout.net>
 <452a4cf1410a41c8b6f767ac6258482e@asem.it>
 <20190403153143.GQ22216@piout.net>
 <fd4bef0bb64e4b6fbdf74cbebaa12de3@asem.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fd4bef0bb64e4b6fbdf74cbebaa12de3@asem.it>
Sender: linux-kernel-owner@vger.kernel.org
To: Flavio Suligoi <f.suligoi@asem.it>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 03/04/2019 15:49:03+0000, Flavio Suligoi wrote:
> > Then, you should probably not enable BLIE because this will cause issues
> > with the alarm functionnality.. It is certainly enough to use
> > RTC_VL_READ periodically.
> 
> We use the nINT signaling solution because of this pin, in addition
> to be used by the CPU, can be also connected to an external connector,
> available for the final user.
> Anyway, even if the BLIE is set, the sw low voltage alarm works,
> with the message (displayed about every 12 minutes):
> 

I agree the DT property makes sense when the nINT pin is not connected
to the CPU. But if it is, then you have an issue that nINT will be
pulled low until the user changes the battery, meaning that you will
not get any alarm interrupt anymore, possibly leading to a system that
is not waking up anymore.

> rtc-pcf2127-i2c 2-0051: low voltage detected, check/replace RTC battery.
> 

You get that message every 11minutes because you are using ntp and
systohc (which I would discourage you to use as it is inaccurate).

> What kind of issues did you find with BLIE enabled?
> 
> Flavio
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
