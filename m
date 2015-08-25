From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 1/2] watchdog: bcm7038: add device tree binding
 documentation
Date: Tue, 25 Aug 2015 12:04:48 -0700
Message-ID: <20150825190448.GA29547@roeck-us.net>
References: <1440092486-16905-1-git-send-email-justinpopo6@gmail.com>
 <1440092486-16905-2-git-send-email-justinpopo6@gmail.com>
 <55DA9045.2060107@roeck-us.net>
 <20150825175538.GA16266@Justins-MacBook-Pro.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150825175538.GA16266@Justins-MacBook-Pro.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Chen <justinpopo6@gmail.com>
Cc: linux-kernel@vger.kernel.org, feedback-list@broadcom.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, wim@iguana.be, linux-watchdog@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Justin,

On Tue, Aug 25, 2015 at 10:55:40AM -0700, Justin Chen wrote:
> 
> Hello Guenter,
> 
> > Is 'clock-frequency' really needed (and useful), or would it make more sense
> > to expect the user to configure a fixed clock if nothing else is available ?
> > How do other drivers handle this ?
> 
> The reason for 'clock-frequency' was for a case where our device tree did not
> have clocks. Creating a new fixed clock for a single device seems unnecessary
> compared to a 'clock-frequency' property. Their is a use for 'clock-frequency',
> but it is not really necessary. However, this is my first linux patch, so I do 
> not fully trust my judgement on this...
> 

All that is needed for a fixed clock is a devicetree entry for it. Not sure
I understand your line of argument; you add a lot of complexity and code
just to avoid those few lines in the dts file (especially with 500+
"fixed-clock" nodes in other devicetree files).

Thanks,
Guenter
