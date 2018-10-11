From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC PATCH v2 0/3] New device-tree format and Opal based idle
 save-restore
Date: Thu, 11 Oct 2018 12:55:49 -0700
Message-ID: <1b6bcd31-1dc8-abf7-304a-4de95b8f998b@gmail.com>
References: <20181011132237.14604-1-akshay.adiga@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181011132237.14604-1-akshay.adiga@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Akshay Adiga <akshay.adiga@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: huntbag@linux.vnet.ibm.com, npiggin@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au, ego@linux.vnet.ibm.com
List-Id: devicetree@vger.kernel.org

+ devicetree mail list

On 10/11/18 06:22, Akshay Adiga wrote:
> Previously if a older kernel runs on a newer firmware, it may enable
> all available states irrespective of its capability of handling it.
> New device tree format adds a compatible flag, so that only kernel
> which has the capability to handle the version of stop state will enable
> it.
> 
> Older kernel will still see stop0 and stop0_lite in older format and we
> will depricate it after some time.
> 
> 1) Idea is to bump up the version string in firmware if we find a bug or
> regression in stop states. A fix will be provided in linux which would
> now know about the bumped up version of stop states, where as kernel
> without fixes would ignore the states.
> 
> 2) Slowly deprecate cpuidle/cpuhotplug threshold which is hard-coded
> into cpuidle-powernv driver. Instead use compatible strings to indicate
> if idle state is suitable for cpuidle and hotplug.
> 
> New idle state device tree format :
>        power-mgt {
>             ...
>          ibm,enabled-stop-levels = <0xec000000>;
>          ibm,cpu-idle-state-psscr-mask = <0x0 0x3003ff 0x0 0x3003ff>;
>          ibm,cpu-idle-state-latencies-ns = <0x3e8 0x7d0>;
>          ibm,cpu-idle-state-psscr = <0x0 0x330 0x0 0x300330>;
>          ibm,cpu-idle-state-flags = <0x100000 0x101000>;
>          ibm,cpu-idle-state-residency-ns = <0x2710 0x4e20>;
>          ibm,idle-states {
>                      stop4 {
>                          flags = <0x207000>;
>                          compatible = "ibm,state-v1",
> 				      "opal-support";
> 			 type = "cpuidle";
>                          psscr-mask = <0x0 0x3003ff>;
>                          handle = <0x102>;
>                          latency-ns = <0x186a0>;
>                          residency-ns = <0x989680>;
>                          psscr = <0x0 0x300374>;
>                   };
>                     ...
>                     stop11 {
>                      ...
>                          compatible = "ibm,state-v1",
> 				      "opal-support";
> 			 type = "cpuoffline";
>                          ...
>                   };
>              };
> 
> High-level parsing algorithm :
> 
> Say Known version string = "ibm,state-v1"
> 
> for each stop state node in device tree:
> 	if (compatible has known version string)
> 		kernel takes care of stop-transitions
> 	else if (compatible has "opal-support")
> 		OPAL takes care of stop-transitions
> 	else
> 		Skip All deeper states
> 
> When a state does not have both version support and opal support,
> Its possible to exit from a shallower state. Hence skipping all
> deeper states.
> 
> OPAL support for idle states
> ----------------------------
> 
> With this patch series, all the states that loose hypervisor state
> will be handled through opal_call.
> 
> Patch 3 adds support for Saving/restoring of SPRs and resync-timebase
> in OPAL. Also all the decision making such as identifying first thread
> in the core and taking locks before restoring, etc are implemented in
> OPAL.
> 
> How does it work ?
> -------------------
> 
> Consider a case that stop4 has a bug. We take the following steps to
> mitigate the problem.
> 
> 1) Change compatible string for stop4 in OPAL to "ibm-state-v2" and
> remove "opal-supported". ship the new firmware.
> The kernel ignores stop4 and all deeper states. But we will still have
> shallower states. Prevents from completely disabling stop states.
> 
> 2) Implement workaround in OPAL and add "opal-supported". Ship new firmware
> The kernel uses opal for stop-transtion , which has workaround implemented.
> We get stop4 and deeper states working without kernel changes and backports.
> (and considerably less time)
> 
> 3) Implement workaround in kernel and add "ibm-state-v2" as known versions
> The kernel will now be able to handle stop4 and deeper states.
> 
> Changes from v1 :
>  - Code is rebased on Nick Piggin's v4 patch "powerpc/64s: reimplement book3s
>    idle code in C"
> 	http://patchwork.ozlabs.org/patch/969596/
>  - All the states that loses hypervisor states will be handled by OPAL
>  - All the decision making such as identifying first thread in
>    the core and taking locks before restoring in such cases have also been
>    moved to OPAL
> 
> 
> Abhishek Goel (1):
>   cpuidle/powernv: save-restore sprs in opal
> 
> Akshay Adiga (2):
>   cpuidle/powernv: Add support for states with ibm,cpuidle-state-v1
>   powernv/cpuidle: Pass pointers instead of values to  stop loop
> 
>  arch/powerpc/include/asm/cpuidle.h            |   9 +
>  arch/powerpc/include/asm/opal-api.h           |   4 +-
>  arch/powerpc/include/asm/opal.h               |   3 +
>  arch/powerpc/include/asm/processor.h          |   8 +-
>  arch/powerpc/kernel/idle_book3s.S             |   6 +-
>  arch/powerpc/platforms/powernv/idle.c         | 247 ++++++++++++++----
>  .../powerpc/platforms/powernv/opal-wrappers.S |   2 +
>  drivers/cpuidle/cpuidle-powernv.c             |  46 ++--
>  8 files changed, 251 insertions(+), 74 deletions(-)
> 
