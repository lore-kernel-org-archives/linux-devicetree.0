From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] arch: arm: common: edma.c:  Remove some unused functions
Date: Wed, 14 Jan 2015 15:24:53 +0530
Message-ID: <54B63CED.1020603@ti.com>
References: <1417906406-5527-1-git-send-email-rickard_strandqvist@spectrumdigital.se> <54A10868.70001@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54A10868.70001-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Rickard Strandqvist <rickard_strandqvist-IW2WV5XWFqGZkjO+N0TKoMugMpMbD5Xr@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Monday 29 December 2014 01:23 PM, Peter Ujfalusi wrote:
> On 12/07/2014 12:53 AM, Rickard Strandqvist wrote:
>> Removes some functions that are not used anywhere:
>> edma_shadow0_read() edma_or_array()
>>
>> This was partially found by using a static code analysis program called cppcheck.
> 
> Acked-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>

Queuing for v3.20 through ARM-SoC.

The correct prefix for ARM patches is "ARM: ". I will fix while
applying. Please take care next time on.

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
