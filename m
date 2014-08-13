From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH Resend v2 0/2] arm64: Add PMU node for APM X-Gene Storm SoC
Date: Wed, 13 Aug 2014 11:32:08 -0700
Message-ID: <1407954730-9768-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds PMU node for APM X-Gene's Potenza CPU.
Potenza CPU PMU is compatible with ARMv8-PMUv3.

I am resending this patch since the original author has left the company and
I am taking over for the work. There is no change to the original patch.

Just a comment on the dependency on the second part of the patch. Though I
agree that without the GIC patch, perf utility does not function correctly on
our current platform. However, it also requires the correct bootloader to be
installed to perform the correct actions. This does not break Linux, which
lead me to remove the statement in the previous attempt. I have since put
back the statement and hope that the maintainer would provide some guidance
on if the patch would be postponed because the dependancy.

Feng Kan (2):
  dt-bindings: Add Potenza PMU binding
  arm64: dts: Add PMU node for APM X-Gene Storm SOC

 Documentation/devicetree/bindings/arm/pmu.txt | 1 +
 arch/arm64/boot/dts/apm-storm.dtsi            | 5 +++++
 2 files changed, 6 insertions(+)

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
