From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv3 05/16] gpio: mvebu: add suspend/resume support
Date: Fri, 28 Nov 2014 12:55:16 +0100
Message-ID: <CACRpkdbPowMLHsw3+Ayi9zAJbd3Y8oTcnn=wb0H_Rmy74v8s7w@mail.gmail.com>
References: <1416585613-2113-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1416585613-2113-6-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1416585613-2113-6-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 21, 2014 at 5:00 PM, Thomas Petazzoni
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
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gregory CLEMENT <gregory.clement@free-electrons.com>

I already have this patch applied to the GPIO tree, I guess you're
just resending the whole set on routine...

Yours,
Linus Walleij
