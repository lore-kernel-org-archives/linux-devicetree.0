From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 0/3] Yet another GIC OF binding series
Date: Tue,  9 Aug 2011 15:16:57 -0500
Message-ID: <1312921020-6820-1-git-send-email-robherring2@gmail.com>
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
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Grant,

Here's yet another patch series for GIC binding and init. 

You keep saying we should have a common DT function scanning for interrupt
controller nodes and calling their initialization functions. But that will
not work until we have dynamic assignment of linux irq numbers. So either
everyone should just stop trying to do DT bindings for GIC/VIC until that
is in place, or we need an interim solution. This is another attempt at
the latter. I reworked gic_of_init intending for it to be the interrupt
controller specific initialization function that DT interrupt controller
scanning code would call. For now, it is just called by the platform code.
The platform initialization looks something like this:

struct of_intc_desc desc;
memset(&desc, 0, sizeof(desc));
desc.controller = of_find_compatible_node(NULL, NULL, "arm,cortex-a9-gic");
gic_of_init(&desc);

I've addressed your previous comments and in particular initializing more
than 1 GIC is supported now.

Rob

Rob Herring (3):
  dt: irq: add interrupt controller descriptor struct
  ARM: gic: allow irq_start to be 0
  ARM: gic: add OF based initialization

 Documentation/devicetree/bindings/arm/gic.txt |   28 +++++++++++++++++++
 arch/arm/common/gic.c                         |   36 ++++++++++++++++++++++++-
 arch/arm/include/asm/hardware/gic.h           |    2 +
 include/linux/of_irq.h                        |    6 ++++
 4 files changed, 71 insertions(+), 1 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/gic.txt

-- 
1.7.4.1
