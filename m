From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH 2/2] arm64: dts: Add device-tree for ARM's AEMv8A-AEMv8A
 FVP Base model
Date: Mon, 20 Jun 2016 15:34:37 +0100
Message-ID: <1466433277.2833.33.camel@linaro.org>
References: <1466424796-13769-1-git-send-email-tixy@linaro.org>
 <1466424796-13769-2-git-send-email-tixy@linaro.org>
 <20160620123906.GC26152@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160620123906.GC26152@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: devicetree@vger.kernel.org

On Mon, 2016-06-20 at 13:39 +0100, Mark Rutland wrote:
> Hi,
> 
> On Mon, Jun 20, 2016 at 01:13:16PM +0100, Jon Medhurst wrote:
> > Fixed Virtual Platform (FVP) Base models are simulations of systems
> > that resemble Versatile Express or Juno hardware.
> > 
> > This adds a device-tree for the model variant that has two clusters of
> > Architecture Envelope Model (AEM) v8-A CPUs. The peripheral devices that
> > are common to all variants of Base models have been placed in a separate
> > file (fvp-base.dtsi) to facilitate creating device-trees for other
> > models.
> > 
> > It is desirable to use simulations for code testing purposes and so it
> > is beneficial to include nodes for things that are timing and power
> > consumption related, even when these don't otherwise have relevance or
> > accuracy. Where these have been included here (e.g. idle-states) entries
> > have been copied from real hardware platforms such as Juno.
> 
> Which firmware are you using,

ARM Trusted Firmware

>  and what precisely does it do w.r.t.
> those idle states?

I don't know, will check. Those states are also in the ARM TF
device-tree for the Base FVP [2] but I admit I didn't verify they were
correct. (Unlike real 'hardware' dt nodes, for which I methodically went
through documentation and LISA files to check and fix).

[2] https://github.com/ARM-software/arm-trusted-firmware/blob/master/fdts/fvp-base-gicv3-psci.dts

>  Judging by the FVP ATF pm code [1], those state IDs
> aren't valid (though perhaps the comment is wrong, or I've misunderstood
> something).

I'm not sure which comment you are referring to, that link [1] doesn't
seem to anchor to a particular source line in my web browser, and I
don't spot anything relevant scanning by eye.

> People use the FVPs with a variety of FW and bootloaders, so I'm not
> keen on putting anything FW or bootloader specific into the canonical
> FVP DT files.

I can agree about bootloaders, but would anyone be using FVP's without
ARM Trusted firmware? And if they aren't using using that, can we still
assume a PSCI capable firmware for things like CPU enable-method? I'm
asking to get an idea where the line is as I have changes for Foundation
model too. Also, want something to say to the people who asked me to
'upstream the FVP DTs' as I expect they think people are using the One
True Way which involves ARM's Trusted Firmware and other sacred tomes
passed down to them ;-)

I'll fix your other comment on the DT, so snipping email here.

> [1] https://github.com/ARM-software/arm-trusted-firmware/commit/6355f2347aec8bf6ad74867c2b0c996e10546ad4#L53 

-- 
Tixy
