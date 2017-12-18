From: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: add reset property for rk3066a-rayeager emac
 phy
Date: Mon, 18 Dec 2017 08:48:40 +0800
Message-ID: <f925b22d-6d70-8406-62f7-6e447749a223@rock-chips.com>
References: <1510134642-18797-1-git-send-email-zyw@rock-chips.com>
 <9893397.vbQdaeDkgV@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=gb18030; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9893397.vbQdaeDkgV@phil>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Heiko

Thanks :)


On 2017Äê12ÔÂ17ÈÕ 04:11, Heiko Stuebner wrote:
> Hi Chris,
>
> Am Mittwoch, 8. November 2017, 17:50:41 CET schrieb Chris Zhong:
>> The ethernet phy of rk3066a-rayeager has a reset pin, it controlled by
>> GPIO1_D6, this pin should be pull down then pull up to reset the phy.
>> Add a reset-gpios property in phy0, make the phy can be reset when emac
>> power on.
>>
>> Signed-off-by: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
>> ---
>>
>> Changes in v2:
>> use a generic property for reset, and this patch follow these 2 pathes
>> from Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>> http://patchwork.ozlabs.org/patch/828499/
>> http://patchwork.ozlabs.org/patch/828505/
> looks like the phylib-patches were accepted some days ago,
> so I've now also applied this patch for 4.16, after fixing the subject
> by adding the "rockchip:" to "ARM: dts: rockchip": :-)
>
>
> Heiko
>
>
>

-- 
Chris Zhong


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
