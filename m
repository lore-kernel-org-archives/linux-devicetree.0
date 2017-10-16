From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] drm: bridge: Add bindings for TI THS8134
Date: Mon, 16 Oct 2017 14:52:23 +0200
Message-ID: <CACRpkda2SDjG--zT+AbCJeqWyAcyNFs6h7AfUUKiDKHiQG2S3A@mail.gmail.com>
References: <20170901094038.4312-1-linus.walleij@linaro.org> <2446705.uuxjYiEYNm@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2446705.uuxjYiEYNm@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 2:08 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:

>> -- compatible: Must be "ti,ths8135"
>> +- compatible: Must be one of
>> +  "ti,ths8134a"
>> +  "ti,ths8134b"
>> +  "ti,ths8135"
>
> As mentioned in the review of patch 2/2, would it make sense to also introduce
> a ti,ths813x compatible string ? I haven't checked the datasheets so the
> answer might very well be no.

That should be fine, compatible-properties from the most specific to the
most generic should work just fine.

I'll respin with a ths813x compatible.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
