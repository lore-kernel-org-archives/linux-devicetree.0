From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] ARM: introducing DT topology
Date: Wed, 18 Jan 2012 16:24:23 +0000
Message-ID: <20120118162423.GK1068@n2100.arm.linux.org.uk>
References: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326897408-11204-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 02:36:43PM +0000, Lorenzo Pieralisi wrote:
> Current code in the kernel, in particular the boot sequence, hinges upon a
> sequential mapping of MPIDR values for cpus and related interrupt
> controller CPU interfaces to logical cpu indexing. 

I don't believe it does.  What it does rely upon is having cpu_logical_map()
correctly setup for the logical-to-hardware mapping - which, if it's
different, should be done in smp_init_cpus(), taking note that logical
CPU 0 is _always_ the boot CPU.  (That's a restriction caused by the
way suspend/resume unplugs all but the lowest numbered logical online
CPU.)

So, with the code today, there's nothing in the code which prevents this
from happening:

a) you boot on h/w CPU 1, which becomes logical CPU 0.
b) you boot h/w CPU 3 as logical CPU 1.
c) you boot h/w CPU 0 as logical CPU 2.
d) you boot h/w CPU 2 as logical CPU 3.

You just need to ensure that cpu_logical_map() contains the array
{1, 3, 0, 2} instead of the default (because we _have_ to have a
default) of {1, 0, 2, 3}.

> This hypothesis is not valid when the concept of cluster is introduced since
> the MPIDR cannot be represented as a single index and interrupt controller
> CPU interfaces might be wired with a numbering scheme following per-SoC
> design parameters which cannot be extrapolated easily through generic functions
> by the primary CPU.

So what you're saying is that the GIC CPU index may not be the CPU number
given by MPIDR?

> Furthermore, relying on the MPIDR to be wired according to real topology
> levels might turn out to be an unreliable solution, hence a SW
> representation is needed to override possibly incorrect MPIDR register
> values.

This sounds like you're saying that the contents of MPIDR might be buggy
sometime in the future?  Do we actually know of any situations where the
information in there is currently wrong (outside of the development lab)?
If not, it's not something we should cater for until it's actually happened,
and then the pain should be felt by those silly enough to allow the chip
to go out the door.
