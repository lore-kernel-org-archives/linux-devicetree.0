From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 02/11] arm64: allwinner: a64: add NMI
 controller on A64
Date: Wed, 5 Apr 2017 19:59:04 +0800
Message-ID: <CAGb2v64zZcxBEGn5KjP3LLNVCfLSN-+BN_51HAA4nAM-nWDWCA@mail.gmail.com>
References: <20170404180145.12897-1-icenowy@aosc.io> <20170404180145.12897-3-icenowy@aosc.io>
 <CAGb2v67BucT8=FTgem3AmSU9XJA7OHoTCq3t3wBzDWyuwzZqaA@mail.gmail.com>
 <20170405061137.n66ectbkl7a2fv5f@lukather> <CAGb2v672Z2JedGF3n+8Hi78QG_hAxz0ZYXaCkw0GAkA3xEdKrA@mail.gmail.com>
 <20170405072832.qunhfngatebcgn4q@lukather>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBIFYSPDQKGQE5GQQ4FI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170405072832.qunhfngatebcgn4q@lukather>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 5, 2017 at 3:28 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, Apr 05, 2017 at 02:20:31PM +0800, Chen-Yu Tsai wrote:
>> On Wed, Apr 5, 2017 at 2:11 PM, Maxime Ripard
>> <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > On Wed, Apr 05, 2017 at 11:51:45AM +0800, Chen-Yu Tsai wrote:
>> >> On Wed, Apr 5, 2017 at 2:01 AM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>> >> > Allwinner A64 SoC features a NMI controller, which is usually connected
>> >> > to the AXP PMIC.
>> >> >
>> >> > Add support for it.
>> >> >
>> >> > Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> >>
>> >> This might not be the best representation of the R_INTC block. Though
>> >> we'd need to change it for all SoCs if we want to be accurate. For now,
>> >
>> > What do you think would be a good representation?
>>
>> My gut feeling is that this is the old INTC from sun4/5i.
>
> Ah, that would make sense.
>
>> It's supposed to be the interrupt controller for the embedded low
>> power core. I've not done a thorough comparison though.
>
> Do we have some documentation / code for this one?

I can't remember where or if I saw any. If Allwinner ever released
any source code for the OpenRISC core we could actually verify it.

However the base address of this block, in addition to the register
offsets found in the driver for "allwinner,sun6i-a31-sc-nmi" do match
up with the sun4i irqchip. The question is if any of the other interrupt
lines are hooked up, and if yes, to what. A possibility would be that
it has all the interrupt lines in the SoC also hooked up, at the same
numbers as the GIC (minus 32). It would feed both the GIC and CPUS.
This is just an educated guess though.

Regards
ChenYu
