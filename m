From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] of/platform: dynamic: Use of_platform_bus_create() to
 create devices
Date: Fri, 20 Jan 2017 18:38:06 +0100
Message-ID: <3da6854d-8361-1724-2a8a-36f28449733e@nokia.com>
References: <b317f693-98b5-ba1e-1184-83735a68db9b@nokia.com>
 <CAL_JsqJZ__mUwRT14BmNQKaa_mAPsJm0iWP8sb6Oqs+_-Gu5hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqJZ__mUwRT14BmNQKaa_mAPsJm0iWP8sb6Oqs+_-Gu5hw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

On 27/10/16 15:00, Rob Herring wrote:
>> @@ -534,15 +535,15 @@ static int of_platform_notify(struct notifier_block *nb,
>>
>>                 /* pdev_parent may be NULL when no bus platform device */
>>                 pdev_parent = of_find_device_by_node(rd->dn->parent);
>> -               pdev = of_platform_device_create(rd->dn, NULL,
>> -                               pdev_parent ? &pdev_parent->dev : NULL);
>> +               ret = of_platform_bus_create(rd->dn, of_default_bus_match_table,
>> +                                            NULL, pdev_parent ?
>> +                                            &pdev_parent->dev : NULL, true);
> I think this should be of_platform_default_populate() instead.

I've just tested: it cannot be. It calls of_platform_populate(), which ignores "status" property.
This not only brakes half of the unit tests, but also would change the existing behavior of
overlays (they will completely ignore "status" too).

-- 
Best regards,
Alexander Sverdlin.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
