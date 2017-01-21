From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] ti,ads7950 device tree bindings
Date: Sat, 21 Jan 2017 15:08:35 +0000
Message-ID: <f0755e7c-f7e8-d3b9-dc20-9edc47d5c171@kernel.org>
References: <1484157171-15571-1-git-send-email-david@lechnology.com>
 <c4c59921-d0dc-0858-8d66-c56fa38d3b50@kernel.org>
 <b60edc70-1d0f-fbfc-6ae9-1e6e5e3525d1@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b60edc70-1d0f-fbfc-6ae9-1e6e5e3525d1-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/01/17 23:44, David Lechner wrote:
> On 01/15/2017 07:58 AM, Jonathan Cameron wrote:
>> On 11/01/17 17:52, David Lechner wrote:
>>> This series adds device tree bindings for the TI ADS7950 family of A/DC chips.
>>> The series includes the bindings documentation and some fixes to the iio driver
>>> to make it work with the device tree bindings.
>>>
>>> FYI, the ads7950 driver has not made it into mainline yet, so no worries about
>>> breaking anyone with these changes.
>>>
>> And here's the bit I failed to read!
>>
>> As an extra point, could you confirm what /sys/bus/iio/iio\:deviceX/name for this
>> one reads?  I have a feeling this is another case of what Lars has been pointing
>> out in other drivers this morning.  That name should be the device part number..
>>
> 
> cat /sys/bus/iio/devices/iio\:device0/name
> ads7957
> 
> This is the part number for the specific chip I am using. So, I am guessing that it is correct unless it is supposed to be upper case or something like that.
> 
> 
Cool. Spot on.
> 
>> Thanks,
>>
>> Jonathan
>>> David Lechner (3):
>>>   DT/bindings: Add bindings for TI ADS7950 A/DC chips
>>>   iio: adc: ti-ads7950: Drop "ti-" prefix from module name
>>>   iio: adc: ti-ads7950: Change regulator matching string to "vref"
>>>
>>>  .../devicetree/bindings/iio/adc/ti-ads7950.txt     | 23 ++++++++++++++++
>>>  drivers/iio/adc/ti-ads7950.c                       | 32 +++++++++++-----------
>>>  2 files changed, 39 insertions(+), 16 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/iio/adc/ti-ads7950.txt
>>>
>>
> 
