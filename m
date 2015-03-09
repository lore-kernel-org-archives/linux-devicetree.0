From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v5 3/8] pinctrl: cygnus: add initial IOMUX driver support
Date: Mon, 09 Mar 2015 19:40:56 +0100
Message-ID: <1425926456.2317.13.camel@tiscali.nl>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	 <1425515756-321-4-git-send-email-rjui@broadcom.com>
	 <1425542612.24292.180.camel@x220>
	 <CACRpkdYTDSSSd5oDNXmcav-2ycbki0=K+0Cm6dLSBHUv6UXF9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYTDSSSd5oDNXmcav-2ycbki0=K+0Cm6dLSBHUv6UXF9g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list>
List-Id: devicetree@vger.kernel.org

Linus Walleij schreef op ma 09-03-2015 om 17:28 [+0100]:
> I think you're right. Or I fear you're right.
> 
> But this problem is present in so many drivers that a generic
> fixup needs to be done with a script and across an entire subsystem
> at once,

Why don't we start with checking for similar cases during review, like
I'm now doing for only a week or two?

>  and besides I'm not sure of these macros disturb so much.

I think they're confusing at best. Ie, when reading the code and the
corresponding Kconfig file one has to wonder: should the Kconfig symbol
actually be tristate or should it stay bool but did someone forget to
delete the module-specific code?

> They are documentation in a sense, albeit a kind of documentation
> we used before we had git to record the actual authors of the
> code.

They're useful, mostly, for module utilities. Outside that scope they
add information that thousands of files (that can also only be built-in
but do not have these macros) do not have and, apparently, do not need.

Thanks,


Paul Bolle
