From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [RFC 1/2] dt-bindings: topology: Add RISC-V cpu topology.
Date: Fri, 2 Nov 2018 15:50:38 +0000
Message-ID: <20181102155038.GA21067@e107155-lin>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <1541113468-22097-2-git-send-email-atish.patra@wdc.com>
 <CAL_Jsq+wProNynprMjQnrz1jmbZT9TmmA-_=vPUxCEED_8xONg@mail.gmail.com>
 <20181102133100.GA13130@e107155-lin>
 <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqLO+cOcHkr41ebPtONwrzOWGhksH1ypph+tihsuOVDOug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>, Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>, Damien.LeMoal@wdc.com, Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org, alankao@andestech.com, Sudeep Holla <sudeep.holla@arm.com>, Zong Li <zong@andestech.com>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 02, 2018 at 10:11:38AM -0500, Rob Herring wrote:
> On Fri, Nov 2, 2018 at 8:31 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> >
> > On Fri, Nov 02, 2018 at 08:09:39AM -0500, Rob Herring wrote:
> > > On Thu, Nov 1, 2018 at 6:04 PM Atish Patra <atish.patra@wdc.com> wrote:
> > > >
> > > > Define a RISC-V cpu topology. This is based on cpu-map in ARM world.
> > > > But it doesn't need a separate thread node for defining SMT systems.
> > > > Multiple cpu phandle properties can be parsed to identify the sibling
> > > > hardware threads. Moreover, we do not have cluster concept in RISC-V.
> > > > So package is a better word choice than cluster for RISC-V.
> > >
> > > There was a proposal to add package info for ARM recently. Not sure
> > > what happened to that, but we don't need 2 different ways.
> > >
> >
> > We still need that, I can brush it up and post what Lorenzo had previously
> > proposed[1]. We want to keep both DT and ACPI CPU topology story aligned.
>
> Frankly, I don't care what the ACPI story is. I care whether each cpu

Sorry I meant feature parity with ACPI and didn't refer to the mechanics.

> arch does its own thing in DT or not. If a package prop works for
> RISC-V folks and that happens to align with ACPI, then okay. Though I
> tend to prefer a package represented as a node rather than a property
> as I think that's more consistent.
>

Sounds good. One of the reason for making it *optional* property is for
backward compatibility. But we should be able to deal with that even with
node.

> Any comments on the thread aspect (whether it has ever been used)?
> Though I think thread as a node level is more consistent with each
> topology level being a node (same with package).
>
Not 100% sure, the only multi threaded core in the market I know is
Cavium TX2 which is ACPI.

--
Regards,
Sudeep
