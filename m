From: Jean Pihet <jean.pihet@newoldbits.com>
Subject: Re: [RFC 3/4] ARM: topology: Update cpu_power according to DT information
Date: Wed, 13 Jun 2012 10:59:25 +0200
Message-ID: <CAORVsuWqWt0pJfewymh_ydAH61-uPsO0M7m7Gs4N3zJY=Vo9ZA@mail.gmail.com>
References: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
	<1339502524-10265-4-git-send-email-vincent.guittot@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1339502524-10265-4-git-send-email-vincent.guittot@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org, linux@arm.linux.org.uk, peterz@infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com
List-Id: devicetree@vger.kernel.org

Vincent,

On Tue, Jun 12, 2012 at 2:02 PM, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
> Use cpu compatibility field and clock-frequency field of DT to
> estimate the capacity of each core of the system
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
> =A0arch/arm/kernel/topology.c | =A0122 ++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 file changed, 122 insertions(+)
>
> diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
> index 2f85a64..0c2aee4 100644
> --- a/arch/arm/kernel/topology.c
> +++ b/arch/arm/kernel/topology.c
> @@ -17,6 +17,7 @@
> =A0#include <linux/percpu.h>
> =A0#include <linux/node.h>
> =A0#include <linux/nodemask.h>
> +#include <linux/of.h>
> =A0#include <linux/sched.h>
>
> =A0#include <asm/cputype.h>
> @@ -47,6 +48,122 @@ void set_power_scale(unsigned int cpu, unsigned l=
ong power)
> =A0 =A0 =A0 =A0per_cpu(cpu_scale, cpu) =3D power;
> =A0}
>
> +#ifdef CONFIG_OF
> +struct cpu_efficiency {
> + =A0 =A0 =A0 const char *compatible;
> + =A0 =A0 =A0 unsigned long efficiency;
> +};
> +
> +/*
> + * Table of relative efficiency of each processors
> + * The efficiency value must fit in 20bit. The final
> + * cpu_scale value must be in the range [1:2048[.
Typo here.

> + * Processors that are not defined in the table,
> + * use the default SCHED_POWER_SCALE value for cpu_scale.
> + */
> +struct cpu_efficiency table_efficiency[] =3D {
> + =A0 =A0 =A0 {"arm,cortex-a15", 3891},
> + =A0 =A0 =A0 {"arm,cortex-a7", =A02048},
How are those results measured or computed? Is this purely related to
the number crunching performance?

Also more generally what if the cores frequencies are changing?

Regards,
Jean
