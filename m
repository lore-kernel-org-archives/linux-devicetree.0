From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: dts: sun6i: Add required ahb1
 clock parent and rates for dma controller
Date: Wed, 17 Sep 2014 00:01:46 +0800
Message-ID: <CAGb2v64BLvB3v8Wnep5Fqh1COTXYJ5_uyeuevejqD-KpYiptQg@mail.gmail.com>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
 <1410000448-9999-7-git-send-email-wens@csie.org> <20140911211531.GN31276@lukather>
 <CAGb2v64+RxJ52DzawhAtYCn=sw+28e4Q11jzG02KQE=8hxa0tQ@mail.gmail.com> <20140916154849.GE2166@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBB7554GQAKGQETYE2JSY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140916154849.GE2166@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 16, 2014 at 11:48 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Fri, Sep 12, 2014 at 10:10:25AM +0800, Chen-Yu Tsai wrote:
>> On Fri, Sep 12, 2014 at 5:15 AM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > On Sat, Sep 06, 2014 at 06:47:27PM +0800, Chen-Yu Tsai wrote:
>> >> The DMA controller requires AHB1 bus clock to be clocked from PLL6.
>> >>
>> >> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> >> ---
>> >>  arch/arm/boot/dts/sun6i-a31.dtsi | 5 +++++
>> >>  1 file changed, 5 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
>> >> index 8eb2c6d..1117989 100644
>> >> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> >> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> >> @@ -317,6 +317,11 @@
>> >>                       clocks = <&ahb1_gates 6>;
>> >>                       resets = <&ahb1_rst 6>;
>> >>                       #dma-cells = <1>;
>> >> +
>> >> +                     /* DMA controller requires AHB1 clocked from PLL6 */
>> >> +                     assigned-clocks = <&ahb1>;
>> >> +                     assigned-clock-parents = <&pll6>;
>> >> +                     assigned-clock-rates = <200000000>;
>> >
>> > Where did you get that from?
>> >
>> > The user manual says that it should be clocked at 600MHz, and I'm not
>> > sure it should be enforced there either.
>>
>> The bindings mean that ahb1 should be clocked from pll6 and at 200 MHz,
>> not "pll6 should be 200 MHz". I assume you were misled by them.
>>
>> Clocking ahb1 from pll6 and at 200 MHz with the /3 pre-divider is the
>> vendor BSP default:
>>
>> On sun6i, the clock init code calls aw_ccu_switch_ahb_2_pll6(), which muxes
>> ahb1 from pll6 with the highest dividers, then sets the rate for ahb1 to
>> pll6, which sets pre-divider to /3 and divider to /1.
>>
>> Hope this clears it up. :)
>
> It does, thanks :)
>
> But still, I find it the wrong place to enforce such a limit. This
> should go into the clock driver itself. The DMA controller requires
> such a parenting, but it doesn't require any specific rate, this is
> more something of the global system policy.

But I am guessing the AHB bus clock cannot be clock at any arbitrary
rate. Just muxing without setting a specific clock rate might result
in a hang. We could address this with per clock limitations, like the
patch you posted earlier. Not sure if there's anything in the kernel
like that at the moment, or how the clock framework handles clock rates
after re-parenting.

Or we could just specify in the clock driver, or in the DT via clock
supplier defaults, that the AHB bus should be clocked from PLL6 @ 200 MHz.

The latter seems easier to do.

Also, I tested the DMA controller using dmatest on my A31 Hummingbird
without this re-parenting patch. It worked fine. How did your tests fail?


Cheers
ChenYu
