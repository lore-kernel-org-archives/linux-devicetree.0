From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: sun8i: a83t: add dwmac-sun8i ethernet driver
Date: Fri, 9 Jun 2017 12:35:08 +0800
Message-ID: <CAGb2v650dPV+WgP_8L1dNEuav3jRSQkk_sQL0bi=PcjOXoQgVg@mail.gmail.com>
References: <20170607173345.22462-1-clabbe.montjoie@gmail.com>
 <20170607173345.22462-3-clabbe.montjoie@gmail.com> <20170608083428.csv54tryvgwdb552@flea.home>
 <20170608084222.GA10830@Red> <20170608124841.b6i5qphsyubksbvb@flea.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170608124841.b6i5qphsyubksbvb-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 8, 2017 at 8:48 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Thu, Jun 08, 2017 at 10:42:22AM +0200, Corentin Labbe wrote:
>> On Thu, Jun 08, 2017 at 10:34:28AM +0200, Maxime Ripard wrote:
>> > On Wed, Jun 07, 2017 at 07:33:45PM +0200, Corentin Labbe wrote:
>> > > The dwmac-sun8i is an ethernet MAC hardware that support 10/100/1000 speed.
>> > > This patch enable the dwmac-sun8i on the Allwinner a83t SoC Device-tree.
>> > >
>> > > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > > Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> > > ---
>> > >  arch/arm/boot/dts/sun8i-a83t.dtsi | 28 ++++++++++++++++++++++++++++
>> > >  1 file changed, 28 insertions(+)
>> > >
>> > > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> > > index 01a83406f9ae..7d719b4aeaa9 100644
>> > > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
>> > > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
>> > > @@ -200,6 +200,14 @@
>> > >                   #interrupt-cells = <3>;
>> > >                   #gpio-cells = <3>;
>> > >
>> > > +                 emac_rgmii_pins: emac-rgmii-pins {
>> > > +                         pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
>> > > +                                "PD11", "PD12", "PD13", "PD14", "PD18",
>> > > +                                "PD19", "PD21", "PD22", "PD23";
>> > > +                         function = "gmac";
>> > > +                         drive-strength = <40>;
>> > > +                 };
>> > > +
>> >
>> > This is not used anywhere.
>> >
>> But will be used by bpim3 board
>
> Then will add it when we'll add support for that board, until then,
> it's dead code.

I'll include this in my A83T work branch and resend it when I get around to it.

Thanks
ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
