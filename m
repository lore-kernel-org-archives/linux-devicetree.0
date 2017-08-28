From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77995: add pfc device node
Date: Mon, 28 Aug 2017 16:05:04 +0200
Message-ID: <20170828140503.GI18592@verge.net.au>
References: <1502281247-24124-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWzc0A-16LUz4rVHJBRk9Fdhs_BLBHqpgPrYOdm23qzAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdWzc0A-16LUz4rVHJBRk9Fdhs_BLBHqpgPrYOdm23qzAg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 28, 2017 at 10:39:47AM +0200, Geert Uytterhoeven wrote:
> Hi Shimoda-san, Simon,
> 
> On Wed, Aug 9, 2017 at 2:20 PM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >
> >  This patch set is based on the renesas-drivers.git /
> > topic/r8a77995-integration branch and depends on the following patch
> >  "pinctrl: sh-pfc: r8a77995: Initial R8A77995 PFC support"
> >
> >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > index 7419688..240b0f8 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> > @@ -123,6 +123,11 @@
> >                         reg = <0 0xe6160000 0 0x0200>;
> >                 };
> >
> > +               pfc: pfc@e6060000 {
> 
> Upon second look, this should use the generic "pin-controller@..." node name.
> I will fix the example in the bindings.
> 
> > +                       compatible = "renesas,pfc-r8a77995";
> > +                       reg = <0 0xe6060000 0 0x508>;
> > +               };

Shimoda-san, as this patch has been accepted for v4.14 could
you please send a follow-up patch (for v4.15)?
