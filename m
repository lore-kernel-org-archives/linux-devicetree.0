From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 6/8] pinctrl: cygnus: add gpio/pinconf driver
Date: Mon, 9 Mar 2015 17:41:21 +0100
Message-ID: <CACRpkdbG3t3QEobibbf7wquTtCRm=B0qwivoAp9FTkYpYNL9JA@mail.gmail.com>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	<1425515756-321-7-git-send-email-rjui@broadcom.com>
	<1425543104.24292.185.camel@x220>
	<1425544581.24292.194.camel@x220>
	<54F88EB8.3020208@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54F88EB8.3020208@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Paul Bolle <pebolle@tiscali.nl>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 5, 2015 at 6:13 PM, Ray Jui <rjui@broadcom.com> wrote:

>> (I knew the other three MODULE_* macros are handled in slightly more
>> complicated way, but the effect is basically that they are preprocessed
>> away.)
>>
>> Paul Bolle
>
> Even these module macros will be pre-processed away when the driver is
> statically linked (and yes, I'm not planning to ever make these driver
> built as module), I'm not too sure about the convention here. I thought
> that they are still good to be in the driver for information purpose.
> I'm seeing other pinctrl drivers doing this as well.
>
> Maybe Linus can help to clarify this?

As pointed out in another mail on similar subject, I think these macros
are a kind of obsolete documentation and if they should be dropped we
need to go over an entire subsystem at a time and remove all boolean users
in a big patch.

Yours,
Linus Walleij
