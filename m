From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [RESEND PATCH v2 1/2] mfd: retu: Add OF device ID table
Date: Thu, 30 Mar 2017 08:49:31 -0400
Message-ID: <a06bc2b6-f3f9-02cc-210f-705d670be650@osg.samsung.com>
References: <20170315104958.24919-1-javier@osg.samsung.com>
 <CAL_JsqJTxT1V1Y8Wte4W22UjFcAKUuny5VCFpurwjkPz=hGxVQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJTxT1V1Y8Wte4W22UjFcAKUuny5VCFpurwjkPz=hGxVQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 03/30/2017 08:41 AM, Rob Herring wrote:
> On Wed, Mar 15, 2017 at 5:49 AM, Javier Martinez Canillas
> <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org> wrote:
>> The driver doesn't have a struct of_device_id table but supported devices
>> are registered via Device Trees. This is working on the assumption that a
>> I2C device registered via OF will always match a legacy I2C device ID and
>> that the MODALIAS reported will always be of the form i2c:<device>.
> 
> It should also have the OF MODALIAS.
> 

Yes, it should but currently it doesn't. This is the .uevent callback for I2C:

static int i2c_device_uevent(struct device *dev, struct kobj_uevent_env *env)
{
	struct i2c_client *client = to_i2c_client(dev);
	int rc;

	rc = acpi_device_uevent_modalias(dev, env);
	if (rc != -ENODEV)
		return rc;

	return add_uevent_var(env, "MODALIAS=%s%s", I2C_MODULE_PREFIX, client->name);
}

>> But this could change in the future so the correct approach is to have a
>> OF device ID table if the devices are registered via OF.
> 
> I believe this is already the case.
>

No, in fact the purpose of these patches (and others that I've been posting in
all subsystems) is to make sure that adding proper OF MODALIAS support for I2C
won't cause regressions in existing drivers due not having OF device ID tables.

This is the RFC patch I posted some time ago for I2C core:

https://patchwork.ozlabs.org/patch/388200/
 
>> The compatible strings don't have a vendor prefix because that's how it's
>> used currently, and changing this will be a Device Tree ABI break.
> 
> How so? These "compatible" strings are not documented, so there is no
> ABI. You may have been lucky to get things working using the driver
> name as the compatible string.
>

Yes, it's not documented but I thought that having users meant that it was
already an ABI.

I'm more than happy to change the upstream DTS to add a vendor prefix and
use this also in the drivers.

> Rob
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
