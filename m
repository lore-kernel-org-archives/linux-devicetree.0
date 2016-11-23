From: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] of: base: add support to get machine compatible
 string
Date: Wed, 23 Nov 2016 13:19:47 +0530
Message-ID: <ae92e013-b41b-6caa-b32f-284ffb6f5aa0@ti.com>
References: <1479811311-3080-1-git-send-email-bgolaszewski@baylibre.com>
 <1479811311-3080-2-git-send-email-bgolaszewski@baylibre.com>
 <5ce9fb9f-459a-562b-2e9f-85d35f9ec035@arm.com>
 <67a3c2c7-0cb9-9764-2710-6ee66fc4dde4@ti.com>
 <fdb93150-9089-c7bb-2b0a-21ded241a647@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fdb93150-9089-c7bb-2b0a-21ded241a647-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-soc <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-drm <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, linux-devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jyri Sarha <jsarha-l0cyMroinI0@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 November 2016 09:16 PM, Sudeep Holla wrote:
> Hi Sekhar,
> 
> On 22/11/16 15:06, Sekhar Nori wrote:
>> Hi Sudeep,
>>
>> On Tuesday 22 November 2016 04:23 PM, Sudeep Holla wrote:
>>>
>>>
>>> On 22/11/16 10:41, Bartosz Golaszewski wrote:
>>>> Add a function allowing to retrieve the compatible string of the root
>>>> node of the device tree.
>>>>
>>>
>>> Rob has queued [1] and it's in -next today. You can reuse that if you
>>> are planning to target this for v4.11 or just use open coding in your
>>> driver for v4.10 and target this move for v4.11 to avoid cross tree
>>> dependencies as I already mentioned in your previous thread.
>>
>> I dont have your original patch in my mailbox, but I wonder if
>> returning a pointer to property string for a node whose reference has
>> already been released is safe to do? Probably not an issue for the root
>> node, but still feels counter-intuitive.
>>
> 
> I am not sure if I understand the issue here. Are you referring a case
> where of_root is freed ?

Yes, right, thats what I was hinting at. Since you are giving up the
reference to the device node before the function returns, the user can
be left with a dangling reference.

> Also I have seen drivers today just using this pointer directly, but
> it's better to copy the string(I just saw this done in one case)

Hmm, the reference is given up before the API returns, so I doubt
copying it later is any additional benefit.

I suspect this is a theoretical issue though since root device node is
probably never freed.

Thanks,
Sekhar

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
