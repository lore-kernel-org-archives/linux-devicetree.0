From: Rameshwar Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
Subject: Re: [PATCH] dmaengine: xgene-dma: Add ACPI support for X-Gene DMA
 engine driver
Date: Thu, 30 Jul 2015 14:21:07 +0530
Message-ID: <CAFd313xntHx7JhfTWSsJo+bTm-DuEcbAzqXt9in1s0irL3g7sw@mail.gmail.com>
References: <1437484479-2822-1-git-send-email-rsahu@apm.com>
	<2384915.JHlOHWBXHy@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2384915.JHlOHWBXHy@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, patches-qTEPVZfXA3Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

On Wed, Jul 29, 2015 at 8:04 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Tuesday 21 July 2015 18:44:39 Rameshwar Prasad Sahu wrote:
>> This patch adds ACPI support for the APM X-Gene DMA engine driver.
>>
>> Signed-off-by: Rameshwar Prasad Sahu <rsahu-qTEPVZfXA3Y@public.gmane.org>
>>
>
> How does a slave driver refer to a channel in case of ACPI?

We don't support slave dma here. This driver supports only memcp, xor,
pq, scatter-gather offloading, so,
client driver can use linux dmaengine APIs like dma_request_channel()
etc to request channel.


>
>         Arnd
> --
> To unsubscribe from this list: send the line "unsubscribe dmaengine" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
