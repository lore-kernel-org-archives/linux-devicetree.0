From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: use IORESOURCE_REG resource type for non-translatable addresses
 in DT
Date: Tue, 29 Jul 2014 23:06:19 -0700
Message-ID: <20140730060619.GC19933@codeaurora.org>
References: <53D788A7.4020303@mm-sol.com>
 <3794875.CZFbAag5Sv@wuerfel>
 <53D7AA72.6010309@mm-sol.com>
 <20140729234522.E9FF1C40738@trevor.secretlab.ca>
 <53D84558.7060406@codeaurora.org>
 <CAL_JsqJjH0OH+X=fzwqAPeWarjoLev7v6Nv_QhAa+nZyztMnFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJjH0OH+X=fzwqAPeWarjoLev7v6Nv_QhAa+nZyztMnFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/29, Rob Herring wrote:
> On Tue, Jul 29, 2014 at 8:07 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> > On 07/29/14 16:45, Grant Likely wrote:
> >> On Tue, 29 Jul 2014 17:06:42 +0300, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org> wrote:
> >>>
> >>> This was just an example. Of course it has many issues and probaly it is
> >>> wrong:) The main goal was to understand does IORESOURCE_REG resource
> >>> type and parsing the *reg* properties for non-translatable addresses are
> >>> feasible. And also does it acceptable by community and OF platform
> >>> maintainers.
> >> The use case is actually very different from of_address_to_resource or
> >> of_get_address() because those APIs explicitly return physical memory
> >> addresses from the CPU perspective. It makes more sense to create a new
> >> API that doesn't attempt to translate the reg address. Alternately, a
> >> new API that only translates upto a given parent node.
> >
> > The most important thing is that platform_get_resource{_by_name}(&pdev,
> > IORESOURCE_REG, n) returns the reg property and optional size encoded
> > into a struct resource. I think Rob is suggesting we circumvent the
> > entire of_address_to_resource() path and do some if
> > (IS_ENABLED(CONFIG_OF) && type == IORESOURCE_REG) check in
> > platform_get_resource() to package up the reg property into a struct
> > resource. That should work.
> 
> No, I'm saying why are you using platform_get_resource at all and
> adding a new resource type? I don't see any advantage.

First off, the resource type is not new. IORESOURCE_REG has
existed for two years (see commit 72dcb1197228 "resources: Add
register address resource type, 2012-08-07").

The main advantage is allowing things like
platform_get_resource_by_name() and platform_get_resource() to
work seamlessly with devicetree. If we don't have this, drivers
are going to open code their reg property parsing and possibly
reg-names parsing. There are a handful of drivers that would be
doing this duplicate work.

Sure, we could consolidate them into an OF helper function, but
then these are the only platform drivers that are getting their
reg properties via a special non-translatable address function.
The drivers don't care that they're using non-translateable
addresses as long as they can pass the address returned from
platform_get_resource() to their regmap and do I/O. The drivers
are written under the assumption that they're a sub-device of
some parent device (in this case a PMIC) and so they assume that
the regmap has already been setup for them.

> 
> You might as well do of_property_read_u32 in the below example.
> 

Fair enough. The example is probably too simple. Things are
sometimes slightly more complicated and a simple
of_property_read_u32() isn't going to work in the case of
multiple reg values or when reg-names is in play.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
