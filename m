From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH RFC] of: platform: Drop OF_POPULATED_BUS check from of_platform_notify()
Date: Thu, 8 Sep 2016 09:17:20 -0500
Message-ID: <CAL_JsqJWBXqs44vHu4XHAiZhOEghg9X=Q0fvUKHaCVCPnd7kVw@mail.gmail.com>
References: <11c8a7bd-142c-d016-e24b-34d1edbdb8cf@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <11c8a7bd-142c-d016-e24b-34d1edbdb8cf-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 5, 2016 at 9:38 AM, Alexander Sverdlin
<alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org> wrote:
> The comment to OF_POPULATED_BUS says "of_platform_populate recursed to children
> of this node". Consider the following structure:
>
>         ocp {
>                 compatible = "simple-bus";
>                 ranges;
>                 ...
>                 l4_wkup: l4_wkup@44c00000 {
>                         compatible = "ti,am3-l4-wkup", "simple-bus";
>                         ranges = <0 0x44c00000 0x280000>;
>                         ...
>                         wkup_m3: wkup_m3@100000 {
>                                 compatible = "ti,am3352-wkup-m3";
>                                 ...
>                         }
>                 }
>         }
>
> If one DT overlay adds "ocp" node without children then of_platform_notify()
> creates a platform device, but doesn't set OF_POPULATED_BUS. If second overlay
> tries to populate children of "ocp" node, corresponding platform devices are
> not instantiated because of check for OF_POPULATED_BUS flag. If the above
> example structure is built of several overlays, of_platform_populate() is not
> involved here at all, so maybe OF_POPULATED_BUS requirement is wrong.

Your example seems a bit made up. While you can craft base DTs and
overlays with any random split between them, I don't necessarily think
we want to support that. There will likely be cases which we say can
only be applied early in boot or we limit which nodes can be overlay
targets for overlays applied from userspace.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
