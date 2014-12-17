From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/3] gpio: Cygnus: define Broadcom Cygnus GPIO binding
Date: Wed, 17 Dec 2014 11:26:40 +0100
Message-ID: <4583974.6IftQ5bv2t@wuerfel>
References: <1418342706-14755-2-git-send-email-rjui@broadcom.com> <1628217.66frkAqHMc@wuerfel> <CAAVeFuJhiten-eVLCa2sMG-nsRwjPMiZap8UJM1kNCuRyK-b1w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuJhiten-eVLCa2sMG-nsRwjPMiZap8UJM1kNCuRyK-b1w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Joe Perches <joe@perches.com>, Scott Branden <sbranden@broadcom.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday 17 December 2014 11:45:01 Alexandre Courbot wrote:
> 
> Actually we are not that far from being able to do completely without
> any GPIO number, and maybe that's what we should aim for. I think the
> only remaining offender is the sysfs interface. If we could reach GPIO
> controllers through a fixed path and just export their GPIOs there, I
> believe we would have fixed the whole issue.

What about the hundreds of board files and device drivers that still
reference hardcoded gpio numbers? The problem seems mostly solved for
anything that uses DT, but there are some architectures and a number
of ARM platforms that don't use DT and probably never will.

I would assume they could all be changed to use gpiod_lookup tables,
but that's a lot of work.

	Arnd
