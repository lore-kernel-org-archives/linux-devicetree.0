From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: [linux-sunxi] [PATCH v2 6/8] ARM: dts: sun8i: a83t: Move mmc1
 pinctrl setting to dtsi file
Date: Fri, 20 Oct 2017 00:34:30 +0800
Message-ID: <CAGb2v64T=z8RefyEcDHJyrJE9ZCRN=c6zVf25JEqSKvDGUE_Rg@mail.gmail.com>
References: <20171018083138.14517-1-wens@csie.org> <20171018083138.14517-7-wens@csie.org>
 <f85a30e2-5a9d-a7ba-0010-6602cabaf83e@riseup.net> <CAGb2v64O+eyriHG-FirtPKo6hACfbV9JcJRUUZ+rY1QM2w_r1g@mail.gmail.com>
 <4a2734fb-71ab-7cd9-2b17-669f2fdf9a2c@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4a2734fb-71ab-7cd9-2b17-669f2fdf9a2c-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?Sm9vbmFzIEt5bG3DpGzDpA==?= <joonas.kylmala-X3B1VOXEql0@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 20, 2017 at 12:02 AM, Joonas Kylmälä <joonas.kylmala-X3B1VOXEql0@public.gmane.org> wrote:
> Chen-Yu Tsai:
>>> Chen-Yu Tsai:
>>>> mmc1 only has 1 possible pinmux setting.
>>>
>>> What if someone is using the MMC with bus width 1 and then using the
>>> remaining 3 pins for something else?
>>
>> I would very much like to see such a design. Currently the devices
>> we see all follow Allwinner's reference design, with only minor
>> modifications. As such, mmc1 is used exclusively for connecting
>> SDIO-based WiFi modules.
>>
>> If such a radical(?) design is done, the vendor can always add
>> a "mmc1-1bit-pins" setting and override the default.
>
> Alright. So could we then make similar patches for other SoCs that have
> the same situation with the MMC pinmuxing? I.e. let's move the pinctrl
> to the dtsi file from the dts files. With H3 SDC0 and SDC1 nodes could
> be moved then to the dtsi. Can't we also move the SDC0 pinctrl in A83T
> to the dtsi file? Though, in order to do that mmc0_cd_pin node needs to
> be added to the A38T dtsi.

Yes. We are slowly doing this and other cleanups. This is somewhat
boring and tedious, and it's not exactly a high priority item. You
might have noticed Maxime recently sent patches to clean up sun4i
and sun9i.

ChenYu
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
