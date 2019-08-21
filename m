From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 11/14] arm64: dts: meson-g12a-x96-max: fix compatible
Date: Wed, 21 Aug 2019 23:14:28 +0200
Message-ID: <CAFBinCA13xJHRmTrOHxSkoy2rMv3=+BBwZsLBmZn=cQ0pyE_Aw@mail.gmail.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-12-narmstrong@baylibre.com> <CAFBinCBWFNJNAWdeZ2LfEJA-MVpSf-A5SrLZEx+0z_P+-iBFDg@mail.gmail.com>
 <c2d78c7c-d9a8-e486-d3b1-c1447e24284b@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c2d78c7c-d9a8-e486-d3b1-c1447e24284b@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 21, 2019 at 4:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 20/08/2019 22:32, Martin Blumenstingl wrote:
> > On Wed, Aug 14, 2019 at 4:33 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> This fixes the following DT schemas check errors:
> >> meson-g12a-x96-max.dt.yaml: /: compatible: ['amediatech,x96-max', 'amlogic,u200', 'amlogic,g12a'] is not valid under any of the given schemas
> >>
> >> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >
> > [...]
> >> -       compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
> >> +       compatible = "amediatech,x96-max", "amlogic,g12a";
> > only partially related: I wonder if we should add a s905x2 compatible
> > string here and to the .dts filename (just like we separate the GXL
> > variants s905x, s905d, s905w, ...)
> >
>
> We could, but AFAIK no variants of G12A are planned yet...
we already support two variants: S905X2 and S905D2 (I'm assuming that
these are similar to S905X and S905D meaning both are almost
identical)
but I guess we can stay with what we have until there's a reason to
have separate compatible strings (for example if we discover that
there is a difference that matters - like the OPP table on S922X vs
A311D)
