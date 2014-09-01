From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/6 v4] ARM: realview: basic device tree implementation
Date: Mon, 1 Sep 2014 13:52:49 +0200
Message-ID: <CACRpkdaugAmVt5CF194xd+eVyz=Yfir6Jz0k9h4VSvSWLkKPRQ@mail.gmail.com>
References: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
	<1406294628-16079-7-git-send-email-linus.walleij@linaro.org>
	<20140725152401.GA21830@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140725152401.GA21830@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some ARM1176JZF confusion in as separate thread...

On Fri, Jul 25, 2014 at 5:24 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Fri, Jul 25, 2014 at 02:23:48PM +0100, Linus Walleij wrote:

>> +               /* Primary DevChip GIC synthesized with the CPU */
>> +               intc_dc1176: interrupt-controller@10120000 {
>> +                       compatible = "arm,arm1176jzf-gic";
>
> As far as I am aware, the JZF flags haven nothing to do with the GIC
> implementation. I think they can be dropped from this string (following
> the example of "arm,arm1176-pmu").

FWIW I changed the string to "arm,arm1176-gic"

But this isn't about the CPU actually. It is the ARM1176JZF development
chip. See:
http://infocenter.arm.com/help/topic/com.arm.doc.ddi0375a/DDI0375A_arm1176jzf_dev_chip_r0p0_trm.pdf

I know it is confusingly named as a name of a SoC that has this
CPU inside it but what can I do ... some guys named ARM came
up with this.

Should use the string "arm,arm1176jzf-devchip-gic"?

>> +               /* This GIC on the board is cascaded off the DevChip GIC */
>> +               intc_pb1176: interrupt-controller@10040000 {
>> +                       compatible = "arm,arm1176jzf-gic";
>
> And this isn't part of the CPU, so that string doesn't look right. I'd
> at least like to see an additional string earlier in the list

This seems to be a follow-on to the above confusion.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
