From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH v3 0/5] Add support for the R_CCU on Allwinner H3/A64
 SoCs
Date: Mon, 3 Apr 2017 00:32:08 +0800 (CST)
Message-ID: <alpine.LNX.2.20.1704030029590.823@x220i>
References: <20170329104246.34204-1-icenowy@aosc.io> <20170402160237.osgt32ugw7cz7ubg@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170402160237.osgt32ugw7cz7ubg@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Sun, 2 Apr 2017, Maxime Ripard wrote:

> Hi,
>
> On Wed, Mar 29, 2017 at 06:42:41PM +0800, Icenowy Zheng wrote:
>> Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
>> (V3s and R40 do not have it, as they have even no PRCM)
>>
>> This patch adds support for the ones on H3/A64.
>>
>> Some clock/reset values are reserved for easier extending the support to
>> A31/A23, but for this I think some changes to the PRCM MFD should be made,
>> see [1] (Although this is only a sketch).
>>
>> The r_pio device node is also added for A64, as the driver is already
>> merged, and its depends (r_ccu) is now met.
>>
>> [1] https://github.com/wens/linux/commits/sunxi-ng-prcm
>
> It looks good now, thanks.
>
> Beside from the minor fix you've mentionned, please don't use the
> defined IDs (yet) in your DT patches (3 to 5).

Thanks! (I think it's the same question we meet when merging V3s patchset, 
right? :-) )

>
> It will be a PITA to get merged otherwise. We'll fix it later.
>
> Thanks!
> Maxime
>
> -- 
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
