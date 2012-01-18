From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 0/5] ARM: introducing DT topology
Date: Wed, 18 Jan 2012 17:50:28 +0000
Message-ID: <20120118175028.GD9691@e102568-lin.cambridge.arm.com>
References: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
 <20120118162423.GK1068@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20120118162423.GK1068@n2100.arm.linux.org.uk>
Content-Disposition: inline
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Will Deacon <Will.Deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 04:24:23PM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 18, 2012 at 02:36:43PM +0000, Lorenzo Pieralisi wrote:
> > Current code in the kernel, in particular the boot sequence, hinges upon a
> > sequential mapping of MPIDR values for cpus and related interrupt
> > controller CPU interfaces to logical cpu indexing. 
> 
> I don't believe it does.  What it does rely upon is having cpu_logical_map()
> correctly setup for the logical-to-hardware mapping - which, if it's
> different, should be done in smp_init_cpus(), taking note that logical
> CPU 0 is _always_ the boot CPU.  (That's a restriction caused by the
> way suspend/resume unplugs all but the lowest numbered logical online
> CPU.)
> 
> So, with the code today, there's nothing in the code which prevents this
> from happening:
> 
> a) you boot on h/w CPU 1, which becomes logical CPU 0.
> b) you boot h/w CPU 3 as logical CPU 1.
> c) you boot h/w CPU 0 as logical CPU 2.
> d) you boot h/w CPU 2 as logical CPU 3.
> 
> You just need to ensure that cpu_logical_map() contains the array
> {1, 3, 0, 2} instead of the default (because we _have_ to have a
> default) of {1, 0, 2, 3}.

I agree with you Russell, that's 100% valid on a single cluster. But on
a multi-cluster (eg dual-cluster) the MPIDR might be wired like this:

MPIDR[15:8] - cluster id
MPIDR[7:0] - core id

no hyperthreading

* CLUSTER 0 *
                       MPIDR[23:16]   MPIDR[15:8]    MPIDR[7:0]
HWCPU0: MPIDR=0x0          0x0            0x0           0x0
HWCPU1: MPIDR=0x1          0x0            0x0           0x1 

* CLUSTER 1 *

HWCPU2: MPIDR=0x100        0x0            0x1           0x0               
HWCPU3: MPIDR=0x101        0x0            0x1           0x1  

MPIDR is not a sequential index anymore, that's what I am going on about. 

And yes, code like cpu_resume, that relies on MPIDR[7:0] to be unique
needs patching, since that just takes into account the first affinity
level, which can have same values for different CPUs in the system if
they belong to different clusters.

> > This hypothesis is not valid when the concept of cluster is introduced since
> > the MPIDR cannot be represented as a single index and interrupt controller
> > CPU interfaces might be wired with a numbering scheme following per-SoC
> > design parameters which cannot be extrapolated easily through generic functions
> > by the primary CPU.
> 
> So what you're saying is that the GIC CPU index may not be the CPU number
> given by MPIDR?
>

Yes, that's correct. Taking the same example as above:

MPIDR[15:8] - cluster id
MPIDR[7:0] - core id

no hyperthreading

* CLUSTER 0 *
                         MPIDR[15:8]    MPIDR[7:0]  GIC-CPU-ID
		       
HWCPU0: MPIDR=0x0            0x0           0x0          0x0
HWCPU1: MPIDR=0x1            0x0           0x1          0x1 

* CLUSTER 1 *

HWCPU2: MPIDR=0x100          0x1           0x0          0x2     
HWCPU3: MPIDR=0x101          0x1           0x1          0x3

There is just one GIC distributor shared across all clusters.

> > Furthermore, relying on the MPIDR to be wired according to real topology
> > levels might turn out to be an unreliable solution, hence a SW
> > representation is needed to override possibly incorrect MPIDR register
> > values.
> 
> This sounds like you're saying that the contents of MPIDR might be buggy
> sometime in the future?  Do we actually know of any situations where the
> information in there is currently wrong (outside of the development lab)?
> If not, it's not something we should cater for until it's actually happened,
> and then the pain should be felt by those silly enough to allow the chip
> to go out the door.

I share your view Russell. Having said that: MPIDR is IMPLEMENTATION DEFINED.

There are three possibilities:

1- MPIDR is not unique (there are CPUs with duplicated values) 
2- MPIDR is unique but affinity levels do not represent hierarchy
   properly (cluster level, core level)
3- MPIDR is unique and affinity levels are properly set

IMHO:

case 1) We should not care and designers must get their act together
case 2) We might use DT to build the topology properly and rely on
        uniqueness to have a properly running system
case 3) We are home and dry	

Thoughts ?

Thanks a lot for your feedback,
Lorenzo
