From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [linux-sunxi] [PATCH v6 9/9] arm64: allwinner: a64: enable Wi-Fi
 for Pine64
Date: Fri, 19 May 2017 15:22:28 +0800
Message-ID: <16dee602b96510170ee1117cfaae0025@aosc.io>
References: <20170518071653.36561-1-icenowy@aosc.io>
 <20170518071653.36561-10-icenowy@aosc.io>
 <CAGb2v66mqMveibKKU9LiBm8jzAOj46hFCK6HvJx0k6077fqLZw@mail.gmail.com>
 <79B00D42-3F95-4D5E-9A23-8E893CCF2462@aosc.io>
 <20170519071922.awmib4qphl6ac6mj@flea.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170519071922.awmib4qphl6ac6mj-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

在 2017-05-19 15:19，Maxime Ripard 写道：
> On Fri, May 19, 2017 at 11:03:33AM +0800, Icenowy Zheng wrote:
>> >The patch looks OK, but given the module is removable, I think it
>> >should be
>> >an overlay. The overlay would enable WiFi + Bluetooth, and all the
>> >peripherals needed to connect them.
>> >
>> >That way, if the module is not installed, we avoid confusing the user
>> >with
>> >unused peripherals, and avoid having live voltage on an unoccupied
>> >header.
>> 
>> But as this header have specific usage, we will also confuse user
>> if it's not enabled as its target usage.
> 
> Yet you would enable unused resources.
> 
> This was already pointed out here:
> https://patchwork.kernel.org/patch/9670235/

I think, before we have an official repository of device tree
overlays (either directly in torvalds/linux or maintained by
linux-sunxi), we shouldn't rely on device tree overlay
functionality.

> 
> Maxime
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
