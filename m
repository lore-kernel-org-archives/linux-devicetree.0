From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v6 4/4] clk: dt: Introduce binding for always-on clock
 support
Date: Wed, 29 Apr 2015 16:11:47 +0100
Message-ID: <20150429151147.GX9169@x1>
References: <1428432239-4114-5-git-send-email-lee.jones@linaro.org>
 <20150407191746.GA26727@lukather>
 <20150408081450.GB5162@x1>
 <20150408094349.GC26727@lukather>
 <20150408103832.GG5162@x1>
 <20150408155705.GF26727@lukather>
 <20150408172344.GH5162@x1>
 <20150422093446.GA28007@lukather>
 <20150429141751.GR9169@x1>
 <CAMuHMdVdtoXGhK97Ky5hoVcjM6XZAZXKWELL64MFQebMpFr2Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdVdtoXGhK97Ky5hoVcjM6XZAZXKWELL64MFQebMpFr2Ng@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@stlinux.com, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, 29 Apr 2015, Geert Uytterhoeven wrote:
> On Wed, Apr 29, 2015 at 4:17 PM, Lee Jones <lee.jones@linaro.org> wro=
te:
> > This useful binding should be accepted and people should not abuse
> > it.  If they do and the vendor Maintainer's review and accept then
> > they have no foundation for recourse.
> >
> > Would you prefer it if I made the warning starker?
>=20
> Perhaps you can add a check for "clock-always-on" to scripts/checkpat=
ch.pl,
> to make people aware they should think twice?

That's a really nice idea!

Maxime, would that make you happ(y|ier)?

> Nah, people don't read documentation, don't run checkpatch, ignore co=
mpiler
> warnings, etc...

:)

You can only wrap people in so much cotton wool.  If they then decide
to ignore all the warnings and jump, woe betide them.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
