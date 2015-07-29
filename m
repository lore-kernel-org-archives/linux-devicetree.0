From: Robert Abel <rabel-Ejy783gw450hGw5VS8l+XCM2BslAju9D@public.gmane.org>
Subject: Re: [PATCH/RFC 0/3] of/overlay: Update aliases when added or removed
Date: Wed, 29 Jul 2015 13:52:20 +0200
Message-ID: <CAMdRc4EFOW8t-Sfm-4Pnk1YoSPNhFO5Qb-iViTThy5WCXuH1eA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Geert, Hi Grant,

On 30 Jun 2015 Grant Likely wroke
> Looks good to me. I've made comments on patch 3. Also, you'll need to include unittests before I can merge it.
> [...]
>>   - Should the OF core handle this itself, by registering a notifier
>>     using of_reconfig_notifier_register()?
>Yes. Let's not add new hooks.

Any news on this? Were the patches applied to any public tree or are
there follow-up patches that address the issue using
of_reconfig_notifier_register?

I'm off-list, please CC me.

Regards,

Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
