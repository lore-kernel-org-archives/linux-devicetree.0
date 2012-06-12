From: Vincent Guittot <vincent.guittot@linaro.org>
Subject: [RFC 0/4] ARM: topology: set the capacity of each cores for big.LITTLE
Date: Tue, 12 Jun 2012 14:02:00 +0200
Message-ID: <1339502524-10265-1-git-send-email-vincent.guittot@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linaro-dev@lists.linaro.org, devicetree-discuss@lists.ozlabs.org
Cc: linux@arm.linux.org.uk, peterz@infradead.org, grant.likely@secretlab.ca, rob.herring@calxeda.com, Vincent Guittot <vincent.guittot@linaro.org>
List-Id: devicetree@vger.kernel.org

This patchset creates an arch_scale_freq_power function for ARM, which is used 
to set the relative capacity of each core of a big.LITTLE system. 

Vincent Guittot (4):
  ARM: topology: Add arch_scale_freq_power function
  ARM: topology: factorize the update of sibling masks
  ARM: topology: Update cpu_power according to DT information
  sched: cpu_power: enable ARCH_POWER

 arch/arm/include/asm/topology.h |    2 +
 arch/arm/kernel/topology.c      |  203 +++++++++++++++++++++++++++++++++++----
 kernel/sched/features.h         |    2 +-
 3 files changed, 185 insertions(+), 22 deletions(-)

-- 
1.7.9.5
