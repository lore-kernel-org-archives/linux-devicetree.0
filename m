From: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3 2/2] gpio: aspeed: Add support for reset tolerance
Date: Tue, 7 Nov 2017 15:31:39 +1030
Message-ID: <CACPK8XcTU84w4e4qtbUxsqBNpv2ucNu4AcicHWb7NRrVM3Dveg@mail.gmail.com>
References: <20171101040457.1200-1-andrew@aj.id.au> <20171101040457.1200-3-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20171101040457.1200-3-andrew@aj.id.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, frowand.list@gmail.com, ckeepax@opensource.wolfsonmicro.com, ldewangan@nvidia.com, Ryan Chen <ryan_chen@aspeedtech.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 1, 2017 at 2:34 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Use the new pinconf parameter for state persistence to expose the
> associated capability of the Aspeed GPIO controller.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

I took a look and checked the offsets against the datasheet. LGTM.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
