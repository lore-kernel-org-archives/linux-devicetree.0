From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [PATCH 2/3] dmaengine: sun6i: Add support for
 Allwinner A23 (sun8i) variant
Date: Thu, 18 Sep 2014 09:57:42 +0800
Message-ID: <CAGb2v65p4QPJY+eiLps6C2kAZjhPd99D5YYauwUjLJnnj54B1A@mail.gmail.com>
References: <1410616381-30226-1-git-send-email-wens@csie.org>
 <1410616381-30226-3-git-send-email-wens@csie.org> <20140916103540.GF9948@lukather>
 <CAGb2v67jokpXHxR26YoCEB2Y_v07oQZXZfPuGJC_wO=r-SRZhg@mail.gmail.com> <20140917155540.GJ2166@lukather>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBLHY5CQAKGQENIQU27Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20140917155540.GJ2166@lukather>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 17, 2014 at 11:55 PM, Maxime Ripard
<maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Tue, Sep 16, 2014 at 10:13:27PM +0800, Chen-Yu Tsai wrote:
>> >> +     /*
>> >> +      * sun8i variant requires us to toggle an undocumented register,
>> >> +      * as seen in Allwinner's SDK.
>> >
>> > The BSP I have has this:
>> >
>> > static void sunxi_dma_hw_init(struct sunxi_dmadev *dev)
>> > {
>> >         struct sunxi_dmadev *sunxi_dev = dev;
>> >
>> >         clk_prepare_enable(sunxi_dev->ahb_clk);
>> > #ifdef CONFIG_ARCH_SUN8IW3
>> >         writel(0x04, sunxi_dev->base + DMA_GATE);
>> > #endif
>> > }
>> >
>> > /* All is ok, and open the clock */
>> > sunxi_dma_hw_init(sunxi_dev);
>> >
>> > So I guess we can say that it's not that undocumented :)
>>
>> That's right. I meant undocumented in the user manual.
>> I did reference the SDK in the comment, didn't I? :)
>
> So something like
>
> writel(DMA_GATE_ENABLE, base->DMA_GATE_REG) wouldn't be too far off :)

Sure. Will also update the comment to reflect the naming.

ChenYu
