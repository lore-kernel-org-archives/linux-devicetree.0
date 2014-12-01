From: arno@natisbad.org (Arnaud Ebalard)
Subject: Re: [PATCHv1 6/6] rtc: rtc-isl12057: add alarm support to Intersil ISL12057 RTC driver
Date: Mon, 01 Dec 2014 09:07:41 +0100
Message-ID: <87r3wjkd2q.fsf@natisbad.org>
References: <cover.1416006090.git.arno@natisbad.org>
	<986ee8d9d3e6862007f398ffddc2a4bb2368933e.1416006090.git.arno@natisbad.org>
	<5476ED9F.2070600@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <5476ED9F.2070600@kleine-koenig.org> ("Uwe \=\?utf-8\?Q\?Kleine-K\?\=
 \=\?utf-8\?Q\?\=C3\=B6nig\=22's\?\=
	message of "Thu, 27 Nov 2014 10:23:43 +0100")
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org

Hi Uwe,

Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:

> Hello,
>
> finally I managed to test this series on my (unmodified) rn104.
>
> For patch 1: Maybe point out that the issue with the century bit isn'=
t
> that critical, because this bit is not expected to be set before year=
 2100.
>
> For patch 3: This patch adds a few dev_err calls that get later amend=
ed
> in patch 5 to also include an error code. IMHO these should already b=
e
> added in patch 3. Patch 5 should only add it to the already existing
> strings (if applicable).
>
> For patch 4: Maybe
> s/obsolete/for backwards compatibility, don't use in new code/.
>
> Some further comments inline ...

Thanks for the tests. I'll take a look at your comments this evening.

Cheers,

a+
