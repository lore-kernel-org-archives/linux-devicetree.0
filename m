From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: kvm: psci: fix handling of unimplemented functions
Date: Fri, 29 May 2015 14:04:49 +0100
Message-ID: <556863F1.10902@arm.com>
References: <1432901799-18359-1-git-send-email-lorenzo.pieralisi@arm.com> <1432901799-18359-2-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432901799-18359-2-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 29/05/15 13:16, Lorenzo Pieralisi wrote:
> According to the PSCI specification and the SMC/HVC calling
> convention, PSCI function_ids that are not implemented must
> return NOT_SUPPORTED as return value.
>
> Current KVM implementation takes an unhandled PSCI function_id
> as an error and injects an undefined instruction into the guest
> if PSCI implementation is called with a function_id that is not
> handled by the resident PSCI version (ie it is not implemented),
> which is not the behaviour expected by a guest when calling a
> PSCI function_id that is not implemented.
>
> This patch fixes this issue by returning NOT_SUPPORTED whenever
> the kvm PSCI call is executed for a function_id that is not
> implemented by the PSCI kvm layer.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> Reported-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
> Cc: Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Anup Patel <anup.patel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> ---
>   arch/arm/kvm/psci.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/kvm/psci.c b/arch/arm/kvm/psci.c
> index 7e9398c..ec5943b 100644
> --- a/arch/arm/kvm/psci.c
> +++ b/arch/arm/kvm/psci.c
> @@ -273,7 +273,8 @@ static int kvm_psci_0_2_call(struct kvm_vcpu *vcpu)
>   		ret = 0;
>   		break;
>   	default:
> -		return -EINVAL;
> +		val = PSCI_RET_NOT_SUPPORTED;
> +		break;

IMO we can remove all the other optional non-implemented PSCI functions
(e.g. KVM_PSCI_FN_MIGRATE, KVM_PSCI_FN_CPU_SUSPEND, ..etc) returning
PSCI_RET_NOT_SUPPORTED here as they will be then automatically covered
by default case.

Otherwise looks good to me:
Acked-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>

Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
