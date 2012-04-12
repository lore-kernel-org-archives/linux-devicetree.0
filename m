From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 1/2] staging: iio: add channel info for sampling frequency
Date: Thu, 12 Apr 2012 18:39:01 +0530
Message-ID: <4F86D3ED.4020301@nvidia.com>
References: <1334234288-25037-1-git-send-email-ldewangan@nvidia.com> <1334234288-25037-2-git-send-email-ldewangan@nvidia.com> <4F86D55F.2030808@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F86D55F.2030808-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org" <jbrenner-yYKgigLBUwlBDgjK7y7TUQ@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "max-U9r9yeDMy7A@public.gmane.org" <max-U9r9yeDMy7A@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 12 April 2012 06:45 PM, Jonathan Cameron wrote:
> On 4/12/2012 1:38 PM, Laxman Dewangan wrote:
>> Adding channel info IIO_CHAN_INFO_SAMP_FREQ to select
>> different sampling frequency per channel wise.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> As per discussion on previous patch, adding channel info
>> for selecting sampling freqeuncy.
> To match with the existing devices can we not use the abrieviation
> for the attribute naming.
>

Sorry..I did not get it completely.
Is it like we should have IIO_CHAN_INFO_SAMPLING_FREQUENCY in place of  
IIO_CHAN_INFO_SAMP_FREQ?


>> @@ -90,6 +90,7 @@ static const char * const iio_chan_info_postfix[] = {
>>    	[IIO_CHAN_INFO_AVERAGE_RAW] = "mean_raw",
>>    	[IIO_CHAN_INFO_LOW_PASS_FILTER_3DB_FREQUENCY]
>>    	= "filter_low_pass_3db_frequency",
>> +	[IIO_CHAN_INFO_SAMP_FREQ] = "samp_freq",
> "sampling_frequency"

and then change here as "sampling_frequency"?
