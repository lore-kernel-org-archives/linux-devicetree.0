From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC/PATCH] of: Mark property::value as const
Date: Thu, 23 Feb 2017 17:38:24 -0600
Message-ID: <CAL_JsqJwMob=XN=SBXict4iz3QrLX01iRbMxhWEzC8zpD4XomA@mail.gmail.com>
References: <20170214025040.23955-1-stephen.boyd@linaro.org> <58AF6B88.6020709@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58AF6B88.6020709-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 23, 2017 at 5:08 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 02/13/17 18:50, Stephen Boyd wrote:
>> The 'blob' we pass into populate_properties() is marked as const,
>> but we cast that const away when we assign the result of
>> fdt_getprop_by_offset() to pp->value. Let's mark value as const
>> instead, so that code can't mistakenly write to the value of the
>> property that we've so far advertised as const.
>
> Instead of struct property field value being a pointer into the
> FDT, I would rather copy the data to newly allocated memory and
> have value be a pointer to that memory.  This is required if we
> want to make /sys/firmware/fdt optional, which would allow us to
> free the memory containing the initial boot FDT.

Making a copy would simplify several things.

> I also do not want overlay live subtrees to have any pointers
> into the FDT that was used to populate the overlay, so copying
> the data solves that problem also.
>
>
>> Unfortunately, this exposes a problem with the fdt resolver code,
>> where we overwrite the value member of properties of phandles to
>> update them with their final value. Add a comment for now to
>> indicate where we're potentially writing over const data.
>
> Yes, the resolver code needs to adjust phandle values.
>
> I think I can get rid of the resolver modifying the various phandle
> values, and instead just modify the phandle value in struct
> device_node.  At the same time, I think I can also remove all
> instances of the phandle properties ('linux,phandle', 'ibm,phandle',
> 'phandle') in the live tree.  These properties should not be
> accessed directly by any code outside of the device tree framework
> since the phandle is located in the struct device_node.  A quick
> grep does not show any such accesses of the phandle properties,
> but I want to look more closely.

Good idea.

BTW, I recently noticed that dtc by default generates both
linux,phandle and phandle properties. I would think the new one has
been around long enough that we can turn off the old one by default
now.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
