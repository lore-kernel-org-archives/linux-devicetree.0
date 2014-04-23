From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V7 1/1] drivers/gpio: Altera soft IP GPIO driver and
 devicetree binding
Date: Wed, 23 Apr 2014 15:32:04 +0200
Message-ID: <CACRpkdaJM4RcMaNOoNnACfkRiQP9xxNSfNjV8nygA1GXYdJrfw@mail.gmail.com>
References: <1393842463-5206-1-git-send-email-thloh@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1393842463-5206-1-git-send-email-thloh@altera.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, "lftan@altera.com" <lftan@altera.com>, Tien Hock Loh <thloh.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

On Mon, Mar 3, 2014 at 11:27 AM,  <thloh@altera.com> wrote:

> From: Tien Hock Loh <thloh@altera.com>
>
> Add driver support for Altera GPIO soft IP, including interrupts and I/O.
> Tested on Altera CV SoC board using dipsw and LED using LED framework.
>
> Signed-off-by: Tien Hock Loh <thloh@altera.com>

Some time has passed since this was posted and we now have
GPIO irqchip helpers in the gpiolib core.

If you repost this, please reform this driver to use the gpiochip
irqchip helpers in the manner of e.g. drivers/gpio/gpio-pl061.c.

More examples and documentation is available on the "devel"
branch in the gpio git tree (also in linux-next).

Yours,
Linus Walleij
