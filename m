From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 0/6] rtc: rtc-isl12057: fixes and alarm support
Date: Wed, 26 Nov 2014 20:28:53 +0100
Message-ID: <87y4qxwykq.fsf@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
	<874mtlyflf.fsf@natisbad.org> <54762096.7040200@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <54762096.7040200@kleine-koenig.org> ("Uwe \=\?utf-8\?Q\?Kleine-K\?\=
 \=\?utf-8\?Q\?\=C3\=B6nig\=22's\?\=
	message of "Wed, 26 Nov 2014 19:48:54 +0100")
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Morton <akpm@linux-foundation.org>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Hi,

Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:

> On 11/26/2014 07:35 PM, Arnaud Ebalard wrote:
>> I wonder if you could take a look at this series I sent providing fi=
xes
>> (patches #1-5) and alarm support (patch #6) for ISL12057 RTC Chip. A=
s
>> all people do for RTC patches - due to lack of feedback from maintai=
ner
>> - I am looking for someone to review the patches (Mark, patch 6 has =
a
>> sticker w/ regmap-inside ;-)) and then push those upstream if they a=
re
>> ok (Jason, you handled that part for 70e123373c05: "rtc: Add support=
 for
>> Intersil ISL12057 I2C RTC chip" in 2013 for the same reason).
>>=20
>> Note that I addressed previous comments and feedback received from U=
we
>> and also spent time to do some soldering in order to support and tes=
t
>> the last patch for both my use case (Alarm IRQ signal not routed to =
the
>> SoC on ReadyNAS RN102, RN104 and RN2120) and the common case.
>>=20
>> Do not hesitate to ask if you want me to resend!
> akpm already applied the series, doesn't he?

I am not really familiar w/ -mm tree workflow. It was not clear to me
whether it was sitting in -mm tree waiting for reviewed-by and
acked-by.

> I'm about to test the patches, just fighting with my NAS to boot my
> custom kernel.
>
> Apart from that patches 1 - 5 can have my Ack. Didn't look deep enoug=
h
> into patch 6 yet. @akpm: No need to hurry adding them, I hope to be
> able to also provide Tested-by:-tags later today.

I'll be happy to handle comments and possible requests for additional
changes if needed.

Cheers,

a+

ps: anyway, thanks Andrew!
