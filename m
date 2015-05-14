From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: l2c: add options to overwrite prefetching behavior
Date: Thu, 14 May 2015 18:49:29 +0200
Message-ID: <5554D219.5020807@hauke-m.de>
References: <1431620035-7183-1-git-send-email-hauke@hauke-m.de> <20150514161526.GB2067@n2100.arm.linux.org.uk> <20150514163027.GC2067@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150514163027.GC2067-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 05/14/2015 06:30 PM, Russell King - ARM Linux wrote:
> On Thu, May 14, 2015 at 05:15:26PM +0100, Russell King - ARM Linux wrote:
>> On Thu, May 14, 2015 at 06:13:55PM +0200, Hauke Mehrtens wrote:
>>> These options make it possible to overwrites the data and instruction
>>> prefetching behavior of the arm pl310 cache controller.
>>>
>>> We have to set these values in the aux and the prefetch register,
>>> because these two bits in the aux registers are mapped to the prefetch
>>> register. If only the prefetch register is changed there is an
>>> inconsistence in the state in this driver.
>>
>> No there isn't.  Just set the bits in the prefetch register.
>>
>> Writing to the prefetch register changes the state of the bits in the
>> auxiliary control register at the same time.
> 
> I see what you're getting at now.  I think we ought to fix that in the
> driver, so that the auxiliary control register is always written first,
> before the prefetch control register.  This also makes l2c_configure()
> reflect the structure of the rest of the driver.
> 
>  arch/arm/mm/cache-l2x0.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Tested-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>

Yes this fixes my problem. I did not meant that the state of the
hardware registers would be inconsistent, but the state of the driver.
I saw the problem you fixed, but was not closely following the control
flow in the driver to see the problem before.

Is it save enough to relay on the aux register not being written after
the prefetch register is written?
To make it more secure you could call l2x0_data->save(base) directly
after l2x0_data->configure(base)

Hauke
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
