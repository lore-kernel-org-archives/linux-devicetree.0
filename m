From: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <uwe@kleine-koenig.org>
Subject: Re: [PATCHv1 1/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Tue, 16 Dec 2014 22:47:31 +0100
Message-ID: <5490A873.1000706@kleine-koenig.org>
References: <cover.1418687005.git.arno@natisbad.org>	<db1f0eecbdc5062a61232b99699ecfa6e0a2a956.1418687005.git.arno@natisbad.org>	<549004B9.2060402@kleine-koenig.org> <87vblbdcii.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <87vblbdcii.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Darshana Padmadas <darshanapadmadas@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Arnaud,

On 12/16/2014 01:07 PM, Arnaud Ebalard wrote:
>>> FWIW, if someone is looking for a way to test alarm support this can
>>> be done in the following way:
>>>
>>>     # echo `date '+%s' -d '+ 1 minutes'` > /sys/class/rtc/rtc0/wakealarm
>>>     # shutdown -h now
>>>
>>> With the commands above, after a minute, the system comes back to life.
>> This paragraph belongs into the 2nd patch, right?
> 
> no, it is for this patch. I did a specific commit message for the second
> patch. IIRC, it also has the example if it was the meaning of your
> question.
Is it usual that an rtc can wake up a machine from shutdown state? I
thought it isn't.

Best regards
Uwe
