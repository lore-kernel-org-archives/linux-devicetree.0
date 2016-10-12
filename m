From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 0/11] Add R8A7743/SK-RZG1M board support
Date: Wed, 12 Oct 2016 11:29:56 +0300
Message-ID: <cea44556-a578-fb54-11b8-f21f5b991caa@cogentembedded.com>
References: <2056698.ncAHq8vRQ3@wasted.cogentembedded.com>
 <5be99d76-a082-129b-1aa6-b6f7402ae79b@cogentembedded.com>
 <20161012080905.GD31183@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161012080905.GD31183-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/12/2016 11:09 AM, Simon Horman wrote:

>>>   Here's the set of 11 patches against Simon Horman's 'renesas.git' repo's
>>> 'renesas-devel-20161003-v4.8' tag. I'm adding the device tree support for
>>> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the board
>>> seems identical to the R8A7791/Porter board. The device tree patches depend on
>>> the R8A7743 CPG/MSSR driver series just posted in order to compile and work.
>>
>>    Forgot to mention that this version causes a regression with the sh_eth
>> driver (well, actually with phylib): since IRQC now gets a deferred probing,
>> PHY IRQ doesn't work anymore -- phylib falls back to polling.
>
> Is there a resolution to that problem?

    Geert has posted his IRQC driver patch recently. Not sure if it was 
intended for merging but it solves the issue.

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
