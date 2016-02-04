From: Petr Kulhavy <petr-Qh/3xLP0EvwAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] Drivers: USB: DA8xx MUSB: added DT support
Date: Thu, 4 Feb 2016 17:17:54 +0100
Message-ID: <56B379B2.2030508@barix.com>
References: <1454590807-26566-1-git-send-email-petr@barix.com>
 <2084444.JalqY5vdCm@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2084444.JalqY5vdCm@wuerfel>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

thanks for your feedback, please see my comments below.

On 04.02.2016 14:37, Arnd Bergmann wrote:
> I would suggest you do the opposite and leave the id table in there
> but change the first check to
>
> 	if (IS_ENABLED(CONFIG_OF) && np)
>
> So the compiler can discard that code when CONFIG_OF is disabled.

That's a good point!

>
>> +		pdev->dev.dma_mask = &da8xx_dmamask;
>> +		pdev->dev.coherent_dma_mask = da8xx_dmamask;
> Don't hardcode DMA masks like this, the mask should be set to a 32-bit
> mask whenever the device is created, and the driver can override it
> by calling dma_set_mask().
>
You're right these two lines can be completely removed as a) they are 
setting the wrong thing and b)
platform_device_register_full() already sets the correct dma mask from 
the pinfo (in the original source file).

I will prepare a new patch.

Cheers
Petr


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
