From: Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
Subject: Re: [PATCH v7] pinctrl: imx27: imx27 pincontrol driver
Date: Wed, 6 Nov 2013 10:54:02 -0600
Message-ID: <CAHCPf3v3dsTyk9Cd93GBLBKQLSQ+Mb0mpq134X7Ko4U8m-b-qg@mail.gmail.com>
References: <1382950843-26066-3-git-send-email-mpa@pengutronix.de>
	<1383057139-25304-1-git-send-email-mpa@pengutronix.de>
	<CACRpkdYKgA5E4-APSTHsM=zVbb3X2R4v+V4EeK3+W1tKPR1FeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdYKgA5E4-APSTHsM=zVbb3X2R4v+V4EeK3+W1tKPR1FeA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 29, 2013 at 11:00 AM, Linus Walleij
<linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 29, 2013 at 7:32 AM, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>
>> imx27 pincontrol driver using the imx1 core driver. The DT bindings are
>> similar to other imx pincontrol drivers.
>>
>> Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Acked-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> Acked-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> Hi,
>>
>> another binding documentation update. The MUX_ID components are described more
>> detailed now.
>
> Patch tentatively applied unless someone has very fundamental
> issues with it, it stays in. I really want a full transfer of i.MX
> pin controllers to the subsystem, using device tree so we can
> get rid of the old i.MX cruft in arch/arm.

I think this is a rush-in patch. I actually read the manual last night
and found some serious weirdness.

The i.MX27 doesn't have a dedicated IOMUX controller so actually
having a whole separate node for it in the device tree - or even a
separate driver - makes very little sense. I understand pinctrl and
gpiolib are somewhat separated as software, but this is encoding a
Linuxism into the tree.

In fact, the binding will conflict with actual binding of the GPIO
(i.e. setting data, receiving interrupts) module since it's all one
register set, and the "fsl,imx27-iomuxc" compatible property does not
represent reality except to collect data in a different spot. There's
no reason for it except to cut the documentation and tree definition
in half, and have two nodes for Linux.

Would it be so bad to implement this as a regmap and have two drivers
access the same regmap on the Linux side? You don't need two nodes for
that, and the IOMUX definitions can live under the GPIO node. There is
NOTHING stopping two drivers on Linux matching the same compatible
property. Locking and coordination in software of a single IP block
used by two drivers shouldn't be arbitrated by the device tree.

Thanks,
Matt Sealey <neko-HhXTZounMxbZATc7fWT8Dg@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
