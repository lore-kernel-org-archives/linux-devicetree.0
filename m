From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/irq: Fix msi-map calculation for nonzero rid-base
Date: Thu, 11 Feb 2016 17:15:27 -0600
Message-ID: <CAL_JsqLScMdfUAtMPDGWphc_PZp4K-c0MfjRZh9G7=A9pLZu9Q@mail.gmail.com>
References: <9f6845195d03b0e0b0d187bb510fbf7bd497e836.1455015344.git.robin.murphy@arm.com>
 <56BC6ABA.5020605@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56BC6ABA.5020605-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, stuart.yoder-3arQi8VN3Tc@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 11, 2016 at 5:04 AM, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> wrote:
> On 09/02/16 11:04, Robin Murphy wrote:
>> The existing msi-map code is fine for shifting the entire RID space
>> upwards, but attempting finer-grained remapping reveals a bug. It turns
>> out that we are mistakenly treating the msi-base part as an offset, not
>> as a new base to remap onto, so things get squiffy when rid-base is
>> nonzero. Fix this, and at the same time add a sanity check against
>> having msi-map-mask clash with a nonzero rid-base, as that's another
>> thing one can easily get wrong.
>>
>> CC: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
>> Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
>
> Rob, Frank,
>
> Are you willing to take this one through the OF tree? Or should we route
> it through the IRQ tree? It'd be good if it make it into 4.5.

Applied for 4.5. ATM, I don't have anything else to send to Linus.
I'll give it a week or so if this is not urgent. Or send me a bunch of
DT binding fixes and you can get it in sooner. ;)

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
