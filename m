Return-Path: <khilman@kernel.org>
From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH v9 5/8] drivers: cpuidle: implement DT based idle states infrastructure
References: <1409938498-17984-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1409938498-17984-6-git-send-email-lorenzo.pieralisi@arm.com>
Date: Fri, 05 Sep 2014 13:00:52 -0700
In-Reply-To: <1409938498-17984-6-git-send-email-lorenzo.pieralisi@arm.com>
	(Lorenzo Pieralisi's message of "Fri, 5 Sep 2014 18:34:54 +0100")
Message-ID: <7hlhpxygzv.fsf@paris.lan>
MIME-Version: 1.0
Content-Type: text/plain
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Charles Garcia Tobin <Charles.Garcia-Tobin@arm.com>, Nicolas Pitre <nico@linaro.org>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Antti Miettinen <ananaza@iki.fi>, Stephen Boyd <sboyd@codeaurora.org>, Sebastian Capella <sebcape@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Walmsley <paul@pwsan.com>, Chander Kashyap <k.chander@samsung.com>, Geoff Levand <geoff@infradead.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Ashwin Chaugule <ashwin.chau gule@linaro.org>, Lina Iyer <lina.iyer@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> writes:

> On most common ARM systems, the low-power states a CPU can be put into are
> not discoverable in HW and require device tree bindings to describe
> power down suspend operations and idle states parameters.
>
> In order to enable DT based idle states and configure idle drivers, this
> patch implements the bulk infrastructure required to parse the device tree
> idle states bindings and initialize the corresponding CPUidle driver states
> data.
>
> The parsing API accepts a start index that defines the first idle state
> that should be initialized by the parsing code in order to give new and
> legacy driver flexibility over which states should be parsed using the
> new DT mechanism.
>
> The idle states node(s) is obtained from the phandle list of the first cpu
> in the driver cpumask;  the kernel checks that the idle state node phandle
> is the same for all CPUs in the driver cpumask before declaring the idle state
> as valid and start parsing its content.
>
> The idle state enter function pointer is initialized through DT match
> structures passed in by the CPUidle driver, so that ARM legacy code can
> cope with platform specific idle entry method based on compatible
> string matching and the code used to initialize the enter function pointer
> can be moved to the DT generic layer.
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

[...]

> +	idle_state->flags = CPUIDLE_FLAG_TIME_VALID;
> +	if (of_property_read_bool(state_node, "local-timer-stop"))
> +		idle_state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> +	/*
> +	 * TODO:
> +	 *	replace with kstrdup and pointer assignment when name
> +	 *	and desc become string pointers
> +	 */
> +	strncpy(idle_state->name, state_node->name, CPUIDLE_NAME_LEN - 1);
> +	strncpy(idle_state->desc, state_node->name, CPUIDLE_DESC_LEN - 1);

This is a very minor concern, and shouldn't hold back this series,
but...

I was playing with this series in order to test out the qcom cpuidle
driver from Lina, and noticed that the state name and descriptions were
not terribly helpful:

/sys/devices/system/cpu/cpu0/cpuidle # cat state?/name
cpu-idle-state-
cpu-idle-state-
/sys/devices/system/cpu/cpu0/cpuidle # cat state?/desc
cpu-idle-state-0
cpu-idle-state-1

Turns out these strings come from the node name itself, and truncated in
the case of state->name, but this can be fixed in the DTS itself (c.f.
reply to Lina's driver.)

However, seeing that the node name is used to populate both the
state->name and ->, made me wonder if there should better way to set the
state->desc field to a more useful string.  Tools like powertop actually
use that field and it can be quite useful.

Kevin
