From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: pca953x: Add optional reset gpio control
Date: Wed, 11 Jan 2017 16:36:53 +0100
Message-ID: <CACRpkdbOOPOg48M7fqexFpA_xZ90C2Sa9Nh-asJs-jV4PNppDQ@mail.gmail.com>
References: <1484076591-20834-1-git-send-email-steve_longerbeam@mentor.com> <1484076591-20834-2-git-send-email-steve_longerbeam@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1484076591-20834-2-git-send-email-steve_longerbeam@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Steve Longerbeam <steve_longerbeam@mentor.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 10, 2017 at 8:29 PM, Steve Longerbeam <slongerbeam@gmail.com> wrote:

> Add optional reset-gpios pin control. If present, de-assert the
> specified reset gpio pin to bring the chip out of reset.
>
> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

v2 patch applied adding a few review tags.

Yours,
Linus Walleij
