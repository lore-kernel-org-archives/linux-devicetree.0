From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] of: base: add support to get machine compatible
 string
Date: Tue, 22 Nov 2016 17:47:08 +0530
Message-ID: <8a05aded-3904-e268-081d-baed0ff85f42@ti.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
 <1479811311-3080-2-git-send-email-bgolaszewski@baylibre.com>
 <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
 <CAMpxmJU=wR4mdQr5tpNSv8POirtWXR=_s7D_Q_H=Cuy=W=-Jtw@mail.gmail.com>
 <dd85c5f9-0899-7da3-ab58-730107bfb02c@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <dd85c5f9-0899-7da3-ab58-730107bfb02c-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 November 2016 04:36 PM, Sudeep Holla wrote:
> 
> 
> On 22/11/16 10:57, Bartosz Golaszewski wrote:
>> 2016-11-22 11:53 GMT+01:00 Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>:
>>>
>>>
>>> On 22/11/16 10:41, Bartosz Golaszewski wrote:
>>>>
>>>> Add a function allowing to retrieve the compatible string of the root
>>>> node of the device tree.
>>>>
>>>
>>> Rob has queued [1] and it's in -next today. You can reuse that if you
>>> are planning to target this for v4.11 or just use open coding in your
>>> driver for v4.10 and target this move for v4.11 to avoid cross tree
>>> dependencies as I already mentioned in your previous thread.
>>
>> Rob's patch checks the model first - I'm not sure this is the behavior
>> we want here as Sekhar suggested we print the machine compatible.
> 
> IIUC, you are replacing of_flat_dt_get_machine_name and
> of_machine_get_model_name does exactly same. So I don't see any point in
> adding this new function and it's just used for logging purpose.
> Also Sekhar just gave example by using just compatible adding that
> function in the driver itself.
> 
> As Arnd suggested me[1], you should for v4.10 fix it in the driver
> itself to avoid the cross tree dependencies at this point similar to [2]

+1. Bartosz, can you please fix it in the driver for v4.10. If there is
an API available, we can move to it for v4.11

Thanks,
Sekhar
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
