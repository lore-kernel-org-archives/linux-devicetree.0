From: "Jon Medhurst (Tixy)" <tixy@linaro.org>
Subject: Re: [RFC PATCH v2 2/2] drivers: mfd: vexpress: add Serial Power
 Controller (SPC) support
Date: Wed, 05 Jun 2013 17:32:30 +0100
Message-ID: <1370449950.3496.12.camel@linaro1.home>
References: <1370432767-6620-1-git-send-email-lorenzo.pieralisi@arm.com>
	 <1370432767-6620-3-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1370432767-6620-3-git-send-email-lorenzo.pieralisi@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, Samuel Ortiz <sameo@linux.intel.com>, Pawel Moll <pawel.moll@arm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>, Achin Gupta <achin.gupta@arm.com>, Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 2013-06-05 at 12:46 +0100, Lorenzo Pieralisi wrote:
[...]
> +
> +static bool __init __vexpress_spc_check_loaded(void);
> +static bool (*spc_check_loaded)(void) = &__vexpress_spc_check_loaded;

We get a section mismatch warning from the above because
__vexpress_spc_check_loaded is marked __init.

Now, we know the code is safe because we replace the reference in the
early_initcall below, before the init section is discarded (which is the
whole point of the construct) so we can add __refdata to the declaration
of spc_check_loaded to silence the warning.

Other than that I've not noticed any issues when testing the patches.

> +
> +static bool __init __vexpress_spc_check_loaded(void)
> +{
> +	if (vexpress_spc_load_result == -EAGAIN)
> +		vexpress_spc_load_result = vexpress_spc_init();
> +	spc_check_loaded = &vexpress_spc_initialized;
> +	return vexpress_spc_initialized();
> +}
> +
> +/*
> + * Function exported to manage early_initcall ordering.
> + * SPC code is needed very early in the boot process
> + * to bring CPUs out of reset and initialize power
> + * management back-end. After boot swap pointers to
> + * make the functionality check available to loadable
> + * modules, when early boot init functions have been
> + * already freed from kernel address space.
> + */
> +bool vexpress_spc_check_loaded(void)
> +{
> +	return spc_check_loaded();
> +}
> +EXPORT_SYMBOL_GPL(vexpress_spc_check_loaded);
> +
> +static int __init vexpress_spc_early_init(void)
> +{
> +	__vexpress_spc_check_loaded();
> +	return vexpress_spc_load_result;
> +}
> +early_initcall(vexpress_spc_early_init);
[...]

-- 
Tixy
