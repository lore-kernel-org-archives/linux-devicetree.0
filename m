From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] hwrng: iproc-rng200 - Add Broadcom IPROC RNG driver
Date: Sat, 28 Feb 2015 08:01:11 -0800
Message-ID: <54F1E647.10106@broadcom.com>
References: <1424888184-22180-3-git-send-email-sbranden@broadcom.com> <4488852.TuVxKbAYde@wuerfel> <54EF9D7A.3090707@broadcom.com> <2093191.gujNGSl66k@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2093191.gujNGSl66k@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jonathan Richardson <jonathar-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Anatol Pomazao <anatol-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15-02-27 01:14 AM, Arnd Bergmann wrote:
> On Thursday 26 February 2015 14:26:02 Scott Branden wrote:
>> On 15-02-26 12:15 PM, Arnd Bergmann wrote:
>>>> On 15-02-25 11:17 AM, Arnd Bergmann wrote:
>>>>> On Wednesday 25 February 2015 10:16:24 Scott Branden wrote:
>>>> This code was following examples of other open source drivers - bcm2835
>>>> and exynos both use cpu_relax.  I'll have to look into this more to
>>>> understand.
>>>>
>>>
>>> The majority of the driver apparently use udelay(10) to wait, which is
>>> not much better but at least consistent. The cpu_relax() call probably
>>> gives better throughput.
>>>
>>> I don't understand why none of the drivers actually attempts to
>>> msleep(), but that may be because the delay is much too long.
>>>
>>> Can you find out what the expected latency is for new data to
>>> become available on your hardware?
>> RNG generates at a nominal 1 Mbps.  So to generate 32 bits of data takes
>> approximately 32 us.
>
> The udelay(10) that the other drivers have seems about appropriate then,
> and we can independently think of a way to refine the interface.
> Please add a comment that explains the rate. Also, is there some kind
> of FIFO present in the hwrng device? If it can store close to 1ms work
> of data (1000 bits), you can just use an msleep(1) to wait for the
> pool to recover.
FIFO is 512 bits.  I will look as to whether we can live with 1/2 
throughput.
>
> Another option would be to use usleep_range() with the exact amount
> of time to wait for, the lower bound being the minimum number of
> bytes asked for and the fifo size, the upper bound being the fifo
> size.
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
