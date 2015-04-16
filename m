From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] [RFC] OF: probe order dependency aware of_platform_populate
Date: Thu, 16 Apr 2015 09:32:13 -0500
Message-ID: <CAL_JsqKAwfGtxpQVn8dbaKhVvBecjoiF9psYobGqn=oC+zS_jw@mail.gmail.com>
References: <1418731891-24768-1-git-send-email-pantelis.antoniou@konsulko.com>
 <20150319191834.5346CC40A35@trevor.secretlab.ca> <8E250936-B06C-40B4-8C34-557D2361CAF6@konsulko.com>
 <CAMuHMdU=Zh00DnkAdAJBaAVn8LthYoRoGCVdFAhxQmWaEGHfkw@mail.gmail.com>
 <1B3AF599-4A64-4FB0-BFB0-0C0544917C6C@konsulko.com> <CAMuHMdWgAzkAJ-ix9NYc46yJRGPHCpmimOjF=HUYprxdgtzkaw@mail.gmail.com>
 <20150402023803.E6A4DC4076D@trevor.secretlab.ca> <CAMuHMdWVTsog2_9iyUEBWm-7xonvNibTTbOY5YxvpAhffUXdcg@mail.gmail.com>
 <CAL_Jsq+9rYTvxX=Y6md5hgNhcBjbuM1m8Q3Y0gNkrV6yaDBskg@mail.gmail.com>
 <552E7309.8020505@hurleysoftware.com> <CAL_JsqJR4NFtwoUsPq3S7nyCBL6v+skarrXA+wvgzy-gR5fKWA@mail.gmail.com>
 <552F9198.4030902@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <552F9198.4030902-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2015 at 5:40 AM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
> On 04/15/2015 10:35 AM, Rob Herring wrote:
>> On Wed, Apr 15, 2015 at 9:17 AM, Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org> wrote:
>
>>> 2. Should DT-specific drivers not be using irq_of_parse_and_map()?
>>>    On probe failure irq_dispose_mapping() will be junking the mapping,
>>>    thus invalidating the irq assignment in the platform resource table,
>>>    which breaks platform drivers which might otherwise probe successfully.
>>
>> Generally no, they should not use irq_of_parse_and_map as we want
>> drivers to work with platform_data, DT, ACPI, or Bob's Firmware
>> Interface. I think most users are PPC drivers which don't have so much
>> of the probe ordering problems.
>
> Apologies for hijacking this thread for a moment.
>
> If of_device_alloc() creates the irq mapping, and no driver probes succeed,
> what is disposing the mapping?
>
> Similarly, if a platform driver fails its probe after platform_get_irq()
> what should dispose of that mapping?

The mapping is created by the irqchip init, not of_device_alloc or
platform_get_irq. Disposing would occur when the irqchip is hot
unplugged. Perhaps we could save some memory by also creating the
irqdesc when we probe. Of course, the resources set by of_device_alloc
would be stale if unplug happened, but platform_get_irq would be okay.
However, I think we don't reference count irqchips to prevent their
hot unplug while in use. GPIOs have similar hotplug issues and that is
being worked on.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
