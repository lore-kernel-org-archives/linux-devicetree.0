From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: using labels for stdout-path
Date: Thu, 11 May 2017 10:49:15 -0500
Message-ID: <CAL_JsqL66sWFovGhYGaA_sB_pnvTrjyaQ7MW3=5pkD5Qwb6y_w@mail.gmail.com>
References: <20170511130545.co6pyyvlwuitbyne@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170511130545.co6pyyvlwuitbyne-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

+dtc list because labels are purely dts syntax.

On Thu, May 11, 2017 at 8:05 AM, Uwe Kleine-König
<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> Hello,
>
> on an i.MX28 based machine I want to have the console on &duart with
> 115200 Bd, 8 Bit, no parity.
>
> The options for that are AFAICT:
>
>  - use an alias, like:
>
>         stdout-path = "serialX:115200n8";
>
>    the problem here is, that the duart doesn't have an alias. I guess I
>    shouldn't introduce a new one for my setup?
>
>  - use a label, like:
>
>         stdout-path = &duart, ":115200n8";
>
>    This would be the prettiest, but that doesn't work, because there is
>    a '\0' separating the path and the options.

You could make that work changing the kernel parsing, but that's
probably not a good option if we ever want to support more than 1 out
path.

>  - use the full path, like:
>
>         stdout-path = "/apb@80000000/apbx@80040000/serial@80074000:115200n8";
>
>    This is ugly.
>
> Do I miss something? Is that worth to introduce new syntax, maybe
>
>         stdout-path = &duart . ":115200n8";
>
> or similar?

Seems like we should make a comma be significant in splitting strings.
I'm not sure if there's anything relying on "foo" "bar" and "foo",
"bar" being the same. At least for numbers, a comma has no meaning, so
it would complicate the parsing I'd imagine. Not really an area I'm
familiar with.

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
