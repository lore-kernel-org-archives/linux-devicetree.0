From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] iio: core: implement devm_iio_device_alloc/devm_iio_device_free
Date: Sun, 21 Jul 2013 17:54:55 +0100
Message-ID: <51EC125F.5020808@kernel.org>
References: <1374142766-29736-1-git-send-email-x0199363@ti.com> <51EA8B06.3080005@metafoo.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51EA8B06.3080005-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Cc: Oleksandr Kravchenko <x0199363-l0cyMroinI0@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org, srinivas.pandruvada-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, grygorii.strashko-l0cyMroinI0@public.gmane.org, Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/20/2013 02:05 PM, Lars-Peter Clausen wrote:
> On 07/18/2013 12:19 PM, Oleksandr Kravchenko wrote:
>> From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>>
>> Add a resource managed devm_iio_device_alloc()/devm_iio_device_free()
>> to automatically clean up any allocations made by IIO drivers,
>> thus leading to simplified IIO drivers code.
>>
>> In addition, this will allow IIO drivers to use other devm_*() API
>> (like devm_request_irq) and don't care about the race between
>> iio_device_free() and the release of resources by Device core
>> during driver removing.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>> [o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org: fix return value ib devm_iio_device_alloc
>> in case if devres_alloc failed, remove unused variable "rc"]
>> Signed-off-by: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
>> Tested-by: Oleksandr Kravchenko <o.v.kravchenko-hExfYMNmJl/Cnp4W7fqMDg@public.gmane.org>
> 
> Very nice, thanks for taking care of this.
> 
> Reviewed-by: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>

Indeed.  Thanks for this,

I did drop the [] bit in the sign off as you had a perfect right
to sign off on it anyway and that really cluttered it up with
stuff that isn't in a standard form for that block as far as I know.

Applied to the togreg branch of iio.git.  I suspect we may get a
reasonable flood of patches using this over the next month or two.

Thanks,

Jonathan
> 
> 
>> ---
>>   drivers/iio/industrialio-core.c |   47 +++++++++++++++++++++++++++++++++++++++
>>   include/linux/iio/iio.h         |   25 +++++++++++++++++++++
>>   2 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
>> index e145931..d56d122 100644
>> --- a/drivers/iio/industrialio-core.c
>> +++ b/drivers/iio/industrialio-core.c
>> @@ -912,6 +912,53 @@ void iio_device_free(struct iio_dev *dev)
>>   }
>>   EXPORT_SYMBOL(iio_device_free);
>>
>> +static void devm_iio_device_release(struct device *dev, void *res)
>> +{
>> +    iio_device_free(*(struct iio_dev **)res);
>> +}
>> +
>> +static int devm_iio_device_match(struct device *dev, void *res, void *data)
>> +{
>> +    struct iio_dev **r = res;
>> +    if (!r || !*r) {
>> +        WARN_ON(!r || !*r);
>> +        return 0;
>> +    }
>> +    return *r == data;
>> +}
>> +
>> +struct iio_dev *devm_iio_device_alloc(struct device *dev, int sizeof_priv)
>> +{
>> +    struct iio_dev **ptr, *iio_dev;
>> +
>> +    ptr = devres_alloc(devm_iio_device_release, sizeof(*ptr),
>> +               GFP_KERNEL);
>> +    if (!ptr)
>> +        return NULL;
>> +
>> +    /* use raw alloc_dr for kmalloc caller tracing */
>> +    iio_dev = iio_device_alloc(sizeof_priv);
>> +    if (iio_dev) {
>> +        *ptr = iio_dev;
>> +        devres_add(dev, ptr);
>> +    } else {
>> +        devres_free(ptr);
>> +    }
>> +
>> +    return iio_dev;
>> +}
>> +EXPORT_SYMBOL_GPL(devm_iio_device_alloc);
>> +
>> +void devm_iio_device_free(struct device *dev, struct iio_dev *iio_dev)
>> +{
>> +    int rc;
>> +
>> +    rc = devres_release(dev, devm_iio_device_release,
>> +                devm_iio_device_match, iio_dev);
>> +    WARN_ON(rc);
>> +}
>> +EXPORT_SYMBOL_GPL(devm_iio_device_free);
>> +
>>   /**
>>    * iio_chrdev_open() - chrdev file open for buffer access and ioctls
>>    **/
>> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> index 8d171f4..f1d99f6 100644
>> --- a/include/linux/iio/iio.h
>> +++ b/include/linux/iio/iio.h
>> @@ -532,6 +532,31 @@ static inline struct iio_dev *iio_priv_to_dev(void *priv)
>>   void iio_device_free(struct iio_dev *indio_dev);
>>
>>   /**
>> + * devm_iio_device_alloc - Resource-managed iio_device_alloc()
>> + * @dev:         Device to allocate iio_dev for
>> + * @sizeof_priv:     Space to allocate for private structure.
>> + *
>> + * Managed iio_device_alloc.  iio_dev allocated with this function is
>> + * automatically freed on driver detach.
>> + *
>> + * If an iio_dev allocated with this function needs to be freed separately,
>> + * devm_iio_device_free() must be used.
>> + *
>> + * RETURNS:
>> + * Pointer to allocated iio_dev on success, NULL on failure.
>> + */
>> +struct iio_dev *devm_iio_device_alloc(struct device *dev, int sizeof_priv);
>> +
>> +/**
>> + * devm_iio_device_free - Resource-managed iio_device_free()
>> + * @dev:        Device this iio_dev belongs to
>> + * @indio_dev:         the iio_dev associated with the device
>> + *
>> + * Free indio_dev allocated with devm_iio_device_alloc().
>> + */
>> +void devm_iio_device_free(struct device *dev, struct iio_dev *iio_dev);
>> +
>> +/**
>>    * iio_buffer_enabled() - helper function to test if the buffer is enabled
>>    * @indio_dev:        IIO device structure for device
>>    **/
>>
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
