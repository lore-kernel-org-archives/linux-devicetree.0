From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] staging: Documentation: add proximity_sampling_period
 as sysfs details
Date: Thu, 12 Apr 2012 15:18:27 +0530
Message-ID: <4F86A4EB.4040202@nvidia.com>
References: <1334214492-23044-1-git-send-email-ldewangan@nvidia.com> <1334214492-23044-3-git-send-email-ldewangan@nvidia.com> <4F86A26B.1090209@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F86A26B.1090209-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org" <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "max-U9r9yeDMy7A@public.gmane.org" <max-U9r9yeDMy7A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 12 April 2012 03:07 PM, Jonathan Cameron wrote:
> On 4/12/2012 8:08 AM, Laxman Dewangan wrote:
>> +What:		/sys/bus/iio/devices/device[n]/proximity_sampling_period
>> +KernelVersion:	3.5
>> +Contact:	linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> +Description:
>> +		Hardware dependent mode for proximity sensor device to set/get
>> +		the sampling rate of proximity sensing and conversion.
> Ah, that explains what it is.  Sorry, use
> in_proximitiy0_sampling_frequency to provide equivalent
> control please.  Might be a pain here, but this interface will just
> provide the same info as the existing
> one in a different form.  Note that sampling_frequency is documented as
> a general one, but can
> be extended to individual channels.
>

Ooop, I did not realize that it is there as part of sysfs.h. I was 
looking for other header to get support for this. I can use this for 
proximity only but I think I should go with you other suggestion to 
implement this on channel basis. This will help also in future for other 
drivers to have different sampling on different channel.
> Actually add it to the iio-core as an element in the info_mask as I
> doubt this will be the last time
> we see this control. This will need to be a precursor patch to the
> driver obviously.
>
> IIO_CHAN_INFO_SAMP_FREQ and the relevant shared and separate macros need
> to go in
> iio.h + the text entry in industrialio-core.c
>
> If you like I can do this but it'll be quicker if you do :)

I will send the patch for implementing this first and then modified 
version of my driver which actually uses this one.
