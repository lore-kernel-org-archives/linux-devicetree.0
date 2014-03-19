From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: sec-core: Fix uninitialized 'regmap_rtc' on S2MPA01
Date: Wed, 19 Mar 2014 09:14:04 +0000
Message-ID: <20140319091404.GF31687@lee--X1>
References: <20140318110947.GR25478@lee--X1>
 <1395148286-32002-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1395148286-32002-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

> Initialize the 'regmap_rtc' on S2MPA01 to some sane value. Sane at le=
ast
> for S5M87X chipsets, not S2MPS/S2MPA but it won't be used because
> rtc-s5m driver does not support S2MPA01.
>=20
> This fixes following error:
> drivers/mfd/sec-core.c:342:45: warning: =E2=80=98regmap_rtc=E2=80=99 =
may be used uninitialized in this function [-Wuninitialized]
>=20
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/mfd/sec-core.c |    7 +++++++
>  1 file changed, 7 insertions(+)

Please don't send patches in the middle of threads like this (v2's are
a different story as it saves on re-sending entire patch-sets), as I
very nearly missed it.

We already have drivers doing similar things so I'll apply this as a
temporary fix, but please find something a little less 'hacky' to
supersede it _soon_.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
