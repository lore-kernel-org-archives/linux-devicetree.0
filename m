From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH RFC 0/2] simplefb: Add regulator handling support
Date: Tue, 13 Oct 2015 09:16:56 +0200
Message-ID: <561CAFE8.9080506@redhat.com>
References: <1444669458-5588-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444669458-5588-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 12-10-15 19:04, Chen-Yu Tsai wrote:
> Hi everyone,
>
> This series adds regulator claiming and enabling support for simplefb.
>
> Sometimes the simplefb display output path consits of external conversion
> chips and/or LCD drivers and backlights. These devices normally have
> GPIOs to turn them on and/or bring them out of reset, and regulators
> supplying power to them.
>
> While the kernel does not touch unclaimed GPIOs, the regulator core
> happily disables unused regulators. Thus we need simplefb to claim
> and enable the regulators used throughout the display pipeline.

Ack for doing something like this (adding regulator support) to simplefb,
it makes sense to have this.

> Now the DT bindings don't support a list of regulators directly, so
> I'm working around it by having a "num-supplies" property to specify
> the number of supply properties to check, and name the actual supplies
> as "vinN-supply".

Hmm, I can see the need for a "supplies" property with a list of regulators
in other use-cases (e.g. the generic mmc-pwrseq driver) too. Now as discussed
we can simply do vin0-supply - vinN-supply properties and be done with it,
but maybe we need to actually add support for a generic "supplies" property ?

And if not then maybe we need a few generic helper devm helper function which
takes a node, figures out how much vinN-supply properties there are and returns
a dynamically allocated array containing references to all the regulators, or
a PTR_ERR in case of err, at which point the caller is expected to fail the
probe so that any successfully acquired regulators are released.

Mark, what are your thoughts on this ?

Regards,

Hans
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
