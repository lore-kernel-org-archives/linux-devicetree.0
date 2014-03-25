From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/7] gpio: dwapb: correct gpio-cells in binding document
Date: Tue, 25 Mar 2014 21:49:40 +0100
Message-ID: <CACRpkdaD=hZGJA0r5DcJs-hFnnkKCFeQ9JwJZ4kcLq5Sb+=ZqQ@mail.gmail.com>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
	<1395505004-22650-3-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1395505004-22650-3-git-send-email-bigeasy@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, Alan Tull <delicious.quinoa@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Mar 22, 2014 at 5:16 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> The example uses gpio-cells = 1 while it should be two (it is even
> mentioned in the text above).
>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

This is obviously correct so patch applied.

How come I cannot see patch 1/7 in my mailbox :-(

I see patches 2-7/7...

Something on my end?

Yours,
Linus Walleij
