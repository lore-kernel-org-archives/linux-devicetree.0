From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v5 3/8] pinctrl: cygnus: add initial IOMUX driver support
Date: Mon, 09 Mar 2015 20:53:58 +0100
Message-ID: <1425930838.2317.46.camel@tiscali.nl>
References: <1425515756-321-1-git-send-email-rjui@broadcom.com>
			 <1425515756-321-4-git-send-email-rjui@broadcom.com>
			 <1425542612.24292.180.camel@x220>
			 <CACRpkdYTDSSSd5oDNXmcav-2ycbki0=K+0Cm6dLSBHUv6UXF9g@mail.gmail.com>
		 <1425926456.2317.13.camel@tiscali.nl> <54FDEDBA.1070404@broadcom.com>
	 <1425929442.2317.39.camel@tiscali.nl> <54FDF72E.2010806@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <54FDF72E.2010806@broadcom.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Christian Daudt <bcm@fixthebug.org>, Matt Porter <mporter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Scott Branden <sbranden@broadcom.com>, Dmitry Torokhov <dtor@google.com>, Anatol Pomazau <anatol@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel>
List-Id: devicetree@vger.kernel.org

Ray Jui schreef op ma 09-03-2015 om 12:40 [-0700]:
> I don't see this as an "issue" to be quite honest.

(Off topic: is issue a, well, strong word? To my (non-English) mind it's
rather neutral, carrying by itself less urgency than, say, problem. If
I'm wrong I might have confused quite a few people by using it quite
often. And that would be a real issue!)

> By saying that, I at
> least agree with you that these are not information that's mandatory to
> be in the driver given what we already have. MODULE_LICENSE is covered
> by license header. MODULE_DESCRIPTION is covered by descriptions in
> Kconfig. MODULE_AUTHOR is much less important than what's in the
> MAINTAINERS list.
> 
> Since I have to submit a new patch series to address the "ngpios" issue
> that Linus mentioned in the other email, I don't mind removing all these
> MODULE_* macros in the driver all together.

I see.

Thanks,


Paul Bolle

