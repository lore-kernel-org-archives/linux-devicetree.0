From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: [PATCH V2 2/2] staging: Documentation: add
	proximity_sampling_period as sysfs details
Date: Thu, 12 Apr 2012 11:01:02 +0100
Message-ID: <4F86A7DE.5040203@cam.ac.uk>
References: <1334214492-23044-1-git-send-email-ldewangan@nvidia.com>
	<1334214492-23044-3-git-send-email-ldewangan@nvidia.com>
	<4F86A26B.1090209@cam.ac.uk> <4F86A4EB.4040202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <4F86A4EB.4040202@nvidia.com>
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

On 4/12/2012 10:48 AM, Laxman Dewangan wrote:
> On Thursday 12 April 2012 03:07 PM, Jonathan Cameron wrote:
>> On 4/12/2012 8:08 AM, Laxman Dewangan wrote:
>>> +What:        /sys/bus/iio/devices/device[n]/proximity_sampling_period
>>> +KernelVersion:    3.5
>>> +Contact:    linux-iio@vger.kernel.org
>>> +Description:
>>> +        Hardware dependent mode for proximity sensor device to set/get
>>> +        the sampling rate of proximity sensing and conversion.
>> Ah, that explains what it is.  Sorry, use
>> in_proximitiy0_sampling_frequency to provide equivalent
>> control please.  Might be a pain here, but this interface will just
>> provide the same info as the existing
>> one in a different form.  Note that sampling_frequency is documented as
>> a general one, but can
>> be extended to individual channels.
>>
>
> Ooop, I did not realize that it is there as part of sysfs.h. I was 
> looking for other header to get
> support for this. I can use this for proximity only but I think I 
> should go with you other
> suggestion to implement this on channel basis. This will help also in 
> future for other
> drivers to have different sampling on different channel.
Great!
>> Actually add it to the iio-core as an element in the info_mask as I
>> doubt this will be the last time
>> we see this control. This will need to be a precursor patch to the
>> driver obviously.
>>
>> IIO_CHAN_INFO_SAMP_FREQ and the relevant shared and separate macros need
>> to go in
>> iio.h + the text entry in industrialio-core.c
>>
>> If you like I can do this but it'll be quicker if you do :)
>
> I will send the patch for implementing this first and then modified 
> version of my driver which actually uses this one.
Cool
>
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
