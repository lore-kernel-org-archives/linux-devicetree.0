From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 17:36:13 +0100
Message-ID: <20150414163613.GM28709@leverpostej>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kumar Gala <galak@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "abhimany@codeaurora.org" <abhimany@codeaurora.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 10, 2015 at 11:05:29AM +0100, Catalin Marinas wrote:
> On Thu, Apr 09, 2015 at 12:37:06PM -0500, Kumar Gala wrote:
> > This patch set adds support for SMP boot on the MSM8x16 family of Qualcomm SoCs.
> > 
> > To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM interfaces to
> > setup the boot/release addresses for the secondary CPUs.  In addition we need
> > a uniquie set of cpu ops.  I'm aware the desired methods for booting secondary
> > CPUs is either via spintable or PSCI.  However, these SoCs are shipping with a
> > firmware that does not support those methods.
> 
> And the reason is? Some guesses:
> 
> a) QC doesn't think boot interface (and cpuidle) standardisation is
>    worth the effort (to put it nicely)
> b) The hardware was available before we even mentioned PSCI
> c) PSCI is not suitable for the QC's SCM interface
> d) Any combination of the above
> 
> I strongly suspect it's point (a). Should we expect future QC hardware
> to do the same?
> 
> You could argue the reason was (b), though we've been discussing PSCI
> for at least two years and, according to QC press releases, MSM8916
> started sampling in 2014.
> 
> The only valid reason is (c) and if that's the case, I would expect a
> proposal for a new firmware interface protocol (it could be PSCI-based),
> well documented, that can be shared with others that may encounter the
> same shortcomings.

There's no need to even fork PSCI. The PSCI specification will evolve
over time as vendors request changes and we try to accomodate them.

If there's something that PSCI doesn't do that you need it to, contact
ARM. Other vendors already have.

Mark.
