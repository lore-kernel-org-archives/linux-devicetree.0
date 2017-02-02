From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v2] Documentation: devicetree: meson-ir:
 "linux,rc-map-name" is supported
Date: Thu, 2 Feb 2017 14:04:15 +0100
Message-ID: <cccd0fef-fa2c-bdfd-b7dd-b26ef288dfa0@suse.de>
References: <20170131212112.5582-1-martin.blumenstingl@googlemail.com>
 <20170201221415.22794-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDF2d36E2hp7w_ehqdErdZPK9maQLpBmqMoGMPZmTTqqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFBinCDF2d36E2hp7w_ehqdErdZPK9maQLpBmqMoGMPZmTTqqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-media <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am 01.02.2017 um 23:26 schrieb Martin Blumenstingl:
> On Wed, Feb 1, 2017 at 11:14 PM, Martin Blumenstingl
> <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
>> The driver already parses the "linux,rc-map-name" property. Add this
>> information to the documentation so .dts maintainers don't have to look
>> it up in the source-code.
>>
>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
>> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> Changes since v1:
>> - removed character which shows up as whitespace from subject
> I have verified that I really sent this without a whitespace (I'm
> using git send-email, so the patch is not mangled by some webmailer) -
> unfortunately it seems to appear again (maybe one of the receiving
> mail-servers or the mailing-list software does something weird here).

Shows up fine here now,

Reviewed-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>

Didn't expect a resend for that btw.

Thanks,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
