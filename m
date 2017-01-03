From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 3/5] drm: bridge: add support for TI ths8135
Date: Tue, 3 Jan 2017 11:08:51 +0530
Message-ID: <d550a8e6-9939-aa5c-8c8c-938dd2290552@ti.com>
References: <1481623759-12786-1-git-send-email-bgolaszewski@baylibre.com>
 <1481623759-12786-4-git-send-email-bgolaszewski@baylibre.com>
 <dbb47a8f-07be-19d6-e77b-f5c06fd39c61@codeaurora.org>
 <0b47c27e-cda4-b5f6-ff3c-da74c40ed204@ti.com>
 <da6d299e-be36-7564-f57f-ba5e3601cafc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <da6d299e-be36-7564-f57f-ba5e3601cafc-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 03 January 2017 10:56 AM, Archit Taneja wrote:
> Hi Sekhar,
> 
> On 1/2/2017 4:38 PM, Sekhar Nori wrote:
>> Hi Archit,
>>
>> On Wednesday 14 December 2016 10:35 AM, Archit Taneja wrote:
>>>
>>>
>>> On 12/13/2016 03:39 PM, Bartosz Golaszewski wrote:
>>>> THS8135 is a configurable video DAC, but no configuration is actually
>>>> necessary to make it work.
>>>>
>>>> For now use the dumb-vga-dac driver to support it.
>>>
>>> Queued to drm-misc-next
>>
>> This patch and 2/5 are not in v4.10 kernel. Did you mean to queue them
>> to v4.10?
> 
> These missed out on 4.10 because the drm related pull requests were
> already sent by then. These 2 patches are queued for 4.11.

Alright, thanks for the update.

Regards,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
