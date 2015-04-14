From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Tue, 14 Apr 2015 23:32:43 +0100
Message-ID: <20150414223242.GA18888@e107981-lin.cambridge.arm.com>
References: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
 <20150410100529.GA6854@e104818-lin.cambridge.arm.com>
 <493B15F8-0EBE-4633-9604-671EF403F36E@codeaurora.org>
 <20150410161052.GF6854@e104818-lin.cambridge.arm.com>
 <FDC755A7-ACCF-4222-8730-782EEC632159@codeaurora.org>
 <20150413094117.GA2745@e104818-lin.cambridge.arm.com>
 <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <245B9FDD-E1B5-41E4-9F24-4D5BB86C450E@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Catalin Marinas <Catalin.Marinas@arm.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "arm@kernel.org" <arm@kernel.org>, Abhimanyu Kapur <abhimany@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 14, 2015 at 03:21:17PM +0100, Kumar Gala wrote:

[...]

> > Looking beyond this set of patches, I can foresee that you won't care
> > about the generic arm64 cpuidle driver either, or more precisely the
> > separation between cpuidle subsystem+driver and the SoC-specific
> > back-end (cpu_operations).
> 
> That's probably true for what I guess are a number of reasons.  I'm guessing the arm64 cpuidle driver expects PSCI.

Wrap lines sensibly please.

The arm64 cpuidle driver, that is now arm generic cpuidle driver does
not expect anything apart from an enable-method (and you pulled
part of its back-end implementation for arm32 Qualcomm platforms, FYI).

It took years to consolidate it and the main reason was the lack of
standard interfaces for power down/up sequences that this patchset of
yours wants to promote in arm64 world.

The lack of standard power interfaces may not have been an issue for you,
who cares about Qualcomm code, it has been a sore issue for people
trying to generalize things across ARM platforms in the kernel, which is
the only sensible way forward.

PSCI is a standard interface (and Qualcomm are already contributing to
it, for the records) that can certainly be extended, and you are welcome
to contribute to it, but certainly not ignored.

Thanks,
Lorenzo
