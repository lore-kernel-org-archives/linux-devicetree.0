From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/11] pinctrl: use ngpios propety from DT
Date: Fri, 30 Oct 2015 12:06:04 +0100
Message-ID: <CACRpkdZa6jX9k9XnSuZErGqf8R+Uznhj=i9OGDCZXXy0TZk5OA@mail.gmail.com>
References: <1445233398-27129-1-git-send-email-pramodku@broadcom.com>
	<1445233398-27129-8-git-send-email-pramodku@broadcom.com>
	<CACRpkdY1GDs6ypqCiY3iiv3DkfnHchnY+bWPoCqU=_sgn9f5vQ@mail.gmail.com>
	<0C803592FC378B4E83922050AB46442A2AD742F0@SJEXCHMB10.corp.ad.broadcom.com>
	<CACRpkdb3FT0K+atNOTXL_e8Fs7Nm0VDLe0RPiiBKK=8o=MHqKQ@mail.gmail.com>
	<56323177.6010605@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <56323177.6010605@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: Pramod Kumar <pramodku@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Russell King <linux@arm.linux.org.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Jason Uy <jasonuy@broadcom.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Thomas Gleixner <tglx@linutronix.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 29, 2015 at 3:47 PM, Jonas Gorski <jogo@openwrt.org> wrote:

> Using ngpios to restrict the amount of actually available GPIOs from
> the possible amount of GPIOs seems a rather limited use, as rerouted
> gpios are seldom at the end of the GPIO space.

I need an example.

> So maybe it makes more sense to use ngpio as the number of
> possible gpios and then have an additional "reserved-gpios"
> bitmask / list of unavailable gpios?

This idea is good, but let's not make upfront design until we have a
piece of hardware that requires exactly this.

I sent a patch to the gpio.txt binding including a diplomatic statement
on this...

> Ideally those would be just consumed by a pinctrl instance, but I
> guess that these are sometimes controlled through pinstrapping,
> so there might be no driver to attach to them.

Uhmm.... Not quite following but all right... With gpio ranges the
GPIO to pins are mapped, and they can switch functions at runtime.

Yours,
Linus Walleij
