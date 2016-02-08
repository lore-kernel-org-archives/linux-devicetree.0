From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 05/11] drivers: pinctrl: add driver for Allwinner A64 SoC
Date: Mon, 8 Feb 2016 15:58:18 +0000
Message-ID: <56B8BB1A.8010705@arm.com>
References: <1454348370-3816-1-git-send-email-andre.przywara@arm.com>
 <1454348370-3816-6-git-send-email-andre.przywara@arm.com>
 <20160201182754.GA14737@excalibur.cnev.de> <56AFE0EC.8080207@arm.com>
 <20160202100046.GM4652@lukather> <56B0DF26.10203@arm.com>
 <20160204165151.GK4270@lukather> <20160208155405.GA4677@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160208155405.GA4677@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 08/02/16 15:54, Rob Herring wrote:
> On Thu, Feb 04, 2016 at 05:51:51PM +0100, Maxime Ripard wrote:
>> Hi Andre,
>>
>> On Tue, Feb 02, 2016 at 04:53:58PM +0000, Andre Przywara wrote:
>>>> So, droping it in the filenames, why not. But I'd really like to keep
>>>> the same compatible scheme.
>>>
>>> And I still don't get this: in the DT compatible scheme we always have a
>>> vendor prefix, so allwinner,a64 is surely not a mysterious ARM Ltd. core
>>> or a new Apple SoC. Instead it is the A64 from Allwinner, full stop. So
>>> why should we add an arbitrary and confusing sun50i naming to it (when
>>> it actually should be more like "sun8i-a64").
>>
>> I don't decide on their marketing names. And I know you want to start
>> anew with the arm64 SoCs, but the truth is, you don't. Most of the
>> compatibles in the DTSI are from earlier SoCs, and we have to keep
>> that legacy and remain consistent with it. With all the good and bad
>> things a legacy imply.
> 
> I have to agree. Unless there is some agreement to move to another 
> naming scheme, then just follow the same pattern. If sunXi is just a 
> made up name outside of Allwinner to provide some logical grouping of 
> SoCs, then yes, that probably should not have been done.

So I still don't like it, but will not waste my time or energy on that
front.

Maxime, do you want "allwinner,sun50i-a64" or would
"allwinner,sunxi-a64" be OK as well?

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
