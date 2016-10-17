From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: da850: add a node for the LCD controller
Date: Mon, 17 Oct 2016 12:42:32 +0530
Message-ID: <65fde145-0820-794d-d345-621f66cdacc0@ti.com>
References: <1475672732-17111-1-git-send-email-bgolaszewski@baylibre.com>
 <1475672732-17111-3-git-send-email-bgolaszewski@baylibre.com>
 <2d276e51-9d37-8648-4aad-283bb2b23626@ti.com>
 <1e23c3e9-d34b-1d8f-8565-c9932a60fd32@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1e23c3e9-d34b-1d8f-8565-c9932a60fd32-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Karl Beldan <karl.beldan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Monday 17 October 2016 11:26 AM, Tomi Valkeinen wrote:
> On 15/10/16 20:42, Sekhar Nori wrote:
> 
>>> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
>>> index f79e1b9..32908ae 100644
>>> --- a/arch/arm/boot/dts/da850.dtsi
>>> +++ b/arch/arm/boot/dts/da850.dtsi
>>
>>> @@ -399,6 +420,14 @@
>>>  				<&edma0 0 1>;
>>>  			dma-names = "tx", "rx";
>>>  		};
>>> +
>>> +		display: display@213000 {
>>> +			compatible = "ti,am33xx-tilcdc", "ti,da850-tilcdc";
>>
>> This should instead be:
>>
>> compatible = "ti,da850-tilcdc", "ti,am33xx-tilcdc";
>>
>> as the closest match should appear first in the list.
> 
> Actually I don't think that's correct. The LCDC on da850 is not
> compatible with the LCDC on AM335x. I think it should be just
> "ti,da850-tilcdc".

So if "ti,am33xx-tilcdc" is used, the display wont work at all? If thats
the case, I wonder how the patch passed testing. Bartosz?

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
