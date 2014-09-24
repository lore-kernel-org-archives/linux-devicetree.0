From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH 3/6] ARM: dts: sunxi: Add Allwinner A80 dtsi
Date: Wed, 24 Sep 2014 19:53:33 +0800
Message-ID: <CAGb2v64yGmdLeWmA=+nxD85DbQf_xxUNx3n3oedFZi51uc50+w@mail.gmail.com>
References: <1411311493-24344-1-git-send-email-wens@csie.org>
 <1411311493-24344-4-git-send-email-wens@csie.org> <20140924063738.GQ15315@lukather>
 <CAGb2v64voZpK_82wtkErRowR0vjEUALNUwvCx_sd8Q5wb4Hq-g@mail.gmail.com> <54227038.2020805@free-electrons.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCMILY6JWQBBBUXBRKQQKGQE3ACDS4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <54227038.2020805-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shuge <shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, Meng Zhang <kevin-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org>, yhf <yhf-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>, ctl <ctl-HcjymKqD97rQT0dZR+AlfA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 24, 2014 at 3:18 PM, Gregory CLEMENT
<gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> Hi Chen-Yu,
>
>
>>>> +
>>>> +     memory {
>>>> +             reg = <0x20000000 0x40000000>;
>>>
>>> Usually, what we put there was the maximum amount of RAM that can be
>>> handled by the SoC. I think that it can go above 1GB
>>
>> With LPAE, it can handle 8GB. But the DT won't take 64bit values.
>> I'm not sure how to get it in. I'll look around for examples.
>
> You can have a look on what we did for Armada XP:
>
> arch/arm/boot/dts/armada-370-xp.dtsi
> arch/arm/boot/dts/armada-xp.dtsi
> arch/arm/boot/dts/armada-xp-gp.dts
>
> I created a skeleton64.dtsi for this case

Thanks for the tip. Before I send v2, I do have a question. I'm using

    ranges = <0 0 0 0x20000000>;

in the clocks and soc node to avoid having to use 64bit values for all
addresses and sizes. Would this be undesirable, even bad practice maybe?

http://linux-sunxi.org/A80/Memory_map is a document I pieced together
from Allwinner's SDK header files. AFAIK only the memory goes above
the 4GB limit. All peripherals are under 512 MB, 256MB even.


Thanks
ChenYu
