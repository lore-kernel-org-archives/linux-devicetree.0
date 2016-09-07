From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 1/8] MAINTAINERS: Add glob for Aspeed devicetree bindings
Date: Wed, 07 Sep 2016 16:42:42 +0200
Message-ID: <5593420.8zaAADKfPO@wuerfel>
References: <20160830075427.11493-1-andrew@aj.id.au> <20160830075427.11493-2-andrew@aj.id.au> <CACRpkdb6Bxg3Unobr=HWj9J1FK5QaMcYrmNTL4G5FOONqU4WfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb6Bxg3Unobr=HWj9J1FK5QaMcYrmNTL4G5FOONqU4WfQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wednesday, September 7, 2016 4:37:15 PM CEST Linus Walleij wrote:
> On Tue, Aug 30, 2016 at 9:54 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > Acked-by: Joel Stanley <joel@jms.id.au>
> 
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I guess some device tree maintainer or SoC tree should merge this patch.
> If you think it is proper to apply in the pinctrl or gpio tree, tell me.
> 

I think it's best to take this through arm-soc to avoid conflicts in
case we add other lines too.

Maybe add a global regex instead of a growing list of file names though.

	Arnd
