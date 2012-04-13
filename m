From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/2] staging: iio: add driver for isl29028
Date: Fri, 13 Apr 2012 15:18:18 +0530
Message-ID: <4F87F662.7040204@nvidia.com>
References: <1334239266-29505-1-git-send-email-ldewangan@nvidia.com> <1334239266-29505-3-git-send-email-ldewangan@nvidia.com> <4F86E7F9.7000303@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F86E7F9.7000303-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org" <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "max-U9r9yeDMy7A@public.gmane.org" <max-U9r9yeDMy7A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 12 April 2012 08:04 PM, Jonathan Cameron wrote:
> On 4/12/2012 3:01 PM, Laxman Dewangan wrote:
>> Intersil's ISL29028 is concurrent Ambient Light and
>> Proximity Sensor device.
>> Add driver to access the light and IR intensity and
>> proximity value via iio interface.
> Very nearly there.  The available attributes need to match naming
> of what they are providing values for. (we need a better way of handling
> these but that's a job for another day).
>
> Otherwise, all good.

Fine, I will do change.

>> +     mutex_unlock(&chip->lock);
>> +     return ret;
>> +}
>> +
>> +static IIO_CONST_ATTR(proximity_sampling_frequency_available,
>> +                             "1, 3, 5, 10, 13, 20, 83, 100");
>> +static IIO_CONST_ATTR(illuminance_scale_available, "125, 2000");
>> +
>> +#define ISL29028_DEV_ATTR(name) (&iio_dev_attr_##name.dev_attr.attr)
>> +#define ISL29028_CONST_ATTR(name) (&iio_const_attr_##name.dev_attr.attr)
>> +static struct attribute *isl29028_attributes[] = {
>> +     ISL29028_CONST_ATTR(proximity_sampling_frequency_available),
> tiny disconnect now that you have in_proximity0_sampling frequency, this
> should be in_proximity0_sampling_frequency_available
>

I saw the attribute appear as
in_illuminance_input
in_illuminance_scale
in_intensity_raw
in_proximity_raw
in_proximity_sampling_frequency


As I have not set  the .indexed to non-zero,  I will go as non-indexd 
name like
in_proximity_sampling_frequency_available.

>> +     ISL29028_CONST_ATTR(illuminance_scale_available),
> snap here (sorry, missed that last time).
>
> in_illuminance0_scale_available
>

I think should be in_illuminance_scale_available
