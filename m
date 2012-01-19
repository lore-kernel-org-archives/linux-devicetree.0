From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [RFC PATCH 0/5] ARM: introducing DT topology
Date: Thu, 19 Jan 2012 12:18:32 +0000
Message-ID: <20120119121832.GD9268@arm.com>
References: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20120118162423.GK1068@n2100.arm.linux.org.uk>
 <20120118175028.GD9691@e102568-lin.cambridge.arm.com>
 <20120118180453.GN1068@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20120118180453.GN1068@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, Vincent Guittot <vincent.guittot@linaro.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Will Deacon <Will.Deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 06:04:53PM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 18, 2012 at 05:50:28PM +0000, Lorenzo Pieralisi wrote:
> > > This sounds like you're saying that the contents of MPIDR might be buggy
> > > sometime in the future?  Do we actually know of any situations where the
> > > information in there is currently wrong (outside of the development lab)?
> > > If not, it's not something we should cater for until it's actually happened,
> > > and then the pain should be felt by those silly enough to allow the chip
> > > to go out the door.
> > 
> > I share your view Russell. Having said that: MPIDR is IMPLEMENTATION DEFINED.
> 
> I'll assume you mean that it's left to the implementation to set MPIDR
> appropriately, and you're expecting implementations to make mistakes
> with it.

I think what Lorenzo means is that MPIDR is indeed a mandated register
with certain bits specified by the ARM ARM. However, the affinity bits
are left to the implementation. The ARM ARM makes recommendations and
gives some examples but they are not mandatory. An implementer is under
no legal obligation to follow the examples. It is not that unlikely that
someone in the future may use a different cluster/processor counting
scheme than ours. Also in the context of virtualisation, the lower
affinity field may be used for virtual CPUs counting).

-- 
Catalin
