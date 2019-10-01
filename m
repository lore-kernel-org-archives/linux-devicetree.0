From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy rules
Date: Mon, 30 Sep 2019 22:04:48 -0300
Message-ID: <877e5pwa1b.fsf@morokweng.localdomain>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com> <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nayna Jain <nayna@linux.ibm.com>
Cc: linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jeremy Kerr <jk@ozlabs.org>, Matthew Garret <matthew.garret@nebula.com>, Mimi Zohar <zohar@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Claudio Carvalho <cclaudio@linux.ibm.com>, George Wilson <gcwilson@linux.ibm.com>, Elaine Palmer <erpalmer@us.ibm.com>, Eric Ricther <erichte@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org


Hello,

Nayna Jain <nayna@linux.ibm.com> writes:

> PowerNV systems uses kernel based bootloader, thus its secure boot
> implementation uses kernel IMA security subsystem to verify the kernel
> before kexec. Since the verification policy might differ based on the
> secure boot mode of the system, the policies are defined at runtime.
>
> This patch implements the arch-specific support to define the IMA policy
> rules based on the runtime secure boot mode of the system.
>
> This patch provides arch-specific IMA policies if PPC_SECURE_BOOT
> config is enabled.
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig           |  2 ++
>  arch/powerpc/kernel/Makefile   |  2 +-
>  arch/powerpc/kernel/ima_arch.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/ima.h            |  3 ++-
>  4 files changed, 38 insertions(+), 2 deletions(-)
>  create mode 100644 arch/powerpc/kernel/ima_arch.c
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 2c54beb29f1a..54eda07c74e5 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -916,6 +916,8 @@ config PPC_SECURE_BOOT
>  	prompt "Enable secure boot support"
>  	bool
>  	depends on PPC_POWERNV
> +	depends on IMA
> +	depends on IMA_ARCH_POLICY
>  	help
>  	  Systems with firmware secure boot enabled needs to define security
>  	  policies to extend secure boot to the OS. This config allows user
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 875b0785a20e..7156ac1fc956 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -157,7 +157,7 @@ endif
>  obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>
> -obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o
> +obj-$(CONFIG_PPC_SECURE_BOOT)	+= secure_boot.o ima_arch.o
>
>  # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>  GCOV_PROFILE_prom_init.o := n
> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
> new file mode 100644
> index 000000000000..39401b67f19e
> --- /dev/null
> +++ b/arch/powerpc/kernel/ima_arch.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 IBM Corporation
> + * Author: Nayna Jain
> + */
> +
> +#include <linux/ima.h>
> +#include <asm/secure_boot.h>
> +
> +bool arch_ima_get_secureboot(void)
> +{
> +	return is_powerpc_os_secureboot_enabled();
> +}
> +
> +/* Defines IMA appraise rules for secureboot */
> +static const char *const arch_rules[] = {
> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
> +#endif
> +	NULL
> +};
> +
> +/*
> + * Returns the relevant IMA arch policies based on the system secureboot state.
> + */
> +const char *const *arch_get_ima_policy(void)
> +{
> +	if (is_powerpc_os_secureboot_enabled())
> +		return arch_rules;
> +
> +	return NULL;
> +}

If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
then IMA won't enforce module signature either. x86's
arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
powerpc version need to do that as well?

On the flip side, if module signatures are enforced by the module
subsystem then IMA will verify the signature a second time since there's
no sharing of signature verification results between the module
subsystem and IMA (this was observed by Mimi).

IMHO this is a minor issue, since module loading isn't a hot path and
the duplicate work shouldn't impact anything. But it could be avoided by
having a NULL entry in arch_rules, which arch_get_ima_policy() would
dynamically update with the "appraise func=MODULE_CHECK" rule if
is_module_sig_enforced() is true.

--
Thiago Jung Bauermann
IBM Linux Technology Center
