From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC PATCH 4/5] ARM: gic: add cpuif topology description
Date: Wed, 18 Jan 2012 17:17:46 +0000
Message-ID: <20120118171746.GC9691@e102568-lin.cambridge.arm.com>
References: <1326897408-11204-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1326897408-11204-5-git-send-email-lorenzo.pieralisi@arm.com>
 <4F16EB24.4000701@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <4F16EB24.4000701@gmail.com>
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
Cc: Russell King <linux@arm.linux.org.uk>, Catalin Marinas <Catalin.Marinas@arm.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Will Deacon <Will.Deacon@arm.com>, Grant Likely <grant.likely@secretlab.ca>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Vincent Guittot <vincent.guittot@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 18, 2012 at 03:54:12PM +0000, Rob Herring wrote:
> On 01/18/2012 08:36 AM, Lorenzo Pieralisi wrote:
> > In order to set up a proper logical to per-cpu interrupt controller IF
> > mapping, the GIC interrupt controller device tree bindings must be enhanced
> > to define the CPU IF id for all present CPUs.
> > GIC CPU IF ids are needed to send interprocessor IPIs and to set affinity
> > levels. Since the way CPU IF ids are wired depends on the specific
> > system design, they cannot be extrapolated or probed in HW by the boot
> > CPU, so a binding to define them is needed to set-up the system properly.
> > 
> > This patch adds a logical map of per-cpu interrupt controller identifiers.
> > The newly introduced per-cpu IF map has to be initialized by the GIC
> > driver so that interprocessor interrupts and affinity levels can be set
> > accordingly in an SMP system, with a proper 1:1 relation between per-cpu
> > IF ids and logical cpu indexes.
> > 
> > This patch adds a function that parses the device tree properties and
> > initializes the cpu interfaces ids properly according to the latest GIC
> > device tree bindings.
> > 
> > If CONFIG_OF is not enabled, per-cpu CPU IF mappings are defined as
> > cpu_logical_map(), leaving the current functionality unchanged.
> > 
> 
> What if CONFIG_OF is enabled, but the DTB is not updated? That needs to
> work.
> 

That's a fair point, I have to cater for that, point taken, I will rework it.  

> I really don't get this. Furthermore, DT bindings are not supposed to
> evolve. They need to be complete enough that they don't need frequent
> updates for existing h/w. We discussed GIC bindings at length for 3+
> months. The binding had sub nodes for cpu interfaces at one point, but
> got rid of them. Then support for cpu interfaces at different addresses
> was added. Those times were the time to bring-up issues like this. We
> can't keep changing the binding.

We are updating it, not changing it and we can change it if it does not 
describe all HW features we need, I hope.
This patch does not re-introduce GIC CPU IF addresses. It just adds a
GIC CPU IF id which is required to associate software generated IRQs to a 
given CPU. ARM mandates that those CPU ids should be wired sequentially,
but it depends on design parameters, so it is important to have the capability  
to define them through DT.

Lorenzo
