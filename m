From: Stefan Mavrodiev <stefan.mavrodiev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] arm: sunxi: Add alternative pins for spi0
Date: Thu, 14 Dec 2017 08:24:54 +0200
Message-ID: <5f518e4b-e624-17c2-7e72-24ba930a1c15@gmail.com>
References: <1513151074-6888-1-git-send-email-stefan@olimex.com>
 <20171213154035.qc655iahjoeflftq@flea.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171213154035.qc655iahjoeflftq-ZC1Zs529Oq4@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
Cc: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 12/13/2017 05:40 PM, Maxime Ripard wrote:
> Hi,
>
> On Wed, Dec 13, 2017 at 09:44:34AM +0200, Stefan Mavrodiev wrote:
>> Allwinner A10/A13/A20 SoCs have pinmux for spi0
>> on port C. The patch adds these pins in the respective
>> dts includes.
>>
>> Signed-off-by: Stefan Mavrodiev <stefan-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>
> Do you have any boards that are using these?
>
> We won't merge that patch if there's no users for it.
>
> Maxime
>
A20-OLinuXino-Lime/Lime2 and A10-OLinuXino-Lime with spi flash.
For A13 we still doesn't have that option.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
