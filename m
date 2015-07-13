From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/4] gpio: brcmstb: fix null ptr dereference in driver remove
Date: Mon, 13 Jul 2015 14:24:12 +0200
Message-ID: <CACRpkdY_ER-=ig=zeGNKaGFmVrrLrTqXPCJ+75F9eZZ9JOOmxA@mail.gmail.com>
References: <1434589243-502-1-git-send-email-gregory.0xf0@gmail.com>
	<1434589243-502-2-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434589243-502-2-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 18, 2015 at 3:00 AM, Gregory Fong <gregory.0xf0@gmail.com> wrote:

> If a failure occurs during probe, brcmstb_gpio_remove() is called. In
> remove, we call platform_get_drvdata(), but at the time of failure in
> the probe the driver data hadn't yet been set which leads to a NULL
> ptr dereference in the remove's list_for_each.  Call
> platform_set_drvdata() and set up list head right after allocating the
> priv struct to both avoid the null pointer dereference that could
> occur today.  To guard against potential future changes, check for
> null pointer in remove.
>
> Reported-by: Tim Ross <tross@broadcom.com>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
> ---
> New in v3.

Patch applied.

Yours,
Linus Walleij
