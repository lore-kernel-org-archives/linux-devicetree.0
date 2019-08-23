From: Abhishek Goel <huntbag@linux.vnet.ibm.com>
Subject: [RFC 0/3] New idle device-tree format and support for versioned stop state
Date: Fri, 23 Aug 2019 02:09:37 -0500
Message-ID: <20190823070940.43220-1-huntbag@linux.vnet.ibm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, paulus@samba.org
Cc: npiggin@gmail.com, mpe@ellerman.id.au, ego@linux.vnet.ibm.com, svaidy@linux.ibm.com, mikey@neuling.org, rjw@rjwysocki.net, daniel.lezcano@linaro.org, Abhishek Goel <huntbag@linux.vnet.ibm.com>
List-Id: devicetree@vger.kernel.org

Background
------------------

Previously if a older kernel runs on a newer firmware, it may enable
all available states irrespective of its capability of handling it.
Consider a case that some stop state has a bug, we end up disabling all
the stop states. This patch introduces selective control to solve this
problem.

Previous version of these patches can be found at:
https://lkml.org/lkml/2018/10/11/544
These patch however also had patches for support of opal save-restore
which now I am decoupling and will take them seperately.
I have posted the corresponding skiboot patches for this kernel patchset
here : https://patchwork.ozlabs.org/cover/1144587/

What's new?
--------------------

Add stop states under ibm,idle-states in addition to the current array
based device tree properties.

New device tree format adds a compatible flag which has version
corresponding to every state, so that only kernel which has the capability
to handle the version of stop state will enable it. Drawback of the array
based dt node is that versioning of idle states is not possible.

Older kernel will still see stop0 and stop0_lite in older format and we
will deprecate it after some time.

Consider a case that stop4 has a bug. We take the following steps to
mitigate the problem.

1) Change compatible string for stop4 in OPAL to "stop4,v2" from
"stop4,v1", i.e. basicallly bump up the previous version and ship the
new firmware.

2) The kernel will ignore stop4 as it won't be able to recognize this
new version. Kernel will also ignore all the deeper states because its
possible that a cpu have requested for a deeper state but was never able
to enter into it. But we will still have shallower states that are there
before stop 4. This, thus prevents from completely disabling stop states.

Linux kernel can now look at the version string and decide if it has the
ability to handle that idle state. Henceforth, if kernel does not know
about a version, it will skip that state and all the deeper state.

Once when the workaround are implemented into the kernel, we can bump up
the known version in kernel for that state, so that support can be
enabled once again in kernel.

New Device-tree :

Final output
       power-mgt {
            ...
         ibm,enabled-stop-levels = <0xec000000>;
         ibm,cpu-idle-state-psscr-mask = <0x0 0x3003ff 0x0 0x3003ff>;
         ibm,cpu-idle-state-latencies-ns = <0x3e8 0x7d0>;
         ibm,cpu-idle-state-psscr = <0x0 0x330 0x0 0x300330>;
         ibm,cpu-idle-state-flags = <0x100000 0x101000>;
         ibm,cpu-idle-state-residency-ns = <0x2710 0x4e20>;
         ibm,idle-states {
                     stop4 {
                         flags = <0x207000>;
                         compatible = "stop4,v1",
                         psscr-mask = <0x0 0x3003ff>;
                         latency-ns = <0x186a0>;
                         residency-ns = <0x989680>;
                         psscr = <0x0 0x300374>;
			 ...
                  };
                    ...
                    stop11 {
                         ...
                         compatible = "stop11,v1",
                         ...
                  };
             };


Abhishek Goel (3):
  cpuidle/powernv : Pass state pointer instead of values to stop loop
  cpuidle/powernv: Add support for versioned stop states
  cpuidle/powernv : Add flags to identify stop state type

 arch/powerpc/include/asm/cpuidle.h    |   8 +-
 arch/powerpc/include/asm/opal-api.h   |   7 +
 arch/powerpc/include/asm/processor.h  |   5 +-
 arch/powerpc/platforms/powernv/idle.c | 371 +++++++++++++++++++++-----
 drivers/cpuidle/cpuidle-powernv.c     |  81 +++---
 5 files changed, 363 insertions(+), 109 deletions(-)

-- 
2.17.1
