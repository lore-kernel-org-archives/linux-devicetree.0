From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: mediatek: Modify pinctrl bindings for mt7623
Date: Fri, 19 Feb 2016 13:12:29 +0100
Message-ID: <CACRpkdbWad9iZV9LYkvEFRZn_BQDtPEAy3JE0uuR569UwMJkHQ@mail.gmail.com>
References: <1455866238-6102-1-git-send-email-blogic@openwrt.org>
	<CACRpkdYiQop2qDNuh4N2YZy2DTy9mOEyERro8hT4YogCPc2LGw@mail.gmail.com>
	<56C6DF23.3060202@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C6DF23.3060202-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Biao Huang <biao.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Feb 19, 2016 at 10:23 AM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
> On 19/02/2016 10:03, Linus Walleij wrote:
>> On Fri, Feb 19, 2016 at 8:17 AM, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> wrote:
>>
>>> Signed-off-by: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>> ---
>>> please apply to the devel-mt2701 branch
>>>
>>> Changes in V2
>>> * make mt7623-pinfunc.h part of patch 1/2
>>> * make sure the list stays sorted
>>
>> Patch applied unless the Mediatek maintainers come with serious
>> remarks (I can always revert).
>>
>> Only minor comments from Yingjoe on the previous version so I guess
>> it is finished.
>>
>> MTK guys: do you even have this SoC? It appears MTK is churning out
>> a plethora of SoCs and then they land in the lap of the OpenWRT
>> developers before the MTK maintainers even start to look at it...
>>
>> Yours,
>> Linus Walleij
>>
>
> I am doing this work in close collaboration with MTK. It is contractual
> work. MTK is huge and has many BUs, one of them is WCN, formerly known
> as Ralink. I have supported their MIPS silicon for many years now so
> asking me to also take care of the Wireless SoCs based on ARM was the
> natural next step.

Awesome!

Keep doing what you're doing :)

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
