From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCHv3 2/3] ARM: mxs: cfa10049: Switch bus i2c1 to bitbanging
Date: Tue, 02 Jul 2013 19:15:49 +0200
Message-ID: <51D30AC5.9000701@free-electrons.com>
References: <1372094699-3832-1-git-send-email-alexandre.belloni@free-electrons.com> <51D2BEA1.6010206@free-electrons.com> <51D2DE5B.9060309@free-electrons.com> <201307021833.04282.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201307021833.04282.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>, brian-ZKiFAVwZFM2FeswfMrDH8w@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jimwall@q.com, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 02/07/2013 18:33, Marek Vasut wrote:
> Dear Alexandre Belloni,
> 
>> On 02/07/2013 13:50, Alexandre Belloni wrote:
>>> On 02/07/2013 13:45, Fabio Estevam wrote:
>>>> Shouldn't this be
>>>>
>>>>          i2c@1 {
>>>>          
>>>>                  reg = <1>; ?
>>>
>>> No, we have 4 devices on that mux and 2 pins to select the muxing.
>>
>> OK, got it working.
>>
>> So, the results:
>>
>> bitbanging:
>>
>> # time cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
>> 2637
>> real	0m 0.09s
>> user	0m 0.01s
>> sys	0m 0.01s
>>
>>
>> i2c-mxs PIO mode:
>>
>> # time cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
>> [   35.007650] [sched_delayed] sched: RT throttling activated
>> 2627
>> real	0m 7.14s
>> user	0m 0.02s
>> sys	0m 0.01s
>>
>>
>> i2c-mxs PIO mode without LRADC:
>>
>> # time cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
>> [   18.007432] [sched_delayed] sched: RT throttling activated
>> 2629
>> real	0m 7.09s
>> user	0m 0.00s
>> sys	0m 0.03s
>>
>>
>> i2c-mxs DMA mode:
>>
>> # time cat /sys/bus/iio/devices/iio\:device1/in_voltage0_raw
>> 2631
>> real	0m 0.12s
>> user	0m 0.01s
>> sys	0m 0.01s
>>
>>
>> It seems fine for me.
> 
> I think I'm getting a little lost in these gazilions of i2c and lradc threads. 
> Can we not create one thread and keep the related stuff in there instead of 
> discussing it all around !?
> 
> Only one question comes to mind with this email -- what do LRADC and I2C have to 
> do with each other here ?
> 

Yeah, sorry, I meant the lradc touchscreen support. This seemed to
trigger the issue for Fabio but as my testing shows, this is not the
case for me, I get the issue with PIO, whether the lradc touchscreen
support is activated or not.

I think Torsten is the one that investigated it the most :

http://www.spinics.net/lists/linux-i2c/msg12619.html


> It'd be nice if someone could summarize on what I should focus and possibly 
> prepare a testcase.
> 

On my setup, it happens on every i2c read that are done in PIO mode.
But, my setup may be a bit unconventional as we are using a i2c gpio muxer.

Regards,

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
