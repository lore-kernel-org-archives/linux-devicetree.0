From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [v7,1/3] dt-bindings: net: add mt76 wireless device binding
Date: Tue, 21 Nov 2017 09:45:02 +0100
Message-ID: <d6e4c888-d6f8-7e20-d27a-a36a3ec01ccf@nbd.name>
References: <20171120193549.80831-2-nbd@nbd.name>
 <20171121070837.AA354607EA@smtp.codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171121070837.AA354607EA-4h6buKAYkuurB/BPivuO70B+6BGkLq7r@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2017-11-21 08:08, Kalle Valo wrote:
> Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org> wrote:
> 
>> Add documentation describing how device tree can be used to configure
>> wireless chips supported by the mt76 driver.
>> 
>> Signed-off-by: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
> Fails to compile:
> 
> drivers/net/wireless/mediatek/mt76/mac80211.c: In function ‘mt76_led_init’:
> drivers/net/wireless/mediatek/mt76/mac80211.c:111:7: error: implicit declaration of function ‘of_get_child_by_name’ [-Werror=implicit-function-declaration]
>   np = of_get_child_by_name(np, "led");
>        ^
Sorry about that, I must have mixed up something while updating the
patches based on my git tree. Will send out a fixed version later today.

- Felix
