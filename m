Return-Path: <SRS0=qchw=UL=verge.net.au=horms@kernel.org>
Date: Wed, 12 Jun 2019 14:16:36 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612121636.qwktrxb3e3je5nd3@verge.net.au>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 12, 2019 at 10:27:56AM +0200, Geert Uytterhoeven wrote:
> Hi Fabrizio,
> 
> On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > This patch adds uSD and eMMC support to the HiHope RZ/G2M
> > board.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> 
> > +&sdhi3 {
> > +       pinctrl-0 = <&sdhi3_pins>;
> > +       pinctrl-1 = <&sdhi3_pins>;
> > +       pinctrl-names = "default", "state_uhs";
> > +
> > +       vmmc-supply = <&reg_3p3v>;
> > +       vqmmc-supply = <&reg_1p8v>;
> > +       bus-width = <8>;
> > +       mmc-hs200-1_8v;
> 
> Does the eMMC support HS400, too?
> 
> > +       non-removable;
> > +       fixed-emmc-driver-type = <1>;
> > +       status = "okay";
> > +};
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks,

applied for inclusion in v5.3.
