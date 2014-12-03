From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/1] gpio: mcp23s08: Add option to configure IRQ output
 polarity as active high
Date: Wed, 3 Dec 2014 14:35:56 +0100
Message-ID: <CACRpkdZgDHmYO-LPcugBv5H8wV1HY2rqnhVaoYiaQGhZ24mCkg@mail.gmail.com>
References: <1417418760-17368-1-git-send-email-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1417418760-17368-1-git-send-email-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Dec 1, 2014 at 8:26 AM, Alexander Stein
<alexander.stein@systec-electronic.com> wrote:

> Default is active low, but if property is specified in DT set INTPOL flag.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
> ---
> Changes in v2:
> * Modified the commit message and binding text slightly to indicate that
>   this features changes the IRQ output polarity.

Patch applied.

Yours,
Linus Walleij
