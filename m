From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] pinctrl: Rename Broadcom Capri pinctrl driver
Date: Thu, 23 Jan 2014 09:36:54 +0100
Message-ID: <CACRpkdbEtQCBeMr-vM1prD8hOcPOdMfH_-pGt5aesPYKZ2n4Zg@mail.gmail.com>
References: <1390343886-25852-1-git-send-email-syin@broadcom.com>
	<CACRpkdZ+3MC8XpfD-vumvq3yQACzFn89DQjWQeXbdBK+9JmfLQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ+3MC8XpfD-vumvq3yQACzFn89DQjWQeXbdBK+9JmfLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jan 23, 2014 at 9:17 AM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Jan 21, 2014 at 11:38 PM, Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org> wrote:
>
>> To be consistent with other Broadcom drivers, the Broadcom Capri pinctrl
>> driver and its related CONFIG option are renamed to bcm281xx.
>>
>> Devicetree compatible string and binding documentation use
>> "brcm,bcm11351-pinctrl" to match the machine binding here:
>> Documentation/devicetree/bindings/arm/bcm/bcm11351.txt
>>
>> This driver supports pinctrl on BCM11130, BCM11140, BCM11351, BCM28145
>> and BCM28155 SoCs.
>>
>> Signed-off-by: Sherman Yin <syin-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
>> Reviewed-by: Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>
> Patch applied for fixes.

No wait. I took the patch out.
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This driver is already causing a messy conflict situation in ARM SoC.
I don't want to escalate their problem.

Either you merge this through ARM SoC or split off the arch/arm/*
changes into a separate patch for ARM SoC.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
