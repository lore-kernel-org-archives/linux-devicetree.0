From: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCHv1 6/6] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Tue, 02 Dec 2014 09:26:45 +0100
Message-ID: <547D77C5.2080705@kleine-koenig.org>
References: <cover.1416006090.git.arno@natisbad.org> <986ee8d9d3e6862007f398ffddc2a4bb2368933e.1416006090.git.arno@natisbad.org> <5476ED9F.2070600@kleine-koenig.org> <87tx1fnn9y.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <87tx1fnn9y.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: arno@natisbad.org
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
List-Id: devicetree@vger.kernel.org



On December 1, 2014 9:11:21 PM CET, arno@natisbad.org wrote:
>Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:
>> For patch 1: Maybe point out that the issue with the century bit
>isn't
>> that critical, because this bit is not expected to be set before yea=
r
>> 2100.
>
>It has:
>
>   This was tested by putting a device 100 years in the future (using =
a
> specific kernel due to the inability of userland tools such as date o=
r
>hwclock to pass year 2038), rebooting on a kernel w/ this patch applie=
d
>    and verifying the device was still 100 years in the future.
>
That describes your test, but it doesn't rule out that someone might us=
e
the century bit to distinguish 19** and 20**.

Best regards
Uwe
