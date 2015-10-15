From: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 7/7] clk: ns2: add clock support for Broadcom Northstar
 2 SoC
Date: Thu, 15 Oct 2015 11:36:19 -0700
Message-ID: <561FF223.2050807@broadcom.com>
References: <1444770485-11210-1-git-send-email-jonmason@broadcom.com>
 <6427519.eIBEvCNlle@wuerfel> <561EB10B.40502@broadcom.com>
 <6398606.WW44dcgQDV@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <6398606.WW44dcgQDV@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jon,

Can you add this to your patchset and change COMMON_CLK_IPROC to a 
silent option?

On 15-10-14 01:16 PM, Arnd Bergmann wrote:
> On Wednesday 14 October 2015 12:46:19 Scott Branden wrote:
>>>
>>> My patch fixes it by always selecting COMMON_CLK_IPROC from
>>> ARCH_BCM_CYGNUS. I wasn't sure whether you want COMMON_CLK_IPROC
>>> to still be user-selectable, so I left that in place. Normally
>>> I'd expect it to be a silent option though, that just gets
>>> implicitly enabled whenever a platform that needs it is built
>>> into the kernel.
>> COMMON_CLK_IPROC can be a silent option and selected as Arnd has done below.
>
> Ok, please do that then. If you want to apply my patch directly,
> you can remove that last paragraph from the description.
>
>>> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>> Acked-by: Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>
> Thanks for taking a look!
>
> 	Arnd
>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
