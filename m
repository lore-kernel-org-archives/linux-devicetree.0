From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 0/6] rtc: rtc-isl12057: fixes and alarm support
Date: Wed, 26 Nov 2014 21:10:29 +0100
Message-ID: <87egsp205m.fsf@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
	<874mtlyflf.fsf@natisbad.org> <54762096.7040200@kleine-koenig.org>
	<87y4qxwykq.fsf@natisbad.org>
	<20141126115345.a3ef26c9fef0c388cbb6e6ee@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20141126115345.a3ef26c9fef0c388cbb6e6ee@linux-foundation.org>
	(Andrew Morton's message of "Wed, 26 Nov 2014 11:53:45 -0800")
Sender: linux-doc-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi Andrew,

Andrew Morton <akpm@linux-foundation.org> writes:

>> > akpm already applied the series, doesn't he?
>> 
>> I am not really familiar w/ -mm tree workflow. It was not clear to me
>> whether it was sitting in -mm tree waiting for reviewed-by and
>> acked-by.
>
> -mm is a collection of several hundred trees (most of which are empty
> at a particular time).  The workflow depends on which tree we're
> talking about!
>
> For RTC patches I attempt to review them myself but I'm by no means an
> expert on RTC, so I'm careful to cc various people who I think might
> help with review and test.  Often people do this.  Generally when they
> don't, the patches are sufficiently obvious for me to proceed under my
> own steam.  If something breaks (this is rare), the number of people
> who are affected is usually quite small and they tend to be system
> developers who can fix it up for us anyway.

Thanks for the explanation.

Cheers,

a+
