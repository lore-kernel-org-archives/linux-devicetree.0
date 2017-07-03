From: Chunyan Zhang <zhang.lyra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V1 7/9] clk: sprd: add adjustable pll support
Date: Mon, 3 Jul 2017 15:41:33 +0800
Message-ID: <CAAfSe-sw669n2ZwpWpeCDw0S46Pg94xaWZFcSbEE6TYKg2JbLg@mail.gmail.com>
References: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
 <20170618015855.27738-8-chunyan.zhang@spreadtrum.com> <20170620013710.GJ4493@codeaurora.org>
 <CAAfSe-sMy3aM9=LwpVivvHKy4hVw3GEd3U-hZe17pXM5fJRxPg@mail.gmail.com>
 <20170630014452.GL22780@codeaurora.org> <CAAfSe-smKqgd42jDAGDA=NtYvRZExNanU7fHrRkT4W-WH-2=ug@mail.gmail.com>
 <20170630192228.GO22780@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170630192228.GO22780-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: Chunyan Zhang <chunyan.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Xiaolong Zhang <xiaolong.zhang-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Orson Zhai <orson.zhai-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Geng Ren <geng.ren-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>, Ben Li <ben.li-lxIno14LUO0EEoCn2XhGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1 July 2017 at 03:22, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
> On 06/30, Chunyan Zhang wrote:
>> Hi Stephen,
>>
>> On 30 June 2017 at 09:44, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> > On 06/22, Chunyan Zhang wrote:
>> >> On 20 June 2017 at 09:37, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> >> > On 06/18, Chunyan Zhang wrote:
>> >> >> +     pll->factors[member].width
>> >> >> +
>> >> >> +#define pmask(pll, member)                                   \
>> >> >> +     ((pwidth(pll, member)) ?                                \
>> >> >> +     GENMASK(pwidth(pll, member) + pshift(pll, member) - 1,  \
>> >> >> +     pshift(pll, member)) : 0)
>> >> >> +
>> >> >> +#define pinternal(pll, cfg, member)  \
>> >> >> +     (cfg[pindex(pll, member)] & pmask(pll, member))
>> >> >> +
>> >> >> +#define pinternal_val(pll, cfg, member)      \
>> >> >> +     (pinternal(pll, cfg, member) >> pshift(pll, member))
>> >> >> +
>> >> >> +static unsigned long pll_get_refin_rate(struct ccu_pll *pll)
>> >> >
>> >> > pll could be const?
>> >>
>> >> What this function returns is a factor used to calculate the pll rate
>> >> later, I will rename this function in the next iterator.
>> >>
>> >
>> > Rename is fine, but pll can still be marked const?
>>
>> Oh, sorry I misunderstood :)
>> You mean mark the input parameter "pll" const, right?
>
> Yes.
>
>> >> >> +
>> >> >> +static int ccu_pll_helper_set_rate(struct ccu_pll *pll,
>> >> >> +                                unsigned long rate,
>> >> >> +                                unsigned long parent_rate)
>> >> >> +{
>> >> >> +     u32 mask, shift, width, ibias_val, index, kint, nint;
>> >> >> +     u32 reg_num = pll->regs[0], i = 0;
>> >> >> +     unsigned long refin, fvco = rate;
>> >> >> +     struct reg_cfg *cfg;
>> >> >> +
>> >> >> +     cfg = kcalloc(reg_num, sizeof(*cfg), GFP_KERNEL);
>> >> >> +     if (!cfg)
>> >> >> +             return -ENOMEM;
>> >> >> +
>> >> >> +     refin = pll_get_refin_rate(pll);
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_PREDIV);
>> >> >> +     index = pindex(pll, PLL_PREDIV);
>> >> >> +     width = pwidth(pll, PLL_PREDIV);
>> >> >> +     if (width && (ccu_pll_readl(pll, index) & mask))
>> >> >> +             refin = refin * 2;
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_POSTDIV);
>> >> >> +     index = pindex(pll, PLL_POSTDIV);
>> >> >> +     width = pwidth(pll, PLL_POSTDIV);
>> >> >> +     cfg[index].msk = mask;
>> >> >> +     if (width && ((pll->fflag == 1 && fvco <= pll->fvco) ||
>> >> >> +                   (pll->fflag == 0 && fvco > pll->fvco)))
>> >> >> +             cfg[index].val |= mask;
>> >> >> +
>> >> >> +     if (width && fvco <= pll->fvco)
>> >> >> +             fvco = fvco * 2;
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_DIV_S);
>> >> >> +     index = pindex(pll, PLL_DIV_S);
>> >> >> +     cfg[index].val |= mask;
>> >> >> +     cfg[index].msk |= mask;
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_SDM_EN);
>> >> >> +     index = pindex(pll, PLL_SDM_EN);
>> >> >> +     cfg[index].val |= mask;
>> >> >> +     cfg[index].msk |= mask;
>> >> >> +
>> >> >> +     nint  = fvco/(refin * CCU_PLL_1M);
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_NINT);
>> >> >> +     index = pindex(pll, PLL_NINT);
>> >> >> +     shift = pshift(pll, PLL_NINT);
>> >> >> +     cfg[index].val |= (nint << shift) & mask;
>> >> >> +     cfg[index].msk |= mask;
>> >> >> +
>> >> >> +     mask = pmask(pll, PLL_KINT);
>> >> >> +     index = pindex(pll, PLL_KINT);
>> >> >> +     width = pwidth(pll, PLL_KINT);
>> >> >> +     shift = pshift(pll, PLL_KINT);
>> >> >> +#ifndef CONFIG_64BIT
>> >> >> +     i = width < 21 ? 0 : i - 21;
>> >> >> +#endif
>> >> >
>> >> > What's this? Why do we depend on CONFIG_64BIT?
>> >>
>> >> On 32-bit SoCs, the largest width we can support is limited due to the
>> >> limitation of calculation precision.
>> >
>> > Does the hardware width change? Still not clear to me what's
>> > going on here.
>>
>> I heard from my colleague, that because the calculation precision on
>> Spreadtrum's 32-bit SoCs is different from on 64-bit SoCs,  when the
>> width of the value of PLL_KINT is larger than 21, the value is too
>> large to be multiplied on 32-bit Spreadtrum's SoCs.
>
> It sounds like you're saying that the clk hardware is not
> changing, but the sizeof(long) is different on 64-bit and 32-bit
> CPUs so you've added this ifndef here for that.
>

I finally figure out that this #ifndef is indeed not needed, thanks to
your querying :)

They told me that on Spreadtrum's 32-bit SoCs, only 20-bit of PLL_KINT
is used and 3-bit is reserved in order to keep in line with the PLLs
on 64-bit SoC.
And we can get the same effect only if we define PLL with the specific
'width' and 'shift' for PLL_KINT.

I'll remove this statement and 'i' from here and
sprd_pll_helper_recalc_rate() function.

>>
>> i = width < 21 ? 0 : i - 20;
>>
>> Here ' i ' is used to adjust 'shift' rather than 'width'  like below (
>> wrote the code back for convenience of understanding)
>>
>> +       kint = DIV_ROUND_CLOSEST(((fvco - refin * nint * CCU_PLL_1M)/10000) *
>> +       ((mask >> (shift + i)) + 1), refin * 100) << i;
>>
>
> Having the types for all these variables would also be helpful.
>
>   u32 mask, shift, width, kint, nint;
>   unsigned long refin, fvco;
>
> Why don't we do 64-bit math here instead of 32-bit math? And use
> DIV_ROUND_CLOSEST_ULL?

Agree, we should use 64-bit math, will address this.

Thanks,
Chunyan

>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
