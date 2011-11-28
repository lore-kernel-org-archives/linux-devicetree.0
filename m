From: Pawel Moll <pawel.moll@arm.com>
Subject: Re: [PATCH v2 4/4] ARM: vexpress: DT-based support for CoreTiles
 Express A5x2 and A9x4
Date: Mon, 28 Nov 2011 17:00:02 +0000
Message-ID: <1322499602.3164.73.camel@hornet.cambridge.arm.com>
References: <1322060508-11298-1-git-send-email-pawel.moll@arm.com>
 <1322060508-11298-5-git-send-email-pawel.moll@arm.com>
 <20111128162925.GE2465@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20111128162925.GE2465@localhost.localdomain>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Dave Martin <dave.martin@linaro.org>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Mon, 2011-11-28 at 16:29 +0000, Dave Martin wrote:
> > +config ARCH_VEXPRESS_V2P_CA5S_CA9
> > +	bool "CoreTile Express A5x2 and A9x4 based platform support"
> > +	select ARCH_VEXPRESS_RS1
> > +	select ARCH_VEXPRESS_DT
> 
> Shouldn't we depend on CPU_V7, ARM_GIC and CACHE_PL310 here?  I get a lot of
> moaning from Kconfig about unmet dependencies.  I think the coretiles do have
> a CPU etc. on them... 

CPU_V7 and ARM_GIC - definitely, thanks for spotting that.

CACHE_PL310 - I don't think so, as it's just a special case of
CACHE_L2X0, which is optional. The tile works fine with the L2 cache
disabled.

> > +	select ARM_ERRATA_720789
> > +	select ARM_ERRATA_751472
> 
> The workarounds for these errata both erroneously depend on CONFIG_SMP; however,
> I don't think that's a bug in these patches -- selecting those options here
> feels correct.

Yes, I've just mirrored what the ARCH_VEXPRESS_CA9X4 selects.

> > +	select ARM_ERRATA_753970
> 
> Will has a patch, now in Russell's fixes branch, which renames this to
> PL310_ERRATA_753970 for compatibility with other people's patches. 
> This erratum workaround depends on CACHE_PL310, but since the PL310 is
> a property of the CoreTile which must be configured in, that dependency
> seems reasonable.

As the PL310 is optional I think I'll just do:

        select PL310_ERRATA_753970 if CACHE_PL310

Cheers!

Pawel
