From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/11] dt-bindings: mfd: Add Altera Arria10 System
 Resource Chip bindings
Date: Tue, 26 Apr 2016 07:33:32 -0500
Message-ID: <20160426123332.GA25487@rob-hp-laptop>
References: <1461339219-15255-1-git-send-email-tthayer@opensource.altera.com>
 <1461339219-15255-2-git-send-email-tthayer@opensource.altera.com>
 <20160425125514.GA5100@rob-hp-laptop>
 <571E3160.60702@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-hwmon-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <571E3160.60702@opensource.altera.com>
Sender: linux-hwmon-owner@vger.kernel.org
To: Thor Thayer <tthayer@opensource.altera.com>
Cc: lee.jones@linaro.org, linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com, linux@roeck-us.net, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com, linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Apr 25, 2016 at 10:01:52AM -0500, Thor Thayer wrote:
> 
> 
> On 04/25/2016 07:55 AM, Rob Herring wrote:
> >On Fri, Apr 22, 2016 at 10:33:29AM -0500, tthayer@opensource.altera.com wrote:
> >>From: Thor Thayer <tthayer@opensource.altera.com>
> >>
> >>The Altera Arria10 Devkit System Resource chip is a Multi-Function
> >>Device with a GPIO expander and power supply alarm.
> >
> >An alarm with no interrupt? Are the GPIOs interrupt capable?
> 
> The alarms have no interrupt but the GPIOs are interrupt capable (not
> implemented with interrupt capability in this patch series).

Please make the binding as complete as possible even if you don't 
support features in the driver yet. Driver features may evolve, but a 
specific h/w doesn't.

Rob
