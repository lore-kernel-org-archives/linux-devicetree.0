From: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: dts: sunxi: h3/h5: Add device node
 for SID
Date: Tue, 19 Mar 2019 11:17:31 +0800
Message-ID: <CAGb2v64HJX+2rC14OEPgBSc61h-8KCAthdyY05xTuquKYTfsRA@mail.gmail.com>
References: <20190318073354.12151-1-wens@kernel.org> <20190318073354.12151-7-wens@kernel.org>
 <8e9ef57f-1d24-b151-f8a4-812b7bb65388@sholland.org>
Reply-To: wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBWF6YHSAKGQE2E7JCQQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <8e9ef57f-1d24-b151-f8a4-812b7bb65388-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org>
Cc: Chen-Yu Tsai <wens-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 19, 2019 at 9:55 AM Samuel Holland <samuel-RkNLwX/CsU9g9hUCZPvPmw@public.gmane.org> wrote:
>
> On 03/18/19 02:33, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> >
> > The device tree binding already lists compatible strings for these two
> > SoCs. Add a device node for them.
> >
> > Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-h3.dtsi              | 4 ++++
> >  arch/arm/boot/dts/sunxi-h3-h5.dtsi           | 5 +++++
> >  arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi | 4 ++++
> >  3 files changed, 13 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> > index 959d265e7254..e37c30e811d3 100644
> > --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> > @@ -231,3 +231,7 @@
> >  &rtc {
> >       compatible = "allwinner,sun8i-h3-rtc";
> >  };
> > +
> > +&sid {
> > +     compatible = "allwinner,sun8i-h3-sid";
> > +};
> > diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > index d74a6cbbfdf4..e2100b673a51 100644
> > --- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > +++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
> > @@ -227,6 +227,11 @@
> >                       #size-cells = <0>;
> >               };
> >
> > +             sid: eeprom@1c14000 {
> > +                     /* compatible and clocks are in per SoC .dtsi file */
>
> There are no clocks for this node, just a compatible string.

Right. I'll fix this when applying.

ChenYu
