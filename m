From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 7/8] tpm: add sysfs attributes for tpm2
Date: Thu, 13 Jun 2019 20:30:09 -0300
Message-ID: <20190613233009.GI22901@ziepe.ca>
References: <20190613180931.65445-1-swboyd@chromium.org>
 <20190613180931.65445-8-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613180931.65445-8-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Andrey Pronin <apronin@chromium.org>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-integrity@vger.kernel.org, devicetree@vger.kernel.org, Duncan Laurie <dlaurie@chromium.org>, Guenter Roeck <groeck@chromium.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 13, 2019 at 11:09:30AM -0700, Stephen Boyd wrote:

> +static ssize_t tpm2_prop_flag_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buf)
>  {
> -	/* XXX: If you wish to remove this restriction, you must first update
> -	 * tpm_sysfs to explicitly lock chip->ops.
> -	 */
> -	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> -		return;
> +	struct tpm2_prop_flag_dev_attribute *pa =
> +		container_of(attr, struct tpm2_prop_flag_dev_attribute, attr);
> +	u32 flags;
> +	ssize_t rc;
> +
> +	rc = tpm2_get_tpm_pt(to_tpm_chip(dev), pa->property_id, &flags,
> +			     "reading property");
> +	if (rc)
> +		return 0;
> +
> +	return sprintf(buf, "%d\n", !!(flags & pa->flag_mask));
> +}
> +
> +static ssize_t tpm2_prop_u32_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	struct tpm2_prop_u32_dev_attribute *pa =
> +		container_of(attr, struct tpm2_prop_u32_dev_attribute, attr);
> +	u32 value;
> +	ssize_t rc;
> +
> +	rc = tpm2_get_tpm_pt(to_tpm_chip(dev), pa->property_id, &value,
> +			     "reading property");
> +	if (rc)
> +		return 0;
> +
> +	return sprintf(buf, "%u\n", value);
> +}
>  
> +#define TPM2_PROP_FLAG_ATTR(_name, _property_id, _flag_mask)           \
> +	struct tpm2_prop_flag_dev_attribute attr_tpm2_prop_##_name = { \
> +		__ATTR(_name, S_IRUGO, tpm2_prop_flag_show, NULL),     \
> +		_property_id, _flag_mask                               \
> +	}
> +
> +#define TPM2_PROP_U32_ATTR(_name, _property_id)                        \
> +	struct tpm2_prop_u32_dev_attribute attr_tpm2_prop_##_name = {  \
> +		__ATTR(_name, S_IRUGO, tpm2_prop_u32_show, NULL),      \
> +		_property_id                                           \
> +	}
> +
> +TPM2_PROP_FLAG_ATTR(owner_auth_set,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_OWNER_AUTH_SET);
> +TPM2_PROP_FLAG_ATTR(endorsement_auth_set,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_ENDORSEMENT_AUTH_SET);
> +TPM2_PROP_FLAG_ATTR(lockout_auth_set,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_LOCKOUT_AUTH_SET);
> +TPM2_PROP_FLAG_ATTR(disable_clear,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_DISABLE_CLEAR);
> +TPM2_PROP_FLAG_ATTR(in_lockout,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_IN_LOCKOUT);
> +TPM2_PROP_FLAG_ATTR(tpm_generated_eps,
> +		    TPM2_PT_PERMANENT, TPM2_ATTR_TPM_GENERATED_EPS);
> +
> +TPM2_PROP_FLAG_ATTR(ph_enable,
> +		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_PH_ENABLE);
> +TPM2_PROP_FLAG_ATTR(sh_enable,
> +		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_SH_ENABLE);
> +TPM2_PROP_FLAG_ATTR(eh_enable,
> +		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_EH_ENABLE);
> +TPM2_PROP_FLAG_ATTR(ph_enable_nv,
> +		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_PH_ENABLE_NV);
> +TPM2_PROP_FLAG_ATTR(orderly,
> +		    TPM2_PT_STARTUP_CLEAR, TPM2_ATTR_ORDERLY);
> +
> +TPM2_PROP_U32_ATTR(lockout_counter, TPM2_PT_LOCKOUT_COUNTER);
> +TPM2_PROP_U32_ATTR(max_auth_fail, TPM2_PT_MAX_AUTH_FAIL);
> +TPM2_PROP_U32_ATTR(lockout_interval, TPM2_PT_LOCKOUT_INTERVAL);
> +TPM2_PROP_U32_ATTR(lockout_recovery, TPM2_PT_LOCKOUT_RECOVERY);
> +
> +#define ATTR_FOR_TPM2_PROP(_name) (&attr_tpm2_prop_##_name.attr.attr)
> +static struct attribute *tpm2_dev_attrs[] = {
> +	ATTR_FOR_TPM2_PROP(owner_auth_set),
> +	ATTR_FOR_TPM2_PROP(endorsement_auth_set),
> +	ATTR_FOR_TPM2_PROP(lockout_auth_set),
> +	ATTR_FOR_TPM2_PROP(disable_clear),
> +	ATTR_FOR_TPM2_PROP(in_lockout),
> +	ATTR_FOR_TPM2_PROP(tpm_generated_eps),
> +	ATTR_FOR_TPM2_PROP(ph_enable),
> +	ATTR_FOR_TPM2_PROP(sh_enable),
> +	ATTR_FOR_TPM2_PROP(eh_enable),
> +	ATTR_FOR_TPM2_PROP(ph_enable_nv),
> +	ATTR_FOR_TPM2_PROP(orderly),
> +	ATTR_FOR_TPM2_PROP(lockout_counter),
> +	ATTR_FOR_TPM2_PROP(max_auth_fail),
> +	ATTR_FOR_TPM2_PROP(lockout_interval),
> +	ATTR_FOR_TPM2_PROP(lockout_recovery),
> +	&dev_attr_durations.attr,
> +	&dev_attr_timeouts.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group tpm2_dev_group = {
> +	.attrs = tpm2_dev_attrs,
> +};
> +
> +void tpm_sysfs_add_device(struct tpm_chip *chip)
> +{
>  	/* The sysfs routines rely on an implicit tpm_try_get_ops, device_del
>  	 * is called before ops is null'd and the sysfs core synchronizes this
>  	 * removal so that no callbacks are running or can run again
>  	 */
> +	/* FIXME: update tpm_sysfs to explicitly lock chip->ops for TPM 2.0
> +	 */

What does the fixme mean? You cold add proper get_ops locking for the
tpm2 callbacks, it is not so hard. 

I actually think it is needed...

Oh. Jarkko, this is why you can't set ops to null in the class
shutdown, sysfs needs to be fixed first. ops can only go to null for
TPM1 after device_del until someone fixes the locking.

Jason
