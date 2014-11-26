From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCHv1 0/6] rtc: rtc-isl12057: fixes and alarm support
Date: Wed, 26 Nov 2014 11:46:27 -0800
Message-ID: <20141126114627.9c29947c6f524b0dd9883c15@linux-foundation.org>
References: <cover.1416006090.git.arno@natisbad.org>
	<874mtlyflf.fsf@natisbad.org>
	<54762096.7040200@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <54762096.7040200@kleine-koenig.org>
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, 26 Nov 2014 19:48:54 +0100 Uwe Kleine-K__nig <uwe@kleine-koenig.org> wrote:

> Hello Arnaud,
> 
> On 11/26/2014 07:35 PM, Arnaud Ebalard wrote:
> > I wonder if you could take a look at this series I sent providing fixes
> > (patches #1-5) and alarm support (patch #6) for ISL12057 RTC Chip. As
> > all people do for RTC patches - due to lack of feedback from maintainer
> > - I am looking for someone to review the patches (Mark, patch 6 has a
> > sticker w/ regmap-inside ;-)) and then push those upstream if they are
> > ok (Jason, you handled that part for 70e123373c05: "rtc: Add support for
> > Intersil ISL12057 I2C RTC chip" in 2013 for the same reason).
> > 
> > Note that I addressed previous comments and feedback received from Uwe
> > and also spent time to do some soldering in order to support and test
> > the last patch for both my use case (Alarm IRQ signal not routed to the
> > SoC on ReadyNAS RN102, RN104 and RN2120) and the common case.
> > 
> > Do not hesitate to ask if you want me to resend!
> akpm already applied the series, doesn't he?
> 
> I'm about to test the patches, just fighting with my NAS to boot my
> custom kernel.
> 
> Apart from that patches 1 - 5 can have my Ack. Didn't look deep enough
> into patch 6 yet. @akpm: No need to hurry adding them, I hope to be
> able to also provide Tested-by:-tags later today.

Thanks, it really helps.
