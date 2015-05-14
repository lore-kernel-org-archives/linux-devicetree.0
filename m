From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [PATCH 2/5] arm64: Juno: Split juno.dts into juno-base.dtsi and
 juno.dts.
Date: Thu, 14 May 2015 12:04:31 +0100
Message-ID: <1431601471.2881.36.camel@linaro.org>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
	 <1431537092-19597-3-git-send-email-Liviu.Dudau@arm.com>
	 <1431596142.2881.13.camel@linaro.org>
	 <20150514103040.GN2345@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150514103040.GN2345@e106497-lin.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <Marc.Zyngier@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Sudeep Holla <Sudeep.Holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-05-14 at 11:30 +0100, Liviu Dudau wrote:
> On Thu, May 14, 2015 at 10:35:42AM +0100, Jon Medhurst (Tixy) wrote:
[...]
> > 
> > What criteria were used to select the contents of juno-base.dtsi?
> > From what I can see, the stuff left out of base is still the same for r0
> > and r1 (cpu, pmu, memory, psci!).
[...]
> 
> There are potential differences. Cortex-A53 cluster in r1 has limited
> CPUfreq functionality due to a chip errata and there were talks internally
> to actually disable it, hence the reason for keeping CPUs outside the
> juno-base.dtsi. r2 will have a different set of big CPUs as well, so this
> is preparing for the future as well.
> 
> PMU are linked to the CPUs, hence the reason they stayed. As for the
> memory and psci nodes the thinking behind it was mostly to allow for
> ACPI to make changes there, but it does look now like retrofitting an
> explanation to something that I did not give too much thought at that
> moment.

I guess my concern was motivated by the selfish aspect of having to
maintain a bunch of out-of-tree Juno patches (like cpuidle and cpufreq
related DT updates) and having to duplicate those in more than one DT,
and also having backport DT reorgs like this patch. Of course, none of
that should be a consideration in deciding what goes into mainline, I
just wanted to make sure there was a reason for the patch.

-- 
Tixy
