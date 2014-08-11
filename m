From: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
Subject: [PATCH Resend 0/2] arm64: Add PMU node for APM X-Gene Storm SoC
Date: Mon, 11 Aug 2014 16:47:31 -0700
Message-ID: <1407800853-3149-1-git-send-email-fkan@apm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: patches-qTEPVZfXA3Y@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dann.frazier-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
Cc: Feng Kan <fkan-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds PMU node for APM X-Gene's Potenza CPU.
Potenza CPU PMU is compatible with ARMv8-PMUv3.

I have remove the previous notice regarding the dependancy on the GIC driver
from the commit message.

Feng Kan (1):
  dt-bindings: Add Potenza PMU binding

Vinayak Kale (1):
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
