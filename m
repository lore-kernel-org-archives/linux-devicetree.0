From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] clocksource: moxart: Add AST2500 compatible string
Date: Sun, 28 May 2017 16:00:36 +0200
Message-ID: <CACRpkdb9fRTOBwb62=fzcww7HaQZPrfj3SkEockEGU6qw+_0Hg@mail.gmail.com>
References: <20170516075840.23130-1-andrew@aj.id.au> <20170525202808.GA9501@mai>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170525202808.GA9501@mai>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
List-Id: devicetree@vger.kernel.org

On Thu, May 25, 2017 at 10:28 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:

> Shouldn't the compatible string be:
>
>         "aspeed,ast2400-timer", "faraday,fttmr010"
>         "aspeed,ast2500-timer", "faraday,fttmr010"

Actually not this time. The Gemini and Moxart timers are compatible with
the pure Faraday fttmr010 IP-block but Aspeed has played around with the
silicon IP so it is not compatible anymore.

Yours,
Linus Walleij
