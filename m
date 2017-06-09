From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH] of: Introduce of_node_get_match_data() helper
Date: Fri, 9 Jun 2017 09:56:05 +0200
Message-ID: <CAMuHMdXxYF5_B7CX71dv9COThH3KnJdujqnCqrmSiPv_N0gM=Q@mail.gmail.com>
References: <1493142007-29347-1-git-send-email-geert+renesas@glider.be> <7ff6bd21-19f0-7e0c-18bf-e835e7d4319e@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7ff6bd21-19f0-7e0c-18bf-e835e7d4319e-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Vladimir,

On Fri, Jun 9, 2017 at 9:30 AM, Vladimir Zapolskiy
<vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org> wrote:
> On 04/25/2017 08:40 PM, Geert Uytterhoeven wrote:
>> If CONFIG_OF=3Dn, code using
>>
>>     info =3D of_match_node(matchs, np)->data;
>>
>> fails to compile:
>>
>>     warning: dereferencing =E2=80=98void *=E2=80=99 pointer
>>     error: request for member =E2=80=98data=E2=80=99 in something not a =
structure or union
>
> IMHO firstly all the cases like one above must be fixed in place, in
> parallel do an overall conversion of subcases:
>
> -       of_id =3D of_match_node(some_dt_ids, dev->of_node);
> +       of_id =3D of_match_device(some_dt_ids, dev);
>
>> Follow the example set by of_device_get_match_data(), and introduce a
>> new helper of_node_get_match_data().  This will allow to increase
>> compile-testing coverage later.
>
> Unfortunately the proposed of_node_get_match_data() is not so similar
> to the of_device_get_match_data(), the latter one has only one input
> argument in opposite to of_match_device(), which is truly convenient.

Thanks to your comment, I realized I can just use of_device_get_match_data(=
).
Hence I'd like to withdraw my patch.

Background: I encountered this in a clock driver, which started life as
a CLK_OF_DECLARE() driver, but ended up as a platform driver anyway.
CLK_OF_DECLARE() drivers don't have a struct device to use, so the
driver still used of_match_node() instead of of_match_device().

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
