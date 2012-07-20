From: "Turquette, Mike" <mturquette@ti.com>
Subject: Re: [PATCH 3/3] cpufreq: Add a generic cpufreq-cpu0 driver
Date: Fri, 20 Jul 2012 08:50:58 -0700
Message-ID: <CAJOA=zMQKLTumW7Nx68+yxHC5Yk4QyiL2mf1+TSZfVOAtnXDWA@mail.gmail.com>
References: <1342713281-31114-1-git-send-email-shawn.guo@linaro.org>
 <1342713281-31114-4-git-send-email-shawn.guo@linaro.org> <CAMQu2gw32LogXJJa+K5ZjmCZzBNK3FY2wYwZXU8fsftsVzEO2Q@mail.gmail.com>
 <20120720123317.GA32263@S2101-09.ap.freescale.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20120720123317.GA32263@S2101-09.ap.freescale.net>
Sender: cpufreq-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@ti.com>, Nishanth Menon <nm@ti.com>, linux-pm@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, cpufreq@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>, Richard Zhao <richard.zhao@freescale.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 20, 2012 at 5:33 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> On Fri, Jul 20, 2012 at 12:22:14PM +0530, Shilimkar, Santosh wrote:
>> This *_CPU0 doesn't seems to be appropriate since this infrastructure will be
>> used on SMP systems where CPUs shares clock/voltage rails. May be you can
>> get rid of that unless there is a strong need.
>>
> All the resource handlers, clk, regulator, opp, DT node, are retrieved
> from CPU0 device even for SMP.  I hope the naming of the driver could
> tell:
>
> - The driver supports UP
> - The driver supports SMP where CPUs shares clock/voltage rails by
>   managing CPU0 (resource)
> - The driver does not support SMP where individual CPU can scale
>   clock/voltage independently.
>

How about cpufreq-single-thread.c and CONFIG_CPUFREQ_SINGLE_THREAD?
That makes sense for both UP and SMP.

Regards,
Mike
