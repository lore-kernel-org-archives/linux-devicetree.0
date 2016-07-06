From: "'Arend Van Spriel' via linux-sunxi" <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: Re: [PATCH 1/4] brcmfmac: Add brcm,nvram_file_name
 dt property
Date: Wed, 6 Jul 2016 10:08:55 +0200
Message-ID: <CAF7Mx6qcwtwYQhrkNk8o+D6UQBLEQkL-ti7aMQyLVuRo+JMUfw@mail.gmail.com>
References: <1467209074-15634-1-git-send-email-hdegoede@redhat.com>
 <8717879.O1RMZcQt4V@wuerfel> <577AAC95.7040800@broadcom.com> <26659199.PqqRaoPEho@wuerfel>
Reply-To: arend.vanspriel-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRYNGWEWYDBBGPZ6K5QKGQELCWVFEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <26659199.PqqRaoPEho@wuerfel>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>, "John W . Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Arend van Spriel <arend-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 5, 2016 at 3:43 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Monday, July 4, 2016 8:36:05 PM CEST Arend van Spriel wrote:
>> On 04-07-16 16:54, Arnd Bergmann wrote:
>> > On Monday, July 4, 2016 11:08:38 AM CEST Arend Van Spriel wrote:
>> >
>> > In drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c I already see
>> > over a dozen different chips being supported, bcm4329 is only one of
>> > them. In particular, there seem to be some that have various modules:
>> >
>> >         BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0x0000001F, 43241B0),
>> >         BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0x00000020, 43241B4),
>> >         BRCMF_FW_NVRAM_ENTRY(BRCM_CC_43241_CHIP_ID, 0xFFFFFFC0, 43241B5),
>> >
>> > So if you have a bcm43241, that compatible string probably should
>> > include both brcm,bcm43241-b4-fmac and brcm,bcm43241-fmac, possibly also
>> > brcm,bcm4329-fmac, to show that it is a superset of the programming
>> > interface of that one.
>>
>> Hi Arnd,
>>
>> I have to disagree here. The compatible string "brcm,bcm4329-fmac" is
>> chosen as the bcm4329 chip was the first supported and we never added
>> others as there is no other programming required. For all supported
>> devices the same device tree properties apply and are handled the same.
>> As such there is no need to come up with a new compatible string.
>
> Generally speaking, the way that the compatible strings work is that you
> add a new one whenever you get a new piece of hardware, and you can leave
> the first one as a fallback so you don't have to change the driver.
>
> Adding the new string for the actual device is important though,
> since you might only discover later that they are not 100% compatible
> and that you in fact need to know the difference.
>
> For discoverable buses like sdio or usb, it may actually be better
> to not identify the device through the compatible property at all,
> and instead use a string that is generated from the actual identifier
> as the primary key, as e.g. documented in
> Documentation/devicetree/bindings/usb/usb-device.txt

Well, that is my point. We do not need to identify the device here. We
can obtain that info, ie. chip id and revision, from the device itself
as our wifi chips have a discoverable AXI backplane. What is missing
is that we have no way to tell what board/module this device is
integrated on, which makes it impossible to select the correct nvram
file. The model property can fill that gap just nicely.

Regards,
Arend

> The mmc binding is less clear about that, and we may want to correct
> that. In fact, the example in
> Documentation/devicetree/bindings/mmc/mmc.txt even lists an invalid
> compatible string, so that is even worse.
>
>         Arnd
