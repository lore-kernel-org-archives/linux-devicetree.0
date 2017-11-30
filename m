From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: Disable strict mode for H5 driver
Date: Thu, 30 Nov 2017 16:07:17 +0000
Message-ID: <3ef7cfa4-cc1a-f24b-0013-f36db82781e5@arm.com>
References: <20171125120200.23294-1-andre.przywara@arm.com>
 <20171125120200.23294-3-andre.przywara@arm.com>
 <CACRpkdZX5U=JoQFS+X96+F68yVSZbnCZpgNfAnvfJGxZ9moi8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZX5U=JoQFS+X96+F68yVSZbnCZpgNfAnvfJGxZ9moi8A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-GB
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 30/11/17 15:51, Linus Walleij wrote:
> On Sat, Nov 25, 2017 at 1:02 PM, Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>> All of the H5 boards in the kernel reference the MMC0 CD pin twice in
>> their DT, so strict mode will make the MMC driver fail to load.
>> To keep existing DTs working, disable strict mode in the H5 driver.
>>
>> Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
>> Reported-by: Chris Obbard <obbardc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
> Patch applied with Maxime's ACK.

Thanks for that (also to Maxime and Chen-Yu) and the smooth handling!

Sorry, I just see that I didn't point this out explicitly, but this is
to fix a regression introduced in 4.15-rc1, so is this on a branch that
will be pushed for 4.15-rc, still? (Couldn't find anything quickly on
kernel.org)

Cheers,
Andre.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
