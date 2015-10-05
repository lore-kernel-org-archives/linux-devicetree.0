From: "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
Subject: Re: [PATCH][RESEND] drm: panel-simple: add URT UMSH-8596MD-xT panel
 support
Date: Mon, 05 Oct 2015 17:25:33 +0200
Message-ID: <5612966D.3090507@maciej.szmigiero.name>
References: <55E5AD23.8070309@maciej.szmigiero.name> <560EF9C0.7080407@maciej.szmigiero.name> <20151005110112.GA16920@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151005110112.GA16920@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thierry,

On 05.10.2015 13:01, Thierry Reding wrote:
>> On 01.09.2015 15:50, Maciej S. Szmigiero wrote:
>>> This patch adds support for United Radiant Technology
>>> UMSH-8596MD-xT 7.0" WVGA TFT LCD panels
>>> (both LVDS and parallel versions) to DRM
>>> panel-simple driver.
>>>
>>> Signed-off-by: Maciej Szmigiero <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>
>>> ---
>>> This is a resend without changes.
>>>
>>> diff --git a/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
>>> new file mode 100644
>>> index 0000000..2990e6b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/panel/urt,umsh-8596md.txt
>>> @@ -0,0 +1,11 @@
>>> +United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
>>> +
>>> +Supported are LVDS versions (-11T, -19T) and parallel ones
>>> +(-T, -1T, -7T, -20T).
> 
> Please don't use this kind of wildcard compatible values. If these are
> different models then each of them deserves a separate compatible
> string.

The differences between these revisions are like different maximum backlight
luminance or presence / absence of touch panel.

None of this changes panel timings - should they be split into different
compatible values anyway?

>>> You might want to
>>> split the DT binding and vendor prefix to separate patches.
>>
>> Do you mean to first submit new vendor prefix then panel patch with docs?
>> Or even docs separately?
> 
> This should be three patches: the vendor prefix is usually a separate
> patch and needs an Acked-by from one of the device tree bindings
> maintainers. The binding itself should also be a separate patch and the
> driver changes should come last.

I will split the patch and first submit DT binding docs.

> Thierry

Best regards,
Maciej

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
