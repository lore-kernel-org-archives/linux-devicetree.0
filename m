From: Olliver Schinagl <oliver-dxLnbx3+1qmEVqv0pETR8A@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v5 5/6] ARM: sun7i: Convert to CCU
Date: Mon, 10 Jul 2017 14:24:17 +0200
Message-ID: <6e8b7b1d-c14c-d5fa-a9ef-71dae239fd64@schinagl.nl>
References: <cover.23e9103a2becf2261d7e145bb1516221a5cfb8a4.1499197129.git-series.plaes@plaes.org>
 <2ff8930c51b90a0bb875ecc6c4737f44b3314e7f.1499197129.git-series.plaes@plaes.org>
 <4091e67f-6207-26ef-85f1-e9ff509dd3b7@schinagl.nl>
 <20170710115519.sddpeyvbxq5llunf@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170710115519.sddpeyvbxq5llunf@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Jonathan Liu <net147-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On 10-07-17 13:55, Maxime Ripard wrote:
> On Mon, Jul 10, 2017 at 01:23:51PM +0200, Olliver Schinagl wrote:
>> Hi Pleas,
>>
>> On 04-07-17 22:05, Priit Laes wrote:
>>> Convert sun7i-a20.dtsi to new CCU driver.
>>>
>>> Tested on Cubietruck.
>>>
>>> Signed-off-by: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
>>> ---
>>>  arch/arm/boot/dts/sun7i-a20.dtsi | 719 +++-----------------------------
>>>  1 file changed, 84 insertions(+), 635 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
>>> index 96bee77..a5ca5a8 100644
>>> --- a/arch/arm/boot/dts/sun7i-a20.dtsi
>>> +++ b/arch/arm/boot/dts/sun7i-a20.dtsi
>>> @@ -46,8 +46,6 @@
>>>
>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>  #include <dt-bindings/thermal/thermal.h>
>>> -
>>> -#include <dt-bindings/clock/sun4i-a10-pll2.h>
>>>  #include <dt-bindings/dma/sun4i-a10.h>
>> I had to add these includes here to make this all work:
>
> That's unlikely, none of the defines are used in this patch.
>

My appologies you are right. I needed to add them to get this ontop of 
your DRM stack working for the A20. I looked at my local diff and 
responded a bit overeagerly probably. Nice catch!

Olliver

> Maxime
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
