From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 0/6] drivers: firmware: psci: add basic v1.0 support
Date: Fri, 29 May 2015 13:16:33 +0100
Message-ID: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The PSCI v1.0 specification[1] introduces a brand new set of features
(ie OS initiated mode and system suspend being the most notable ones)
and provides updates to the PSCI 0.2 specification, keeping backward
compatibility.

PSCI v1.0 applies minor changes to function return codes and function
behaviour (ie AFFINITY_INFO requirements, INVALID_ADDRESS return value)
and introduces a new power_state parameter format (extended stateid)
that is probeable with the newly introduced PSCI_FEATURES call.

This series upgrades the current kernel PSCI layer implementation with
a set of patches that make the kernel PSCI v1.0 compliant.

The series augments the PSCI firmware layer with a hook to retrieve
the features for a specific PSCI function (ie based on the PSCI_FEATURES
call) and uses it to detect the power_state parameter format, updating
the power_state parameter handling functions accordingly.

In order to prevent firmware interfaces mismatch, a new compatible
string is added to the DT bindings to characterize a 1.0 compliant
firmware interface.

The series is built on top of M.Rutland's branch:

git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git psci/unification

Tested on a Juno board.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.den0022c/DEN0022C_Power_State_Coordination_Interface.pdf

Lorenzo Pieralisi (6):
  ARM: kvm: psci: fix handling of unimplemented functions
  drivers: firmware: psci: add INVALID_ADDRESS return value
  drivers: firmware: psci: move power_state handling to generic code
  drivers: firmware: psci: add PSCI_FEATURES call
  drivers: firmware: psci: add extended stateid power_state support
  drivers: firmware: psci: add PSCI v1.0 DT bindings

 Documentation/devicetree/bindings/arm/psci.txt |  6 +++
 arch/arm/kvm/psci.c                            |  6 +--
 arch/arm64/kernel/psci.c                       | 14 -------
 drivers/firmware/psci.c                        | 53 ++++++++++++++++++++++++++
 include/linux/psci.h                           |  2 +
 include/uapi/linux/psci.h                      | 15 ++++++++
 6 files changed, 79 insertions(+), 17 deletions(-)

-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
