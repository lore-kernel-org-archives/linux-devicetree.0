From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: sunxi: Introduce Allwinner for
 A83T support
Date: Tue, 22 Sep 2015 23:56:26 +0800
Message-ID: <CAGb2v67pX_q=O0ezUs4CbhMz-Do_0dxq7WnfGPjxw0JNDZar=g@mail.gmail.com>
References: <1442936337-3104-1-git-send-email-vishnupatekar0510@gmail.com>
 <1442936337-3104-2-git-send-email-vishnupatekar0510@gmail.com>
 <CAGb2v665FhnSoWYGJn+Tf79F7pZitYBrEOmAts4nVoUWb-uBqg@mail.gmail.com> <20150922155313.GK4684@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBQHUQWYAKGQEGBIVXQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <20150922155313.GK4684@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 22, 2015 at 11:53 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Sep 22, 2015 at 11:47:40PM +0800, Chen-Yu Tsai wrote:
>> On Tue, Sep 22, 2015 at 11:38 PM, Vishnu Patekar
>> <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Allwinner A83T is octa-core cortex-a7 based SoC.
>> > It's clock control unit and prcm, pinmux are different from previous sun8i
>> > series.
>> > Its processor cores are arragned in two clusters 4 cores each,
>> > similar to A80.
>> >
>> > Signed-off-by: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> > ---
>> >  Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
>> >  arch/arm/mach-sunxi/sunxi.c                     | 1 +
>> >  drivers/clk/sunxi/clk-sunxi.c                   | 6 ++++++
>> >  3 files changed, 8 insertions(+)
>> >
>> > diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
>> > index 67da205..cf5ed27 100644
>> > --- a/Documentation/devicetree/bindings/arm/sunxi.txt
>> > +++ b/Documentation/devicetree/bindings/arm/sunxi.txt
>> > @@ -11,4 +11,5 @@ using one of the following compatible strings:
>> >    allwinner,sun8i-a23
>> >    allwinner,sun8i-a33
>> >    allwinner,sun8i-h3
>> > +  allwinner,sun8i-a83t
>>
>> Alphabetic order please.
>>
>> >    allwinner,sun9i-a80
>> > diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
>> > index 65bab28..b04aefa 100644
>> > --- a/arch/arm/mach-sunxi/sunxi.c
>> > +++ b/arch/arm/mach-sunxi/sunxi.c
>> > @@ -69,6 +69,7 @@ static const char * const sun8i_board_dt_compat[] = {
>> >         "allwinner,sun8i-a23",
>> >         "allwinner,sun8i-a33",
>> >         "allwinner,sun8i-h3",
>> > +       "allwinner,sun8i-a83t",
>>
>> Same here.
>>
>> >         NULL,
>> >  };
>> >
>> > diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
>> > index 413070d..f216d5d 100644
>> > --- a/drivers/clk/sunxi/clk-sunxi.c
>> > +++ b/drivers/clk/sunxi/clk-sunxi.c
>> > @@ -1212,6 +1212,12 @@ CLK_OF_DECLARE(sun6i_a31s_clk_init, "allwinner,sun6i-a31s", sun6i_init_clocks);
>> >  CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clocks);
>> >  CLK_OF_DECLARE(sun8i_a33_clk_init, "allwinner,sun8i-a33", sun6i_init_clocks);
>> >
>> > +static void __init sun8ia83t_init_clocks(struct device_node *node)
>> > +{
>> > +       sunxi_init_clocks(NULL, 0);
>> > +}
>> > +CLK_OF_DECLARE(sun9i_a83t_clk_init, "allwinner,sun8i-a83t", sun8ia83t_init_clocks);
>>
>> sun8i? Missing underscore too.
>>
>> I think you should add this once you actually have clock support.
>> Otherwise this call basically does nothing.
>
> That's not true, it actually initializes most of the clocks in the
> system.

Right. Sorry, I think my thoughts strayed to sun9i.

ChenYu
