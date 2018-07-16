From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] of/fdt: avoid undefined behaviour in populate_properties()
Date: Mon, 16 Jul 2018 08:36:34 -0600
Message-ID: <CAL_JsqJLyf8-szrAQKWSEpy6gG_j0Cyu9miijOQiO_YSPx_dGQ@mail.gmail.com>
References: <20180706113715.30053-1-mark.rutland@arm.com> <c1f615b6-6e56-414c-b4f8-e75ad4c114e7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1f615b6-6e56-414c-b4f8-e75ad4c114e7@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 6, 2018 at 10:51 AM Frank Rowand <frowand.list@gmail.com> wrote:
>
> On 07/06/18 04:37, Mark Rutland wrote:
> > We unflatten a device tree in two passes: the first calculating the size
> > of the unflattened tree, and the second performing the actual
> > unflattening into a suitably-sized buffer.

[...]

> > @@ -187,7 +187,9 @@ static void populate_properties(const void *blob,
> >       int cur;
> >       bool has_name = false;
> >
> > -     pprev = &np->properties;
> > +     if (!dryrun)
> > +             pprev = &np->properties;
> > +
> >       for (cur = fdt_first_property_offset(blob, offset);
> >            cur >= 0;
> >            cur = fdt_next_property_offset(blob, cur)) {
> >
>
> Please add a one line comment explaining why "if (!dryrun)" so that no one
> decides to remove the test in the future as not needed.  Otherwise,

Please re-spin ASAP with the comment if you'd like this in 4.18.

Rob
