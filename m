From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH RFC 0/2] ARM: DT: add bindings for system suspend
Date: Wed, 21 Jan 2015 11:35:53 +0000
Message-ID: <1421840155-18990-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jisheng Zhang <jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

There are various attempts on the list to implement system suspend
on ARM64 using CPU Idle. Here is an attempt to standardise it by 
defining DT bindings for the same and hence provide a generic solution
without associating it with CPUIdle.

Currently only PSCI is supported as entry method in this series.

Regards,
Sudeep

P.S: I am on vacation till Jan 31st and will have limited access to
emails, so there might be delays in my response.

Sudeep Holla (2):
  Documentation: arm: define DT bindings for system suspend
  ARM64: psci: implement system suspend using PSCI v0.2 CPU SUSPEND

 Documentation/devicetree/bindings/arm/psci.txt     | 11 +++
 .../devicetree/bindings/arm/system-suspend.txt     | 93 ++++++++++++++++++++++
 arch/arm64/kernel/psci.c                           | 83 ++++++++++++++++---
 3 files changed, 178 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/system-suspend.txt

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
