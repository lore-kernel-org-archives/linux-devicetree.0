From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/6] ARM: kvm: psci: fix handling of unimplemented functions
Date: Fri, 29 May 2015 13:16:34 +0100
Message-ID: <1432901799-18359-2-git-send-email-lorenzo.pieralisi@arm.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

According to the PSCI specification and the SMC/HVC calling
convention, PSCI function_ids that are not implemented must
return NOT_SUPPORTED as return value.

Current KVM implementation takes an unhandled PSCI function_id
as an error and injects an undefined instruction into the guest
if PSCI implementation is called with a function_id that is not
handled by the resident PSCI version (ie it is not implemented),
which is not the behaviour expected by a guest when calling a
PSCI function_id that is not implemented.

This patch fixes this issue by returning NOT_SUPPORTED whenever
the kvm PSCI call is executed for a function_id that is not
implemented by the PSCI kvm layer.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Reported-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 arch/arm/kvm/psci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kvm/psci.c b/arch/arm/kvm/psci.c
index 7e9398c..ec5943b 100644
--- a/arch/arm/kvm/psci.c
+++ b/arch/arm/kvm/psci.c
@@ -273,7 +273,8 @@ static int kvm_psci_0_2_call(struct kvm_vcpu *vcpu)
 		ret = 0;
 		break;
 	default:
-		return -EINVAL;
+		val = PSCI_RET_NOT_SUPPORTED;
+		break;
 	}
 
 	*vcpu_reg(vcpu, 0) = val;
@@ -295,10 +296,9 @@ static int kvm_psci_0_1_call(struct kvm_vcpu *vcpu)
 		break;
 	case KVM_PSCI_FN_CPU_SUSPEND:
 	case KVM_PSCI_FN_MIGRATE:
+	default:
 		val = PSCI_RET_NOT_SUPPORTED;
 		break;
-	default:
-		return -EINVAL;
 	}
 
 	*vcpu_reg(vcpu, 0) = val;
-- 
2.2.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
