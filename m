From: Pratik Patel <pratikp@codeaurora.org>
Subject: Re: CoreSight framework and drivers
Date: Fri, 21 Dec 2012 14:17:12 -0800
Message-ID: <20121221221712.GB22404@pratikp-linux.qualcomm.com>
References: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
 <20121219112314.GA26329@mudshark.cambridge.arm.com>
 <50D1F37E.6000804@ti.com>
 <20121219212431.GC23594@pratikp-linux.qualcomm.com>
 <50D34EE5.8090407@ti.com>
 <20121220195127.GA14877@pratikp-linux.qualcomm.com>
 <50D3972E.4030607@ti.com>
 <20121220234011.GE14363@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121220234011.GE14363@n2100.arm.linux.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jon Hunter <jon-hunter@ti.com>, linux-arm-msm@vger.kernel.org, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, "magnus.p.persson@stericsson.com" <magnus.p.persson@stericsson.com>, "david.rusling@linaro.org" <david.rusling@linaro.org>, "arve@android.com" <arve@android.com>, "dsaxena@linaro.org" <dsaxena@linaro.org>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "d-deao@ti.com" <d-deao@ti.com>, "christian.bejram@stericsson.com" <christian.bejram@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 20, 2012 at 11:40:11PM +0000, Russell King - ARM Linux wrote:
> On Thu, Dec 20, 2012 at 04:54:38PM -0600, Jon Hunter wrote:
> > On 12/20/2012 01:51 PM, Pratik Patel wrote:
> > > Ok, so are you referring to making CoreSight devices register
> > > with AMBA bus instead of platform bus keeping everything else
> > > intact?
> > 
> > Yes exactly. However, please note I am not saying that we should do
> > this, and I asking what direction does the community want us to take
> > here? Platform bus or AMBA bus?
> 
> One of the issues which worries me about mixing peripheral drivers on
> random different buses is... what happens when we end up with a SoC
> which gates the APB clock at bus level (there are SoCs which gate the
> APB clock at peripheral level.)  In other words, an APB bus only gets
> clocked upon request.
> 
> We can deal with that with the infrastructure we have in place in the
> AMBA bus layer, but not with the platform bus - we'd have to teach the
> platform bus driver about the special APB clock instead of having it
> handled primerily at the bus layer.
> 
> At least the coresight ETM peripherals make use of the APB bus.  They
> have a whole pile of registers on the APB bus, and they have the
> primecell IDs stored in the last words of the peripheral, again just
> like the other primecell devices we have using the AMBA bus layer.
> 
> What I'd say is... why stick it on a different bus type from the other
> peripherals which might make things harder in the future?

Thanks for the info. I will look into using the AMBA bus instead
of the platform bus but one issue I notice is that AMBA framework
seems to support one contiguous register space.

CoreSight STM typically has a config register space and a
stimulus port/channel register space and these can be
non-contiguous in the chip memory map.

-- 
Employee of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
