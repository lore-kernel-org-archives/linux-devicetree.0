From: Kumar Gala <galak@codeaurora.org>
Subject: [RFC PATCH 0/5] Add smp booting support for Qualcomm ARMv8 SoCs
Date: Thu,  9 Apr 2015 12:37:06 -0500
Message-ID: <1428601031-5366-1-git-send-email-galak@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org
Cc: Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, arm@kernel.org, devicetree@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, abhimany@codeaurora.org
List-Id: devicetree@vger.kernel.org

This patch set adds support for SMP boot on the MSM8x16 family of Qualcomm SoCs.

To support SMP on the MSM8x16 SoCs we need to add ARMv8/64-bit SCM interfaces to
setup the boot/release addresses for the secondary CPUs.  In addition we need
a uniquie set of cpu ops.  I'm aware the desired methods for booting secondary
CPUs is either via spintable or PSCI.  However, these SoCs are shipping with a
firmware that does not support those methods.

- k

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
