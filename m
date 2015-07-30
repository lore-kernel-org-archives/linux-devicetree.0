From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v5 01/10] clk: mediatek: Removed unused dpi_ck clock from
 MT8173
Date: Thu, 30 Jul 2015 12:42:44 -0700
Message-ID: <55BA7E34.2050206@codeaurora.org>
References: <1438152754-11970-1-git-send-email-jamesjj.liao@mediatek.com> <1438154233.17770.39.camel@mtksdaap41> <20150730173643.GH3159@codeaurora.org> <1450634.BBmUdb8ZLk@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1450634.BBmUdb8ZLk@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 07/30/2015 11:04 AM, Heiko St=FCbner wrote:
> Am Donnerstag, 30. Juli 2015, 10:36:43 schrieb Stephen Boyd:
>
>> Is it being used in DT right now and causing regressions on
>> v4.2-rcX? Sorry, I'm trying to understand why this patch matters
>> for the 4.2 release.
> it's not been used in an actual devicetree file, but as far as I unde=
rstand it,
> the dt-binding headers themself are also part of the ABI.
>
> And it is new in 4.2, so has not been part of an official release yet=
=2E
>
> The reason for the removal from what I understand is that the removed=
 clock is
> not documented at all (it's source, what it does), which got it the "=
clk_null"
> parent in the first place.
>
>

Right, so my understanding of the DT ABI thing is that newer kernels=20
should keep working with older DTs. If there isn't any DT using the=20
binding, then we don't have a problem because the only thing that could=
=20
happen would be a newer DT working with an older kernel, which doesn't=20
make any sense from a backwards incompatible standpoint.

If you feel strongly that some sort of DT ABI rule would be broken and=20
you want to make sure that doesn't happen I guess we can queue this up=20
to be sent off to Linus, but if you aren't worried (and I'm obviously=20
not worried) then I'd prefer we just queue it up for 4.3.

--=20
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
