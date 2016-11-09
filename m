From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Wed, 9 Nov 2016 15:44:29 +0100
Message-ID: <CAMuHMdXJwjUzbK=Ry6x1dy0m-Ho7evteUz4c6igOaqWivYzqgA@mail.gmail.com>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <3567809.JctLPjIDdk@wuerfel> <aec67ab3-8e89-fe06-b385-988f8eea5f46@codeaurora.org>
 <3809309.oOnjdjqnN9@wuerfel> <20161102162811.GN25787@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161102162811.GN25787@tuxbot>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Imran Khan <kimran-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

On Wed, Nov 2, 2016 at 5:28 PM, Bjorn Andersson
<bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Wed 26 Oct 07:05 PDT 2016, Arnd Bergmann wrote:
>> On Wednesday, October 26, 2016 7:20:42 PM CEST Imran Khan wrote:
>> > On 10/26/2016 2:19 AM, Arnd Bergmann wrote:
>> > > On Tuesday, October 25, 2016 3:23:34 PM CEST Imran Khan wrote:
>> > >> On 10/21/2016 4:03 PM, Arnd Bergmann wrote:
>> > >> Okay. I will go for human readable IDs. Can we add 2 more fields
>> > >> in the generic structure.
>> > >> These 2 fields would be:
>> > >>
>> > >> vendor: A string for vendor name
>> > >> serial_number: A string containing serial number for the platform
>> > >
>> > >
>> > > serial_number seems straightforward, adding this seems like a good
>> > > idea. I don't understand yet what would go into the vendor field
>> > > though. For this particular driver, is it always "Qualcomm", or
>> > > would it be a third-party that makes a device based on that chip?
>> >
>> > As we are talking about generic soc_device_attribute fields, I was hoping that
>> > having a vendor field would be helpful as along with family it would provide
>> > a more thorough information. Also as more than one foundries may be used for
>> > a soc, can we have a field say foundry_id to provide this information.
>>
>> My first feeling is that this 'vendor' information can should be
>> derived from the family.
>
> In [1] Geert just put the vendor directly into "family", while Imran
> uses "Snapdragon" (which I find reasonable in the Qualcomm case). But it
> seems like Geert would like a "vendor" as well, rather than a "family".
>
> And if "family" really is supposed to contain the "SoC family name" and
> we're trying to provide user space with some useful information (for
> some reason), should we just rely on the unlikeliness of two vendors
> using the same family name?
>
> [1] http://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1261742.html

I think vendor is slightly less volatile than family. Family may
change overnight
if marketing had a good dream. Well, vendor may change, too...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
