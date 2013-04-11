From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/4] Documentation: Add memory mapped ARM architected
 timer binding
Date: Thu, 11 Apr 2013 12:24:07 +0100
Message-ID: <20130411112407.GD8259@e106331-lin.cambridge.arm.com>
References: <1365474623-29181-1-git-send-email-sboyd@codeaurora.org>
 <1365474623-29181-2-git-send-email-sboyd@codeaurora.org>
 <20130409090843.GS23725@e106331-lin.cambridge.arm.com>
 <516444FE.2080200@codeaurora.org>
 <20130410101336.GB8799@e106331-lin.cambridge.arm.com>
 <51662584.6070906@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51662584.6070906@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Marc Zyngier <Marc.Zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 11, 2013 at 03:52:52AM +0100, Stephen Boyd wrote:
> On 04/10/13 03:13, Mark Rutland wrote:
> >>>> +
> >>>> +- #size-cells : Must be 1.
> >>>> +
> >>>> +- ranges : Indicates parent and child bus address space are the same.
> >>>> +
> >>> Similarly, what if someone wants to write a more complex mapping for some
> >>> reason?
> >>>
> >>> We should be able to handle it if we use the standard accessors.
> >> Maybe I should just leave this part out? They are standard DT properties
> >> so I could assume DT writers know what to do.
> > I'd be happy with that. It may be worth describing them as "as necessary" or
> > something to that effect.
> 
> Ok. I added this and removed the property descriptions:
> 
> Note that #address-cells, #size-cells, and ranges shall be present to ensure
> the CPU can address a frame's registers.

Sounds good to me.

> 
> > I can see why we need to specify secure/non-secure, but I'm not sure why we
> > need to specify hyp/user/kernel usage. Could we not leave this up to the kernel
> > to figure out?
> >
> > A basic overveiew for those that don't know about the memory mapped timers:
> >
> > * There's one control frame CNTCTLBase. Some registers in this frame are only
> >   available for secure accesses, including CNTNSAR which sets whether the
> >   counter frames are accessible from the non-secure side.
> >
> > * There are up to 8 timer frames, which have their own CNTVOFF and
> >   physical/virtual timers. Each frame CNTBaseN is duplicated at CNTPL0BaseN
> >   with CNTVOFF and CNTPL0ACR (which controls PL0 accesses) inaccessible.
> >
> > I can see that we might have frames/registers we can't access (if we were
> > booted on the non-secure side), but I can't see anything limiting whether we
> > use a frame for kernel/hyp/user beyond that. Have I missed something?
> >
> > Could we not have something like the following for each frame:
> >
> > frame0 {
> > 	frame-id = <0>;
> > 	status = "disabled"; /* booted NS, secure firmware has not enabled access */
> > 	reg = <0x... 0x1000>, /* CNTBase0 */
> > 	      <0x... 0x1000>; /* CNTPL0Base0 */
> > };
> >
> 
> I don't think you're missing anything. Technically the second view is
> not always implemented though. Using the status property should be
> sufficient I think.

Could we say the reg for the second view is optional?

Might we have a hardware / firmware configuration where the kernel can only access
the secondary view?

> 
> >> Also to get the frame number, I was thinking maybe we should expand the
> >> reg property to have two address cells. Then we could have reg = <0
> >> 0xf0001000 0x1000>.
> > We could do that, but then you definitely need a more complex ranges property,
> > and additional parsing code to handle grabbing it out of the reg property. I
> > can't see what it buys us.
> 
> Ok. It would mandate node names like "frame@0", "frame@1", but I'll drop
> the idea unless someone else finds it useful.

I see. I'd prefer to use a separate property for the id. Placing it in the reg
and then requiring a mapping sounds like it's going to cause a lot of pain.

Cheers,
Mark.
