From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [RFC PATCH] gpio: use "output-active" and "output-inactive" for
 gpio-hogs
Date: Fri, 9 Jun 2017 10:10:15 +0300
Message-ID: <34157a2b-9657-e591-5ad8-a26b0d93ce29@cogentembedded.com>
References: <20170604101049.4592-1-uwe@kleine-koenig.org>
 <20170608223346.unfwdh32v3kt2y52@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170608223346.unfwdh32v3kt2y52@rob-hp-laptop>
Sender: linux-gpio-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, Andrey Smirnov <andrew.smirnov@gmail.com>
List-Id: devicetree@vger.kernel.org

>> Maybe the same idea can be applied to the cpp definitions GPIOD_OUT_LOW
>> and GPIOD_OUT_HIGH.

I'd say it was quite bad idea to introduce ACTIVE_LOW thing while still
same "high" / "low" names all over the API. Now this is causing
confusion in every other use case.

The only way to clean up this mess now without breaking things is to
rename everything, and deprecate all currently-exisitng identifiers
containing "high" and "low" substrings.
