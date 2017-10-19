From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] firmware: meson-sm: use generic compatible
Date: Thu, 19 Oct 2017 12:25:30 +0200
Message-ID: <7h8tg7zb6t.fsf@baylibre.com>
References: <20171012134743.10625-1-jbrunet@baylibre.com>
        <20171017204959.kfbhn2yxhv2sb5qg@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017204959.kfbhn2yxhv2sb5qg@rob-hp-laptop> (Rob Herring's
        message of "Tue, 17 Oct 2017 15:50:00 -0500")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:

> On Thu, Oct 12, 2017 at 03:47:43PM +0200, Jerome Brunet wrote:
>> The meson secure monitor seems to be compatible with more SoCs than
>> initially thought. Let's use the most generic compatible he have in
>> DT instead of the gxbb specific one
>> 
>> Signed-off-by: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>> ---
>>  Documentation/devicetree/bindings/firmware/meson/meson_sm.txt | 4 ++--
>>  drivers/firmware/meson/meson_sm.c                             | 4 ++--
>>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> Seems like a pointless, not backwards compatible change to me.

I've verified that it's backwards compatible with existing upstream DTs.

> end, it's just a string to match on. Who cares what the string is.

As platform maintiner, I very much care what the strings are and I want
it to be coherent with the platform generic names, and I want the
SoC-specific strings to correspond to the actual SoC names.

Kevin



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
