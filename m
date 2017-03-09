From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 14/15] ARM: sun5i: a10s: Add the HDMI
 controller node
Date: Thu, 9 Mar 2017 19:10:37 +0800
Message-ID: <CAGb2v674TKUho1tsq6KSyWS_=+dn_8CFuM31uxR7akZSXAjeHA@mail.gmail.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
 <61406c0ba992f2fa5b5180b790a1ef3fa38d9567.1488876832.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64KKp0cYB3u0=bSVcq0gB41LkurCeiTJ3OEzn7UjdSPpQ@mail.gmail.com> <20170309105934.ahsussan6p36lrzn@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBRXQQTDAKGQEGNVGPPQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170309105934.ahsussan6p36lrzn@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 9, 2017 at 6:59 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> 1;4601;0c
> On Wed, Mar 08, 2017 at 11:35:39AM +0800, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Tue, Mar 7, 2017 at 4:56 PM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > The A10s has an HDMI controller connected to the second TCON channel. Add
>> > it to our DT.
>> >
>> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> >  arch/arm/boot/dts/sun5i-a10s.dtsi | 34 ++++++++++++++++++++++++++++++++-
>> >  arch/arm/boot/dts/sun5i.dtsi      |  1 +-
>> >  2 files changed, 35 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
>> > index 074485782a4a..3482c9d2b120 100644
>> > --- a/arch/arm/boot/dts/sun5i-a10s.dtsi
>> > +++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
>> > @@ -72,7 +72,33 @@
>> >                 };
>> >         };
>> >
>> > +       display-engine {
>> > +               compatible = "allwinner,sun5i-a10s-display-engine",
>> > +                            "allwinner,sun5i-a13-display-engine";
>> > +               allwinner,pipelines = <&fe0>;
>> > +       };
>> > +
>> >         soc@01c00000 {
>> > +               hdmi0: hdmi@01c16000 {
>>
>> Nit: is the 0 suffix needed? I don't see any indication that there is
>> a second controller.
>>
>> > +                       compatible = "allwinner,sun5i-a10s-hdmi";
>> > +                       reg = <0x01c16000 0x1000>;
>> > +                       clocks = <&ccu CLK_AHB_HDMI>, <&ccu CLK_HDMI>,
>> > +                                <&ccu CLK_PLL_VIDEO0_2X>,
>> > +                                <&ccu CLK_PLL_VIDEO1_2X>;
>> > +                       clock-names = "ahb", "mod", "pll-0", "pll-1";
>> > +                       status = "disabled";
>> > +
>> > +                       port {
>> > +                               #address-cells = <1>;
>> > +                               #size-cells = <0>;
>> > +
>> > +                               hdmi0_in_tcon0: endpoint@0 {
>> > +                                       reg = <0>;
>> > +                                       remote-endpoint = <&tcon0_out_hdmi0>;
>> > +                               };
>> > +                       };
>> > +               };
>> > +
>> >                 pwm: pwm@01c20e00 {
>> >                         compatible = "allwinner,sun5i-a10s-pwm";
>> >                         reg = <0x01c20e00 0xc>;
>> > @@ -129,3 +155,11 @@
>> >
>> >  &sram_a {
>> >  };
>> > +
>> > +&tcon0_out {
>> > +       tcon0_out_hdmi0: endpoint@2 {
>> > +               reg = <2>;
>> > +               remote-endpoint = <&hdmi0_in_tcon0>;
>> > +               allwinner,tcon-channel = <1>;
>> > +       };
>> > +};
>> > diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
>> > index f3b6e19244f9..3d009b2aa42a 100644
>> > --- a/arch/arm/boot/dts/sun5i.dtsi
>> > +++ b/arch/arm/boot/dts/sun5i.dtsi
>> > @@ -273,6 +273,7 @@
>> >                                         tcon0_out_tve0: endpoint@1 {
>> >                                                 reg = <1>;
>> >                                                 remote-endpoint = <&tve0_in_tcon0>;
>> > +                                               allwinner,tcon-channel = <1>;
>>
>> This looks like a separate patch, probably following the binding
>> change?
>
> I don't know, the binding says that without anything specified, reg
> would be used. I was assuming that we only needed it once we had the
> new endpoint to make it consistent, therefore it didn't need an extra
> patch.
>
> But I can definitely create one if you want.

It just seems a bit out of place, that's all. Mentioning it in the
commit message would be good enough for me.

ChenYu

> Maxime
>
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
