From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 06/17] gpio: mvebu: add suspend/resume support
Date: Mon, 3 Nov 2014 14:29:11 +0100
Message-ID: <CACRpkdZXhAbta_GsM64AdQzxxKHAVQWfbAZoTp7rfNvN8TfBMw@mail.gmail.com>
References: <1414151970-6626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1414151970-6626-7-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 24, 2014 at 1:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

> This commit adds the implementation of ->suspend() and ->resume()
> platform_driver hooks in order to save and restore the state of the
> GPIO configuration. In order to achieve that, additional fields are
> added to the mvebu_gpio_chip structure.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org

Patch applied with Alexandre's ACK.

Yours,
Linus Walleij
