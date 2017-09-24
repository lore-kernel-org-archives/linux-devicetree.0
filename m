From: Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: cadence-quadspi: Add runtime PM
 support
Date: Sun, 24 Sep 2017 15:12:37 +0200
Message-ID: <fa700cdf-f0b5-779b-4f38-3138a7612cc2@gmail.com>
References: <20170924105924.23923-1-vigneshr@ti.com>
 <20170924105924.23923-6-vigneshr@ti.com>
 <3a1160f9-a0ae-c84c-d209-af97c3c3b0f6@gmail.com>
 <4ee69ea4-14cc-4305-bf3f-8fe76d43bf6b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4ee69ea4-14cc-4305-bf3f-8fe76d43bf6b-l0cyMroinI0@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 09/24/2017 03:08 PM, Vignesh R wrote:
> 
> 
> On 9/24/2017 5:31 PM, Marek Vasut wrote:
>> On 09/24/2017 12:59 PM, Vignesh R wrote:
>>> Add pm_runtime* calls to cadence-quadspi driver. This is required to
>>> switch on QSPI power domain on TI 66AK2G SoC during probe.
>>>
>>> Signed-off-by: Vignesh R <vigneshr-l0cyMroinI0@public.gmane.org>
>>
>> Are you planning to add some more fine-grained PM control later?
> 
> Yes, I will need to add fine-grained PM control at some point. But, for
> now SoC does not really support low power mode or runtime power saving
> option.
> The fact that driver still uses clk_prepare_*() calls to enable/disable
> clocks instead of pm_*() calls makes it a bit tricky though.
> 
> Just figured out I forgot to add cleanup code in error handling path of
> probe(). Will fix that and send a v4.

OK, fine. Cleanups are welcome. The SoCFPGA doesn't do much runtime PM
either, so it's fine for now.

-- 
Best regards,
Marek Vasut
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
