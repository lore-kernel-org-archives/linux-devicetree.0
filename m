From: "Dave P. Martin" <Dave.Martin@arm.com>
Subject: RE: RFC: ARM Boot standard for passing device tree blob
Date: Mon, 29 Mar 2010 12:24:30 +0100
Message-ID: <000001cacf32$66d4b190$4044010a@Emea.Arm.com>
References: <fa686aa41003240811l6f40c8cfs6fdad496facdc089@mail.gmail.com>
	<20100325210409.GH24984@n2100.arm.linux.org.uk>
	<1269610665.807.51.camel@e102109-lin.cambridge.arm.com>
	<4BACF238.3040405@firmworks.com>
	<fa686aa41003261113o7cd8612eh9b51904114902a3a@mail.gmail.com>
	<alpine.LFD.2.00.1003261435460.694@xanadu.home>
	<fa686aa41003261252u7dc31bb6nca2e77ae8feb4355@mail.gmail.com>
	<20100326230343.GC29179@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20100326230343.GC29179@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, Grant Likely <grant.likely@secretlab.ca>
Cc: Nicolas Pitre <nico@fluxnic.net>, Catalin Marinas <Catalin.Marinas@arm.com>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Philippe Robin <Philippe.Robin@arm.com>, David Rusling <David.Rusling@arm.com>, Mitch Bradley <wmb@firmworks.com>, Jeremy Kerr <jeremy.kerr@canonical.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi

> -----Original Message-----
> From: Russell King - ARM Linux [mailto:linux@arm.linux.org.uk] 
> Sent: 26 March 2010 23:04
> To: Grant Likely
> Cc: Nicolas Pitre; Mitch Bradley; Catalin Marinas; 
> devicetree-discuss; Philippe Robin; David Rusling; Jeremy 
> Kerr; Dave P Martin; linux-arm-kernel@lists.infradead.org
> Subject: Re: RFC: ARM Boot standard for passing device tree blob

[...]

> 2. No ARM CPU supports having the D-cache enabled without the MMU; the
>    data cache needs to be told via the page tables what can be cached
>    and what can't - it needs to be told that RAM can cached but IO
>    devices must not be.
> 
> In short, the MMU must always be off, which in turn means the 
> D-cache must always be disabled.

Further to this, it's worth pointing out that some systems have external
caches (such as non-architected L2 cache etc.) which are not integrated into
the the CPU.  If we allow D-cache to be turned on at all, we would have to
be clear that external caches must be turned off or configured in a very
precise way in order to avoid breaking the kernel's bootstrap process.  This
is especially important when assumptions about the cache arrangement are not
fixed at build time (in the device tree context, such assumptions generally
won't be completely fixed).  There's a potential world of problems here---
it seems best avoided.

It could be worth clarifying that the L1 I-cache is the _only_ cache which
is permitted to be enabled at kernel entry, and that all other caches in the
system must be disabled.

Cheers
---Dave
