From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH V2 0/5] arm64: Initial support Texas Instrument's AM654
 Platform
Date: Wed, 18 Jul 2018 11:57:15 -0700
Message-ID: <20180718185715.GG99251@atomide.com>
References: <20180626162615.19194-1-nm@ti.com>
 <20180718180455.gaej4fgf47zytdxk@kahuna>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180718180455.gaej4fgf47zytdxk@kahuna>
Sender: linux-kernel-owner@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Sudeep Holla <sudeep.holla@arm.com>, arm@kernel.org
List-Id: devicetree@vger.kernel.org

* Nishanth Menon <nm@ti.com> [180718 18:08]:
> On 16:26-20180626, Nishanth Menon wrote:
> > Hi,
> > 
> > This is an minor update from V1 posted earlier:
> > 	https://marc.info/?l=linux-kernel&m=152943745424138&w=2
> > 
> > The following series enables support for newest addition in TI's SoC
> > portfolio - AM654 SoC.
> > 
> > The series is based off v4.18-rc1, also available here:
> > https://github.com/nmenon/linux-2.6-playground/tree/upstream/v4.18-rc1/k3-1-am6-base
> > 
> > Key changes since RFC are indicated in respective patches:
> > * Pickedup Tony's Reviewed by
> > * Modified cbass nodes to indicate interconnect (patch #3 in the series)
> 
> Hi Tony,
> 
> Apologies on the off-request. Looks like Tero might be on vacation
> and might not be able to send the Pull request to arm-soc folks on time.
> 
> Requesting you to pick them up on our behalf for v4.19 if it that is
> fine with you. We do have Rob's ack on the bindings themselves, and
> the patches also have been reviewed as well.

Sure applying the whole series into am654-for-v4.19 branch.

Regards,

Tony
