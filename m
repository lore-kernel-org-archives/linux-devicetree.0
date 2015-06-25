From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 0/3] ARM: keystone: add ecc error interrupt handling
Date: Thu, 25 Jun 2015 14:02:07 -0700
Message-ID: <558C6C4F.1090102@codeaurora.org>
References: <1435242710-31346-1-git-send-email-vitalya@ti.com> <558C188B.5060107@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <558C188B.5060107-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: santosh shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Vitaly Andrianov <vitalya-l0cyMroinI0@public.gmane.org>, ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 06/25/2015 08:04 AM, santosh shilimkar wrote:
> On 6/25/2015 7:31 AM, Vitaly Andrianov wrote:
>> This patch series adds support for arm L1/L2 ecc and ddr3 ecc error
>> handling
>> for Keystone devices
>>
>> Change Log
>>
>> v2:
>> - removing unused and sorting headers of keystone.c are moved to a
>> separate
>>    patch.
>> - l1l2 ecc and ddr3 ecc error handling are split it to separate patches
>> - removed unused headers from keystone_ecc.c
>> - platsmp.c removed from the patch.
>> - return IRQ_HANDLED for 1 bit error in l1l2 ecc handler
>> - checked and handled existing echttps://lwn.net/Articles/593336/c
>> error before enabling ddr3 interrupt
>> - 1 bit ddr3 interrupt is disabled, because it is handled by hardware
>> and
>>    there is no reason to handle it by software
>>
> This version looks good to me. As already commented, I would have liked
> the patch 2/3(L2 ECC) code in ARM generic code so will give some more
> time for others to come back. Otherwise I will queue this up for next
> window.

Why not make this into an edac driver? I sent out an L1/L2 error
detection edac driver for Krait processors a year ago, but it stalled
due to some DT binding stuff[1]. This looks fairly similar.

[1] https://lwn.net/Articles/593336/

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
