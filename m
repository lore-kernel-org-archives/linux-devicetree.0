From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH V2] spmi: pmic-arb: Enforce the ownership check optionally
Date: Fri, 25 Aug 2017 15:47:46 +0800
Message-ID: <20170825074324.GF3685@dragon>
References: <1503070110-15018-1-git-send-email-kgunda@codeaurora.org>
 <e0af96c3-208b-abfc-8b2a-4ea1cc810ec7@codeaurora.org>
 <20170822085541.GB3685@dragon>
 <20170822203132.GC21656@codeaurora.org>
 <20170824121818.GE3685@dragon>
 <20170824183701.GN21656@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170824183701.GN21656@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Kiran Gunda <kgunda@codeaurora.org>, gregkh@linuxfoundation.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Abhijeet Dharmapurikar <adharmap@codeaurora.org>, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Aug 24, 2017 at 11:37:01AM -0700, Stephen Boyd wrote:
> On 08/24, Shawn Guo wrote:
> > On Tue, Aug 22, 2017 at 01:31:32PM -0700, Stephen Boyd wrote:
> > > Also, I see that on v4.13-rc series the read/write checks are
> > > causing the led driver to fail in a different way:
> > > 
> > >     spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc040
> > >     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x40 failed
> > >     leds-gpio soc:leds: Error applying setting, reverse things back
> > >     spmi spmi-0: error: impermissible write to peripheral sid:0 addr:0xc041
> > >     qcom-spmi-gpio 200f000.spmi:pm8916@0:gpios@c000: write 0x41 failed
> > >     leds-gpio: probe of soc:leds failed with error -1 
> > > 
> > > Are you seeing similar behavior?
> > 
> > Yes.  I forgot to mention that, and leds-gpio failure is gone after
> > applying Kiran's patch below.
> > 
> > spmi: pmic-arb: remove the read/write access checks
> > 
> 
> Sure. Removing the checks will silence the warnings, but it still
> means that we're attempting to configure GPIOs that we shouldn't
> be configuring.

The driver is attempting to configure the GPIOs that device tree tells
to.

	led@3 {                        
		label = "apq8016-sbc:green:user3";
		gpios = <&pm8916_gpios 1 GPIO_ACTIVE_HIGH>;
		linux,default-trigger = "mmc1";
		default-state = "off";         
	};

Are you saying, in case of user3 led above, device tree shouldn't use
GPIO <&pm8916_gpios 1> there at all?

> Is there some sort of default configuration that
> gets applied to all pins by default?

I do not quite understand what you are asking and how that is related to
the thing we discuss here.  But my understanding is that spmi_arb
read/write access is used not only by pinctrl API to set up pinmux for
GPIO function, but also by GPIO API to actually drive the GPIO.

Shawn
