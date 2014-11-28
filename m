From: Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] arm64: ARM: Fix the Generic Timers interrupt active
 level description
Date: Fri, 28 Nov 2014 11:12:52 +0800
Message-ID: <20141128111252.4a6e8892@xhacker>
References: <1417105283-19575-1-git-send-email-Liviu.Dudau@arm.com>
	<54776FE0.8030600@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54776FE0.8030600-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Dear Marc and Liviu,

On Thu, 27 Nov 2014 10:39:28 -0800
Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:

> On 27/11/14 16:21, Liviu Dudau wrote:
> > The Cortex-A5x TRM states in paragraph "9.2 Generic Timer functional
> > description" that generic timers provide a level not edge interrupt
> > output. Fix the device trees to correctly describe this.
> > 
> > While doing this update the CPU mask to match the number of described
> > CPUs as well as the DT bindings documentation for Generic Timers.
> > 
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> 
> Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> 
> 	M.
> 
> > ---
> > 
> > Arnd, Olof: This is on top of linux-next/master as it patches Juno's
> > as well as all the other ARM DTs.
> > 
> > --
> > 
> >  Documentation/devicetree/bindings/arm/arch_timer.txt | 8 ++++----
> >  arch/arm64/boot/dts/arm/foundation-v8.dts            | 8 ++++----
> >  arch/arm64/boot/dts/arm/juno.dts                     | 8 ++++----
> >  arch/arm64/boot/dts/arm/rtsm_ve-aemv8a.dts           | 8 ++++----
> >  4 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arch_timer.txt
> > b/Documentation/devicetree/bindings/arm/arch_timer.txt index
> > 37b2caf..6d2aa87 100644 ---
> > a/Documentation/devicetree/bindings/arm/arch_timer.txt +++
> > b/Documentation/devicetree/bindings/arm/arch_timer.txt @@ -27,10 +27,10
> > @@ Example: timer {
> >  		compatible = "arm,cortex-a15-timer",
> >  			     "arm,armv7-timer";
> > -		interrupts = <1 13 0xf08>,
> > -			     <1 14 0xf08>,
> > -			     <1 11 0xf08>,
> > -			     <1 10 0xf08>;
> > +		interrupts = <1 13 0xf04>,
> > +			     <1 14 0xf04>,
> > +			     <1 11 0xf04>,
> > +			     <1 10 0xf04>;
> >  		clock-frequency = <100000000>;
> >  	};
> >  

Does it mean we also need to fix the interrupt level description under
arch/arm/boot/dts? I found they are also wrong or I misunderstand something?

Thanks,
Jisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
