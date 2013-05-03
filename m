From: Javi Merino <javi.merino@arm.com>
Subject: Re: [RFC PATCH v2] drivers: bus: add ARM CCI support
Date: Fri, 3 May 2013 16:17:07 +0100
Message-ID: <20130503151706.GB2756@e102654-lin.cambridge.arm.com>
References: <1367425108-4698-1-git-send-email-lorenzo.pieralisi@arm.com>
 <1367425108-4698-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1367425108-4698-2-git-send-email-lorenzo.pieralisi@arm.com>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Jon Medhurst <tixy@linaro.org>, Dave Martin <dave.martin@linaro.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Stephen Boyd <sboyd@codeaurora.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Olof Johansson <olof@lixom.net>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Amit Kucheria <amit.kucheria@linaro.org>, "grant.likely@linaro.org" <grant.likely@linaro.org>, Mark Rutland <Mark.Rutland@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, David Gibson <david@gibson.dropbear.id.au>
List-Id: devicetree@vger.kernel.org

Hi Lorenzo,

On Wed, May 01, 2013 at 05:18:28PM +0100, Lorenzo Pieralisi wrote:
> On ARM multi-cluster systems coherency between cores running on
> different clusters is managed by the cache-coherent interconnect (CCI).
> It allows broadcasting of TLB invalidates and memory barriers and it
> guarantees cache coherency at system level through snooping of slave
> interfaces connected to it.
> 
> This patch enables the basic infrastructure required in Linux to handle and
> programme the CCI component.
> 
> Non-local variables used by the CCI management functions called by power
> down function calls after disabling the cache must be flushed out to main
> memory in advance, otherwise incoherency of those values may occur if they
> are sitting in the cache of some other CPU when power down functions
> execute. Driver code ensures that relevant data structures are flushed
> from inner and outer caches after the driver probe is completed.
> 
> CCI slave port resources are linked to set of CPUs through bus masters
> phandle properties that link the interface resources to masters node in
> the device tree.
> 
> Documentation describing the CCI DT bindings is provided with the patch.
> 
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> ---

[...]

> diff --git a/include/linux/arm-cci.h b/include/linux/arm-cci.h
> new file mode 100644
> index 0000000..0e70942
> --- /dev/null
> +++ b/include/linux/arm-cci.h
> @@ -0,0 +1,59 @@
> +/*
> + * CCI cache coherent interconnect support
> + *
> + * Copyright (C) 2013 ARM Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
> + */
> +
> +#ifndef __LINUX_ARM_CCI_H
> +#define __LINUX_ARM_CCI_H
> +
> +#include <linux/errno.h>
> +#include <linux/types.h>
> +
> +struct device_node;
> +
> +#ifdef CONFIG_ARM_CCI
> +extern int cci_ace_get_port(struct device_node *dn);
> +extern int cci_disable_port_by_cpu(u64 mpidr);
> +extern int __cci_control_port_by_device(struct device_node *dn, bool enable);
> +extern int __cci_control_port_by_index(u32 port, bool enable);
> +#else
> +static inline int cci_ace_get_port(struct device_node *dn, bool cpu)

Builds with !CONFIG_ARM_CCI fail because this definition of
cci_ace_get_port() takes two arguments whereas the one for
CONFIG_ARM_CCI takes only one.

> +{
> +       return -ENODEV;
> +}
> +static inline int cci_disable_port_by_cpu(u64 mpidr) { return -ENODEV; }
> +static inline int __cci_control_port_by_device(struct device_node *dn,
> +                                              bool enable)
> +{
> +       return -ENODEV;
> +}
> +static inline int __cci_control_port_by_index(u32 port, bool enable)
> +{
> +       return -ENODEV;
> +}
> +#endif
> +#define cci_disable_port_by_device(dev) \
> +       __cci_control_port_by_device(dev, false)
> +#define cci_enable_port_by_device(dev) \
> +       __cci_control_port_by_device(dev, true)
> +#define cci_disable_port_by_index(dev) \
> +       __cci_control_port_by_index(dev, false)
> +#define cci_enable_port_by_index(dev) \
> +       __cci_control_port_by_index(dev, true)
> +
> +#endif
