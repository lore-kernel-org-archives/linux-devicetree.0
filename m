From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v5 6/8] pinctrl: cygnus: add gpio/pinconf driver
Date: Mon, 09 Mar 2015 19:47:12 +0100
Message-ID: <1425926832.2317.16.camel@tiscali.nl>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
	 <1425515756-321-7-git-send-email-rjui@broadcom.com>
	 <1425543104.24292.185.camel@x220> <1425544581.24292.194.camel@x220>
	 <54F88EB8.3020208@broadcom.com>
	 <CACRpkdbG3t3QEobibbf7wquTtCRm=B0qwivoAp9FTkYpYNL9JA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbG3t3QEobibbf7wquTtCRm=B0qwivoAp9FTkYpYNL9JA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list>
List-Id: devicetree@vger.kernel.org

Linus Walleij schreef op ma 09-03-2015 om 17:41 [+0100]:
> As pointed out in another mail on similar subject, I think these macros
> are a kind of obsolete documentation and if they should be dropped we
> need to go over an entire subsystem at a time and remove all boolean users
> in a big patch.

And, as I stated in that other thread, we could start by first checking
for things like this during review. (And if people were to do clean up
patches I'd suggest to do them one driver at a time. Just to keep things
manageable.)


Paul Bolle

