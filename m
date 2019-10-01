From: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v6 3/9] powerpc: add support to initialize ima policy
 rules
Date: Tue, 1 Oct 2019 12:07:10 -0400
Message-ID: <84f057d0-6a0b-d486-0eb6-f1590f32e377@linux.vnet.ibm.com>
References: <1569594360-7141-1-git-send-email-nayna@linux.ibm.com>
 <1569594360-7141-4-git-send-email-nayna@linux.ibm.com>
 <877e5pwa1b.fsf@morokweng.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877e5pwa1b.fsf@morokweng.localdomain>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>, Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
List-Id: devicetree@vger.kernel.org



On 09/30/2019 09:04 PM, Thiago Jung Bauermann wrote:
> Hello,

Hi,

>
>> diff --git a/arch/powerpc/kernel/ima_arch.c b/arch/powerpc/kernel/ima_arch.c
>> new file mode 100644
>> index 000000000000..39401b67f19e
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/ima_arch.c
>> @@ -0,0 +1,33 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2019 IBM Corporation
>> + * Author: Nayna Jain
>> + */
>> +
>> +#include <linux/ima.h>
>> +#include <asm/secure_boot.h>
>> +
>> +bool arch_ima_get_secureboot(void)
>> +{
>> +	return is_powerpc_os_secureboot_enabled();
>> +}
>> +
>> +/* Defines IMA appraise rules for secureboot */
>> +static const char *const arch_rules[] = {
>> +	"appraise func=KEXEC_KERNEL_CHECK appraise_type=imasig|modsig",
>> +#if !IS_ENABLED(CONFIG_MODULE_SIG)
>> +	"appraise func=MODULE_CHECK appraise_type=imasig|modsig",
>> +#endif
>> +	NULL
>> +};
>> +
>> +/*
>> + * Returns the relevant IMA arch policies based on the system secureboot state.
>> + */
>> +const char *const *arch_get_ima_policy(void)
>> +{
>> +	if (is_powerpc_os_secureboot_enabled())
>> +		return arch_rules;
>> +
>> +	return NULL;
>> +}
> If CONFIG_MODULE_SIG is enabled but module signatures aren't enforced,
> then IMA won't enforce module signature either. x86's
> arch_get_ima_policy() calls set_module_sig_enforced(). Doesn't the
> powerpc version need to do that as well?
>
> On the flip side, if module signatures are enforced by the module
> subsystem then IMA will verify the signature a second time since there's
> no sharing of signature verification results between the module
> subsystem and IMA (this was observed by Mimi).
>
> IMHO this is a minor issue, since module loading isn't a hot path and
> the duplicate work shouldn't impact anything. But it could be avoided by
> having a NULL entry in arch_rules, which arch_get_ima_policy() would
> dynamically update with the "appraise func=MODULE_CHECK" rule if
> is_module_sig_enforced() is true.

Thanks Thiago for reviewing.  I am wondering that this will give two 
meanings for NULL. Can we do something like below, there are possibly 
two options ?

1. Set IMA_APPRAISED in the iint->flags if is_module_sig_enforced().

OR

2. Let ima_get_action() check for is_module_sig_enforced() when policy 
is appraise and func is MODULE_CHECK.

Thanks & Regards,
    - Nayna
