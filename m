From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v10 1/2] mfd: AXP20x: Add bindings documentation
Date: Mon, 9 Mar 2015 09:29:31 +0000
Message-ID: <20150309092931.GC3427@x1>
References: <1424431168-25157-1-git-send-email-wens@csie.org>
 <1424431168-25157-2-git-send-email-wens@csie.org>
 <CAGb2v65-kq=usC8Xip56p9wbs7RMUd0=sXcjcgY3Ec33bxEUaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v65-kq=usC8Xip56p9wbs7RMUd0=sXcjcgY3Ec33bxEUaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Mark Brown <broonie@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Carlo Caione <carlo@caione.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, 07 Mar 2015, Chen-Yu Tsai wrote:

> On Fri, Feb 20, 2015 at 7:19 PM, Chen-Yu Tsai <wens@csie.org> wrote:
> > From: Carlo Caione <carlo@caione.org>
> >
> > Bindings documentation for the AXP20x driver. In this file also
> > sub-nodes are documented.
> >
> > Signed-off-by: Carlo Caione <carlo@caione.org>
> > [wens@csie.org: clarify interrupt source for the axp PMIC]
> > [wens@csie.org: explain dcdc-workmode in detail and trim lines to 8=
0 chars]
> > [wens@csie.org: make regulator supplies optional if using unregulat=
ed input]
> > [wens@csie.org: use cubieboard2 regulator nodes as example]
> > [wens@csie.org: x-powers,dcdc-workmode default changed to 'current =
hardware
> >                 setting']
> > [wens@csie.org: reorganized regulator related properties into separ=
ate
> >                 section.]
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>=20
> Ping?

Don't do that.  It won't speed up the review.

If you think your set has been fogotten about (this one has not)
resend with s/PATCH/RESEND/ in the subject line.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
