From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 0/5] ARM: introducing DT topology
Date: Wed, 18 Jan 2012 16:12:39 +0000
Message-ID: <20120118161238.GB9691@e102568-lin.cambridge.arm.com>
References: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
 <4F16E78E.2060801@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F16E78E.2060801@gmail.com>
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
To: Rob Herring <robherring2@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Will Deacon <Will.Deacon@arm.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vincent Guittot <vincent.guittot@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 03:38:54PM +0000, Rob Herring wrote:
> On 01/18/2012 08:36 AM, Lorenzo Pieralisi wrote:
> > The introduction of multi-cluster ARM systems in SoC designs requires the kernel
> > to become cluster aware, so that it can be booted on every CPU in the system
> > and it can build an appropriate representation of topology levels.
> > 
> > Current code in the kernel, in particular the boot sequence, hinges upon a
> > sequential mapping of MPIDR values for cpus and related interrupt
> > controller CPU interfaces to logical cpu indexing. 
> > This hypothesis is not valid when the concept of cluster is introduced since
> > the MPIDR cannot be represented as a single index and interrupt controller
> > CPU interfaces might be wired with a numbering scheme following per-SoC
> > design parameters which cannot be extrapolated easily through generic functions
> > by the primary CPU.
> > 
> > Furthermore, relying on the MPIDR to be wired according to real topology levels
> > might turn out to be an unreliable solution, hence a SW representation is
> > needed to override possibly incorrect MPIDR register values.
> > 
> 
> "might be" is used several times. Is this a real problem? Wouldn't a
> more simple solution be providing properties to override the MPIDR
> register value if it is unreliable?

Thanks for having a look. 
We cannot control how it is wired up, so yes, it might be a problem.
The strict requirement is that it must be a unique identifier, and the 
bindings I wrote provide the MPIDR through "cpu" nodes "reg" properties, 
but those values must correspond to the real HW value, which has to be unique 
[ie pen release], but it *might not* represent the affinity levels properly.

Thanks,
Lorenzo
