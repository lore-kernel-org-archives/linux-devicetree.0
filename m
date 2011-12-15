From: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] irq/of: Cleanup and Enchance irq_domain support.
Date: Wed, 14 Dec 2011 18:32:06 -0800
Message-ID: <1323916330-8865-1-git-send-email-ddaney.cavm@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>

Back in early Nov. I send the first version of this patch set.  Now
things are heating up again in the world of irq_domain, so I wanted to
try to get some closure on the issues I had.  The Octeon patch is
included here to show how I am using irq_domain, but is part of a much
larger effort to merge Octeon device tree support.

The basic problem I am attempting to solve is using irq domains when
there is a 'non-linear' mapping of hwirq <--> irq within a domain.
Octeon has a single set of irq numbers that is used across two
different implementations of the interrupt controller as well as more
than 10 different SOCs all which use different subsets of the irq
number space.  The result is that the hwirq to irq mapping function
contains many gaps and discontinuities, it is really quite random.

The existing irq domain infrastructure assumes a continuous linear
mapping of hwirq to irq that can be encapsulated by the irq_base,
hwirq_base and nr_irq elements of struct irq_domain.  This is not
suitable for the Octeon implementation.

The gist of my change is to add an optional iterator function to
irq_domain_ops which knows how to iterate over the irq numbers in a
given domain.  For simple linear domains (those currently supported),
we iterate using the current method based on irq_base, hwirq_base and
nr_irq.

Summary of the patches:

1) Get rid of some unused code to make subsequent changes simpler.

2) Cleanup the data type used by various hwirq functions and users.

3) Add the irq iterator, and fix up the ARM GIC code to use it instead
of the current irq_domain_for_each_irq().

4) Add the Octeon users of the interface.

In an earlier exchange, Rob Herring had said:

   ... Handling sparse irqs is a potentially common problem, so we
   should address that in the core irqdomain code.

Which is what this patch set is doing.

There was a suggestion that perhaps having .to_irq() return a magic
value if there was no mapping would also work.  However I prefer this
approach as it separates the concepts of iteration and mapping of irq
numbers.

Please comment.

David Daney (4):
  irq: Get rid of irq_domain_for_each_hwirq().
  irq/of/ARM: Make irq_domain hwirq type consistent throughout the
    kernel.
  irq/of/ARM: Enhance irq iteration capability of irq_domain code.
  MIPS: Octeon: Add irq_create_of_mapping() and GPIO interrupts.

 arch/arm/common/gic.c                |   34 +++--
 arch/mips/Kconfig                    |    1 +
 arch/mips/cavium-octeon/octeon-irq.c |  259 +++++++++++++++++++++++++++++++++-
 include/linux/irqdomain.h            |   23 ++--
 kernel/irq/irqdomain.c               |   88 ++++++++----
 5 files changed, 354 insertions(+), 51 deletions(-)

-- 
1.7.2.3
