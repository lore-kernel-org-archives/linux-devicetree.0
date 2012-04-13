From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: [PATCH V4 2/2] staging: iio: add driver for isl29028
Date: Fri, 13 Apr 2012 11:05:33 +0100
Message-ID: <4F87FA6D.7080700@cam.ac.uk>
References: <1334239266-29505-1-git-send-email-ldewangan@nvidia.com>
	<1334239266-29505-3-git-send-email-ldewangan@nvidia.com>
	<4F86E7F9.7000303@cam.ac.uk> <4F87F662.7040204@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4F87F662.7040204@nvidia.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
	<mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "max@stro.at" <max@stro.at>, "jbrenner@taosinc.com" <jbrenner@taosinc.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Rhyland Klein <rklein@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

On 4/13/2012 10:48 AM, Laxman Dewangan wrote:
> On Thursday 12 April 2012 08:04 PM, Jonathan Cameron wrote:
>> On 4/12/2012 3:01 PM, Laxman Dewangan wrote:
>>> Intersil's ISL29028 is concurrent Ambient Light and
>>> Proximity Sensor device.
>>> Add driver to access the light and IR intensity and
>>> proximity value via iio interface.
>> Very nearly there.  The available attributes need to match naming
>> of what they are providing values for. (we need a better way of handling
>> these but that's a job for another day).
>>
>> Otherwise, all good.
>
> Fine, I will do change.
>
>>> +     mutex_unlock(&chip->lock);
>>> +     return ret;
>>> +}
>>> +
>>> +static IIO_CONST_ATTR(proximity_sampling_frequency_available,
>>> +                             "1, 3, 5, 10, 13, 20, 83, 100");
>>> +static IIO_CONST_ATTR(illuminance_scale_available, "125, 2000");
>>> +
>>> +#define ISL29028_DEV_ATTR(name) (&iio_dev_attr_##name.dev_attr.attr)
>>> +#define ISL29028_CONST_ATTR(name) 
>>> (&iio_const_attr_##name.dev_attr.attr)
>>> +static struct attribute *isl29028_attributes[] = {
>>> +     ISL29028_CONST_ATTR(proximity_sampling_frequency_available),
>> tiny disconnect now that you have in_proximity0_sampling frequency, this
>> should be in_proximity0_sampling_frequency_available
>>
>
> I saw the attribute appear as
> in_illuminance_input
> in_illuminance_scale
> in_intensity_raw
> in_proximity_raw
> in_proximity_sampling_frequency
>
>
> As I have not set  the .indexed to non-zero,  I will go as non-indexd 
> name like
> in_proximity_sampling_frequency_available.
Fair enough.
>
>>> +     ISL29028_CONST_ATTR(illuminance_scale_available),
>> snap here (sorry, missed that last time).
>>
>> in_illuminance0_scale_available
>>
>
> I think should be in_illuminance_scale_available
yup
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
