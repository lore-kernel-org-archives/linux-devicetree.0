From: Brendan Jackman <brendan.jackman-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC 0/6] Illustration of using domain-idle-states for CPU idle states
Date: Wed, 24 Aug 2016 14:48:16 +0100
Message-ID: <20160824134822.3591-1-brendan.jackman@arm.com>
References: <1470351902-43103-3-git-send-email-lina.iyer@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470351902-43103-3-git-send-email-lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org
Cc: andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Axel Haslam <ahaslam+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Titinger <mtitinger+renesas-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Lina Iyer <lina.iyer-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I've proposed before that, in order to avoid splitting idle state information
between cpu-idle-states (or a hypothetical device-idle-states for devices) and
domain-idle-states, we use domain-idle-states for everything. If a device or CPU
has an idle state, we declare that it's in a power (sub)domain of its own, and
add the idle state as a property of that (sub)domain.

I'm just posting these patches to illustrate the idea. With these patches,
cpu-idle-states is totally ignored when a cpu node has a power-domains property
and instead the power-domains tree is walked to find states. The states are
linearised under the assumption that no parent domain can enter an idle state
until its children are in their deepest possible state.

This _doesn't_ include OSI suspend so not much of the work is done. In order to
extend this for OSI suspend, we'd need to detect whether OSI is supported by the
FW (as in Lina's patch [1]). If it is not supported, we'd add all the states to
cpuidle as in these patches. If it _is_, we'd add only the CPU-level states to
cpuidle, and the remaining states to the CPU PM domains. I'm not clear on how
that would be architected so my next step is to investigate that.

[1] drivers: firmware: psci: Allow OS Initiated suspend mode
    https://patchwork.kernel.org/patch/9264543/

Brendan Jackman (6):
These three are just awkward implementation details for the proof-of-concept:
  cpuidle: Rename cpuidle_get_{cpu->dev}_driver
  cpuidle: Add public funcion to get driver from CPU index
  cpuidle: Add device_node pointer in cpuidle_state

This is the important one that demonstrates the behaviour I'm talking about:
  cpuidle: dt: Add support for reading states from power domains

These two illustrate how the DT would look with this model; ARM Juno r0 is the
only platform I have for the moment.
  arm64: dts: Add Juno r0 CPU power domain tree
  arm64: dts: Add domain-idle-states for Juno r0 power domains

 arch/arm64/boot/dts/arm/juno.dts |  61 +++++++++++
 drivers/cpuidle/cpuidle.c        |  10 +-
 drivers/cpuidle/driver.c         |  22 ++--
 drivers/cpuidle/dt_idle_states.c | 220 ++++++++++++++++++++++++++++++++-------
 drivers/cpuidle/sysfs.c          |   6 +-
 drivers/firmware/psci.c          |  38 +++----
 include/linux/cpuidle.h          |  23 ++--
 kernel/sched/idle.c              |   2 +-
 8 files changed, 297 insertions(+), 85 deletions(-)

--
2.9.3
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
