From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Wed, 19 Mar 2014 13:41:59 +0100
Message-ID: <1395232919.15174.7.camel@AMDC1943>
References: <20140318110947.GR25478@lee--X1>
 <1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
 <20140319091404.GF31687@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20140319091404.GF31687@lee--X1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2014-03-19 at 09:14 +0000, Lee Jones wrote:
> > Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at =
least
> > for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
> > rtc-s5m driver does not support S2MPA01.
> >=20
> > This fixes following error:
> > drivers/mfd/sec-core.c:342:45: warning: =E2=80=98regmap_rtc=E2=80=99=
 may be used uninitialized in this function [-Wuninitialized]
> >=20
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> > ---
> >  drivers/mfd/sec-core.c |    7 +++++++
> >  1 file changed, 7 insertions(+)
>=20
> Please don't send patches in the middle of threads like this (v2's ar=
e
> a different story as it saves on re-sending entire patch-sets), as I
> very nearly missed it.

OK, I understand. I put it in the middle because it was a follow up of
your immutable branch ib-mfd-regulator-3.15 (merging mine S2MPS14 and
Sachin's S2MPA01).

>=20
> We already have drivers doing similar things so I'll apply this as a
> temporary fix, but please find something a little less 'hacky' to
> supersede it _soon_.

Sure, I just sent a patch for it.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
