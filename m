From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 5/5] iio: mxs-lradc: add write_raw function to modify
 scale
Date: Fri, 19 Jul 2013 21:23:05 +0100
Message-ID: <51E9A029.3000008@kernel.org>
References: <1374225208-28940-1-git-send-email-hector.palacios@digi.com>
 <201307191639.01240.marex@denx.de> <51E95BEC.5080703@digi.com>
 <201307191817.27102.marex@denx.de> <51E967D8.8020001@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <51E967D8.8020001-i7dp0qKlBMg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Hector Palacios <hector.palacios-i7dp0qKlBMg@public.gmane.org>
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org" <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org" <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org" <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/19/2013 05:22 PM, Hector Palacios wrote:
> Dear Marek,
> 
> On 07/19/2013 06:17 PM, Marek Vasut wrote:
>>> Here you have three entries per channel:
>>> in_voltageX_raw        -> the sample raw value
>>> in_voltageX_scale    -> the scale to multiply the raw value to get the
>> voltage
>>> in mV in_voltageX_scale_available -> lists the available scales of the
>>> channel
>>>
>>> For example for channel 0:
>>>
>>> # cat in_voltage0_scale_available
>>> 0.451660156 0.903320312    (two scales available, first with divider by two
>>> disabled, second with divider by two enabled)
>>>
>>> # cat in_voltage0_scale
>>> 0.451660156            (divider by two is currently disabled)
>>>
>>> # cat in_voltage0_raw        (shows measured value)
>>> 1000
>>>
>>> If you multiply the value by the scale you get: 1000 * 0.451660156 = 451.6
>>> mV
>>>
>>> # echo 0.903320312 > in_voltage0_scale    (enables the divider by two)
>>
>> Ok, so I have to remember this value : '0.903320312' in case I want to enable
>> divide-by-two functionality?
> 
> No you don't. That's why there is a 'in_voltage_scale_available' that lists the available values.
> 
>> Hmmmm ... why would this interface not work:
>> echo 2 > in_voltage0_scale
>>
>> or
>>
>> echo 1 > in_voltage0_scale
> 
> An easy thing like that is what I first submitted, but it was rejected and I was told to use the scale_available
> descriptor instead, which is the common interface the rest of drivers use.

This comes down to allowing us to have one generic predictable interface (which sometimes
ends up looking uggly!).  The key thing is that if you are outputing using the _raw
sysfs interfaces, the aim is to avoid doing nasty maths in kernel to get to 'standard' units such as mV.

Hence that scale attribute tells you what to apply to the value.  If you just wanted it
to be 1 or 2 then the in_voltage0_raw value would have to be a long and nasty
decimal.  Now we do have the option of in_voltage0_calibscale which would be applied
internally to the value but it really isn't for this purpose (it's for devices with a 'trim'
control) and you'd still have scale set to 0.903320312 or similar. Although they have
meaning obviously, in this case 1 and 2 are little more than 'magic' numbers.

Note that when things are quite, I'm at least in theory working on a cleaner interface
for these 'available' attributes that would also provide in kernel access for IIO consumers.
Basically this will be another callback to get either the 'range' of pseudo continuous
variables or the 'available' set for parameters like this.

Being lazy I'm happy to let someone else clean this corner up if they like? *looks hopeful*

Jonathan
> 
> Best regards,
> -- 
> Hector Palacios
