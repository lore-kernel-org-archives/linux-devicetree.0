From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: Fwd: [PATCH] x86/devicetree: Fix compile warnings on AMD64
Date: Thu, 28 Aug 2014 15:13:59 +0200
Message-ID: <53FF2B17.4030600@linutronix.de>
References: <1407230388-14211-1-git-send-email-ricardo.ribalda@gmail.com> <CAPybu_39pLQ6gvKOPuLNCnn46Y50QU36C5thJmxrNmCzGN+MAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPybu_39pLQ6gvKOPuLNCnn46Y50QU36C5thJmxrNmCzGN+MAQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ingo Molnar <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/28/2014 03:04 PM, Ricardo Ribalda Delgado wrote:
> ---------- Forwarded message ----------
> From: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Tue, Aug 5, 2014 at 11:19 AM
> Subject: [PATCH] x86/devicetree: Fix compile warnings on AMD64
> To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Ingo Molnar
> <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org,
> Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>=
,
> Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>,
> linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

=E2=87=91
this makes it not a valid patch submission.

> arch/x86/kernel/devicetree.c: In function =E2=80=98ioapic_xlate=E2=80=
=99:
> arch/x86/kernel/devicetree.c:294:8: warning: cast from pointer to
> integer of different size [-Wpointer-to-int-cast]
>   idx =3D (__force u32) domain->host_data;
>         ^
> arch/x86/kernel/devicetree.c: In function =E2=80=98dt_add_ioapic_doma=
in=E2=80=99:
> arch/x86/kernel/devicetree.c:323:4: warning: cast to pointer from
> integer of different size [-Wint-to-pointer-cast]
>     (void *)ioapic_num);
>=20
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

while the patch fixes the type cast warnings, it makes me wonder: How
did you enable it on 64bit? Both platforms (that is CE4100 and OLPC)
are 32bit only.

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
