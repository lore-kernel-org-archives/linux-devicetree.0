From: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: keystone: add support for post divider register
 for main pll
Date: Mon, 22 Jun 2015 16:15:26 -0400
Message-ID: <55886CDE.7090906@ti.com>
References: <1432915453-409-1-git-send-email-m-karicheri2@ti.com> <20150618223728.9112.75331@quantum> <55834C64.6020703@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55834C64.6020703-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/18/2015 06:55 PM, santosh shilimkar wrote:
> On 6/18/2015 3:37 PM, Michael Turquette wrote:
>> Quoting Murali Karicheri (2015-05-29 09:04:12)
>>> Main PLL controller has post divider bits in a separate register in
>>> pll controller. Use the value from this register instead of fixed
>>> divider when available.
>>>
>>> Signed-off-by: Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>
>>
>> Applied to clk-next.
>>
> Thanks Mike !!
>
>
Thanks Mike.

Regards,

-- 
Murali Karicheri
Linux Kernel, Keystone

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
