From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 08/10] ARM: davinci: fix the DT boot on da850-evm
Date: Mon, 13 Feb 2017 10:35:55 -0800
Message-ID: <m2shnidjlg.fsf@baylibre.com>
References: <1486485683-11427-1-git-send-email-bgolaszewski@baylibre.com>
        <1486485683-11427-9-git-send-email-bgolaszewski@baylibre.com>
        <m2fujpkgkg.fsf@baylibre.com>
        <4574d1c3-c169-b158-dba6-f1965a1056b0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4574d1c3-c169-b158-dba6-f1965a1056b0-l0cyMroinI0@public.gmane.org> (Sekhar Nori's
        message of "Thu, 9 Feb 2017 20:53:02 +0530")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Alexandre Bailon <abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lad Prabhakar <prabhakar.csengg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org> writes:

> On Tuesday 07 February 2017 11:51 PM, Kevin Hilman wrote:
>> Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:
>> 
>>> When we enable vpif capture on the da850-evm we hit a BUG_ON() because
>>> the i2c adapter can't be found. The board file boot uses i2c adapter 1
>>> but in the DT mode it's actually adapter 0. Drop the problematic lines.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>>> ---
>>>  arch/arm/mach-davinci/pdata-quirks.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-davinci/pdata-quirks.c b/arch/arm/mach-davinci/pdata-quirks.c
>>> index 94948c1..09f62ac 100644
>>> --- a/arch/arm/mach-davinci/pdata-quirks.c
>>> +++ b/arch/arm/mach-davinci/pdata-quirks.c
>>> @@ -116,10 +116,6 @@ static void __init da850_vpif_legacy_init(void)
>>>  	if (of_machine_is_compatible("ti,da850-lcdk"))
>>>  		da850_vpif_capture_config.subdev_count = 1;
>>>  
>>> -	/* EVM (UI card) uses i2c adapter 1 (not default: zero) */
>>> -	if (of_machine_is_compatible("ti,da850-evm"))
>>> -		da850_vpif_capture_config.i2c_adapter_id = 1;
>>> -
>> 
>> oops, my bad.
>> 
>> Acked-by: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>
> The offending code is not in my master branch. Since its almost certain
> that VPIF platform support is going to wait for v4.12, can you or Kevin
> please update Kevin's original patches with these fixes rolled in?

I'm folding this into the original patch.

Kevin

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
