From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v2 4/5] of: overlay: Pick up label symbols from overlays.
Date: Mon, 16 May 2016 21:40:08 +0200
Message-ID: <CAMuHMdWTC4hmQbcrT3iRMUWWPCa2g2Jt6GQw=UL6+LeSzn1-8g@mail.gmail.com>
References: <1463417556-23087-1-git-send-email-pantelis.antoniou@konsulko.com>
	<1463417556-23087-5-git-send-email-pantelis.antoniou@konsulko.com>
	<CAMuHMdXHzhO3M6oG-ONn1y+mVJPdGM8890tT5-QfJEyBVkJ9ug@mail.gmail.com>
	<86DB0786-6636-4259-B69F-9BAACE9C9CAD@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <86DB0786-6636-4259-B69F-9BAACE9C9CAD-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Pantelis,

On Mon, May 16, 2016 at 9:27 PM, Pantelis Antoniou
<pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>> On May 16, 2016, at 22:06 , Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org=
> wrote:
>> On Mon, May 16, 2016 at 6:52 PM, Pantelis Antoniou
>> <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org> wrote:
>>> Insert overlay symbols to the base tree when applied.
>>> This makes it possible to apply an overlay that references a label
>>> that a previously inserted overlay had.
>>>
>>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>>
>> This patch hasn't changed, so I think you can keep my
>
> It=E2=80=99s been tweaked slightly that=E2=80=99s why I dropped your =
tested-by
> signoff. Could you test this version again please to verify it
> works for you?

Oh, I missed that you did make some changes...

Will test again and report back to you...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
