Return-Path: <linux-arm-kernel-bounces+robh=kernel.org@lists.infradead.org>
Message-ID: <57189c3c.8eed420a.3cf1e.ffffe242SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Thu, 21 Apr 2016 02:21:10 -0700
From: Ashok Kumar <ashoks@broadcom.com>
Subject: Re: [PATCH v5 3/7] arm64/perf: Changed events naming as per ARM ARM
References: <1461092062-7484-1-git-send-email-ashoks@broadcom.com>
 <1461092062-7484-4-git-send-email-ashoks@broadcom.com>
 <20160420133456.GJ11453@leverpostej>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160420133456.GJ11453@leverpostej>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+robh=kernel.org@lists.infradead.org
To: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, jchandra@broadcom.com, Suzuki.Poulose@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, robh+dt@kernel.org, jglauber@cavium.com, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Apr 20, 2016 at 02:34:56PM +0100, Mark Rutland wrote:
> On Tue, Apr 19, 2016 at 11:54:18AM -0700, Ashok Kumar wrote:
> > changed all the events name definition as per ARM ARM
> > naming convention.
> 
> Please note which document you got these from (I assume the ARM ARM),
> complete with the ARM document number (e.g. ARM DDI 0487A.i for revision
> A.i). That gives us a consistent point of reference, which is helpful
> for review and in case these names have cahnged (or change in future).
> 
> I've verified that the renaming of architected events now leaves them
> named as per the ARM ARM. I see that we don't have the full list of
> IMPDEF events, but that's a matter for another patch.
> 
> It might also be worth explicitly noting the correction of the l21/l2i
> typo, as that looks a little odd otherwise.
> 
> >  /* ARMv8 Cortex-A53 specific event types. */
> >  #define ARMV8_A53_PERFCTR_PREFETCH_LINEFILL			0xC2
> >  
> >  /* ARMv8 Cavium ThunderX specific event types. */
> > -#define ARMV8_THUNDER_PERFCTR_L1_DCACHE_MISS_ST			0xE9
> > -#define ARMV8_THUNDER_PERFCTR_L1_DCACHE_PREF_ACCESS		0xEA
> > -#define ARMV8_THUNDER_PERFCTR_L1_DCACHE_PREF_MISS		0xEB
> > -#define ARMV8_THUNDER_PERFCTR_L1_ICACHE_PREF_ACCESS		0xEC
> > -#define ARMV8_THUNDER_PERFCTR_L1_ICACHE_PREF_MISS		0xED
> > +#define ARMV8_THUNDER_PERFCTR_L1D_CACHE_MISS_ST			0xE9
> > +#define ARMV8_THUNDER_PERFCTR_L1D_CACHE_PREF_ACCESS		0xEA
> > +#define ARMV8_THUNDER_PERFCTR_L1D_CACHE_PREF_MISS		0xEB
> > +#define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_ACCESS		0xEC
> > +#define ARMV8_THUNDER_PERFCTR_L1I_CACHE_PREF_MISS		0xED
> 
> I'm not sure of the value of renaming these. I would think these should
> match whatever is in the documentation for Cortex-A53 and ThunderX
> respectively (and there's the obvious PREFETCH/PREF difference
> remaining).
I have changed them to PREF and will post it in v6.
I checked table 12.28 in Cortex-A53 MPCore Processor TRM r0p4.
For 0xc2, event mnemonic is not available but event name says 
"Linefill because of prefetch".

Thanks for the review.
> 
> However, I'll leave that to Will.
> 
> Other than that, this looks good to me:
> 
> Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> 
> Thanks for putting this together!
> 
> Mark.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
