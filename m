From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 03/11] ARM: shmobile: r8a7743: basic SoC support
Date: Fri, 7 Oct 2016 13:02:07 +0300
Message-ID: <836d9018-e8f4-27ef-bfff-06932184d59f@cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <15557770.lH5aPepOeZ@wasted.cogentembedded.com>
 <20161007031537.GK13721@verge.net.au> <2345971.ESZSzve5jF@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2345971.ESZSzve5jF@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 10/7/2016 11:33 AM, Laurent Pinchart wrote:

>>> Add minimal support for the RZ/G1M (R8A7743) SoC.
>>>
>>> Based on the original (and large) patch by Dmitry Shifrin
>>> <dmitry.shifrin-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>>
>> Thanks, I have queued this up.
>
> I'd like to see this patch rebased on top of "[PATCH] ARM: shmobile:
> Consolidate R8A779[234] machine definitions".

    R87743 is analogous to R8A7791, not R8A779[234], not sure how it is 
connected to your patch.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
