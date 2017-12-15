From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: DT dtc warnings
Date: Fri, 15 Dec 2017 20:21:28 +0100
Message-ID: <20171215192128.GD7022@piout.net>
References: <CAL_JsqJKCzjx3zNigu_0T=Ku=_P2SQEjTx=uVbvr_QxJQR7kYg@mail.gmail.com>
 <CAJKOXPc7M3jeV_hNBBRJKGs3vtNzdrGbW_YETw2n0fXxhqjZ_g@mail.gmail.com>
 <CAJKOXPfCDT+7wPkz3g6AiKgLvFp4rnicYQgYn8A_yaPe4YhD5A@mail.gmail.com>
 <CAOMZO5BGX1U90bGrff42rZKKOSQK3NB=-k_4BX04Tsi=yX0Odg@mail.gmail.com>
 <CAJKOXPea5nx+i+vWJcMGqct1=gP5OHbDSAzqTCBYr1RvFW-1gw@mail.gmail.com>
 <CAOMZO5CKPhQwdkYBeu74k=RYBxGhVf13nnrzHXUhq8LWk8yBSg@mail.gmail.com>
 <CAJKOXPeqm-KRnuc7uUena=iH+rYLzSVSCb-uSbLB4SdRGqLRtw@mail.gmail.com>
 <20171215072921.GJ2559@piout.net>
 <CAJKOXPcf_zf3X8i9xVpK_BSvnR-78otwmaiOERDYTT2tC3VC2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAJKOXPcf_zf3X8i9xVpK_BSvnR-78otwmaiOERDYTT2tC3VC2A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 15/12/2017 at 08:34:55 +0100, Krzysztof Kozlowski wrote:
> On Fri, Dec 15, 2017 at 8:29 AM, Alexandre Belloni
> <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> > On 15/12/2017 at 08:23:39 +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Dec 15, 2017 at 12:02 AM, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> > On Thu, Dec 14, 2017 at 7:19 PM, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >> >
> >> >> Thanks for reply!
> >> >>
> >> >> Isn't this property of a SoC? The registers used by
> >> >> syscon-poweroff/reboot are part of SoC power management unit. It does
> >> >> not refer to any externals. Why then it should be put outside of soc?
> >> >
> >> > If these nodes have registers, then they should have a unit address
> >> > and reg property.
> >>
> >> That's the point - they do not have unit address.
> >>
> >
> > Should they be put under the syscon they are using?
> 
> They are not using syscon but regmap provided by such external IP
> block (for example this:
> http://elixir.free-electrons.com/linux/v4.15-rc3/source/arch/arm/boot/dts/exynos3250.dtsi#L153).
> I guess you are proposing something like on imx7s:
> http://elixir.free-electrons.com/linux/v4.15-rc3/source/arch/arm/boot/dts/imx7s.dtsi#L539
> 

Yeah, exactly.

Another example here:
http://elixir.free-electrons.com/linux/v4.15-rc3/source/arch/arm/boot/dts/gemini.dtsi#L32

It seems your poweroff and reboot bits are in registers that are in the
pmu_system_controller so it makes sense to put them under it. I would
even remove the regmap property and get the regmap from the parent
first. This can easily be done while keeping the ABI backward
compatibility.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
